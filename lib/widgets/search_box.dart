import 'package:el_flutter/widgets/svg_widgets.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/gen_color.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GenColor.c3F474E,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          isDense: true,
          hintText: Constants.searchTx,
          hintStyle: TextStyle(color: GenColor.cADB5BD),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 2, 2),
            child: Material(
              color: GenColor.c3F474E,
              shape: Border(
                left: BorderSide(color: GenColor.secondaryBorderDark, width: 1),
              ),
              child: IconButton(
                onPressed: () {
                  debugPrint('icon clicked!');
                },
                icon: const SvgSearchWidget(color: Colors.white),
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.size4),
            borderSide: BorderSide(color: GenColor.secondaryBorderDark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.size4),
            borderSide: BorderSide(color: GenColor.linkNav),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.size4),
            borderSide: BorderSide(color: GenColor.secondaryBorderDark),
          ),
        ),
      ),
    );
  }
}
