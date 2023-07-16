import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String Email;
  final String Point;
  final String full_name;
  final String walle;
  final String? Urlimage;

  const UserModel({
    this.id,
    required this.Email,
    required this.Point,
    required this.full_name,
    required this.walle,
    this.Urlimage,
  });

  toJson() {
    return {
      'Email': Email,
      'Point': Point,
      'full_name': full_name,
      'walle': walle
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        Email: data['Email'],
        Point: data['Point'],
        full_name: data['full_name'],
        walle: data['walle'],
        Urlimage: data['Urlimage']);
  }
}
