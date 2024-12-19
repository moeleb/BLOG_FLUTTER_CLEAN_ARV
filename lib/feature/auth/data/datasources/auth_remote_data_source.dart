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
  }) async{
    try {
     final response = await  supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          "name": name,
        },
      );
     if(response.user==null){
       throw ;
     }
     return response.user!.id;
    } catch (e) {

    }
  }

  @override
  Future<String> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
