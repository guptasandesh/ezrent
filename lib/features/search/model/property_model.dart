// Model for Property
class Property {
  final String imageUrl;
  final String name;
  final String location;
  final double pricePerRoom;
  final double rating;

  Property({
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.pricePerRoom,
    required this.rating,
  });
}
