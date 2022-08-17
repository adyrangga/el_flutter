import 'package:el_flutter/constants/constants.dart';
import 'package:el_flutter/constants/gen_color.dart';
import 'package:flutter/material.dart';

import 'badge_widget.dart';

class SideBarMenuTile extends StatelessWidget {
  const SideBarMenuTile({
    Key? key,
    this.leading,
    this.title = '',
    this.trailing = const Icon(Icons.keyboard_arrow_down_rounded),
    this.leadingPad = const EdgeInsets.only(left: Constants.size6),
    this.titlePad = const EdgeInsets.only(left: Constants.size6),
    this.trailingPad = const EdgeInsets.only(left: Constants.size6),
    this.badgeData = '',
    this.withoutTrailing = false,
    this.expandSideBar = true,
    this.dense = false,
  }) : super(key: key);

  final Widget? leading;
  final String title;
  final Widget? trailing;
  final EdgeInsetsGeometry leadingPad;
  final EdgeInsetsGeometry titlePad;
  final EdgeInsetsGeometry trailingPad;
  final String badgeData;
  final bool withoutTrailing;
  final bool expandSideBar;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dense ? Constants.size32 : Constants.size48,
      child: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: Theme.of(context)
              .iconTheme
              .copyWith(color: GenColor.primaryTextDark),
        ),
        child: Row(
          children: [
            SideBarMenuTileLeading(leading: leading, leadingPad: leadingPad),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1500),
                reverseDuration: const Duration(milliseconds: 500),
                child: expandSideBar
                    ? Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: titlePad,
                              child: Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: Constants.size16,
                                  color: GenColor.primaryTextDark,
                                ),
                              ),
                            ),
                          ),
                          badgeData.isNotEmpty
                              ? BadgeWidget(badgeData)
                              : const SizedBox(),
                          SideBarMenuTileTrailing(
                            withoutTrailing: withoutTrailing,
                            trailingPad: trailingPad,
                            trailing: trailing,
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SideBarMenuTileLeading extends StatelessWidget {
  const SideBarMenuTileLeading({
    Key? key,
    required this.leading,
    required this.leadingPad,
  }) : super(key: key);

  final Widget? leading;
  final EdgeInsetsGeometry leadingPad;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: leading != null
          ? Padding(
              padding: leadingPad,
              child: SizedBox(
                width: Constants.size36,
                child: leading,
              ),
            )
          : const SizedBox(),
    );
  }
}

class SideBarMenuTileTrailing extends StatelessWidget {
  const SideBarMenuTileTrailing({
    Key? key,
    required this.withoutTrailing,
    required this.trailingPad,
    required this.trailing,
  }) : super(key: key);

  final bool withoutTrailing;
  final EdgeInsetsGeometry trailingPad;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: withoutTrailing
          ? const SizedBox()
          : Padding(
              padding: trailingPad,
              child: trailing,
            ),
    );
  }
}
