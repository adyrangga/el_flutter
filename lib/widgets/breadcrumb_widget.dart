import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';
import 'anchor_widget.dart';
import 'package:collection/collection.dart';

class BreadcrumbWidget extends StatelessWidget {
  const BreadcrumbWidget({
    Key? key,
    this.data = const [],
  }) : super(key: key);

  final List<BreadcrumbDataModel> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: data.mapIndexed((i, e) {
        List<Widget> children = [];
        if (i < data.length - 1) {
          children.add(AnchorWidget(e.title, url: e.url, target: e.target));
          if (data.length > 1) {
            children.add(_itemSeparator());
          }
        } else {
          children.add(_itemActive());
        }
        return Row(children: children);
      }).toList(),
    );
  }

  Widget _itemActive() {
    return Text(
      Constants.dashboardTx,
      style: TextStyle(
        color: GenColor.cADB5BD,
        fontSize: Constants.size16,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Padding _itemSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.size8),
      child: Text(
        '/',
        style: TextStyle(
          color: GenColor.cADB5BD,
          fontSize: Constants.size16,
        ),
      ),
    );
  }
}

class BreadcrumbDataModel {
  final String title;
  final String url;
  final LinkTarget target;

  BreadcrumbDataModel(this.title,
      [this.url = '', this.target = LinkTarget.self]);
}
