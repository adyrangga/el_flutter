// To parse this JSON data, do
//
//     final expansionMenuTileModel = expansionMenuTileModelFromJson(jsonString);

import 'dart:convert';

ExpansionMenuTileModel expansionMenuTileModelFromJson(String str) =>
    ExpansionMenuTileModel.fromJson(json.decode(str));

String expansionMenuTileModelToJson(ExpansionMenuTileModel data) =>
    json.encode(data.toJson());

class ExpansionMenuTileModel {
  ExpansionMenuTileModel({
    this.id = '',
    this.title = '',
    this.asset = '',
    this.badgeValue = '',
    this.children = const [],
  });

  String id;
  String title;
  String asset;
  String? badgeValue;
  List<ChildMenu> children;

  factory ExpansionMenuTileModel.fromJson(Map<String, dynamic> json) =>
      ExpansionMenuTileModel(
        id: json["id"],
        title: json["title"],
        asset: json["asset"],
        badgeValue: json["badgeValue"] ?? "",
        children: List<ChildMenu>.from(
            json["children"].map((x) => ChildMenu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "asset": asset,
        "badgeValue": badgeValue,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
      };
}

class ChildMenu {
  ChildMenu({
    this.id = '',
    this.title = '',
  });

  String id;
  String title;

  factory ChildMenu.fromJson(Map<String, dynamic> json) => ChildMenu(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
