import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';
import '../data/models/expansion_menu_tile_model.dart';
import 'badge_widget.dart';

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
              backgroundColor: GenColor.primaryDark,
              collapsedBackgroundColor: GenColor.primaryDark,
              iconColor: GenColor.primaryTextDark,
              collapsedIconColor: GenColor.primaryTextDark,
              children: _expansionTileChildren(),
            )
          : ListTile(
              contentPadding: const EdgeInsets.only(left: Constants.size16),
              title: Text(
                data.title,
                style: TextStyle(color: GenColor.primaryTextDark),
              ),
              leading: _svgAsset(),
              trailing: BadgeWidget(
                data.badgeValue!,
                margin: const EdgeInsets.only(
                  top: Constants.size2,
                  right: Constants.size6,
                ),
              ),
              onTap: onTap != null ? () => onTap!(data.id) : null,
              tileColor: GenColor.primaryDark,
            ),
    );
  }

  List<ListTile> _expansionTileChildren() {
    return data.children
        .map((val) => ListTile(
              contentPadding: const EdgeInsets.only(left: Constants.size32),
              title: Text(
                val.title,
                style: TextStyle(
                  color: GenColor.primaryTextDark,
                ),
              ),
              horizontalTitleGap: 0,
              leading: Icon(
                Icons.circle_outlined,
                size: Constants.size18,
                color: GenColor.primaryTextDark,
              ),
              onTap: onTap != null ? () => onTap!(val.id) : null,
            ))
        .toList();
  }

  Widget _svgAsset() => SvgPicture.asset(
        data.asset,
        color: GenColor.primaryTextDark,
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
        Text(data.title, style: TextStyle(color: GenColor.primaryTextDark)),
        Positioned(
          top: Constants.size2,
          right: Constants.zeroNum.toDouble(),
          child: BadgeWidget(data.badgeValue!),
        ),
      ],
    );
  }
}
