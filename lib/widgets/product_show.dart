import 'package:flutter/material.dart';
import 'package:smartshop/pages/product.dart';
import 'package:smartshop/widgets/productCard.dart';

class ProductShow extends StatefulWidget {
  final Product product;

  const ProductShow({super.key, required this.product});

  @override
  State<ProductShow> createState() => ProductShow_State();
}

class ProductShow_State extends State<ProductShow> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(15),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Productcard(product: widget.product);
            },
          );
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: ListTile(
            leading: SizedBox(
              width: 60,
              child: Image.asset(widget.product.image, fit: BoxFit.contain),
            ),
            title: Text(
              widget.product.nom,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "${widget.product.price} dhs",
              style: TextStyle(color: Colors.blueGrey),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  favorite = !favorite;
                });
              },
              icon: Icon(
                favorite ? Icons.favorite : Icons.favorite_border_rounded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


  // child: Row(
          //   children: [
          //     Container(
          //       width: 60,
          //       height: 60,
          //       margin: EdgeInsets.only(left: 10),
          //       child: Image.asset(widget.product.image, fit: BoxFit.cover),
          //     ),
          //     SizedBox(width: 30),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           widget.product.nom,
          //           style: TextStyle(fontWeight: FontWeight.bold),
          //         ),
          //         Text(
          //           "${widget.product.price} dhs",
          //           style: TextStyle(color: Colors.blueGrey),
          //         ),
          //       ],
          //     ),
          //     Spacer(),
          //     ElevatedButton(
          //       onPressed: () {
          //         setState(() {
          //           favorite = !favorite;
          //         });
          //       },
          //       child: Icon(
          //         favorite
          //             ? Icons.favorite_sharp
          //             : Icons.favorite_border_rounded,
          //       ),
          //     ),
          //   ],
          // ),