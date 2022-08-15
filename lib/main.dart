import 'package:el_flutter/pages/dashboard_page.dart';
import 'package:el_flutter/widgets/apps_bar.dart';
import 'package:flutter/material.dart';

import 'constants/gen_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: GenColor.primaryDarkLight,
        canvasColor: GenColor.primaryDark,
      ),
      home: const DashboardPage(title: 'Flutter Demo Home Page'),
    );
  }
}
