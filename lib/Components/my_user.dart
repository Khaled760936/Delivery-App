// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class User {
  String firstName;
  String lastName;
  String location = "";
  File? profileImage;
  User({
    required this.firstName,
    required this.lastName,
  });
}

User user = User(firstName: "hammada", lastName: "abo hmaid");
