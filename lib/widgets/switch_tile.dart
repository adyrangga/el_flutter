import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';

class SwitchTile extends StatelessWidget {
  const SwitchTile({
    Key? key,
    this.title = '',
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: Constants.size16,
          color: GenColor.primaryTextDark,
        ),
      ),
      value: value,
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}
