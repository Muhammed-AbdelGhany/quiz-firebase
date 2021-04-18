import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_firebase/models/quiz_user.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  QuizUser _getUser(User user) {
    return user != null ? QuizUser(uid: user.uid) : null;
  }

  Future sigInEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user;
      return _getUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpEmailAndPassowrd(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _getUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
