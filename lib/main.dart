import 'package:flutter/material.dart';
import 'FirstPage.dart';
void main() {
  runApp(BankApp(
    
  ));
}

class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
