import 'package:el_flutter/core_managers/theme_manager/theme_manager_provider.dart';
import 'package:el_flutter/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/gen_color.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManagerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const DashboardPage(title: 'Flutter Demo Home Page'),
    );
  }
}
