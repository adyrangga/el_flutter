import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'breadcrumb_widget.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Constants.size16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            Constants.dashboardTx,
            style: TextStyle(fontSize: Constants.size28),
          ),
          BreadcrumbWidget(data: [
            BreadcrumbDataModel('Home', 'http://localhost:62623/#/'),
            BreadcrumbDataModel('Dashboard'),
          ]),
        ],
      ),
    );
  }
}
