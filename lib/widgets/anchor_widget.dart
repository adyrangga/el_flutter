import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';

class AnchorWidget extends StatelessWidget {
  const AnchorWidget(
    this.title, {
    Key? key,
    required this.url,
    this.target = LinkTarget.self,
  }) : super(key: key);

  final String title;
  final String url;
  final LinkTarget target;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Link(
        uri: Uri.parse(url),
        target: target,
        builder: (context, followLink) {
          return GestureDetector(
            onTap: followLink,
            child: Text(
              title,
              style: TextStyle(
                color: GenColor.primary,
                fontSize: Constants.size16,
              ),
            ),
          );
        },
      ),
    );
  }
}
