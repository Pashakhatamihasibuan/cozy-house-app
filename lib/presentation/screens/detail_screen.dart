import 'package:cozy_house/presentation/models/sanctuary_photo.dart';
import 'package:cozy_house/presentation/theme/color.dart';
import 'package:cozy_house/presentation/theme/fonts.dart';
import 'package:cozy_house/presentation/widgets/facilities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/list_space.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  final Space space;

  const DetailScreen({
    super.key,
    required this.space,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Photo> foto = Photo.getPhotos();
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    Future<void> openUrl(String url) async {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    }

    Future<void> showConfirmation() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFffcc00),
                    size: 85,
                  ),
                  Text(
                    'Konfirmasi',
                    style: blackTextSyle.copyWith(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            content: Text(
              'Apakah kamu ingin menghubungi pemilik kos?',
              style: regularTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            actions: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 100,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(
                            width: 2.0,
                            color: purpleColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context, 'Batal');
                        },
                        child: Text(
                          style: GoogleFonts.poppins(
                            color: purpleColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          'Batal',
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'Hubungi');
                          openUrl("tel:+${widget.space.phone}");
                        },
                        child: Text(
                          style: whiteTextSyle.copyWith(
                            fontSize: 16,
                          ),
                          'Hubungi',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              padding:
                  const EdgeInsets.only(top: 328), // Menggeser konten ke bawah
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      // Judul, Harga, dan Bintang
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space
                                      .name, // Menggunakan nama ruang dari model
                                  style: blackTextSyle.copyWith(fontSize: 22),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Text(
                                      "\$${widget.space.price}", // Menggunakan harga dari model
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                    ),
                                    Text(
                                      " / month",
                                      style:
                                          greyTextSyle.copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Menampilkan Rating Bintang
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < widget.space.rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: orangeColor,
                                  size: 20,
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Fasilitas Utama
                      Text(
                        "Main Facilities",
                        style: regularTextStyle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Facilities(
                            number: widget.space.numberOfKitchens,
                            imageUrl: "assets/icons/Icon_bar_counter.png",
                            description: "kitchen",
                          ),
                          const SizedBox(width: 35),
                          Facilities(
                            number: widget.space.numberOfBedrooms,
                            imageUrl: "assets/icons/Icon_double_bed.png",
                            description: "bedroom",
                          ),
                          const SizedBox(width: 35),
                          Facilities(
                            number: widget.space.numberOfCupboards,
                            imageUrl: "assets/icons/Icon_cupboard.png",
                            description: "cupboards",
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Foto
                      Text(
                        "Photo",
                        style: regularTextStyle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 88,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: foto.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  widget.space.photos[index],
                                  width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Lokasi
                      Text(
                        "Location",
                        style: regularTextStyle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.space
                                    .address, // Menggunakan lokasi dari model
                                style: greyTextSyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                widget.space.city, // Hardcoded or bisa diubah
                                style: greyTextSyle,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              openUrl(widget.space
                                  .mapUrl); // Menggunakan URL peta dari model
                            },
                            child: Image.asset(
                              "assets/icons/btn_location.png",
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: purpleColor,
                        ),
                        child: TextButton(
                          onPressed: () {
                            showConfirmation();
                          },
                          child: Text(
                            "Book Now",
                            style: whiteTextSyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30), // Memberikan ruang di bawah
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 24,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/icons/btn_back.png",
                  width: 40,
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 24,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                child: Image.asset(
                  isClicked
                      ? "assets/icons/Icon_love_solid.png"
                      : "assets/icons/btn_wishlist.png",
                  width: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
