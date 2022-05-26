class UserModel {
  String? uid;
  String? firstName;
  String? secondName;
  String? cnic;
  String? email;
  String? phoneno;
  String? pass;

  UserModel({
    this.uid,
    this.firstName,
    this.secondName,
    this.cnic,
    this.email,
    this.phoneno,
    this.pass,
  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        firstName: map['firstname'],
        secondName: map['secondname'],
        cnic: map['cnic'],
        email: map['email'],
        phoneno: map['phoneno'],
        pass: map['password']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstname': firstName,
      'secondname': secondName,
      'cnic': cnic,
      'email': email,
      'phoneno': phoneno,
      'password': pass,
    };
  }
}