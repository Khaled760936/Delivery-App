import 'package:flutter/material.dart';
import 'package:test/Components/my_cart_list.dart';
import 'package:test/Components/my_item_for_cart.dart';
import 'package:test/Components/my_order.dart';

class BasketPage extends StatefulWidget {
  BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  double calculateTotalPrice() {
    double total = 0.0;
    for (var cartItem in addedToCart) {
      total += cartItem.item.price * cartItem.quantity;
    }
    return total;
  }

  void updateQuantity(int index, int newQuantity) {
    setState(() {
      addedToCart[index].quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Items cart',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: addedToCart.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: addedToCart.length,
                    itemBuilder: (context, index) {
                      return ItemsOnCart(
                        item: addedToCart[index].item,
                        quantity: addedToCart[index].quantity,
                        onDelete: () {
                          setState(() {
                            addedToCart.removeAt(index);
                          });
                        },
                        onQuantityChange: (newQuantity) {
                          updateQuantity(index, newQuantity);
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: GestureDetector(
                    //مشان يضيف منتجات للسلة بيرجع عالمتجر يلي كان فيه
                    onTap: () {
                      Navigator.of(context).pop();
                      print(
                          'Add more products tapped'); //جملة الطباعة بتطلع عشاشة الكونسول
                    },
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.add),
                            Text(
                              'Add more products',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total: \$${calculateTotalPrice().toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  //بيبعد كونتينر المتابعة عن زيادة المنتجات
                  padding: const EdgeInsets.symmetric(vertical: 170),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        //بدل ما تطلع على سكرين جديدة بيطلع متل شاشة صغيرة بنص الشاشة
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text(
                            'Your request has been added to your current location. You can modify or cancel the request for a maximum of 24 hours. You can monitor the request from the “My Requests” window...',
                          ), //بدي وقت الوصول من الباك
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Order order = Order(itemsOrderd: addedToCart,timecreated: DateTime.now(),);
                                orders.add(order);

                                setState(() {
                                  for(int i=0 ;i <addedToCart.length;i++){
                                    addedToCart[i].item.isAddedToCart=false;
                                  }
                                  addedToCart.clear();
                                });

                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                      print('Dialog shown');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 188, 188, 245)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: const Center(
                          child: Text(
                            'Confirm order',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const Column(
              //اذا كانت السلة فرغة
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.shopping_cart,
                    size: 120,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text('Your shopping cart is empty',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center),
              ],
            ),
    );
  }
}
