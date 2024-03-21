import 'package:flutter/material.dart';
import 'package:sample_flutterapp/custome_stepper/flutter_vip_stepper.dart';
import 'package:sample_flutterapp/custome_stepper/widgets/stepper_dot_widget.dart';

class HorizontalStepperItem extends StatelessWidget {
  final StepperData item;
  final int index;
  final int totalLength;
  final int activeIndex;
  final bool isInverted;
  final Color activeColor;
  final Color inActiveColor;
  final double barHeight;
  final double iconHeight;
  final double iconWidth;
  final bool stepDotWithNoContent;
  final bool isFilledInActiveDot;

  const HorizontalStepperItem(
      {Key? key,
      required this.item,
      required this.index,
      required this.totalLength,
      required this.activeIndex,
      required this.isInverted,
      required this.activeColor,
      required this.inActiveColor,
      required this.barHeight,
      required this.iconHeight,
      required this.stepDotWithNoContent,
      required this.isFilledInActiveDot,
      required this.iconWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            isInverted ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: isInverted ? getInvertedChildren() : getChildren(),
      ),
    );
  }

  List<Widget> getChildren() {
    return [
      if (item.title != null) ...[
        SizedBox(
          child: Text(
            item.title!.text,
            textAlign: TextAlign.center,
            style: item.title!.textStyle ??
                const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const SizedBox(height: 4),
      ],
      if (item.subtitle != null) ...[
        SizedBox(
          child: Text(
            item.subtitle!.text,
            textAlign: TextAlign.center,
            style: item.subtitle!.textStyle ??
                const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        const SizedBox(height: 10),
      ],
      Row(
        children: [
          Flexible(
            child: Container(
              color: index == 0
                  ? Colors.transparent
                  : (index <= activeIndex ? activeColor : inActiveColor),
              height: barHeight,
            ),
          ),
          StepperDotProvider(
            activeIndex: activeIndex,
            index: index,
            item: item,
            iconHeight: iconHeight,
            iconWidth: iconWidth,
            activeColor: activeColor,
            inActiveColor: inActiveColor,
            isFilledInActiveDot: isFilledInActiveDot,
            stepDotWithNoContent: stepDotWithNoContent,
          ),
          Flexible(
            child: Container(
              color: index == totalLength - 1
                  ? Colors.transparent
                  : (index < activeIndex ? activeColor : inActiveColor),
              height: barHeight,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
