import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DatabaseManager {

  final CollectionReference profileList =
  FirebaseFirestore.instance.collection('profileInfo');
  Future<void> createUserData(String name, String secondname, String cnic,
      String email, String phoneno, String pass, String confirm,
      String uid) async {
    return await profileList
        .doc(uid)
        .set({
      'firstname': name,
      'secondname': secondname,
      'cnic': cnic,
      'email': email,
      'phoneno': phoneno,
      'password': pass,
      'confirm_pass': confirm,
    });
  }

  Future updatefirstname(String name, String uid) async {
    return await profileList.doc(uid).update({
      'firstname': name,
    });
  }

  Future updatesecondname(String secondname, String uid) async {
    return await profileList.doc(uid).update({
      'secondname': secondname,
    });
  }

  Future updatecnic(String cnic, String uid) async {
    return await profileList.doc(uid).update({
      'cnic': cnic,
    });
  }

  Future updatephone(String phone, String uid) async {
    return await profileList.doc(uid).update({
      'phoneno': phone,
    });
  }

  Future updateemail(String email, String uid) async {
    return await profileList.doc(uid).update({
      'email': email,
    });
  }

  Future updatepass(String passnew, String passcon, String uid) async {
    return await profileList.doc(uid).update({
      'password': passnew, 'confirm_pass': passcon,
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
