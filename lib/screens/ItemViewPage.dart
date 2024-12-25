import 'package:flutter/material.dart';
import 'package:test/Components/my_cart_list.dart';

import 'package:test/Components/my_item.dart';
import 'package:test/Components/my_item_for_cart.dart';

class ItemView extends StatefulWidget {
  final Item item;

  ItemView({required this.item});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(2, 3),
              ),
            ],
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Image.asset(widget.item.image, fit: BoxFit.fill),
                  height: 200,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.item.name,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description:",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.item.descrebtion,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Price: ${widget.item.priceAsString}",
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: widget.item.isAddedToCart
                    ? null // Disable the GestureDetector if the item is already added
                    : () {
                        setState(() {
                          addedToCart.add(
                            ItemsOnCart(item: widget.item, onDelete: () {}),
                          );
                          widget.item.isAddedToCart = true;
                        });
                      },
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: widget.item.isAddedToCart
                          ? Colors.grey // Change color for disabled state
                          : Theme.of(context).colorScheme.secondary,
                    ),
                    child: Center(
                      child: Text(
                        widget.item.isAddedToCart
                            ? "Item added successfully"
                            : "Add to Cart",
                        style: TextStyle(
                          fontSize: 15,
                          color: widget.item.isAddedToCart
                              ? Colors.white
                              : Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (!widget.item.isAddedToFavoraite) {
              favorite.add(widget.item);
            } else {
              favorite.remove(widget.item);
            }
            widget.item.isAddedToFavoraite = !widget.item.isAddedToFavoraite;
          });
        },
        backgroundColor: widget.item.isAddedToFavoraite
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.tertiary,
        child: Icon(
          Icons.favorite,
          color: widget.item.isAddedToFavoraite
              ? Theme.of(context).colorScheme.tertiary
              : Theme.of(context).colorScheme.primary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
