class City {
  int id;
  String imageUrl;
  String name;
  bool isClick;
  City({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.isClick,
  });

  // Tambahkan daftar contoh data di dalam class City sebagai static
  static List<City> getCities() {
    return [
      City(
          id: 1,
          imageUrl: "assets/images/pic1.png",
          name: "Jakarta",
          isClick: false),
      City(
          id: 2,
          imageUrl: "assets/images/pic2.png",
          name: "Bandung",
          isClick: false),
      City(
          id: 3,
          imageUrl: "assets/images/pic3.png",
          name: "Surabaya",
          isClick: false),
      City(
          id: 4,
          imageUrl: "assets/images/pic4.png",
          name: "Palembang",
          isClick: false),
      City(
          id: 5,
          imageUrl: "assets/images/pic5.png",
          name: "Aceh",
          isClick: false),
      City(
          id: 6,
          imageUrl: "assets/images/pic6.png",
          name: "Bogor",
          isClick: false),
    ];
  }
}
