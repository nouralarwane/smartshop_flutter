import 'package:flutter/material.dart';
import 'package:smartshop/pages/cart_page.dart';
import 'package:smartshop/pages/main_screen.dart';
import 'pages/product_Details.dart';
import 'pages/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => MainScreen(),
        "/details": (context) => ProductDetails(),
        "/profile": (context) => Profile(),
        "/panier": (context) => CartPage(),
      },
      debugShowCheckedModeBanner: false,

      title: "Mon test",
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
