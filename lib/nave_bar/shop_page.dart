import 'package:authentication/models/shoe.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../HomePage.dart';
import '../ShoeTile.dart';
import '../drawer/about_page.dart';
import '../drawer/rating_bar.dart';
import '../models/cart.dart';
import '../pages/search_page.dart';

class ShopPage extends StatefulWidget {
   const ShopPage({super.key, });
  @override
  State<ShopPage> createState() => _ShopPageState();
}
class _ShopPageState extends State<ShopPage> {


  // method to add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    // let user know item has been added to cart
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pop();
          });
          return  const AlertDialog(
            title: Center(child: Text('Successfully Added')
            ),
          );
        }
    );
  }

  final List<String> items = [
    'assets/images/first.jpeg',
    'assets/images/second.jpeg',
    'assets/images/third.jpeg',
    'assets/images/forth.jpeg',
  ];

  //carousel controller
  late CarouselController controller;
  //integer to keep track of slider current index
  late  int _currentIndex = 0;
  @override
  void initState() {
    controller = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        iconTheme: const IconThemeData(color: Colors.purple),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        title: const Text(
          'CLOUD', style: TextStyle(
            color: Colors.purple, fontWeight: FontWeight.w900),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => const SearchPage()));
              },),
          ),
        ],
      ),
      drawer:  Drawer(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                      color: Colors.purple,
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          dividerTheme: const DividerThemeData(color: Colors.transparent)
                      ),
                      child: const DrawerHeader(
                        child: Text('Options', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
                          textAlign: TextAlign.center, ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                        Icons.home),
                    title: const Text('Home', style: TextStyle(fontSize: 18),),
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                        Icons.rate_review),
                    title: const Text('Rating', style: TextStyle(fontSize: 18),),
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => const RatingBar()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                        Icons.settings),
                    title: const Text('Settings', style: TextStyle(fontSize: 18),),
                    onTap: () {
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                        Icons.info),
                    title: const Text('About', style: TextStyle(fontSize: 18),),
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                    },
                  ),
                ],
              ),

              const SizedBox(height: 230,),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: ListTile(
                  leading: const Icon(
                      Icons.logout),
                  title: const Text('Sign Out', style: TextStyle(fontSize: 18,
                      color: Colors.red, fontWeight: FontWeight.bold),),
                  onTap: () {
                    FirebaseAuth.instance.signOut();

                  },
                ),
              ),
            ],
          ),
        ),
      ),

      body: Consumer<Cart>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Column(
            children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: CarouselSlider(
                     carouselController: controller,
                    items: items.map(
              (item) => Image.asset(
            item,
          fit: BoxFit.cover,
          width: double.infinity,
           ),
          )
          .toList(),
                     options: CarouselOptions(
                       height: 150.0,
                       enlargeCenterPage: true,
                       autoPlay: true,
                       scrollDirection: Axis.horizontal,
                       autoPlayCurve: Curves.fastOutSlowIn,
                       enableInfiniteScroll: true,
                       autoPlayAnimationDuration: const Duration(milliseconds: 400),
                       viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                         setState(() {
                           _currentIndex = index;
                         });
                      }
                     ),
                   ),
                 ),

      Stack(
        alignment: AlignmentDirectional.topCenter,
        children:  [
      Positioned(
      child:   DotsIndicator(
                    dotsCount: 4,
                    position: _currentIndex,
                    onTap: (index) {
                      controller.animateToPage(index);
                    },
                    decorator: DotsDecorator(
                        color: Colors.black54,
                        activeColor: Colors.purple,
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )
                    ),
                  ),
               ),
            ],
      ),

              SizedBox(
                height: 420,
                child: ListView.builder(
                  itemCount: 16,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index)  {
                    Shoe shoe = value.getShoeList()[index];
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
