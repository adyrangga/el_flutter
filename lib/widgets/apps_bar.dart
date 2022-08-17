import 'package:el_flutter/constants/constants.dart';
import 'package:el_flutter/constants/gen_color.dart';
import 'package:el_flutter/data/static_data.dart';
import 'package:el_flutter/providers/apps_bar_provider.dart';
import 'package:el_flutter/widgets/icon_button_badge.dart';
import 'package:el_flutter/widgets/svg_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../data/models/notification_popup_model.dart';
import '../providers/cores/core_screen_size.dart';
import '../providers/dashboard_page_provider.dart';
import 'icon_badge.dart';

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
      title: AppsBarMenuList(menuList: menuList),
      titleSpacing: Constants.size12,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            debugPrint('icon clicked!');
          },
          icon: const SvgSearchWidget(),
        ),
        IconButtonBadge(
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
        const PopupMenuBellButton(),
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
          icon: SvgPicture.asset(
            'assets/icons/customize.svg',
            color: GenColor.linkNav,
            width: Constants.size20,
            height: Constants.size20,
            semanticsLabel: 'Customize',
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class PopupMenuBellButton extends StatelessWidget {
  const PopupMenuBellButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      position: PopupMenuPosition.under,
      icon: IconBadge(
        icon: SvgPicture.asset(
          'assets/icons/bell.svg',
          color: GenColor.linkNav,
          width: Constants.size16,
          height: Constants.size16,
          semanticsLabel: 'Bell',
        ),
        value: context
            .watch<AppsBarProvider>()
            .notificationBellData
            .count
            .toString(),
      ),
      onSelected: (value) {
        debugPrint(value);
        if (value != 'See All Notifications' || value != 'Notification Empty') {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(Constants.size20),
              ),
            ),
            isScrollControlled: true,
            builder: (c) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.75,
                padding: const EdgeInsets.all(Constants.size20),
                child: Text('Bottom Sheet'),
              );
            },
          );
        }
      },
      itemBuilder: (BuildContext context) {
        var bellData = context.read<AppsBarProvider>().notificationBellData;
        List<PopupMenuItem<String>> items = bellData.notifications
            .map((e) => PopupMenuItem<String>(
                  value: e.count.toString(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _determinIconText(e),
                      Text(
                        e.lastSeen.substring(11, 16),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ))
            .toList();

        String lastItemsTx =
            bellData.count > 0 ? 'See All Notifications' : 'Notification Empty';
        items.add(
          PopupMenuItem<String>(
            value: lastItemsTx,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(lastItemsTx, textAlign: TextAlign.center)],
            ),
          ),
        );
        return items;
      },
    );
  }

  Widget _determinIconText(NotificationsPopupItemModel e) {
    Widget icon = const Icon(Icons.mail);
    String text = 'new messages';
    if (e.type == NotificationType.friendRequest.name) {
      icon = const Icon(Icons.group);
      text = 'friends requests';
    } else if (e.type == NotificationType.report.name) {
      icon = const Icon(Icons.file_open);
      text = 'new reports';
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: icon,
        ),
        Text('${e.count} $text'),
      ],
    );
  }
}

class AppsBarMenuList extends StatelessWidget with CoreScreenSizeImpl {
  const AppsBarMenuList({
    Key? key,
    required this.menuList,
  }) : super(key: key);

  final List<String>? menuList;

  @override
  Widget build(BuildContext context) {
    final screenSize = super.getScreenSize(context);
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (screenSize.isMobileLS()) {
              Scaffold.of(context).openDrawer();
            } else {
              context.read<DashboardPageProvider>().toggleExpandSideBar();
            }
          },
          icon: const Icon(Icons.menu),
        ),
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
            .toList(),
        Text('${MediaQuery.of(context).size.width}'),
      ],
    );
  }
}
