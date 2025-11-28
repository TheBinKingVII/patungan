import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/auth_user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthUserModel?> getCurrentUser();
  Future<AuthUserModel?> signInWithGoogle();
  Future<AuthUserModel?> signInWithEmail(String email, String password);
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.firestore,
  });

  @override
  Future<AuthUserModel?> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user == null) return null;
    return AuthUserModel.fromFirebaseUser(user);
  }

  @override
  Future<AuthUserModel> signInWithEmail(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return AuthUserModel.fromFirebaseUser(result.user!);
  }

  @override
  Future<AuthUserModel> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'sign_in_canceled',
        message: 'Sign in aborted by user',
      );
    }
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final result = await firebaseAuth.signInWithCredential(credential);
    await _upsertUserLoginDoc(result.user!);
    return AuthUserModel.fromFirebaseUser(result.user!);
  }

  @override
  Future<void> signOut() async {
    // Sign out dari GoogleSignIn dulu, baru FirebaseAuth
    // Ini memastikan semua session benar-benar dibersihkan
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }

  Future<void> _upsertUserLoginDoc(User user) async {
    final docRef = firestore.collection('users').doc(user.uid);
    final snapshot = await docRef.get();

    final data = <String, dynamic>{
      'uid': user.uid,
      'displayName': user.displayName,
      'email': user.email,
      'photoUrl': user.photoURL,
      'provider': user.providerData.isNotEmpty
          ? user.providerData.first.providerId
          : 'google',
      'lastLogin': FieldValue.serverTimestamp(),
    };

    if (!snapshot.exists) {
      await docRef.set({...data, 'createdAt': FieldValue.serverTimestamp()});
    } else {
      await docRef.update(data);
    }
  }
}
