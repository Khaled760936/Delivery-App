// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test/Components/my_item.dart';
import 'package:test/screens/ItemViewPage.dart';
class ItemsOnCart extends StatelessWidget {
  final Item item;
   int quantity;
  final VoidCallback onDelete;
  final Function(int) onQuantityChange; // Callback to notify parent of quantity change

  ItemsOnCart({
    Key? key,
    required this.item,
    required this.onDelete,
    required this.quantity,
    required this.onQuantityChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = quantity * item.price; // Calculate total price per item

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () =>   Navigator.push(context,MaterialPageRoute(builder: (context) => ItemView(item: item),))
,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(2, 3),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Product Image
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.asset(
                    item.image,
                    height: 100,
                    width: 75,
                  ),
                ),
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Price: \$${item.price.toStringAsFixed(2)}'),
                      Text('Total Price: \$${totalPrice.toStringAsFixed(2)}'),
                    ],
                  ),
                ),
                // Quantity Controls
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 0, 0, 50)),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Theme.of(context).colorScheme.secondary,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 93, 92, 92)
                            .withOpacity(0.5),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Decrease Quantity or Delete Item
                      IconButton(
                        icon: Icon(
                          quantity == 1 ? Icons.delete : Icons.remove,
                        ),
                        onPressed: () {
                          if (quantity > 1) {
                            onQuantityChange(quantity - 1);
                          } else {
                            onDelete();
                            item.isAddedToCart=false; // Delete item when quantity is 1
                          }
                        },
                      ),
                      // Display Quantity
                      Text('$quantity'),
                      // Increase Quantity
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          onQuantityChange(quantity + 1);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
