import 'package:flutter/material.dart';
import '../model/property_model.dart';

class SearchViewModel extends ChangeNotifier {
  // Dummy property list
  final List<Property> properties = [
    Property(
      imageUrl: 'assets/images/demo_1.webp',
      name: 'Sunset Villa',
      location: 'Goa, India',
      pricePerRoom: 2500,
      rating: 4.5,
    ),
    Property(
      imageUrl: 'assets/images/demo_2.webp',
      name: 'Mountain Retreat',
      location: 'Manali, India',
      pricePerRoom: 1800,
      rating: 4.2,
    ),
    Property(
      imageUrl: 'assets/images/demo_3.webp',
      name: 'City Apartment',
      location: 'Mumbai, India',
      pricePerRoom: 3000,
      rating: 4.7,
    ),
    Property(
      imageUrl: 'assets/images/demo_4.webp',
      name: 'Beach House',
      location: 'Chennai, India',
      pricePerRoom: 2200,
      rating: 4.3,
    ),
  ];
}
