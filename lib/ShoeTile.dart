import 'package:flutter/material.dart';
import 'models/shoe.dart';


class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});
 // int _counter = 0;
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Container(
         // height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.purpleAccent)
          ),
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(20.0),
            width: 250,
              child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   AspectRatio(
                     aspectRatio: 1,
                     child: Container(
                       decoration: const BoxDecoration(
                         color: Colors.white
                       ),
                         width: double.infinity,
                         padding: const EdgeInsets.all(25),
                         child: Image.asset(
                             shoe.imagePath)
                     ),
                   ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(shoe.name,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 17),
                      ),
                        const SizedBox(height: 5.0),
                       Text('\$${shoe.price}',
                        style: const TextStyle(color: Colors.black, fontSize: 25,
                            fontWeight: FontWeight.bold ),
                      ),
                    ],
                    ),
                    const SizedBox(width: 15),
                     GestureDetector(
                        onTap: onTap,
                        child: Container(
                          width: 55,
                          padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(color: Colors.purple,
                            borderRadius: BorderRadius.all(Radius.circular(10)
                                )),
                            child: const Center(
                              child: Text('Buy',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                         ),
                       ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    shoe.description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
         );
     }
}
