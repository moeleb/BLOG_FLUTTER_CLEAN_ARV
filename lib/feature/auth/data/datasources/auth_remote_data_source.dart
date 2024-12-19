import 'package:bloc/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailAndPassword(
      {required String name, required String email, required String password});

  Future<String> logInWithEmailAndPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          "name": name,
        },
      );
      if (response.user == null) {
        throw ServerException("User is null");
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> logInWithEmailAndPassword({
    required String email,
    required String password,
  })async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,

      );
      if (response.user == null) {
        throw ServerException("User is null");
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
