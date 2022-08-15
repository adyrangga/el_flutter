import 'package:el_flutter/core_managers/theme_manager/theme_manager_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../widgets/apps_bar.dart';
import '../widgets/content_header.dart';
import '../widgets/info_card.dart';
import '../widgets/settings_drawer.dart';
import '../widgets/side_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ThemeMode themeMode =
          Provider.of<ThemeManagerProvider>(context, listen: false).themeMode;
      bool isBrightnessDark = Theme.of(context).brightness == Brightness.dark;
      Provider.of<ThemeManagerProvider>(context, listen: false)
          .setThemeMode(themeMode, isBrightnessDark);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppsBar(),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SideBar(),
            Expanded(child: ContentWrapper()),
          ],
        ),
        endDrawer: const SettingsDrawer(),
        endDrawerEnableOpenDragGesture: false,
      ),
    );
  }
}

class ContentWrapper extends StatelessWidget {
  const ContentWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.size8,
          vertical: Constants.size16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContentHeader(),
            Row(
              children: const [
                InfoCard(
                  title: 'CPU Traffic',
                  value: '10%',
                  icon: Icons.settings,
                ),
                InfoCard(
                  title: 'CPU Traffic',
                  value: '10%',
                  icon: Icons.settings,
                  type: InfoCardType.danger,
                ),
                InfoCard(
                  title: 'CPU Traffic',
                  value: '10%',
                  icon: Icons.settings,
                  type: InfoCardType.success,
                ),
                InfoCard(
                  title: 'CPU Traffic',
                  value: '10%',
                  icon: Icons.settings,
                  type: InfoCardType.warning,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
