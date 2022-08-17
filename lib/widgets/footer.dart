import 'package:el_flutter/providers/layout_manager_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: context.watch<LayoutManagerProvider>().showFooter
          ? Container(
              color: GenColor.primaryDark,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(Constants.size8),
                child: Text(
                  Constants.copyrightTx,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
