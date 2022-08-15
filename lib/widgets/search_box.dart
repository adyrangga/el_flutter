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
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        isDense: true,
        label: const Text(Constants.searchTx),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 2, 2, 2),
          child: Material(
            shape: Border(
              left: BorderSide(color: GenColor.primaryBorderDark, width: 2),
            ),
            child: IconButton(
              onPressed: () {
                debugPrint('icon clicked!');
              },
              icon: const SvgSearchWidget(color: Colors.white),
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.size4),
          borderSide: BorderSide(color: GenColor.primaryBorderDark),
        ),
      ),
    );
  }
}
