import 'package:flutter/material.dart';
import 'package:smartshop/pages/home_page.dart';
import 'package:smartshop/pages/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  List<Product> produitsAjoutes = Home.addedProduct;

  // Calcul correct du total
  double get prixTotal =>
      produitsAjoutes.fold<double>(0, (sum, p) => sum + p.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to your cart dear customer😉!!",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: Home.addedProduct.length,
                itemBuilder: (context, index) {
                  final product = Home.addedProduct[index];
                  return Card(
                    elevation: 4,
                    child: Row(
                      children: [
                        Image.asset(
                          product.image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),

                        SizedBox(width: 20, height: 20),
                        Column(
                          children: [
                            Text("${product.price} Dhs"),
                            Text(
                              product.details,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Divider(height: 100),
                      ],
                    ),
                  );
                },
              ),
            ),
            Text("Le prix total pour ces produits est: $prixTotal dhs"),
          ],
        ),
      ),
    );
  }
}
