import 'package:book_a_ride/screens/mail_login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookARide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MailLogin(),
      builder: (context, child) { 
        return MediaQuery(
         data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
         child: child!,
       );
      },
    );
  }
}
