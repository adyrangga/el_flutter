import 'package:el_flutter/providers/cores/theme_manager_provider.dart';
import 'package:el_flutter/widgets/expansion_window_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';
import '../providers/cores/core_screen_size.dart';
import '../widgets/apps_bar.dart';
import '../widgets/content_header.dart';
import '../widgets/content_wrapper.dart';
import '../widgets/footer.dart';
import '../widgets/info_card.dart';
import '../widgets/customize_drawer.dart';
import '../widgets/side_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with CoreScreenSizeImpl {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var provider = Provider.of<ThemeManagerProvider>(context, listen: false);
      bool isBrightnessDark = Theme.of(context).brightness == Brightness.dark;
      ThemeMode themeMode = provider.themeMode;
      provider.setThemeMode(themeMode, isBrightnessDark);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = super.getScreenSize(context);
    return SafeArea(
      child: Scaffold(
        appBar: const AppsBar(),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SideBar(),
            ContentWrapper(
              children: [
                const ContentHeader(),
                const ContentInfoCards(),
                const ExpansionWindowCard(
                  title: 'Default Example',
                  onTapClose: null,
                ),
                ExpansionWindowCard(
                  title: 'Default with Actions Example',
                  actions: [
                    IconButton(
                      onPressed: () {},
                      iconSize: Constants.size16,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                const ExpansionWindowCard(
                  title: 'Expansion Only Example',
                  closeableAction: false,
                ),
                const ExpansionWindowCard(
                  title: 'No Actions Header Example',
                  collapsibleAction: false,
                  closeableAction: false,
                ),
              ],
            ),
          ],
        ),
        drawer: screenSize.isMobileLS()
            ? Drawer(
                backgroundColor: GenColor.primaryDark,
                width: Constants.kSideBarWidth,
                child: const SideBar(),
              )
            : null,
        drawerEnableOpenDragGesture: false,
        endDrawer: const CustomizeDrawer(),
        endDrawerEnableOpenDragGesture: false,
        bottomNavigationBar: const Footer(),
      ),
    );
  }
}

class ContentInfoCards extends StatelessWidget {
  const ContentInfoCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
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
    );
  }
}
