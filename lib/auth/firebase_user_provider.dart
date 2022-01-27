import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GifticanoFirebaseUser {
  GifticanoFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

GifticanoFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GifticanoFirebaseUser> gifticanoFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<GifticanoFirebaseUser>(
        (user) => currentUser = GifticanoFirebaseUser(user));
