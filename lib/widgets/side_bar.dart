import 'package:el_flutter/data/static_data.dart';
import 'package:el_flutter/widgets/search_box.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';
import '../data/models/side_bar_menu_model.dart';
import 'expansion_menu_tile.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.kSideBarWidth,
      height: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: GenColor.primaryDark, blurRadius: Constants.size2),
        ],
      ),
      child: SingleChildScrollView(
        primary: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.size8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ActiveUserTile(),
              const SearchBox(),
              SideBarMenu(SideBarMenuData().list),
            ],
          ),
        ),
      ),
    );
  }
}

class ActiveUserTile extends StatelessWidget {
  const ActiveUserTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: GenColor.primaryBorderDark),
          bottom: BorderSide(color: GenColor.primaryBorderDark),
        ),
      ),
      margin: const EdgeInsets.only(
        top: Constants.size8,
        bottom: Constants.size16,
      ),
      child: const ListTile(
        leading: CircleAvatar(
          child: FlutterLogo(),
        ),
        title: Text('User Account'),
        contentPadding: EdgeInsets.all(Constants.size8),
      ),
    );
  }
}

class SideBarMenu extends StatelessWidget {
  const SideBarMenu(this.data, {Key? key}) : super(key: key);

  final List<SideBarMenuModel> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data
          .map((group) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGroupTitleText(group),
                  ...group.children
                      .map((menu) => ExpansionMenuTile(
                            menu,
                            onTap: (id) {
                              debugPrint('clicked $id');
                            },
                          ))
                      .toList()
                ],
              ))
          .toList(),
    );
  }

  Widget _buildGroupTitleText(SideBarMenuModel group) {
    return group.groupTitle.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(Constants.size8),
            child: Text(group.groupTitle.toUpperCase()),
          )
        : const SizedBox();
  }
}
