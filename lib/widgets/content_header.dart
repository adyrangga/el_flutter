import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'breadcrumb_widget.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Constants.size8,
        bottom: Constants.size18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            Constants.dashboardTx,
            style: TextStyle(fontSize: Constants.size28),
            overflow: TextOverflow.ellipsis,
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
