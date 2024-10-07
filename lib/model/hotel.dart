class Hotel {
  const Hotel({
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.rating,
    required this.price,
    required this.totalBedroom,
    required this.totalBathroom,
  });

  final String name;
  final String imageUrl;
  final String address;
  final double rating;
  final double price;
  final int totalBedroom;
  final int totalBathroom;
}
