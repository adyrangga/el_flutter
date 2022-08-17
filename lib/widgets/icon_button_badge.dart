import 'package:el_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

import 'badge_widget.dart';

class IconButtonBadge extends StatelessWidget {
  final Widget icon;
  final String value;
  final Color badgeColor;
  final VoidCallback? onPressed;

  const IconButtonBadge({
    Key? key,
    required this.icon,
    required this.value,
    this.badgeColor = Colors.red,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
        value.isNotEmpty
            ? Positioned(
                right: Constants.size4,
                top: Constants.size8,
                child: Opacity(
                  opacity: onPressed != null ? Constants.full : Constants.half,
                  child: BadgeWidget(value),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
