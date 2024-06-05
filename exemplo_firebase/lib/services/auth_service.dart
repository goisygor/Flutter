import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //atributio
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //metodo login user
  Future<User?> loginUsuario(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// metodo de registrar usuario
  Future<User?> registrarUsuario(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //metodo de logout
  Future<void> logoutUsuario() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
