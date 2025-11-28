import '../repositories/auth_repository.dart';
import '../entities/auth_user_entity.dart';

class SignInWithGoogle {
  final AuthRepository repository;
  SignInWithGoogle(this.repository);

  Future<AuthUserEntity?> call() async {
    return await repository.sigInWithGoogle();
  }
}
