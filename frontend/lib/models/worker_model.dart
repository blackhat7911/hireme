import 'package:frontend/models/coordinates_model.dart';
import 'package:frontend/models/location_model.dart';
import 'package:frontend/models/user.dart';

class Worker {
  final int id;
  // final User user;
  final String fullname;
  final String imageUrl;
  final String? dob;
  final int phoneNumber;
  final String email;
  // final Location address;
  // final Coordinates coordinates;
  final String joinedAt;
  Worker({
    required this.id,
    // required this.user,
    required this.fullname,
    required this.imageUrl,
    this.dob,
    required this.phoneNumber,
    required this.email,
    // required this.address,
    // required this.coordinates,
    required this.joinedAt,
  });

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      id: json['id'],
      // user: (json['user']),
      fullname: (json['fullname']),
      email: (json['email']),
      imageUrl: (json['profile']),
      dob: (json['date_of_birth']),
      phoneNumber: (json['phone']),
      // address: (json['location']),
      // coordinates: (json['coordinates']),
      joinedAt: (json['created_at']),
    );
  }
}
