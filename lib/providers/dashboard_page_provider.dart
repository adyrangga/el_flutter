import 'package:flutter/material.dart';

class DashboardPageProvider with ChangeNotifier {
  bool _expandSideBar = true;

  bool get expandSideBar => _expandSideBar;

  void setExpandSideBar(bool value) {
    _expandSideBar = value;
    notifyListeners();
  }

  void toggleExpandSideBar() {
    setExpandSideBar(!_expandSideBar);
  }
}
