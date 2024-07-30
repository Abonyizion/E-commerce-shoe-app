
import 'package:authentication/models/shoe.dart';
import 'package:flutter/foundation.dart';


class Cart extends ChangeNotifier{

  List<Shoe> shoeShop = [
    Shoe(
        id: 1,
        name: 'Adidas Zurro',
        price: 70,
        imagePath: 'lib/images/one.jpg',
        description: 'Best in the Market'),
    Shoe(
        id: 2,
        name: 'Adidas Superstar',
        price: 50,
        imagePath: 'lib/images/two.webp',
        description: 'never go wrong with white'),
    Shoe(
        id: 3,
        name: 'Nike force 1',
        price: 40,
        imagePath: 'lib/images/three.webp',
        description: 'everyone flies but some fly higher'),
    Shoe(
        id: 4,
        name: 'Adidas Kaptir',
        price: 65,
        imagePath: 'lib/images/four.webp',
        description: 'Best quality men adidas for long walks'),
    Shoe(
        id: 5,
        name: 'Adidas Copa 20.3',
        price: 80,
        imagePath: 'lib/images/five.webp',
        description: 'experience swiftness in running with us'),
    Shoe(
        id: 6,
        name: 'Nike Revolution 7',
        price: 45,
        imagePath: 'lib/images/six.jpg',
        description: 'Best in the Market'),
    Shoe(
        id: 7,
        name: 'Omni multi cult',
        price: 30,
        imagePath: 'lib/images/eight.jpg',
        description: 'Best in the Market'),
    Shoe(
        id: 8,
        name: 'Air Jordan ',
        price: 75,
        imagePath: 'lib/images/nine.jpg',
        description: 'Best in the Market'),
    Shoe(
        id: 9,
        name: 'Supreme Leather',
        price: 55,
        imagePath: 'lib/images/eleven.webp',
        description: 'Explore greatness with Adidas'),
    Shoe(
        id: 10,
        name: 'Nike ACG',
        price: 85,
        imagePath: 'lib/images/twelve.webp',
        description: 'Best in the Market made for you'),
    Shoe(
        id: 11,
        name: 'Nike Zegama',
        price: 90,
        imagePath: 'lib/images/thirteen.jpeg',
        description: 'Good for you'),
    Shoe(
        id: 12,
        name: 'Adidas Full force',
        price: 95,
        imagePath: 'lib/images/fourteen.webp',
        description: 'Best in the Market made for you'),
    Shoe(
        id: 13,
        name: 'Adidas Retro',
        price: 15,
        imagePath: 'lib/images/fifteen.webp',
        description: 'Best in the Market made for you'),
    Shoe(
        id: 14,
        name: 'Nike Air Max 90',
        price: 25,
        imagePath: 'lib/images/images-11.jpeg',
        description: 'Best in the Market made for you'),
    Shoe(
        id: 15,
        name: 'Terra Kiger',
        price: 65,
        imagePath: 'lib/images/images-15.jpeg',
        description: 'Best in the Market made for you'),
    Shoe(
        id: 16,
        name: 'NikePegasus 40',
        price: 50,
        imagePath: 'lib/images/images-17.jpeg',
        description: 'Best in the Market made for you'),
  ];

// items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }
//get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

//add shoe to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

 // method to get the quantity of items in the cart
    getCartQty() {
    int total = 0;
    for(int i=0;i< userCart.length;i++) {
      total += userCart[i].quantity;
    }
    return total;
  }

  // method to get the total price of items in the cart
  double getTotalPrice() {
      double total = 0.0;
      for (final shoe in userCart) {
      //  double itemTotal = shoe.Shoe.price;
        total += (shoe.quantity * shoe.price);
      }
      return total;
  }

//method to remove shoe from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }


//method to clear all items from cart
  void clearCart() {
    userCart.clear();
    notifyListeners();
  }

}