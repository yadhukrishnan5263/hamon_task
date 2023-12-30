// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  int age;
  String email;
  int id;
  bool assigned;
  int reg_id;
  String name;

  StudentModel({
    required this.age,
    required this.email,
    required this.id,
    required this.name,
    required this.assigned,
    required this.reg_id
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    age: json["age"],
    email: json["email"],
    id: json["id"],
    name: json["name"], assigned: false, reg_id: 0,
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "email": email,
    "id": id,
    "name": name,
  };
}
