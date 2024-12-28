import 'package:flutter/material.dart';
import 'package:test/Components/my_item_for_cart.dart';
import 'package:intl/intl.dart';
import 'package:test/screens/orderDetailesPage.dart';

class Order extends StatelessWidget {
  final List<ItemsOnCart> itemsOrderd;
  final DateTime timecreated;
  final int state;

  // These fields are derived from `timecreated` and are immutable
  String get formattedDate => DateFormat('yyyy-MM-dd').format(timecreated);
  String get formattedTime => DateFormat('hh:mm a').format(timecreated);

  Order({
    Key? key,
   required this.itemsOrderd,
    required this.timecreated, // Now `timecreated` must always be provided
    this.state = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
        height: 100,
        child: Row(
          children: [
            Text(formattedDate),
            const SizedBox(width: 10),
            Text(formattedTime),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:  (context) => OrderDetailes(order: this),));
          }, icon: Icon(Icons.toc_outlined))
          ],
        
          
        ),
      ),
    );
  }
}
