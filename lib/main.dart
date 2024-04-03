import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'Login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCP9WSgBuZlIWmH8a_keCxxQc2l5DdC1hs",
      appId: "1:283603565303:android:515463f6757647608af1f2",
      messagingSenderId: "283603565303",
      projectId: "formation-b730e",
    ),
  ); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        home:  MyHomePage(),  
    );
  }
}
