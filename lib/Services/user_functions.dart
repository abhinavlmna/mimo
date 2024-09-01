import 'package:hive_flutter/adapters.dart';
import 'package:mimo/Models/user_model.dart';

void addUser(User user) async {
  final db = await Hive.openBox<User>('users');
  db.add(user);
}

Future<List> getUsers() async {
  final db = await Hive.openBox<User>('users');
  return db.values.toList();
}

Future<User?> getUser(int id) async {
  final db = await Hive.openBox<User>('users');
  return db.get(id);
}

void updateUser(User user, int id) async {
  final db = await Hive.openBox<User>('users');
  db.put(id, user);
}
