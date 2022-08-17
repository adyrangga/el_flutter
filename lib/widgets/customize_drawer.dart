import 'package:el_flutter/providers/layout_manager_provider.dart';
import 'package:el_flutter/widgets/switch_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';
import '../providers/cores/theme_manager_provider.dart';

class CustomizeDrawer extends StatelessWidget {
  const CustomizeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SettingsDrawerHeader(),
          Expanded(
            child: SingleChildScrollView(
              primary: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Constants.size16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwitchTile(
                      title: 'Dark Mode',
                      value: context.watch<ThemeManagerProvider>().darkMode,
                      onChanged: (value) {
                        debugPrint('Switch Dark Mode $value');
                        context.read<ThemeManagerProvider>().setDarkMode(value);
                      },
                    ),
                    SwitchTile(
                      title: 'Show Footer',
                      value: context.watch<LayoutManagerProvider>().showFooter,
                      onChanged: (value) {
                        debugPrint('Switch Show Footer $value');
                        context.read<LayoutManagerProvider>().setShowFooter();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsDrawerHeader extends StatelessWidget {
  const SettingsDrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.only(left: Constants.size16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  Constants.customizeTx,
                  style: Theme.of(context).textTheme.headline6,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/open-in-browser.svg',
                    color: GenColor.primaryTextDark,
                    width: Constants.size24,
                    height: Constants.size24,
                    semanticsLabel: 'Open Customize Page',
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              debugPrint('closeEndDrawer clicked!');
              Scaffold.of(context).closeEndDrawer();
            },
            color: GenColor.linkNav,
            iconSize: Constants.size20,
            icon: const Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
}
