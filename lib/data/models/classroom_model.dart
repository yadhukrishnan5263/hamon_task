// To parse this JSON data, do
//
//     final classRoomModel = classRoomModelFromJson(jsonString);

import 'dart:convert';

ClassRoomModel classRoomModelFromJson(String str) => ClassRoomModel.fromJson(json.decode(str));

String classRoomModelToJson(ClassRoomModel data) => json.encode(data.toJson());

class ClassRoomModel {
  int id;
  String layout;
  String name;
  int size;

  ClassRoomModel({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
  });

  factory ClassRoomModel.fromJson(Map<String, dynamic> json) => ClassRoomModel(
    id: json["id"],
    layout: json["layout"],
    name: json["name"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "layout": layout,
    "name": name,
    "size": size,
  };
}
