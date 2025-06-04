import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget(
      {super.key,
      required this.imagePage,
      required this.title,
      required this.subtitle});
  final String imagePage;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.red,
      child: Column(children: [
       SvgPicture.asset(imagePage,height: 200,),
       const SizedBox(height: 10),
       Text(
          title,
          style: const TextStyle(
            fontSize: 20,)),
        const SizedBox(height: 5),
        // Text(
        //   subtitle,
        //   style: const TextStyle(
        //     fontSize: 16,
        //     color: Colors.grey,
        //   ),
        // ),
      ],),
    );
  }
}
