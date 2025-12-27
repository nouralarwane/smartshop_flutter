import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});

  Map<String, String> person = {
    "nom": "Noura Larwane",
    "filiere": "Robotique et Objets Connectés",
    "etablissement": "ENIAD",
    "email": "joe@gmail.com",
    "number": "+212 6 95 97 69 04",
    "adresse": "Berkane",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mon profil"), backgroundColor: Colors.green),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 16),
          child: Column(
            spacing: 15,
            children: [
              CircleAvatar(radius: 60, backgroundImage: AssetImage("joe.JPG")),
              Column(
                children: [
                  Text(
                    "${person["nom"]}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text("${person["filiere"]} - ${person["etablissement"]}"),
                ],
              ),
              Divider(color: Colors.blueGrey, thickness: 0.5),

              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  spacing: 20,
                  children: [Icon(Icons.email), Text("${person["email"]}")],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  spacing: 20,
                  children: [Icon(Icons.phone), Text("${person["number"]}")],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  spacing: 20,
                  children: [
                    Icon(Icons.location_on),
                    Text("${person["adresse"]}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

