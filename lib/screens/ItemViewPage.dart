import 'package:flutter/material.dart';
import 'package:test/Components/my_cart_list.dart';
import 'package:test/Components/my_item.dart';
import 'package:test/Components/my_item_for_cart.dart';
import 'dart:io'; // For checking internet connection

class ItemView extends StatefulWidget {
  final Item item;

  ItemView({required this.item});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  bool _hasInternet = true;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    try {
      // Attempt to ping a reliable host
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          _hasInternet = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        _hasInternet = false;
      });
    }
  }

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
              // Image with error handling
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200,
                  child: widget.item.image.startsWith('http')
                      ? Image.network(
                          widget.item.image,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 100,
                                color: Colors.grey,
                              ),
                            );
                          },
                        )
                      : Image.asset(
                          widget.item.image,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(
                                Icons.image_not_supported,
                                size: 100,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
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
                      widget.item.description,
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
                    "Price: ${widget.item.price}",
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: !_hasInternet
                    ? null // Disable if there's no internet
                    : widget.item.isAddedToCart
                        ? null // Disable if the item is already added
                        : () {
                            setState(() {
                              addedToCart.add(
                                ItemsOnCart(
                                  item: widget.item,
                                  onDelete: () {},
                                  quantity: 1,
                                  onQuantityChange: (p0) {},
                                ),
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
                      color: !_hasInternet
                          ? Colors.red // Indicate no internet
                          : widget.item.isAddedToCart
                              ? Colors.grey // Change color for disabled state
                              : Theme.of(context).colorScheme.secondary,
                    ),
                    child: Center(
                      child: Text(
                        !_hasInternet
                            ? "No Internet Connection"
                            : widget.item.isAddedToCart
                                ? "Item added successfully"
                                : "Add to Cart",
                        style: TextStyle(
                          fontSize: 15,
                          color: !_hasInternet || widget.item.isAddedToCart
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
        onPressed: !_hasInternet
            ? null // Disable favorite button if there's no internet
            : () {
                setState(() {
                  if (!widget.item.isAddedToFavorite) {
                    favorite.add(widget.item);
                  } else {
                    favorite.remove(widget.item);
                  }
                  widget.item.isAddedToFavorite = !widget.item.isAddedToFavorite;
                });
              },
        backgroundColor: widget.item.isAddedToFavorite
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.tertiary,
        child: Icon(
          Icons.favorite,
          color: widget.item.isAddedToFavorite
              ? Theme.of(context).colorScheme.tertiary
              : Theme.of(context).colorScheme.primary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
