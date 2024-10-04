class Space {
  int id;
  String name;
  String city;
  String country;
  String imageUrl;

  int price;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List<String> photos;
  int numberOfKitchens;
  int numberOfBedrooms;
  int numberOfCupboards;

  Space({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.address,
    required this.phone,
    required this.mapUrl,
    required this.photos,
    required this.numberOfKitchens,
    required this.numberOfBedrooms,
    required this.numberOfCupboards,
  });

  // Fungsi untuk mengubah dari JSON ke objek Space
  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
      id: json['id'] ?? 0, // Menggunakan default value jika null
      name: json['name'] ?? '', // Default ke string kosong
      city: json['city'] ?? '',
      country: json['country'] ?? '',
      imageUrl: json['image_url'] ?? '', // Perhatikan kunci ini
      price: json['price'] ?? 0,
      rating: json['rating'] ?? 0,
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      photos: List<String>.from(json['photos'].map((x) => x.toString())),
      mapUrl: json['map_url'] ?? '',
      numberOfKitchens:
          json['number_of_kitchens'] ?? 0, // Sesuaikan jika ada di JSON
      numberOfBedrooms:
          json['number_of_bedrooms'] ?? 0, // Sesuaikan jika ada di JSON
      numberOfCupboards:
          json['number_of_cupboards'] ?? 0, // Sesuaikan jika ada di JSON
    );
  }
}
