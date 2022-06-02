import 'package:airplane_apps/models/user_model.dart';
import 'package:airplane_apps/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModels> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );

      UserModels user = await UserService().getUserById(userCredential.user!.uid);

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModels> signUp({
    required String email,
    required String password,
    required String name,
    String hobby = '',
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );

      UserModels user = UserModels(
        id: userCredential.user!.uid, 
        email: email, 
        name: name,
        hobby: hobby,
        balance: 280000000,
      );

      await UserService().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}