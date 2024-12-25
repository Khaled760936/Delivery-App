import 'package:flutter/material.dart';
import 'package:test/Components/my_items_list.dart';
import 'package:test/screens/ItemViewPage.dart';
// import 'package:sonic_delivery_app/components/my_items_list.dart';
// import 'package:sonic_delivery_app/screens/item_view_screen.dart';

class ItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          "products :",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items in a row
            crossAxisSpacing: 8.0, // Space between columns
            mainAxisSpacing: 8.0, // Space between rows
            childAspectRatio: 3 / 4, // Adjusts the height and width ratio
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemView(item: item),
                  )),
              child: Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(item.image, height: 100, fit: BoxFit.cover),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(item.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          )),
                    ),
                    const SizedBox(height: 8),
                    Text("\$${item.price}",
                        style:
                            const TextStyle(color: Colors.green, fontSize: 10)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
