import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterapp/pages/edit_name_page.dart';
import 'firebase_options.dart';

//IMPORTACIONES PAGE
import 'package:flutterapp/pages/add_name_page.dart';
import 'package:flutterapp/pages/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase - CRUD',
      initialRoute: '/',
      routes: {
        '/': (context) =>const Home(),
        '/add': (context) =>const AddNamePage(),
        '/edit': (context) =>const EditNamePage(),

      },
    );
  }
}