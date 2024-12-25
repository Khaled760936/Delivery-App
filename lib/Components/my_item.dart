import 'package:flutter/material.dart';
import 'package:test/screens/ItemViewPage.dart';

class Item extends StatelessWidget {
  String image;
  String name;
  String descrebtion;
  double price;
  bool isAddedToCart = false;
  bool isAddedToFavoraite = false;

  String get priceAsString => price.toStringAsFixed(2);
  Item(
      {required this.name,
      required this.image,
      required this.descrebtion,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => ItemView(item: this))),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: GestureDetector(
          child: SizedBox(
            height: 170,
            width: 140,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 1, // Spread of the shadow
                    blurRadius: 5, // Blurring of the shadow
                    offset: Offset(2, 2), // Position of the shadow (x, y)
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    height: 90,
                    width: 140,
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "$price \$",
                    style: const TextStyle(color: Colors.green, fontSize: 10),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
