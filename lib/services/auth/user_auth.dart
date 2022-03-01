import 'package:firebase_auth/firebase_auth.dart';
import 'package:ourpass_int/utils/exception.dart';

class UserAuthentication {
  final _auth = FirebaseAuth.instance;

  Future<void> signUpAnonymously() async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (authError) {
      throw CustomAuthException(authError.code, authError.message!);
    } catch (e) {
      throw CustomException(errorMessage: "Unknown Error");
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (authError) {
      throw CustomAuthException(authError.code, authError.message!);
    } catch (e) {
      throw CustomException(errorMessage: "Unknown Error");
    }
  }
}
