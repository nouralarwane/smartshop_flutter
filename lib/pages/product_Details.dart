import 'package:flutter/material.dart';
import 'package:smartshop/pages/home_page.dart';
import 'product.dart';


class ProductDetails extends StatefulWidget {
  @override
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => Details_State();
}

class Details_State extends State<ProductDetails> {
  // final Product product;
  bool added = false;

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product?;

    if (product == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('Erreur')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product.nom, style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset(product.image, width: 140),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    Text(
                      product.nom,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product.details,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return index == 4
                            ? Icon(
                                Icons.star,
                                fill: 0,
                                color: Theme.of(context).colorScheme.onPrimary,
                              )
                            : index == 3
                            ? Icon(
                                Icons.star_half,
                                fill: 1,
                                color: Colors.amber,
                              )
                            : Icon(Icons.star, fill: 1, color: Colors.amber);
                      }),
                    ),
                    Text(
                      "Prix: ${product.price} DH",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(13),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                    padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          !added
                              ? "Produit ajouté au panier"
                              : "Produit rétiré du panier",
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    setState(() {
                      added = !added;
                      Home.addedProduct.add(product);
                    });
                  },
                  icon: Icon(
                    !added ? Icons.shopping_cart_checkout : Icons.check,
                  ),
                  label: Text(
                    added ? "Retirer du panier" : "Ajouter au Panier",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
