import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';
import '../data/models/expansion_menu_tile_model.dart';
import 'icon_badge.dart';

class ExpansionMenuTile extends StatelessWidget {
  const ExpansionMenuTile(
    this.data, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  final ExpansionMenuTileModel data;
  final Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: data.children.isNotEmpty
          ? ExpansionTile(
              tilePadding: const EdgeInsets.only(left: Constants.size16),
              title: ExpansionTitle(data: data),
              leading: _svgAsset(),
              children: _expansionTileChildren(),
            )
          : ListTile(
              contentPadding: const EdgeInsets.only(left: Constants.size16),
              title: Text(data.title),
              leading: _svgAsset(),
              trailing: BadgeWidget(
                data.badgeValue!,
                margin: const EdgeInsets.only(
                  top: Constants.size2,
                  right: Constants.size6,
                ),
              ),
              onTap: onTap != null ? () => onTap!(data.id) : null,
            ),
    );
  }

  List<ListTile> _expansionTileChildren() {
    return data.children
        .map((val) => ListTile(
              contentPadding: const EdgeInsets.only(left: Constants.size32),
              title: Text(val.title),
              horizontalTitleGap: 0,
              leading: Radio(value: val.id, groupValue: '', onChanged: null),
              onTap: onTap != null ? () => onTap!(val.id) : null,
            ))
        .toList();
  }

  Widget _svgAsset() => SvgPicture.asset(
        data.asset,
        color: GenColor.linkNav,
        width: Constants.size16,
        height: Constants.size16,
        semanticsLabel: data.title,
      );
}

class ExpansionTitle extends StatelessWidget {
  const ExpansionTitle({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ExpansionMenuTileModel data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(data.title),
        Positioned(
          top: Constants.size2,
          right: Constants.zeroNum.toDouble(),
          child: BadgeWidget(data.badgeValue!),
        ),
      ],
    );
  }
}
