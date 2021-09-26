import 'package:hive/hive.dart';
part 'login_model.g.dart';

@HiveType(typeId: 0)
class Login{
  @HiveField(0)
  final String? username;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? id;

  Login(this.username, this.email, this.id);
}
