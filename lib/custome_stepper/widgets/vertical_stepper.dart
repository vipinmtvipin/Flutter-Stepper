import 'package:flutter/material.dart';
import 'package:sample_flutterapp/custome_stepper/flutter_vip_stepper.dart';
import 'package:sample_flutterapp/custome_stepper/widgets/stepper_dot_widget.dart';

class VerticalStepperItem extends StatelessWidget {
  final StepperData item;
  final int index;
  final int totalLength;
  final int activeIndex;
  final double gap;
  final bool isInverted;
  final Color activeColor;
  final Color inActiveColor;
  final double barWidth;
  final double iconHeight;
  final double iconWidth;
  final bool stepDotWithNoContent;
  final bool isFilledInActiveDot;
  const VerticalStepperItem(
      {Key? key,
      required this.item,
      required this.index,
      required this.totalLength,
      required this.gap,
      required this.activeIndex,
      required this.isInverted,
      required this.activeColor,
      required this.inActiveColor,
      required this.barWidth,
      required this.iconHeight,
      required this.isFilledInActiveDot,
      required this.stepDotWithNoContent,
      required this.iconWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: isInverted ? getInvertedChildren() : getChildren(),
    );
  }

  List<Widget> getChildren() {
    return [
      Column(
        children: [
          Container(
            color: index == 0
                ? Colors.transparent
                : (index <= activeIndex ? activeColor : inActiveColor),
            width: barWidth,
            height: gap,
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
          Container(
            color: index == totalLength - 1
                ? Colors.transparent
                : (index < activeIndex ? activeColor : inActiveColor),
            width: barWidth,
            height: gap,
          ),
        ],
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment:
              isInverted ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (item.title != null) ...[
              Text(
                item.title!.text,
                textAlign: TextAlign.start,
                style: item.title!.textStyle ??
                    const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
            if (item.subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                item.subtitle!.text,
                textAlign: TextAlign.start,
                style: item.subtitle!.textStyle ??
                    const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ],
        ),
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
