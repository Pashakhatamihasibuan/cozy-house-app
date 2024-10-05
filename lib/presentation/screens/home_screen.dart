import 'package:cozy_house/presentation/models/city.dart';
import 'package:cozy_house/presentation/provider/space_provider.dart';
import 'package:cozy_house/presentation/screens/detail_screen.dart';
import 'package:cozy_house/presentation/screens/error_screen.dart';
import 'package:cozy_house/presentation/theme/color.dart';
import 'package:cozy_house/presentation/theme/fonts.dart';
import 'package:cozy_house/presentation/widgets/bottom_navigator.dart';
import 'package:cozy_house/presentation/widgets/city_card.dart';
import 'package:cozy_house/presentation/widgets/space_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool isClick;
  List<City> cities = City.getCities();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SpaceProvider>(context, listen: false).getRecommendedSpace();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Text(
                  "Explore Now",
                  style: blackTextSyle.copyWith(fontSize: 24),
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Text(
                  "Mencari kosan yang cozy",
                  style: greyTextSyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Text(
                  "Popular Cities",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              // Popular Cities
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                ),
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          if (index == 0) const SizedBox(width: 0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                for (var city in cities) {
                                  city.isClick = false;
                                }
                                cities[index].isClick = true;
                              });
                            },
                            child: CityCard(city: cities[index]),
                          ),
                          const SizedBox(width: 20),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Recommended Space
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Text(
                  "Recommended Space",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              // Menampilkan rekomendasi Space dari Provider
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Consumer<SpaceProvider>(
                  builder: (context, spaceProvider, child) {
                    if (spaceProvider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (spaceProvider.hasError) {
                      return const Center(child: Text("Error loading spaces."));
                    }
                    if (spaceProvider.spaces.isEmpty) {
                      return const Center(child: Text("No spaces available."));
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: spaceProvider.spaces.length,
                      itemBuilder: (context, index) {
                        var space = spaceProvider.spaces[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(space: space),
                              ),
                            );
                          },
                          child: SpaceTile(space: space),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 30), // Jarak antar item
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // Tips & Guidance
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Text(
                  "Tips & Guidance",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              // City Guidelines
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ErrorScreen(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Image.asset(
                    "assets/icons/icon_tipspurple.png",
                    width: 80,
                    height: 80,
                  ),
                  title: Text(
                    "City Guidelines",
                    style: blackTextSyle.copyWith(fontSize: 18),
                  ),
                  subtitle: Text(
                    "Updated 20 Apr",
                    style: greyTextSyle.copyWith(fontSize: 14),
                  ),
                  trailing: Image.asset(
                    "assets/icons/Icon_right_outline.png",
                    width: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Jakarta Fairship
              ListTile(
                leading: Image.asset(
                  "assets/icons/icon_tipsblue.png",
                  width: 80,
                  height: 80,
                ),
                title: Text(
                  "Jakarta Fairship",
                  style: blackTextSyle.copyWith(fontSize: 18),
                ),
                subtitle: Text(
                  "Updated 11 Dec",
                  style: greyTextSyle.copyWith(fontSize: 14),
                ),
                trailing: Image.asset(
                  "assets/icons/Icon_right_outline.png",
                  width: 20,
                ),
              ),
              const SizedBox(height: 50 + 65),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * 24),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: whiteshadeColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtomNavItem(
              imageUrl: "assets/icons/Icon_home_solid_purple.png",
              isActive: true,
            ),
            ButtomNavItem(
              imageUrl: "assets/icons/Icon_mail_solid_grey.png",
              isActive: false,
            ),
            ButtomNavItem(
              imageUrl: "assets/icons/Icon_card_solid_grey.png",
              isActive: false,
            ),
            ButtomNavItem(
              imageUrl: "assets/icons/Icon_love_solid_grey.png",
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
