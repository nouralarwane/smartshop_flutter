import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  late Function(String) onText;

  SearchPage({super.key, required this.onText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: TextField(
        onSubmitted: (value) {
          onText(value);
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: "Entrez le produit recherché",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: Icon(Icons.search),
          prefixIconColor: Colors.black,
        ),
      ),
    );
  }
}
