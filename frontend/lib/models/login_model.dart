import 'package:hive/hive.dart';
part 'login_model.g.dart';

@HiveType(typeId: 0)
class Login{
  @HiveField(0)
  final String? username;
  @HiveField(1)
  final String? imageUrl;
  @HiveField(2)
  final String? token;
  @HiveField(3)
  final String? id;
  Login(this.username, this.imageUrl, this.token, this.id);
}
