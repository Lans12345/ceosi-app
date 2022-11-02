import 'package:ceosi_app/constants/labels.dart';
import 'package:ceosi_app/screens/ceosi_freedomwall/add_freedom_post_screen.dart';
import 'package:ceosi_app/screens/ceosi_freedomwall/freedomposts_screen.dart';
import 'package:ceosi_app/screens/home_screen.dart';
import 'package:ceosi_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        errorColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/addfreedompostscreen',
      routes: {
        '/': (context) => LoginScreen(),
        '/freedompostsscreen': (context) => const FreedomPostsScreen(),
        '/homescreen': (context) => const HomeScreen(),
        '/addfreedompostscreen': (context) => const AddFreedomPostScreen(),
      },
      title: Labels.ceosiFreedomWall,
    );
  }
}
