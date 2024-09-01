import 'package:hive_flutter/adapters.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String email;
  @HiveField(2)
  late String password;
  @HiveField(3)
  late String cnfrmpassword;
  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.cnfrmpassword});
}
