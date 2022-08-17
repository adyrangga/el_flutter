import 'package:el_flutter/data/static_data.dart';
import 'package:el_flutter/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';
import '../data/models/side_bar_menu_model.dart';
import '../providers/cores/core_screen_size.dart';
import '../providers/dashboard_page_provider.dart';
import 'expansion_menu_tile.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with TickerProviderStateMixin, CoreScreenSizeImpl {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..forward();

  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = super.getScreenSize(context);
    _sidebarToggleWatcher(context, screenSize);
    return SizedBox(
      child: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        axisAlignment: Constants.negativeOne,
        child: const SideBarContent(),
      ),
    );
  }

  void _sidebarToggleWatcher(BuildContext context, ScreenSize screenSize) {
    if (!screenSize.isMobileLS() &&
        context.watch<DashboardPageProvider>().expandSideBar) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}

class SideBarContent extends StatelessWidget {
  const SideBarContent({
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
          top: BorderSide(color: GenColor.separator),
          bottom: BorderSide(color: GenColor.separator),
        ),
      ),
      margin: const EdgeInsets.only(
        top: Constants.size8,
        bottom: Constants.size16,
      ),
      child: ListTile(
        leading: const CircleAvatar(child: FlutterLogo()),
        title: Text(
          'User Account',
          style: TextStyle(
            color: GenColor.primaryTextDark,
            overflow: TextOverflow.clip,
          ),
        ),
        contentPadding: const EdgeInsets.all(Constants.size8),
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
            child: Text(
              group.groupTitle.toUpperCase(),
              style: TextStyle(
                  color: GenColor.primaryTextDark, fontWeight: FontWeight.w400),
            ),
          )
        : const SizedBox();
  }
}
