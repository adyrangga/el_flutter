import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';

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
                      Text('data'),
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
