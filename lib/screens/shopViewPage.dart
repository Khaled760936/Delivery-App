import 'package:flutter/material.dart';
import 'package:test/Components/my_items_list.dart';
import 'package:test/Components/my_shop.dart';
import 'package:test/screens/ItemViewPage.dart';


// ignore: must_be_immutable
class ShopViewScreen extends StatelessWidget {
  Shop shop;
  // ignore: use_key_in_widget_constructors
  ShopViewScreen({
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 220.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    shop.logo,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      color: Colors.black
                          .withOpacity(0.5), // Semi-transparent background
                      padding:const EdgeInsets.all(8.0),
                      child: Text(
                        shop.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
  SliverGrid.builder(
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
        ),
      ),
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use Image.network to load images from external URLs
            Image.network(
              item.image,
              height: 100,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, color: Colors.red, size: 50);
              },
            ),
            const SizedBox(height: 8),
            Text(item.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 8),
            Text(
              "\$${item.price}",
              style: const TextStyle(color: Colors.green, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  },
)
        ],
      ),
    );
  }
}
