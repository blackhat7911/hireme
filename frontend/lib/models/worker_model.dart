import 'package:frontend/models/location_model.dart';

class Worker {
  final String username;
  final String fullname;
  final String imageUrl;
  final String? dob;
  final int phoneNumber;
  final String email;
  final Location address;
  final String joinedAt;
  Worker({
    required this.username,
    required this.fullname,
    required this.imageUrl,
    this.dob,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.joinedAt,
  });
}
