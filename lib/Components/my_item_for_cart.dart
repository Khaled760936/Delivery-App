// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test/Components/my_item.dart';
import 'package:test/Components/my_items_list.dart';

class ItemsMap extends StatefulWidget {
  @override
  State<ItemsMap> createState() => _ItemsMapState();
}

class _ItemsMapState extends State<ItemsMap> {
  // وظيفة لحذف العنصر
  void removeItem(int index) {
    setState(() {
      items.removeAt(index); // إزالة العنصر من القائمة
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ItemsOnCart(
          item: items[index],
          onDelete: () => removeItem(index), // تمرير وظيفة الحذف
        );
      },
    );
  }
}

class ItemsOnCart extends StatefulWidget {
  Item item;
  final VoidCallback onDelete; // وظيفة الحذف التي يتم تمريرها
  int quantity = 1; //الكمية يلي بحددها المستخدم

  ItemsOnCart({Key? key, required this.item, required this.onDelete, required})
      : super(key: key);

  @override
  State<ItemsOnCart> createState() => _ItemsState();
}

class _ItemsState extends State<ItemsOnCart> {
  @override
  Widget build(BuildContext context) {
    double totalPrice =
        widget.quantity * widget.item.price; //السعر الاجمالي للعنصر الواحد

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 2, // Spread of the shadow
              blurRadius: 5, // Blurring of the shadow
              offset: const Offset(2, 3), // Position of the shadow (x, y)
            ),
          ],
          //استخدمت الديكورايشن مشان احسن اعمل بوردر للعنصر كاملا
          borderRadius: const BorderRadius.all(
              Radius.circular(15)), //بيعطيه انحناء شوي عن الزاوية القائمة
        ),
        child: Padding(
          //عطين بادينغ للمكونات تبع العنصر متل اسم المنتج وهيك
          padding: const EdgeInsets.all(8.0),
          child: Row(
            //هو عبارة عن صورة وعامود بقلب هاد العامود في اسم المنتج والسعر السعر الاجمالي
            children: [
              // صورة المنتج
              Padding(
                //عملت بعد داخلي خاص للصورة
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  child: Image.asset(
                    widget.item.image,
                    height: 100,
                    width: 75,
                  ),
                ),
              ),
              // تفاصيل المنتج
              Expanded(
                child: Column(
                  //هاد العامود يلي حكيت عنو فوق انو بيحتوي المكونات تبع العنصر
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Price: ${widget.item.price}'),
                    Text('Total Price: $totalPrice'),
                  ],
                ),
              ),
              // أدوات التحكم بالكمية
              Container(
                /*مشان عملية الزيادة والنقصان حطيتها بكونتينر لحالها وبقلبو في سطر بيحتوي
              icon(remove or delet)  quantity  icon(add)
              */
                padding: const EdgeInsets.symmetric(horizontal: 1),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromARGB(255, 0, 0, 50)),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Theme.of(context).colorScheme.secondary,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 93, 92, 92)
                          .withOpacity(0.5), // لون الظل مع شفافية
                      blurRadius: 1, // مقدار التمويه
                      spreadRadius: 1, // مقدار التمدد
                      offset: const Offset(2, 2), // إزاحة الظل (يمين وأسفل)
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    //عرض أيقونة الحذف او ايقونة النقصان
                    IconButton(
                      icon: Icon(
                        widget.quantity == 1 ? Icons.delete : Icons.remove,
                      ),
                      onPressed: () {
                        if (widget.quantity > 1) {
                          setState(() {
                            widget.quantity--;
                          });
                        } else {
                          // حذف العنصر إذا كانت الكمية 0
                          widget.onDelete();
                        }
                      },
                    ),
                    // عرض الكمية
                    Text('${widget.quantity}'),
                    // زر الزيادة
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          widget.quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
