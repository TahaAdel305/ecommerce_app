
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
//signUp اول مرخ اسجل دخول
  Future<UserCredential> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await credential.user?.updateDisplayName(name);

    return credential;
  }

//signInjs تسجيل دخول ع طول

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      rethrow;
    }
  }



  Future<void> signOut() async {
    await _auth.signOut();
  }


  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    await _auth.sendPasswordResetEmail(
      email: email,
    );
  }

// massege error
  String getErrorMessage(String code) {
    switch (code) {
      case 'invalid-credential':
        return 'Email or password is incorrect';

      case 'invalid-email':
        return 'Please enter a valid email';

      case 'user-disabled':
        return 'This account has been disabled';

      case 'too-many-requests':
        return 'Too many attempts. Please try again later';

      case 'network-request-failed':
        return 'Check your internet connection';

      default:
        return 'Something went wrong. Please try again';
    }
  }




}
