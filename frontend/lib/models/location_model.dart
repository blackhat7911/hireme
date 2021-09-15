import 'coordinates_model.dart';

class Location{
  final String name;
  final int zipCode;
  final Coordinates coordinates;
  Location({
    required this.name,
    required this.zipCode,
    required this.coordinates
  });
}