import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire/firebase_options.dart';
import 'package:flutterfire/homepage.dart';
import 'package:flutterfire/screen/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(
    home: StreamBuilder(
        // ara yüzü güncelleyen witgetler
        //. Genellikle, veri akışı değiştikçe kullanıcı arayüzünü güncellemek için kullanılır.
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Homepage();
          }
          return const Auth();
        }),
  ));
}
