import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodwastemange/ngo_login_signup/DatabaseManager/DatabaseManager.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
// registration with email and password

  Future createNewUser(String firstname1, String secondname1,String cnic ,String email1, String phoneno1, String password1, String conpass1) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email1, password: password1);
      User? user = result.user;
      await DatabaseManager().createUserData(firstname1,secondname1,cnic,email1,phoneno1,password1,conpass1,user!.uid);
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

// sign with email and password

  Future loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
    }
  }

// signout

  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
