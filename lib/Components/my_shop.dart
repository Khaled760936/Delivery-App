import 'package:flutter/material.dart';
import 'package:test/Components/my_item.dart';
import 'package:test/Components/my_items_list.dart';
import 'package:test/screens/shopViewPage.dart';

class Shop extends StatelessWidget {
  int ID;
  String image;
  String name;
  List<Item> shopItem=items;
  // Function moveToElements;
  Shop({
    Key? key,
    required this.ID,
    required this.image,
    required this.name,
    // required this.moveToElements,
  }) : super(key: key);
factory Shop.fromJson(Map<String, dynamic> json) {
  return Shop(
    ID: json['id'] as int,
    name: json['name'] as String,
    image: json['logo'] as String,
  );
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShopViewScreen(shop: this),
          )),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 1, // Spread of the shadow
                  blurRadius: 5, // Blurring of the shadow
                  offset: const Offset(2, 2), // Position of the shadow (x, y)
                ),
              ],
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Container(
                height: 130,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(name,
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 16,
                              fontFamily: 'Raleway',
                            )),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
