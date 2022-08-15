import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';
import '../core_managers/theme_manager/theme_manager_provider.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({
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
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                primary: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Constants.size16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwitchListTile(
                        value: context.watch<ThemeManagerProvider>().darkMode,
                        onChanged: (value) {
                          debugPrint('Switch Dark Mode $value');
                          context
                              .read<ThemeManagerProvider>()
                              .setDarkMode(value);
                        },
                        title: const Text('Dark Mode'),
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      )
                    ],
                  ),
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
          Text(
            Constants.customizeTx,
            style: Theme.of(context).textTheme.headline6,
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
