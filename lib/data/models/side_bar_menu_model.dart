// To parse this JSON data, do
//
//     final sideBarMenuModel = sideBarMenuModelFromJson(jsonString);

import 'dart:convert';

import 'expansion_menu_tile_model.dart';

List<SideBarMenuModel> sideBarMenuModelFromJson(String str) =>
    List<SideBarMenuModel>.from(
        json.decode(str).map((x) => SideBarMenuModel.fromJson(x)));

String sideBarMenuModelToJson(List<SideBarMenuModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SideBarMenuModel {
  SideBarMenuModel({
    this.id = '',
    this.groupTitle = '',
    this.children = const [],
  });

  String id;
  String groupTitle;
  List<ExpansionMenuTileModel> children;

  factory SideBarMenuModel.fromJson(Map<String, dynamic> json) =>
      SideBarMenuModel(
        id: json["id"],
        groupTitle: json["groupTitle"],
        children: List<ExpansionMenuTileModel>.from(
            json["children"].map((x) => ExpansionMenuTileModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "groupTitle": groupTitle,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
      };
}
