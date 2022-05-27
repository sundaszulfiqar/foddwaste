import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodwastemange/constants/constant.dart';
import 'package:foodwastemange/ngo_login_signup/ngo_login.dart';
import 'package:foodwastemange/ngo_login_signup/profile/user_model.dart';
import 'package:foodwastemange/ngo_login_signup/DatabaseManager/DatabaseManager.dart';

import 'add_employee.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  FirebaseStorage storage = FirebaseStorage.instance;

  List userProfilesList = [];

  String userID = "";

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("profileInfo")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    fetchUserInfo();
    fetchDatabaseList();
  }

  fetchUserInfo() async {
    User getUser = await FirebaseAuth.instance.currentUser!;
    userID = getUser.uid;
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }

  updatefirstname(String firstname, String uid) async {
    await DatabaseManager().updatefirstname(firstname, uid);
    fetchDatabaseList();
  }

  updatesecondname(String secondname, String uid) async {
    await DatabaseManager().updatesecondname(secondname, uid);
    fetchDatabaseList();
  }

  updatecnic(String cnic, String uid) async {
    await DatabaseManager().updatecnic(cnic, uid);
    fetchDatabaseList();
  }

  updatephone(String phone, String uid) async {
    await DatabaseManager().updatephone(phone, uid);
    fetchDatabaseList();
  }

  updateemail(String email, String uid) async {
    await DatabaseManager().updateemail(email, uid);
    fetchDatabaseList();
  }

  updatepass(String passnew, String passcon, String uid) async {
    await DatabaseManager().updatepass(passnew, passcon, uid);
    fetchDatabaseList();
  }

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  late String firstname = loggedInUser.firstName as String;
  late String secondname = loggedInUser.secondName as String;
  late String phone = loggedInUser.phoneno as String;
  late String email = loggedInUser.email as String;
  late String pass1 = loggedInUser.pass as String;
  late String cnic = loggedInUser.cnic as String;
  late String passold;
  late String passnew;
  late String passcon;

  var oldpassController = TextEditingController();
  var newpassController = TextEditingController();
  var newconpassController = TextEditingController();
  var cniccontroller = TextEditingController();
  var firstnameController = TextEditingController();
  var secondnameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    changefirstName() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 200.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Change First Name",
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: firstnameController,
                    style: buttonBlackTextStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter First Name',
                      hintStyle: greyHeadingStyle,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: buttonBlackTextStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            firstname = firstnameController.text;
                            if (firstname.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Frist Name Field Must Not Be Empty");
                            } else if (firstname.length <= 3) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Enter Valid First Name(Min. 3 Character)");
                            } else {
                              updatefirstname(firstname, userID);
                              Fluttertoast.showToast(
                                  msg: "First Name Updated Successfully");
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Okay',
                            style: wbuttonWhiteTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    changesecondName() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 200.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Change Second Name",
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: secondnameController,
                    style: buttonBlackTextStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter second Name',
                      hintStyle: greyHeadingStyle,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: buttonBlackTextStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            secondname = secondnameController.text;
                            if (secondname.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Second Name Field Must Not Be Empty");
                            } else if (secondname.length <= 3) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Enter Valid Second Name(Min. 3 Character)");
                            } else {
                              updatesecondname(secondname, userID);
                              Fluttertoast.showToast(
                                  msg: "Second Name Updated Successfully");
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Okay',
                            style: wbuttonWhiteTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    changecnic() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 200.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Change CNIC Number",
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: cniccontroller,
                    style: buttonBlackTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter CNIC Number',
                      hintStyle: greyHeadingStyle,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: buttonBlackTextStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            cnic = cniccontroller.text;
                            if (cnic.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "CNIC Field Must Not Be Empty");
                            } else if (cnic.length != 13) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Enter Valid CNIC No(13 Characters Must)");
                            } else {
                              updatecnic(cnic, userID);
                              Fluttertoast.showToast(
                                  msg: "CNIC No Updated Successfully");
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Okay',
                            style: wbuttonWhiteTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    changePassword() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 295.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Change Your Password",
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: oldpassController,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Old Password',
                      hintStyle: greyHeadingStyle,
                    ),
                  ),
                  TextField(
                    controller: newpassController,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                    decoration: InputDecoration(
                      hintText: 'New Password',
                      hintStyle: greyHeadingStyle,
                    ),
                  ),
                  TextField(
                    controller: newconpassController,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Confirm New Password',
                      hintStyle: greyHeadingStyle,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: buttonBlackTextStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          passold = oldpassController.text as String;
                          passnew = newpassController.text as String;
                          passcon = newconpassController.text as String;

                          if (passold.isEmpty ||
                              passnew.isEmpty ||
                              passcon.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Each Text Field Must Not Be Empty");
                          } else {
                            if (passold == pass1 &&
                                passnew == passcon &&
                                passnew.length >= 6 &&
                                passcon.length >= 6) {
                              FirebaseAuth.instance.currentUser!
                                  .updatePassword(passcon);
                              updatepass(passnew, passcon, userID);
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: "Password is Updated");
                            } else {
                              if (passold != pass1) {
                                Fluttertoast.showToast(
                                    msg: "Old password is incorrect");
                              } else if (passnew != passcon) {
                                Fluttertoast.showToast(
                                    msg: "Password not match");
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Password must be >= 6 chracter");
                              }
                            }
                          }
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Okay',
                            style: wbuttonWhiteTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    changePhoneNumber() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 200.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Change Phone Number",
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: phoneController,
                    style: buttonBlackTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Phone Number',
                      hintStyle: greyHeadingStyle,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: buttonBlackTextStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            phone = phoneController.text;
                            if (phone.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Phone Number Must Not Be Empty");
                            } else if (phone.length != 11) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Enter Valid Phone No(11 Characters Must)");
                            } else {
                              updatephone(phone, userID);
                              Fluttertoast.showToast(
                                  msg: "Phone No Updated Successfully");
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Okay',
                            style: wbuttonWhiteTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    changeEmail() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 200.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Change Email",
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: emailController,
                    style: buttonBlackTextStyle,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email Address',
                      hintStyle: greyHeadingStyle,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: buttonBlackTextStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            email = emailController.text;
                            if (email.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Email Field Must Not Be Empty");
                            } else if (email.endsWith("@gmail.com")) {
                              FirebaseAuth.instance.currentUser!
                                  .updateEmail(email);
                              updateemail(email, userID);
                              Fluttertoast.showToast(
                                  msg: "Email Updated Successfully");
                              Navigator.pop(context);
                            } else {
                              Fluttertoast.showToast(msg: "Enter Valid Email");
                            }
                          });
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Okay',
                            style: wbuttonWhiteTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: scaffoldBgColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text('Complete Your Profile', style: whiteTextButtonTextStyle),
        ),
      body:
      ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                // Profile Image Start
              SizedBox(
                height: 100,
              ),
              // Profile Image End
              // First Name Start
              InkWell(
                onTap: changefirstName,
                child: getTile('First Name', firstname),
              ),
              // First Name End
              // second Name Start
              InkWell(
                onTap: changesecondName,
                child: getTile('Second Name', secondname),
              ),
              // second Name End
              //cnic start
              InkWell(
                onTap: changecnic,
                child: getTile('CNIC No', cnic),
              ),
              //cnic end
              // Password Start
              InkWell(
                onTap: changePassword,
                child: getTile('Password', '******'),
              ),
              // Password End
              // Phone Start
              InkWell(
                onTap: changePhoneNumber,
                child: getTile('Phone', phone),
              ),
              // Phone End
              // Email Start
              InkWell(
                onTap: changeEmail,
                child: getTile('Email', email),
              ),
     // Email End
        ],
      ),
    ],
      ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
               // FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) =>

                        AddEmployee(),


                    ));
              },
                child: Text("Add Employee"),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) =>

ngo_login(),


              ));
    },
    child: Text("Logout"),),
            ),
          ],
        ),
    );
  }

  getTile(String title, String value) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          right: fixPadding, left: fixPadding, bottom: fixPadding * 1.5),
      padding: EdgeInsets.only(
        right: fixPadding,
        left: fixPadding,
        top: fixPadding * 2.0,
        bottom: fixPadding * 2.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 1.5,
            spreadRadius: 1.5,
            color: Colors.grey[200]!,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: width - 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: (width - 80.0) / 2.4,
                  child: Text(
                    title,
                    style: greyHeadingStyle,
                  ),
                ),
                Container(
                  width: (width - 80.0) / 2.0,
                  child: Text(
                    value,
                    style: headingStyle,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.0,
            color: Colors.grey.withOpacity(0.6),
          ),
        ],
      ),
    );
  }

  // Bottom Sheet for Select Options (Camera or Gallery) Start Here
  // void _selectOptionBottomSheet() {
  //   double width = MediaQuery.of(context).size.width;
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return Container(
  //           color: whiteColor,
  //           child: new Wrap(
  //             children: <Widget>[
  //               Container(
  //                 child: Container(
  //                   padding: EdgeInsets.all(8.0),
  //                   child: Column(
  //                     children: <Widget>[
  //                       Container(
  //                         width: width,
  //                         padding: EdgeInsets.all(10.0),
  //                         child: Text(
  //                           'Choose Option',
  //                           textAlign: TextAlign.center,
  //                           style: headingStyle,
  //                         ),
  //                       ),
  //                       InkWell(
  //                         onTap: () {
  //                           _upload('camera');
  //                           Navigator.pop(context);
  //                         },
  //                         child: Container(
  //                           width: width,
  //                           padding: EdgeInsets.all(10.0),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             children: <Widget>[
  //                               Icon(
  //                                 Icons.camera_alt,
  //                                 color: Colors.black.withOpacity(0.7),
  //                                 size: 18.0,
  //                               ),
  //                               SizedBox(
  //                                 width: 10.0,
  //                               ),
  //                               Text(
  //                                 'Camera',
  //                                 style: listItemTitleStyle,
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                       InkWell(
  //                         onTap: () {
  //                           _upload('gallery');
  //                           Navigator.pop(context);
  //                         },
  //                         child: Container(
  //                           width: width,
  //                           padding: EdgeInsets.all(10.0),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             children: <Widget>[
  //                               Icon(
  //                                 Icons.photo_album,
  //                                 color: Colors.black.withOpacity(0.7),
  //                                 size: 18.0,
  //                               ),
  //                               SizedBox(
  //                                 width: 10.0,
  //                               ),
  //                               Text(
  //                                 'Upload from Gallery',
  //                                 style: listItemTitleStyle,
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }

  // Future<void> _upload(String inputSource) async {
  //   final picker = ImagePicker();
  //   XFile? pickedImage;
  //   try {
  //     pickedImage = await picker.pickImage(
  //         source: inputSource == 'camera'
  //             ? ImageSource.camera
  //             : ImageSource.gallery,
  //         maxWidth: 1920);
  //     final String fileName = path.basename(pickedImage!.path);
  //     File imageFile = File(pickedImage.path);
  //
  //     try {
  //       // Uploading the selected image with some custom meta data
  //       FirebaseStorage storage = FirebaseStorage.instance;
  //       Reference ref =
  //           storage.ref().child('profile/$email ' + DateTime.now().toString());
  //       UploadTask uploadTask = ref.putFile(imageFile);
  //       await uploadTask
  //           .whenComplete(() => Fluttertoast.showToast(msg: "Images Uploaded"));
  //       uploadTask.then((res) {
  //         res.ref.getDownloadURL();
  //       });
  //       // Refresh the UI
  //
  //       setState(() {
  //         _image = pickedImage as File;
  //       });
  //     } on FirebaseException catch (error) {
  //       if (kDebugMode) {
  //         print(error);
  //       }
  //     }
  //   } catch (err) {
  //     if (kDebugMode) {
  //       print(err);
  //     }
  //   }
  // }

}


