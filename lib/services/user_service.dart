import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  var currentUser;

  UserService() {
    this.currentUser = FirebaseAuth.instance.currentUser();
  }
}