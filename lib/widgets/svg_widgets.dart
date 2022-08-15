import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';

class SvgSearchWidget extends StatelessWidget {
  const SvgSearchWidget({
    Key? key,
    this.size = Constants.size16,
    this.color,
  }) : super(key: key);

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/magnifying-glass.svg',
      color: color ?? GenColor.linkNav,
      width: size,
      height: size,
      semanticsLabel: 'Search',
    );
  }
}
