class Photo {
  String imageUrl;

  Photo({
    required this.imageUrl,
  });

  // Menyediakan daftar contoh data foto sebagai static
  static List<Photo> getPhotos() {
    return [
      Photo(
        imageUrl: "assets/images/pic1.png",
      ),
      Photo(
        imageUrl: "assets/images/pic2.png",
      ),
      Photo(
        imageUrl: "assets/images/pic3.png",
      ),
    ];
  }
}
