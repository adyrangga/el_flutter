import 'package:el_flutter/data/models/notification_popup_model.dart';
import 'package:flutter/cupertino.dart';

enum NotificationType {
  message,
  friendRequest,
  report,
}

class AppsBarProvider with ChangeNotifier {
  final NotificationPopupModel _notificationBellData =
      notificationPopupModelFromJson(
          '{"count":7,"notifications":[{"type":"message","count":2,"lastSeen":"2022-08-17 18:44:48.725"},{"type":"friendRequest","count":4,"lastSeen":"2022-08-17 18:44:48.725"},{"type":"report","count":1,"lastSeen":"2022-08-17 18:44:48.725"}]}');

  NotificationPopupModel get notificationBellData => _notificationBellData;

  void setNotifyBellData(int index) {
    _notificationBellData.notifications.removeAt(index);
    notifyListeners();
  }
}
