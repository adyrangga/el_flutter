import 'dart:convert';

import 'package:el_flutter/data/models/expansion_menu_tile_model.dart';
import 'package:el_flutter/data/models/side_bar_menu_model.dart';

class StaticData {
  static const menuList = ['Home', 'Contact'];
  static ExpansionMenuTileModel dashboardSubMenu() {
    var data = ExpansionMenuTileModel.fromJson(jsonDecode(
        '{"id":"dashboard","title":"Dashboard","asset":"assets/icons/tachometer.svg","children":[{"id":"dashboard-v1","title":"Dashboard v1"},{"id":"dashboard-v2","title":"Dashboard v2"},{"id":"dashboard-v3","title":"Dashboard v3"}]}'));
    return data;
  }

  static ExpansionMenuTileModel widgetSubMenu() {
    var data = ExpansionMenuTileModel.fromJson(jsonDecode(
        '{"id":"widgets","title":"Widgets","asset":"assets/icons/grid.svg","children":[]}'));
    return data;
  }

  static ExpansionMenuTileModel layoutOptSubMenu() {
    var data = ExpansionMenuTileModel.fromJson(jsonDecode(
        '{"id":"layout-options","title":"Layout Options","asset":"assets/icons/copy.svg","children":[{"id":"top-navigation","title":"Top Navigation"}]}'));
    return data;
  }
}

class SideBarMenuData {
  factory SideBarMenuData() => SideBarMenuData._internal();
  SideBarMenuData._internal();

  List<SideBarMenuModel> list = sideBarMenuModelFromJson(
      '[{"id":"","groupTitle":"","children":[{"id":"dashboard","title":"Dashboard","asset":"assets/icons/tachometer.svg","children":[{"id":"dashboard-v1","title":"Dashboard v1"},{"id":"dashboard-v2","title":"Dashboard v2"},{"id":"dashboard-v3","title":"Dashboard v3"}]},{"id":"widgets","title":"Widgets","asset":"assets/icons/grid.svg","badgeValue":"N","children":[]},{"id":"layout-options","title":"Layout Options","asset":"assets/icons/copy.svg","badgeValue":"6","children":[{"id":"top-navigation","title":"Top Navigation"}]}]},{"id":"example","groupTitle":"Example","children":[{"id":"calendar","title":"Calendar","asset":"assets/icons/calendar.svg","badgeValue":"2","children":[]}]}]');
}
