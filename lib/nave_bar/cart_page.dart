import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_item.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class CartPage extends StatelessWidget {
    const CartPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        iconTheme: const IconThemeData(color: Colors.purple),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        title: const Text(
          'MY CART', style: TextStyle(
            color: Colors.purple, fontWeight: FontWeight.w900),
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: value.getUserCart().isEmpty
                      ? const Center(child: Text('Your cart is empty...',
                    style: TextStyle(fontSize: 25),))
                      : ListView.builder(
                    itemCount: value.getUserCart().length,
                      itemBuilder: (context, index) {
                        Shoe individualShoe = value.getUserCart() [index];
                        return CartItem(shoe: individualShoe);
                      },
                  ),
              ),
              const Divider(height: 5, color: Colors.grey,
                thickness: 1.5),
            //  const SizedBox(height: 4),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text('Total Price:', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    ),
                  ),

                //  const SizedBox(width: 3.0),

                  Text('\$${value.getTotalPrice().toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),

                     Padding(
                       padding: const EdgeInsets.only(right: 25),
                       child: TextButton(
                        onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context ){
                            return AlertDialog(
                              content: const Text(
                                  'Are you sure you want to clear all items in cart ?'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.purple),
                                    child: const Text('No', style: TextStyle(color: Colors.white),),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                     Navigator.pop(context);
                                      value.clearCart();
                                    },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.purple),
                                    child: const Text('Yes', style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            );
                          }
                         );
                        },
                        child:  const Text('Clear', style: TextStyle(
                            fontSize: 19, color: Colors.black),),
                    ),
                     ),
                ],
              ),
            //  const SizedBox(height: 8),

              Container(
                height: 35,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.of(context).pop();
                          });
                          return  const AlertDialog(
                            title: Center(child: Text('Sending...')
                            ),
                          );
                        }
                    );
                  },
                  child:  const Text('CHECKOUT', style: TextStyle(
                      fontSize: 18, color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
