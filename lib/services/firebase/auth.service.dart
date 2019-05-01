import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AuthFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Returns a observable of firebase user
  Observable<FirebaseUser> loginUser(String email, String password) {
    return Observable.fromFuture(
        _auth.signInWithEmailAndPassword(email: email, password: password));
  }
}
