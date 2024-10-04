import 'package:cozy_house/presentation/screens/home_screen.dart';
import 'package:cozy_house/presentation/theme/color.dart';
import 'package:cozy_house/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 214,
            left: 27,
            right: 27,
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/images/404.png",
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                "Where are you going?",
                style: blackTextSyle.copyWith(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Seems like the page that you were\nrequested is already gone",
                style: greyTextSyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 210,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Back to Home",
                    style: whiteTextSyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
