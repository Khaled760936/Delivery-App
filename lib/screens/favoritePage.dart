import 'package:flutter/material.dart';
import 'package:test/Components/my_cart_list.dart';
import 'package:test/screens/ItemViewPage.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Favoriate",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: !favorite.isEmpty
            ? ListView.builder(
                itemCount: favorite.length + 1, //مشان اضافة عنصر (منتج)
                itemBuilder: (context, index) {
                  if (index < favorite.length) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ItemView(item: favorite[index]),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(favorite[index].image),
                                ),
                              ),
                              Text(
                                favorite[index].name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    // Remove the item from the favorite list
                                    favorite[index].isAddedToFavoraite = false;
                                    favorite.removeAt(index);
                                  });
                                },
                                icon:
                                    Icon(Icons.remove_circle_outline_outlined),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                })
            : Center(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Icon(
                    Icons.favorite,
                    size: 80,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    "There are no items ",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 24),
                  ),
                  Text(
                    "added to favourites",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 24),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              )));
  }
}
