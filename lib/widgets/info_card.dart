import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    this.type = InfoCardType.info,
    this.icon,
    this.title = '',
    this.value = '',
  }) : super(key: key);

  final InfoCardType type;
  final IconData? icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(Constants.size8),
          child: Row(
            children: [
              Container(
                width: Constants.size70,
                height: Constants.size70,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Constants.size4),
                  ),
                  color: _determineIconBgColor(),
                ),
                child: Icon(icon, size: Constants.size34),
              ),
              Expanded(
                child: Container(
                  height: Constants.size70,
                  padding: const EdgeInsets.only(left: Constants.size10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: Constants.size16,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        value,
                        style: const TextStyle(
                          fontSize: Constants.size16,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color _determineIconBgColor() {
    if (type == InfoCardType.primary) return GenColor.primary;
    if (type == InfoCardType.success) return GenColor.primarySuccess;
    if (type == InfoCardType.warning) return GenColor.primaryWarning;
    if (type == InfoCardType.danger) return GenColor.primaryDanger;
    return GenColor.primaryInfo;
  }
}

enum InfoCardType { primary, success, info, warning, danger }
