import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class fooddetail extends StatefulWidget {
  const fooddetail({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<fooddetail> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;


  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final id = new TextEditingController();
  final item = new TextEditingController();
  final count = new TextEditingController();
  final date = new TextEditingController();
  final status = new TextEditingController();
  final ngo = new TextEditingController();
  final mem_name = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    //request id field
    final reqstid = TextFormField(
        autofocus: false,
        controller: id,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Request Id cannot be Empty");
          }
          return null;
        },
     //   validator: (value) {
     //     RegExp regex = new RegExp(r'^.{3,}$');
     //     if (value!.isEmpty) {
     //       return ("First Name cannot be Empty");
     //     }
     //     if (!regex.hasMatch(value)) {
     //       return ("Enter Valid name(Min. 3 Character)");
     //     }
     //     return null;
     //   },
        onSaved: (value) {
          id.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Request ID",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //food item field
    final fooditem = TextFormField(
        autofocus: false,
        controller: item,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Food Item Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          item.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Food Item",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //feed count
    final feedcount = TextFormField(
        autofocus: false,
        controller: count,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Feed count cannot be Empty");
          }
          return null;
        },
    //    validator: (value) {
//           if (value!.isEmpty) {
        //           return ("Please Enter Your Email");
        //  }
          // reg expression for email validation
        //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        //       .hasMatch(value)) {
        //     return ("Please Enter a valid email");
        //   }
//           return null;
        //        },
        onSaved: (value) {
          count.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Feed Count",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //date and time
    final datetime = TextFormField(
        autofocus: false,
        controller: date,
        keyboardType: TextInputType.datetime,
        validator: (value) {
          if (value!.isEmpty) {
            return ("date and time cannot be Empty");
          }
          return null;
        },
        //    validator: (value) {
//           if (value!.isEmpty) {
        //           return ("Please Enter Your Email");
        //  }
        // reg expression for email validation
        //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        //       .hasMatch(value)) {
        //     return ("Please Enter a valid email");
        //   }
//           return null;
        //        },
        onSaved: (value) {
          date.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Date and Time",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //status
    final status1 = TextFormField(
        autofocus: false,
        controller: status,
        keyboardType: TextInputType.datetime,
        validator: (value) {
          if (value!.isEmpty) {
            return ("status cannot be Empty");
          }
          return null;
        },
        //    validator: (value) {
//           if (value!.isEmpty) {
        //           return ("Please Enter Your Email");
        //  }
        // reg expression for email validation
        //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        //       .hasMatch(value)) {
        //     return ("Please Enter a valid email");
        //   }
//           return null;
        //        },
        onSaved: (value) {
          status.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Food Status",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //ngo name
    final ngoname = TextFormField(
        autofocus: false,
        controller: ngo,
        keyboardType: TextInputType.datetime,
        validator: (value) {
          if (value!.isEmpty) {
            return ("ngo name cannot be Empty");
          }
          return null;
        },
        //    validator: (value) {
//           if (value!.isEmpty) {
        //           return ("Please Enter Your Email");
        //  }
        // reg expression for email validation
        //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        //       .hasMatch(value)) {
        //     return ("Please Enter a valid email");
        //   }
//           return null;
        //        },
        onSaved: (value) {
          ngo.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "NGO Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //member name
    final name = TextFormField(
        autofocus: false,
        controller: mem_name,
        keyboardType: TextInputType.datetime,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Member name cannot be Empty");
          }
          return null;
        },
        //    validator: (value) {
//           if (value!.isEmpty) {
        //           return ("Please Enter Your Email");
        //  }
        // reg expression for email validation
        //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        //       .hasMatch(value)) {
        //     return ("Please Enter a valid email");
        //   }
//           return null;
        //        },
        onSaved: (value) {
          mem_name.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Mmember Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));


    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
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
          icon: Icon(Icons.arrow_back, color: Colors.red),
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
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 180,
                        child: Image.asset(
                          "assets/logo1.jpg",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    reqstid,
                    SizedBox(height: 20),
                    fooditem,
                    SizedBox(height: 20),
                    feedcount,
                    SizedBox(height: 20),
                    datetime,
                    SizedBox(height: 20),
                    status1,
                    SizedBox(height: 20),
                    ngoname,
                    SizedBox(height: 20),
                    name,
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
