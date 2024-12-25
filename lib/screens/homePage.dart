import 'package:flutter/material.dart';
import 'package:test/Components/my_Drawer.dart';
import 'package:test/Components/my_items_list.dart';
import 'package:test/Components/my_offers.dart';
import 'package:test/Components/my_search_text_filed.dart';
import 'package:test/Components/my_shop_list.dart';
import 'package:test/screens/ItemsPage.dart';
import 'package:test/screens/cartPage.dart';
import 'package:test/screens/shopsPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BasketPage(),
                ),
              ),
              child: const Icon(
                Icons.shopping_cart_checkout,
                size: 30,
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Pinned search box at the top
          const Padding(
            padding: EdgeInsets.all(8),
            child: MySearchTextField(),
          ),

          // Remaining content in a scrollable ListView
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListView(
                children: [
                  const SizedBox(height: 20),

                  // Offers list
                  Text(
                    "Discover new offers!",
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: "Raleway",
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const <Widget>[
                        MyOffers(),
                        MyOffers(),
                        MyOffers(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Shops list
                  Text(
                    "Shop from our stores:",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Raleway",
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 30),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        shops[0],
                        shops[1],
                        shops[2],
                        IconButton(
                          icon: const Icon(
                            Icons.navigate_next,
                            size: 36,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ShopScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Products list
                  Text(
                    "Explore our products:",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 170,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        items[0],
                        items[1],
                        items[2],
                        IconButton(
                          icon: const Icon(
                            Icons.navigate_next,
                            size: 36,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemsScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
