import 'package:el_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

import '../constants/gen_color.dart';

class IconBadge extends StatelessWidget {
  final Widget icon;
  final String value;
  final Color badgeColor;
  final VoidCallback? onPressed;

  const IconBadge({
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

class BadgeWidget extends StatelessWidget {
  const BadgeWidget(this.data, {Key? key, this.margin}) : super(key: key);

  final String data;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            margin: margin,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constants.size4),
              color: GenColor.primaryDanger,
            ),
            constraints: const BoxConstraints(
              minWidth: Constants.half,
              maxHeight: Constants.size16,
            ),
            child: Padding(
              padding: const EdgeInsets.all(Constants.size2),
              child: Text(
                data,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: Constants.size9,
                      color: Colors.white,
                    ),
              ),
            ),
          )
        : const SizedBox();
  }
}
