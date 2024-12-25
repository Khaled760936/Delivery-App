import 'package:flutter/material.dart';
import 'package:test/Components/my_shop_list.dart';
//import 'package:sonic_delivery_app/components/my_shop_list.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'shops',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  shops[0],
                  shops[1],
                  shops[2],
                  shops[3],
                  shops[4],
                  shops[5],
                ],
              ),
            ),
          ],
        ));
  }
}
