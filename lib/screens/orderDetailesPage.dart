// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test/Components/my_order.dart';
class OrderDetailes extends StatelessWidget {
  final Order order;

  const OrderDetailes({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display order details summary
            Text(
              "Order Date: ${order.formattedDate}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              "Order Time: ${order.formattedTime}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              "Order State: ${order.state == 0 ? 'Pending' : 'Completed'}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Divider(height: 20, thickness: 1),
            // Display list of ordered items
            Expanded(
              child: ListView.builder(
                itemCount: order.itemsOrderd.length,
                itemBuilder: (context, index) {
                  final item = order.itemsOrderd[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(item.item.descrebtion),
                      subtitle: Text("Quantity: ${item.quantity}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}