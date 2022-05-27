import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodwastemange/constants/constants.dart';
import 'package:foodwastemange/ngo_login_signup/Services/AuthenticationService.dart';
import 'package:flutter/material.dart';


class ngo_register extends StatefulWidget {
  const ngo_register({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<ngo_register> {
  // our form key
  final _key = GlobalKey<FormState>();
  final AuthenticationService _auth = AuthenticationService();

  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final cniccontroller = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final PhonenoEditing = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: new InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orangeAccent, width: 3.0),
          ),
          enabledBorder: const OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: const BorderSide(color: Colors.orangeAccent, width: 0.0),
          ),
          border: const OutlineInputBorder(),
          labelText: 'First Name',
          labelStyle: new TextStyle(color: Colors.orangeAccent),
        ),

    );

    //second name field
    final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
      decoration: new InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 3.0),
        ),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 0.0),
        ),
        border: const OutlineInputBorder(),
        labelText: 'Second Name',
        labelStyle: new TextStyle(color: Colors.orangeAccent),
      ),);

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
      decoration: new InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 3.0),
        ),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 0.0),
        ),
        border: const OutlineInputBorder(),
        labelText: 'Email',
        labelStyle: new TextStyle(color: Colors.orangeAccent),
      ),);

    //cnic no
    final cnic = TextFormField(
      autofocus: false,
      controller: cniccontroller,
      keyboardType: TextInputType.phone,
      validator: (value) {
        String pattern = r'(^[0-9]{13}$)';
        RegExp regExp = new RegExp(pattern);
        if (value?.length == 0) {
          return 'Please enter CNIC number';
        }
        else if (!regExp.hasMatch(value!)) {
          return 'Please enter valid CNIC Number';
        }
        return null;
      },
      onSaved: (value) {
        cniccontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: new InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 3.0),
        ),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 0.0),
        ),
        border: const OutlineInputBorder(),
        labelText: 'CNIC Number',
        labelStyle: new TextStyle(color: Colors.orangeAccent),
      ),
    );

    //phone number
    final phonenoa = TextFormField(
        autofocus: false,
        controller: PhonenoEditing,
        keyboardType: TextInputType.phone,
        validator: (value) {
          String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
          RegExp regExp = new RegExp(pattern);
          if (value?.length == 0) {
            return 'Please enter mobile number';
          }
          else if (!regExp.hasMatch(value!)) {
            return 'Please enter valid mobile number';
          }
          return null;
        },
        onSaved: (value) {
          PhonenoEditing.text = value!;
        },
        textInputAction: TextInputAction.next,
      decoration: new InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 3.0),
        ),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 0.0),
        ),
        border: const OutlineInputBorder(),
        labelText: 'Phone Number',
        labelStyle: new TextStyle(color: Colors.orangeAccent),
      ),
    );

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
      decoration: new InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 3.0),
        ),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 0.0),
        ),
        border: const OutlineInputBorder(),
        labelText: 'Password',
        labelStyle: new TextStyle(color: Colors.orangeAccent),
      ),);

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
      decoration: new InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 3.0),
        ),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 0.0),
        ),
        border: const OutlineInputBorder(),
        labelText: 'Confrim Password',
        labelStyle: new TextStyle(color: Colors.orangeAccent),
      ),);

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: primaryColor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_key.currentState!.validate()) {
              createUser();
            }
          },
          child: Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 180,
                        child: Image.asset(
                          "assets/ngo_register.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    firstNameField,
                    SizedBox(height: 20),
                    secondNameField,
                    SizedBox(height: 20),
                    cnic,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    phonenoa,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createUser() async {
    dynamic result = await _auth.createNewUser
      (
        firstNameEditingController.text,
        secondNameEditingController.text,
        cniccontroller.text,
        emailEditingController.text,
        PhonenoEditing.text,
        passwordEditingController.text,
        confirmPasswordEditingController.text
    );
    if (result == null) {
      Fluttertoast.showToast(msg: "Email is not Valid");
    } else {
      print(result.toString());
      firstNameEditingController.clear();
      secondNameEditingController.clear();
      cniccontroller.clear();
      emailEditingController.clear();
      PhonenoEditing.clear();
      passwordEditingController.clear();
      Navigator.pop(context);
    }
  }
}