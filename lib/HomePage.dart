
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'nave_bar/NotificationPage.dart';
import 'nave_bar/ProfilePage.dart';
import 'nave_bar/cart_page.dart';
import 'nave_bar/shop_page.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

   // integer to keep track of the selected page index
  int pageIndex = 0;

   //method to help update selected index when bottom nav bar is pressed
  void navigateBottomBar(int index) {
    setState(() {
      pageIndex = index;
    });
  }
  final pages = [
    const ShopPage(),
    const CartPage(),
    const NotificationPage(),
     const ProfilePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: pages[pageIndex],

      bottomNavigationBar: Consumer<Cart>(
          builder: (context, value, child) {
          return Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(
                  color: Colors.purpleAccent, width: 1.0))
            ),
            child: BottomNavigationBar(
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
               label: 'Home',
              ),
    BottomNavigationBarItem(
          icon: badges.Badge(
            badgeAnimation: const badges.BadgeAnimation.rotation(
            animationDuration: Duration(milliseconds: 500),
            ),
            badgeContent: Text (value.getCartQty().toString(),
                style: const TextStyle(color: Colors.white)),
              child: const Icon(Icons.shopping_cart)),
          label: 'Cart',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
               label: 'Notification',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
                type: BottomNavigationBarType.shifting,

                currentIndex: pageIndex,
                selectedItemColor: Colors.purple,
                unselectedItemColor: Colors.black54,
                iconSize: 30,
                onTap: navigateBottomBar,
                elevation: 5,
              ),
          );
        }
      ),
    );
  }
}




