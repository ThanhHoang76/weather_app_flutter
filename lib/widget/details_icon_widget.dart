import 'package:flutter/material.dart';

import '../ultis/custom_colors.dart';

/// `DetailsIcon` is a stateful widget that displays an image asset in a circular
/// container with a shadow
class DetailsIcon extends StatefulWidget {
  Color color;
  String imageAsset;
  DetailsIcon({
    Key? key,  this.color = CustomColors.cardColor, required this.imageAsset
  }) : super(key: key);

  @override
  State<DetailsIcon> createState() => _DetailsIconState();
}

class _DetailsIconState extends State<DetailsIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                blurRadius: 30,
                offset: Offset(28, 28),
                color: Color(0xFFA7A9AF))
          ]),
      child: Image.asset(widget.imageAsset),
    );
  }
}