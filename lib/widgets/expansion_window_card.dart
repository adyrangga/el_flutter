import 'package:el_flutter/constants/constants.dart';
import 'package:el_flutter/constants/gen_color.dart';
import 'package:flutter/material.dart';

class ExpansionWindowCard extends StatefulWidget {
  const ExpansionWindowCard({
    Key? key,
    this.title = '',
    this.padding = const EdgeInsets.only(top: Constants.size16),
    this.actions = const [],
    this.body,
    this.collapsibleAction = true,
    this.closeableAction = true,
    this.onTapClose,
  }) : super(key: key);

  final String title;
  final EdgeInsetsGeometry padding;
  final List<Widget> actions;
  final Widget? body;
  final bool collapsibleAction;
  final bool closeableAction;
  final void Function()? onTapClose;

  @override
  State<ExpansionWindowCard> createState() => _ExpansionWindowCardState();
}

class _ExpansionWindowCardState extends State<ExpansionWindowCard>
    with TickerProviderStateMixin {
  bool _expand = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        setState(() {
          _expand = status == AnimationStatus.completed;
        });
      }
    })
    ..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).canvasColor,
      margin: widget.padding,
      elevation: Constants.size4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderExpansionWindowCard(
            title: widget.title,
            expand: _expand,
            onToggleExpansion: _onToggleExpansion,
            actions: widget.actions,
            collapsibleAction: widget.collapsibleAction,
            closeableAction: widget.closeableAction,
            onTapClose: widget.onTapClose,
          ),
          SizeTransition(
            sizeFactor: _animation,
            axis: Axis.vertical,
            axisAlignment: Constants.negativeOne,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: GenColor.divider,
                  height: Constants.size2,
                  thickness: Constants.oneHalf,
                ),
                Padding(
                  padding: const EdgeInsets.all(Constants.size20),
                  child: widget.body ?? const NoContentAvailableText(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onToggleExpansion() {
    if (_expand) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }
}

class HeaderExpansionWindowCard extends StatelessWidget {
  const HeaderExpansionWindowCard({
    Key? key,
    required this.title,
    required this.expand,
    required this.onToggleExpansion,
    required this.actions,
    required this.collapsibleAction,
    required this.closeableAction,
    this.onTapClose,
  }) : super(key: key);

  final String title;
  final bool expand;
  final void Function() onToggleExpansion;
  final List<Widget> actions;
  final bool collapsibleAction;
  final bool closeableAction;
  final void Function()? onTapClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.size40,
      padding: const EdgeInsets.only(left: Constants.size16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: Constants.size18),
            ),
          ),
          Row(
            children: [
              ...actions.map((e) => e).toList(),
              collapsibleAction
                  ? IconButton(
                      onPressed: onToggleExpansion,
                      iconSize: Constants.size18,
                      icon: Icon(
                          expand ? Icons.remove : Icons.keyboard_arrow_down),
                    )
                  : const SizedBox(),
              closeableAction
                  ? IconButton(
                      onPressed: onTapClose,
                      iconSize: Constants.size18,
                      icon: const Icon(Icons.close),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class NoContentAvailableText extends StatelessWidget {
  const NoContentAvailableText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        Constants.noContentAvailableTx,
        textAlign: TextAlign.center,
      ),
    );
  }
}
