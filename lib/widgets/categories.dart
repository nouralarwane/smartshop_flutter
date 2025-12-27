import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => Categories_State();
}

class Categories_State extends State<Categories> {
  List<Map<String, String>> categories = [
    {"nom": "Phones", "color": "white"},
    {"nom": "Laptops", "color": "white"},
    {"nom": "Watch", "color": "white"},
    {"nom": "Gaming", "color": "white"},
    {"nom": "Accessoires", "color": "white"},
  ];
  bool color = false;
  String categorie = "";
  String user_value = "";
  // String user_input = SearchPage_State().user_value;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            children: [
              ...categories.map((category) {
                return GestureDetector(
                  onTap: () => setState(() {
                    categorie = category["nom"]!;
                  }),
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: category["nom"] == categorie
                          ? const Color.fromARGB(255, 10, 25, 50)
                          : const Color.fromARGB(107, 208, 123, 123),
                    ),
                    child: Text(
                      category["nom"]!,
                      style: category["nom"] == categorie
                          ? TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )
                          : TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                    ),
                  ),
                );
              }),
            ],
          ),

          Text(categorie != "" ? "Catégorie sélectionnée : $categorie" : ""),
        ],
      ),
    );
  }
}
