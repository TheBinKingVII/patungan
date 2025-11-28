import 'package:patungan/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:patungan/features/auth/domain/entities/auth_user_entity.dart';
import 'package:patungan/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<AuthUserEntity?> getCurrentUser() => remote.getCurrentUser();

  @override
  Future<AuthUserEntity?> sigInWithGoogle() => remote.signInWithGoogle();

  @override
  Future<AuthUserEntity?> signInWithEmail(String username, String password) =>
      remote.signInWithEmail(username, password);

  @override
  Future<void> signOut() => remote.signOut();
}
