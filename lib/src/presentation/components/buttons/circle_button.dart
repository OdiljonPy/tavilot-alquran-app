import 'package:al_quran/src/presentation/components/buttons/animation_button_effect.dart';
import 'package:flutter/material.dart';
import '../../styles/style.dart';


class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final double height;
  final double width;
  final double iconSize;
  final bool isBorder;

  const CircleButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor = Style.greyColor,
    this.height = 36,
    this.width = 36,
    this.iconSize = 21,
    this.isBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffect(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: isBorder
              ? Border.all(color: Style.colorGrey)
              : Border.all(width: 0, color: Style.transparent),
        ),
        child: Center(
            child: Icon(
              icon,
              color: Style.black,
              size: iconSize,
            )),
      ),
    );
  }
}
