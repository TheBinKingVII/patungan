import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:patungan/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:patungan/features/auth/data/repositories/auth_repository.dart';
import 'package:patungan/features/auth/domain/entities/auth_user_entity.dart';
import 'package:patungan/features/auth/domain/repositories/auth_repository.dart';
import 'package:patungan/features/auth/domain/usecases/get_current_user.dart';
import 'package:patungan/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:patungan/screens/main_screen.dart';

class AuthController extends GetxController {
  late final AuthRepository _repository;
  late final SignInWithGoogle _signInWithGoogle;
  late final GetCurrentUser _getCurrentUser;

  final RxBool isSigningIn = false.obs;
  final RxBool rememberMeLogin = false.obs;
  final RxBool rememberMeSignUp = false.obs;

  AuthController({AuthRepository? repository}) {
    _repository =
        repository ??
        AuthRepositoryImpl(
          AuthRemoteDataSourceImpl(
            firebaseAuth: FirebaseAuth.instance,
            googleSignIn: GoogleSignIn(),
          ),
        );
    _signInWithGoogle = SignInWithGoogle(_repository);
    _getCurrentUser = GetCurrentUser(_repository);
  }

  Future<void> signInWithGoogle() async {
    if (isSigningIn.value) return;
    isSigningIn.value = true;
    try {
      await _signInWithGoogle();
      Get.offAll(() => MainScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login gagal', e.message ?? 'Gagal masuk dengan Google.');
    } catch (_) {
      Get.snackbar('Login gagal', 'Terjadi kesalahan. Coba lagi.');
    } finally {
      isSigningIn.value = false;
    }
  }

  Future<AuthUserEntity?> getCurrentUser() async {
    return await _getCurrentUser();
  }

  Future<void> signOut() async {
    await _repository.signOut();
  }

  void toggleRememberMeLogin(bool? value) {
    rememberMeLogin.value = value ?? false;
  }

  void toggleRememberMeSignUp(bool? value) {
    rememberMeSignUp.value = value ?? false;
  }

  void showComingSoon() {
    Get.snackbar('Info', 'Saat ini hanya Google Sign-In yang tersedia.');
  }
}
