import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';
import '../widgets/apps_bar.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppsBar(),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SideBar(),
          ],
        ),
        endDrawer: const SettingsDrawer(),
        endDrawerEnableOpenDragGesture: false,
      ),
    );
  }
}
