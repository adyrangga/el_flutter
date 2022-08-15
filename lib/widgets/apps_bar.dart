import 'package:el_flutter/constants/constants.dart';
import 'package:el_flutter/constants/gen_color.dart';
import 'package:el_flutter/data/static_data.dart';
import 'package:el_flutter/widgets/icon_badge.dart';
import 'package:el_flutter/widgets/svg_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppsBar extends StatelessWidget implements PreferredSizeWidget {
  const AppsBar({
    Key? key,
    this.menuList = StaticData.menuList,
  }) : super(key: key);

  final List<String>? menuList;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: GenColor.primaryDark,
      title: HeaderMenuList(menuList: menuList),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            debugPrint('icon clicked!');
          },
          icon: const SvgSearchWidget(),
        ),
        IconBadge(
          value: "15",
          icon: SvgPicture.asset(
            'assets/icons/comments.svg',
            color: GenColor.linkNav,
            width: Constants.size16,
            height: Constants.size16,
            semanticsLabel: 'Comments',
          ),
          onPressed: () {
            debugPrint('icon clicked!');
          },
        ),
        IconBadge(
          value: "3",
          icon: SvgPicture.asset(
            'assets/icons/bell.svg',
            color: GenColor.linkNav,
            width: Constants.size16,
            height: Constants.size16,
            semanticsLabel: 'Bell',
          ),
          onPressed: () {
            debugPrint('icon clicked!');
          },
        ),
        IconButton(
          onPressed: () {
            debugPrint('icon clicked!');
          },
          icon: SvgPicture.asset(
            'assets/icons/fullscreen.svg',
            color: GenColor.linkNav,
            width: Constants.size20,
            height: Constants.size20,
            semanticsLabel: 'Fullscreen',
          ),
        ),
        IconButton(
          onPressed: () {
            debugPrint('icon clicked!');
            Scaffold.of(context).openEndDrawer();
          },
          color: GenColor.linkNav,
          iconSize: Constants.size20,
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HeaderMenuList extends StatelessWidget {
  const HeaderMenuList({
    Key? key,
    required this.menuList,
  }) : super(key: key);

  final List<String>? menuList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ...menuList!
            .map(
              (value) => TextButton(
                onPressed: () {
                  debugPrint('$value clicked!');
                },
                child: Text(
                  value,
                  style: Theme.of(context).primaryTextTheme.headline6?.copyWith(
                      fontSize: Constants.size16, color: GenColor.linkNav),
                ),
              ),
            )
            .toList()
      ],
    );
  }
}
