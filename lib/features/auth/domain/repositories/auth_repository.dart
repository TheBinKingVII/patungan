import '../entities/auth_user_entity.dart';

abstract class AuthRepository {
  Future<AuthUserEntity?> getCurrentUser();
  Future<AuthUserEntity?> sigInWithGoogle();
  Future<AuthUserEntity?> signInWithEmail(String username, String password);
  Future<void> signOut();
}
