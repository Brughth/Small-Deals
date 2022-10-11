import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:small_deals/auth/logic/auth_provider.dart';
import 'package:small_deals/auth/presentation/login_page.dart';
import 'package:small_deals/shared/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => getIt.get<AuthProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Small Deals',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: LoginPage(),
      ),
    );
  }
}
