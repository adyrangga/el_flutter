import 'package:flutter/material.dart';

import 'badge_widget.dart';

class IconBadge extends StatelessWidget {
  const IconBadge({
    Key? key,
    required this.icon,
    this.value = '',
    this.enabled = true,
  }) : super(key: key);

  final Widget icon;
  final String value;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [icon],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: BadgeWidget(value),
          ),
        ],
      ),
    );
  }
}
