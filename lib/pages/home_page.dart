import 'package:flutter/material.dart';
import 'package:smartshop/pages/cart_page.dart';
import 'package:smartshop/pages/favorites_page.dart';
import 'package:smartshop/pages/profile.dart';
import 'package:smartshop/pages/search_page.dart';
import 'package:smartshop/pages/settings_page.dart';
import 'package:smartshop/widgets/categories.dart';
import 'package:smartshop/widgets/product_show.dart';
import 'package:smartshop/widgets/section_title.dart';
import 'product.dart';

// void main() {
//   runApp(Home());
// }

// ignore: must_be_immutable
class Home extends StatefulWidget {
  const Home({super.key});
  static List<Product> addedProduct = [];

  @override
  State<Home> createState() => Home_State();
}

class Home_State extends State<Home> {
  List<Product> products = [
    Product(
      id: 1,
      image: "assets/products/phone.png",
      nom: "Smartphone Android Pro",
      price: 2199,
      details:
          "Ecran AMOLED 6.7, 128 Go, 8 Go RAM, Caméra 108 MP, Batterie 5000 mAh",
      type: "Smartphone Android Pro",
    ),
    Product(
      id: 2,
      image: "assets/products/laptop.png",
      nom: "Ordinateur Portable",
      price: 8999,
      details:
          "Ecran AMOLED 6.7, 128 Go, 8 Go RAM, Caméra 108 MP, Batterie 5000 mAh",
      type: "Smartphone Android Pro",
    ),
    Product(
      id: 3,
      image: "assets/products/watch.png",
      nom: "Smart watch",
      price: 999,
      details:
          "Ecran AMOLED 6.7, 128 Go, 8 Go RAM, Caméra 108 MP, Batterie 5000 mAh",
      type: "Smartphone Android Pro",
    ),
  ];

  String message = "";
  List<Product> filteredList = [];

  void user_message(String value) {
    setState(() {
      message = value;
      filteredList = products
          .where((p) => p.nom.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smartshop"),
        backgroundColor: const Color.fromARGB(255, 51, 65, 150),
        actions: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => Profile()),
            ),
            child: Icon(Icons.person),
          ),

          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => CartPage()),
            ),
            child: Icon(Icons.shopping_cart),
          ),

          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FavoritesPage()),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
                ),
              },
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Profile(),
                  ),
                ),
              },
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SettingsPage(),
                  ),
                ),
              },
              title: Text("Settings"),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SectionTitle(title: "Produits recommandés"),
          const Categories(),
          SearchPage(onText: user_message),

          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductShow(product: products[index]);
              },
            ),

            // child: GridView.count(
            //   crossAxisCount: 2,
            //   crossAxisSpacing: 10,
            //   mainAxisSpacing: 10,
            //   padding: EdgeInsets.all(10),
            //   children: filteredList.length == 0
            //       ? List.generate(products.length, (index) {
            //           return ProductShow(product: products[index]);
            //         })
            //       : List.generate(filteredList.length, (index) {
            //           return ProductShow(product: filteredList[index]);
            //         }),
            // ),
          ),
        ],
      ),
    );
  }
}
