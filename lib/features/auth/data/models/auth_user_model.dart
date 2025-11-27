import '../../domain/entities/auth_user_entity.dart';

class AuthUserModel extends AuthUserEntity {
  AuthUserModel({required super.uid, super.email, super.name, super.photoUrl});

  factory AuthUserModel.fromFirebaseUser(user) {
    return AuthUserModel(
      uid: user.id,
      email: user.email,
      name: user.displayName,
      photoUrl: user.photoUrl,
    );
  }
}
