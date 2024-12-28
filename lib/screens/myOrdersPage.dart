import 'package:flutter/material.dart';
import 'package:test/Components/my_cart_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor:Theme.of(context).colorScheme.background,
      title: Text("My orders"),
      ),

      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return orders[index];
        },
      ),
    );
  }
}