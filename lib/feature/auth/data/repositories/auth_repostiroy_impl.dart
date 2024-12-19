import 'package:bloc/core/error/exception.dart';
import 'package:bloc/core/error/failure.dart';
import 'package:bloc/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:bloc/feature/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppFailure, String>> loginWithEmailPassword(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure, String>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(AppFailure(e.message));
    }
  }
}
