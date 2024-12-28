import 'package:flutter/material.dart';
import 'package:test/Components/my_Drawer_tile.dart';
import 'package:test/Components/my_user.dart';
import 'package:test/screens/favoritePage.dart';
import 'package:test/screens/myOrdersPage.dart';
import 'package:test/screens/profilePage.dart';
import 'package:test/screens/settingsPage.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Image.asset(
              "assets/images/logo.png",
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MyDrawerTile(
            text: "Home",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyDrawerTile(
            text: "Profile",
            icon: Icons.person,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfilePage(
                    user: User(firstName: "firstName", lastName: "lastName"),
                  ),
                )),
          ),
          MyDrawerTile(
            text: "Settings",
            icon: Icons.settings,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ));
            },
          ),
          MyDrawerTile(
            text: "Favourite",
            icon: Icons.favorite,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(),
                ),
              );
            },
          ),
          MyDrawerTile(
            text: "My Orders",
            icon: Icons.shopping_bag_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrdersPage(),
                ),
              );
            },
          ),
          const Spacer(),
          MyDrawerTile(
            text: "Logout",
            icon: Icons.logout,
            onTap: () {},
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
