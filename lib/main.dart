import 'package:el_flutter/providers/apps_bar_provider.dart';
import 'package:el_flutter/providers/layout_manager_provider.dart';
import 'package:el_flutter/providers/cores/theme_manager_provider.dart';
import 'package:el_flutter/pages/dashboard_page.dart';
import 'package:el_flutter/providers/dashboard_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';
import 'constants/gen_color.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManagerProvider()),
        ChangeNotifierProvider(create: (_) => LayoutManagerProvider()),
        ChangeNotifierProvider(create: (_) => AppsBarProvider()),
        ChangeNotifierProvider(create: (_) => DashboardPageProvider()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: GenColor.primaryDarkLight,
        canvasColor: GenColor.primaryDark,
      ),
      theme: ThemeData.light(),
      themeMode: context.watch<ThemeManagerProvider>().themeMode,
      home: const DashboardPage(title: Constants.arayaOnFlutterTx),
    );
  }
}
