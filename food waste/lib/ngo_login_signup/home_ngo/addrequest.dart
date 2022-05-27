import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodwastemange/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:foodwastemange/ngo_login_signup/home_ngo/firebase.dart';

class addrequest extends StatefulWidget {
  const addrequest({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<addrequest> {
  // our form key
  final _key = GlobalKey<FormState>();

  // editing Controller
  final item = new TextEditingController();
  final count = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //food item
    final fooditem = TextFormField(
      autofocus: false,
      controller: item,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Food Item Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        item.text = value!;
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
        labelText: 'Food Item',
        labelStyle: new TextStyle(color: Colors.orangeAccent),
      ),
    );

    //count item
    final foodcount = TextFormField(
      autofocus: false,
      controller: count,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value?.length == 0) {
          return 'Please enter Feed Count number';
        }
        return null;
      },
      onSaved: (value) {
        count.text = value!;
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
        labelText: 'Feed Count',
        labelStyle: new TextStyle(color: Colors.orangeAccent),
      ),
    );

    final submit = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: primaryColor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            FirebaseFirestore.instance
                .collection('products')
                .add({'fooditem': item.text, 'foodcount': count.text});
            Fluttertoast.showToast(msg: "Food Request Created Successfully!");
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => addrequest()));
          },
          child: Text(
            "submit",
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
                    fooditem,
                    SizedBox(height: 20),
                    foodcount,
                    SizedBox(height: 20),
                    submit,
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
}
