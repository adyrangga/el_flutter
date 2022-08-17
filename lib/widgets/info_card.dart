import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';
import '../providers/cores/core_screen_size.dart';
import '../providers/dashboard_page_provider.dart';

class InfoCard extends StatelessWidget with CoreScreenSizeImpl {
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
    final screenSize = super.getScreenSize(context);
    return Container(
      width: _measureWidth(context, screenSize),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: Constants.size4,
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
                child: Icon(
                  icon,
                  size: Constants.size34,
                  color: Colors.white,
                ),
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
                      Text('${MediaQuery.of(context).size.width}'),
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

  double _measureWidth(BuildContext context, ScreenSize screenSize) {
    double wrapperWidth = screenSize.width;
    bool expandSideBar = context.watch<DashboardPageProvider>().expandSideBar;
    if (!screenSize.isMobileLS() && expandSideBar) {
      wrapperWidth -= Constants.kSideBarWidth;
    }
    double factor = 8;
    double sScreen = 580;
    double mScreen = screenSize.maxMobileLSWidth; // 760;
    var countForSScreen = 1;
    var countForMScreen = 2;
    var countForLScreen = 4;
    var frictionS = (countForSScreen + 1) * factor;
    var frictionM = (countForMScreen + 1) * factor;
    var frictionL = (countForLScreen + 1) * factor;
    var width = (wrapperWidth - frictionL) / countForLScreen;
    if (screenSize.width < sScreen) {
      width = (wrapperWidth - frictionS) / countForSScreen;
    } else if (screenSize.width < mScreen) {
      width = (wrapperWidth - frictionM) / countForMScreen;
    } else if (screenSize.width < screenSize.maxTabledWidth && expandSideBar) {
      width = (wrapperWidth - frictionM) / countForMScreen;
    }
    return width;
  }
}

enum InfoCardType { primary, success, info, warning, danger }
