// To parse this JSON data, do
//
//     final notificationPopupModel = notificationPopupModelFromJson(jsonString);

import 'dart:convert';

NotificationPopupModel notificationPopupModelFromJson(String str) =>
    NotificationPopupModel.fromJson(json.decode(str));

String notificationPopupModelToJson(NotificationPopupModel data) =>
    json.encode(data.toJson());

class NotificationPopupModel {
  NotificationPopupModel({
    this.count = 0,
    this.notifications = const [],
  });

  int count;
  List<NotificationsPopupItemModel> notifications;

  factory NotificationPopupModel.fromJson(Map<String, dynamic> json) =>
      NotificationPopupModel(
        count: json["count"],
        notifications: List<NotificationsPopupItemModel>.from(
            json["notifications"]
                .map((x) => NotificationsPopupItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class NotificationsPopupItemModel {
  NotificationsPopupItemModel({
    this.type = '',
    this.count = 0,
    this.lastSeen = '',
  });

  String type;
  int count;
  String lastSeen;

  factory NotificationsPopupItemModel.fromJson(Map<String, dynamic> json) =>
      NotificationsPopupItemModel(
        type: json["type"],
        count: json["count"],
        lastSeen: json["lastSeen"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "count": count,
        "lastSeen": lastSeen,
      };
}


// {
//     "count": 15,
//     "notifications": [
//         {
//             "type": "message",
//             "count": 4,
//             "lastSeen": "2022-08-17 18:44:48.725"
//         },
//         {
//             "type": "friendRequest",
//             "count": 4,
//             "lastSeen": "2022-08-17 18:44:48.725"
//         },
//         {
//             "type": "friendRequest",
//             "count": 4,
//             "lastSeen": "2022-08-17 18:44:48.725"
//         }
//     ]
// }
