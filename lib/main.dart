import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mimo/Models/todo_model.dart';
import 'package:mimo/Models/user_model.dart';
import 'package:mimo/Screens/Home/homepage.dart';
import 'package:mimo/Screens/Splash/Splash.dart';
import 'package:mimo/Services/todo_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    Hive.registerAdapter(UserAdapter());
  }
  if (!Hive.isAdapterRegistered(ToDoAdapter().typeId)) {
    Hive.registerAdapter(ToDoAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashPage());
  }
}
