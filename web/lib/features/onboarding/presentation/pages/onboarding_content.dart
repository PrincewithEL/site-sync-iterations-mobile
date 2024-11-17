// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardContent extends StatelessWidget {
  String image;
  String description;

  OnBoardContent({
    super.key,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SvgPicture.asset(
          image, 
          fit: BoxFit.scaleDown,
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        const SizedBox(height: 10.0,),
        Text(description, 
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            ),
        const SizedBox(height: 10.0,),
      ],
    );
  }
}