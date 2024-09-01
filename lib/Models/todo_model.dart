import 'package:hive_flutter/adapters.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class ToDo {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late DateTime CreatedAt;
  @HiveField(3)
  late bool Completed;
  ToDo(
      {required this.title,
      required this.description,
      required this.Completed,
      required this.CreatedAt});
}
