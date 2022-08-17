import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget(this.data, {Key? key, this.margin}) : super(key: key);

  final String data;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty && data != '0'
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
