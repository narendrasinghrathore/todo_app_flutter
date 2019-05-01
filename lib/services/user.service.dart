import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AppUser {
  static final user$ = new BehaviorSubject<FirebaseUser>();

  static FirebaseUser get user {
    return user$.stream.value;
  }
}
