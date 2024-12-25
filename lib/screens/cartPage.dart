import 'package:flutter/material.dart';
import 'package:test/Components/my_cart_list.dart';
import 'package:test/Components/my_item_for_cart.dart';
import 'package:test/Components/my_items_list.dart';

class BasketPage extends StatefulWidget {
  BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  bool basketIsNotEmpty = true; // تحقق من توافر عناصر في السلة
  double? totalTotalPrice = 0;
  double calculateTotalPrice() {
    double total = 0.0;
    for (var cartItem in addedToCart) {
      total += cartItem.item.price * cartItem.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items cart',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            )),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: !addedToCart.isEmpty
          ? Column(children: [
              Expanded(
                child: Padding(
                  //حطيت بادينغ لليست كلها من فوق ومن تحت
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: ListView.builder(
                    itemCount: addedToCart.length + 1, //مشان اضافة عنصر (منتج)
                    itemBuilder: (context, index) {
                      if (index < addedToCart.length) {
                        return ItemsOnCart(
                          item: addedToCart[index].item,
                          onDelete: () {
                            setState(() {
                              items[index].isAddedToCart = false;
                              addedToCart.removeAt(
                                  index); //حذف العنصر بحال ضغط المستخدم على ايقونة الديليت
                              if (addedToCart.isEmpty) {
                                //التحقق اذا كانت السلة فارغة اجعل المتغير قيمتو فولس
                                basketIsNotEmpty = false;
                              }
                            });
                          },
                        );
                      } else {
                        return Column(
                          children: [
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
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.add),
                                        Text(
                                          'Add some products',
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
                              //بيبعد كونتينر المتابعة عن زيادة المنتجات
                              padding:
                                  const EdgeInsets.symmetric(vertical: 170),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    //بدل ما تطلع على سكرين جديدة بيطلع متل شاشة صغيرة بنص الشاشة
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                          'Mr.(Username)'), //بدي اسم المستخدم من الباك
                                      content: const Text(
                                        'Thank you for using our program >>> Your order has been received. It will arrive within (arrive time) minutes.',
                                      ), //بدي وقت الوصول من الباك
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // إغلاق الحوار
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 9),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 188, 188, 245)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
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
                        );
                      }
                    },
                  ),
                ),
              ),
            ])
          /*if(basketIsNotEmpty==false)*/ : const Column(
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
