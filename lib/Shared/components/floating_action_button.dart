import 'package:flutter/material.dart';
import 'package:coffee_app/Shared/Resource/view_mangment.dart';

class FloatingActionBubble extends AnimatedWidget {
  const FloatingActionBubble({
    Key? key,
    required this.items,
    required this.onPress,
    required this.iconColor,
    required this.backGroundColor,
    required Animation animation,
    this.herotag,
    this.iconData,
    this.animatedIconData,
  })  : assert((iconData == null && animatedIconData != null) ||
            (iconData != null && animatedIconData == null)),
        super(listenable: animation, key: key);

  final List<Bubble> items;
  final void Function() onPress;
  final AnimatedIconData? animatedIconData;
  final Object? herotag;
  final IconData? iconData;
  final Color iconColor;
  final Color backGroundColor;

  get _animation => listenable;

  Widget buildItem(BuildContext context, int index) {
    final screenWidth = MediaQuery.of(context).size.width;

    TextDirection textDirection = Directionality.of(context);

    double animationDirection = textDirection == TextDirection.ltr ? -1 : 1;

    final transform = Matrix4.translationValues(
      animationDirection *
          (screenWidth - _animation.value * screenWidth) *
          ((items.length - index) / 4),
      0.0,
      0.0,
    );

    return Align(
      alignment: textDirection == TextDirection.ltr
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Transform(
        transform: transform,
        child: Opacity(
          opacity: _animation.value,
          child: BubbleMenu(items[index]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IgnorePointer(
          ignoring: _animation.value == 0,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(height: 5.0),
            padding: const EdgeInsets.symmetric(vertical: 5),
            itemCount: items.length,
            itemBuilder: buildItem,
          ),
        ),

        /// Creates a circular floating action button.
        ///
        /// The [mini] and [clipBehavior] arguments must not be null. Additionally,
        /// [elevation], [highlightElevation], and [disabledElevation] (if specified)
        /// must be non-negative.
        FloatingActionButton(
          heroTag: herotag ?? const _DefaultHeroTag(),
          backgroundColor: backGroundColor,
          onPressed: onPress,
          // iconData is mutually exclusive with animatedIconData
          // only 1 can be null at the time
          child: iconData == null
              ? AnimatedIcon(
                  icon: animatedIconData!,
                  progress: _animation,
                  color: iconColor,
                )
              : Icon(
                  iconData,
                  color: iconColor,
                ),
        ),
      ],
    );
  }
}

/// Creates a bubble item for floating action menu button.
class Bubble {
  const Bubble({
    required IconData icon,
    required Color iconColor,
    required String title,
    required TextStyle titleStyle,
    required Color bubbleColor,
    required this.onPress,
  })  : _icon = icon,
        _iconColor = iconColor,
        _title = title,
        _titleStyle = titleStyle,
        _bubbleColor = bubbleColor;

  final IconData _icon;
  final Color _iconColor;
  final String _title;
  final TextStyle _titleStyle;
  final Color _bubbleColor;
  final void Function() onPress;
}

/// Creates a bubble menu for all the items for floating action menu button.
class BubbleMenu extends StatelessWidget {
  const BubbleMenu(this.item, {Key? key}) : super(key: key);

  final Bubble item;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const StadiumBorder(),
      padding: EdgeInsets.only(
          top: PaddingEdit.p8,
          bottom: PaddingEdit.p8,
          left: PaddingEdit.p16,
          right: PaddingEdit.p16),
      color: item._bubbleColor,
      splashColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.grey.withOpacity(0.1),
      elevation: 10,
      highlightElevation: 2,
      disabledColor: item._bubbleColor,
      onPressed: item.onPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            item._icon,
            color: item._iconColor,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            item._title,
            style: item._titleStyle,
          ),
        ],
      ),
    );
  }
}

/// Creates a Default hero tag for the floating action bubble.
class _DefaultHeroTag {
  const _DefaultHeroTag();
  @override
  String toString() => '<default FloatingActionBubble tag>';
}
