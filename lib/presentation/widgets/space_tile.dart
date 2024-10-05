import 'package:cozy_house/presentation/theme/color.dart';
import 'package:cozy_house/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import '../models/list_space.dart';

class SpaceTile extends StatelessWidget {
  final Space space;
  const SpaceTile({
    super.key,
    required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            children: [
              SizedBox(
                width: 130,
                height: 110,
                child: Image.network(
                  space.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 70,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/Icon_star_solid.png",
                        width: 18,
                      ),
                      Text(
                        "${space.rating.toString()}/5",
                        style: whiteTextSyle.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12), // Mengurangi jarak antar elemen
        Expanded(
          // Menggunakan Expanded agar elemen dapat menyesuaikan lebar
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display name
                Text(
                  space.name,
                  style: blackTextSyle.copyWith(
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis, // Menghindari overflow teks
                  maxLines: 1,
                ),
                const SizedBox(height: 2),
                // Display price and month
                Row(
                  children: [
                    Text(
                      "\$${space.price}",
                      style: purpleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "/",
                      style: lightTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "month",
                      style: greyTextSyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8), // Mengurangi jarak antar elemen
                // Display address
                Text(
                  space.address,
                  style: lightTextStyle.copyWith(
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis, // Menghindari overflow teks
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
