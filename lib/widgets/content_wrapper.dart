import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ContentWrapper extends StatelessWidget {
  const ContentWrapper({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.size8,
            vertical: Constants.size16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
