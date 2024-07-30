import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'models/shoe.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;
  const CartItem({super.key, required this.shoe,});

  @override
  State<CartItem> createState() => _CartItemState();
}
class _CartItemState extends State<CartItem> {

  int _counter = 0;
    // method to remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
    // let user know item has been removed from cart
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pop();
          });
          return  const AlertDialog(
            title: Center(child: Text('Successfully Removed')
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
          color: Colors.grey[100],
          elevation: 3,
          margin: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading:
            AspectRatio(
              aspectRatio: 1.5,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white
                  ),
                  width: double.infinity,
                 // padding: const EdgeInsets.all(50),
                  child:  Image.asset(widget.shoe.imagePath),
              ),
            ),


            title: Text(widget.shoe.name,
              style: const TextStyle(fontSize: 15),),
            subtitle: Text('\$${widget.shoe.price}', style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20
             ),
            ),
            trailing: IconButton(icon:
             Icon(Icons.delete, color: Colors.red[700],),
              onPressed: removeItemFromCart,
            ),
          ),
      ),
    );
  }
}
