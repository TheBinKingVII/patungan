import 'dart:async';

import 'package:patungan/features/auth/domain/entities/auth_user_entity.dart';
import 'package:patungan/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository repository;
  GetCurrentUser(this.repository);

  Future<AuthUserEntity?> call() async {
    return await repository.getCurrentUser();
  }
}
