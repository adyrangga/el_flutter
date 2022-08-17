import 'package:flutter/cupertino.dart';

class LayoutManagerProvider with ChangeNotifier {
  bool _showFooter = true;

  bool get showFooter => _showFooter;

  void setShowFooter() {
    _showFooter = !_showFooter;
    notifyListeners();
  }
}
