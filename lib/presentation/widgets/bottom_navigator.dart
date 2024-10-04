import 'package:cozy_house/presentation/theme/color.dart';
import 'package:flutter/material.dart';

class ButtomNavItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  const ButtomNavItem({
    super.key,
    required this.imageUrl,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            imageUrl,
            width: 26,
          ),
          const Spacer(),
          isActive
              ? Container(
                  width: 30,
                  height: 2,
                  decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
