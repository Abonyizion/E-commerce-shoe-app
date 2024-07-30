
import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';



class RatingBar extends StatefulWidget {
  const RatingBar({super.key});
  @override
  State<RatingBar> createState() => _RatingBarState();
}
class _RatingBarState extends State<RatingBar> {

   int myCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 5,
        iconTheme: const IconThemeData(
            color: Colors.purple,
        ),
        title: const Text('Rate Us', style: TextStyle(color: Colors.purple,
          fontSize: 25, fontWeight: FontWeight.bold,),),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
      ),
      body: Center(
          child: Card(
            elevation: 5,
            color: Colors.blue[100],
            child: Container(
              height: 250,
             // width: 230,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(myCount.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
                  const SizedBox(height: 30),
                  Container(
                         padding: const EdgeInsets.symmetric(horizontal: 22.0),
                         child: FivePointedStar(
                          onChange: (count) {
                            setState(() {
                              myCount = count;
                            });
                          },
                         ),
                       ),
                  const SizedBox(
                    height: 40,),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context)  {
                              return AlertDialog(
                                content:
                                   const Text(
                                      'Thank you for rating us!!!',
                                    style: TextStyle(fontSize: 20),),

                                actions: [
                                     ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.purple
                                        ),
                                        child: const Text('OK',
                                          style: TextStyle(color: Colors.white),),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                ],
                              );
                            }
                        );
                      },
                      child:  const Text('SUBMIT', style: TextStyle(
                          fontSize: 20, color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}