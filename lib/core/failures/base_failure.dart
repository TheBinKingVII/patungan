// lib/core/failures/base_failure.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Base abstract class for all types of failures in the app.
/// Every specific failure should extend this class.
abstract class Failure implements Exception {
  final String message;

  Failure(this.message);

  @override
  String toString() => "Failure: $message";
}

/// 🔹 Represents a general server-side failure (e.g., Firebase, API)
class ServerFailure extends Failure {
  ServerFailure([String message = "Server error occurred"]) : super(message);
}

/// 🔹 Represents network connectivity issues
class NetworkFailure extends Failure {
  NetworkFailure([String message = "No internet connection"]) : super(message);
}

/// 🔹 Represents authentication or authorization errors
class AuthFailure extends Failure {
  AuthFailure([String message = "Authentication failed"]) : super(message);
}

/// 🔹 Represents issues when reading/writing to local database
class DatabaseFailure extends Failure {
  DatabaseFailure([String message = "Database error occurred"]) : super(message);
}

/// 🔹 Represents issues with caching or local storage
class CacheFailure extends Failure {
  CacheFailure([String message = "Cache read/write failed"]) : super(message);
}

/// 🔹 Represents unexpected or unknown errors
class UnknownFailure extends Failure {
  UnknownFailure([String message = "An unknown error occurred"]) : super(message);
}

/// 🧠 Utility function to map various exceptions to our Failure classes.
/// This helps unify exception handling across all layers (data/domain/presentation).
Failure mapExceptionToFailure(Object e) {
  if (e is FirebaseAuthException) {
    // Firebase Auth errors (login, register, etc.)
    switch (e.code) {
      case 'user-not-found':
        return AuthFailure('User not found');
      case 'wrong-password':
        return AuthFailure('Incorrect password');
      case 'email-already-in-use':
        return AuthFailure('Email already in use');
      case 'invalid-email':
        return AuthFailure('Invalid email address');
      default:
        return AuthFailure(e.message ?? 'Firebase Auth error');
    }
  } else if (e is FirebaseException) {
    // General Firebase errors (Firestore, Storage, etc.)
    return ServerFailure(e.message ?? "Firebase server error");
  } else if (e is Failure) {
    // If it's already a Failure, just return it
    return e;
  } else if (e is Exception) {
    // Fallback for generic Exception
    return UnknownFailure(e.toString());
  } else {
    // Fallback for anything else (non-Exception)
    return UnknownFailure('Unexpected error: $e');
  }
}
