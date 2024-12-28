// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test/Components/my_cart_list.dart';

import 'package:test/Components/my_order.dart';

class OrderDetailes extends StatelessWidget {
  Order order;
  OrderDetailes({
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: ListView(
          children: [
            Text(order.formattedDate),
            ListView.builder(
        itemCount: order.itemsOrderd.length+1,
        itemBuilder: (context, index) {
          return order.itemsOrderd[index];
        },
      ),
          ],
        ));
  }
}
