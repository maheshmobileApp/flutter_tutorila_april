import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/utils/constants/appcolors/app_colors.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget(
      {super.key,
      required this.title,
      required this.timings,
      this.backgroundColor});
  final String title;
  final String timings;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                  color: backgroundColor != null
                      ? AppColors.eventUnselectedColor
                      : AppColors.textColor),
            ),
            Text(timings)
          ]),
        ),
      ),
    );
  }
}
