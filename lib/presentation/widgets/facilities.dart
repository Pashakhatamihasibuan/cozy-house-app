import 'package:cozy_house/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';

class Facilities extends StatelessWidget {
  final int number;
  final String imageUrl;
  final String description;

  Facilities({
    super.key,
    required this.number,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$number',
                style: purpleTextStyle,
              ),
              TextSpan(
                text: " $description",
                style: lightTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
