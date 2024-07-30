import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final user = FirebaseAuth.instance.currentUser!;

  var nameController = TextEditingController();
  var phnController = TextEditingController();
  var ageController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future getImage(
      ImageSource img,
      ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
          () {
        if (xfilePick != null) {
          _image = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar( // is this context <<<
              const SnackBar(content: Text('No image selected')));
        }
      },
    );
  }


  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select from:'),
            content: SizedBox(
              height: 100,
              width: double.infinity,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: ()  {
                      getImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    child: const Row(
                      children: [
                        Icon(Icons.image, color: Colors.white,),
                        Text('Gallery', style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      getImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    child: const Row(
                      children: [
                        Icon(Icons.camera, color: Colors.white,),
                        Text('Camera', style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
          appBar: AppBar(
            elevation: 5,
            iconTheme: const IconThemeData(color: Colors.purple),
            backgroundColor: Colors.grey[300],
            centerTitle: true,
            title: const Text(
              'PROFILE', style: TextStyle(
                color: Colors.purple, fontWeight: FontWeight.w900),
            ),
          ),
          backgroundColor: Colors.grey[300],
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    const Text('You are currently logged in as:',
                      style: TextStyle(fontSize: 15), ),
                    const SizedBox(height: 2,),
                    Text(user.email!, style: const TextStyle(
                        fontSize: 30, fontWeight: (FontWeight.bold), color: Colors.purple),),
                    const SizedBox(height: 10,),

                ElevatedButton(
                          onPressed: () async {
                            myAlert();
                          },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                        child: const Text('Upload Photo',
                          style: TextStyle(color: Colors.white),),
                      ),
                const SizedBox(
                  height: 10,
                ),
                //if image not null show the image
                //if image null show text
                _image != null
                    ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      //to show image, you type like this.
                      File(_image!.path),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                    ),
                  ),
                )
        : const Text(
    "No Image",
    style: TextStyle(fontSize: 20),
    ),

    const SizedBox(height: 20,),

                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purpleAccent),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        labelText: 'Full Name',
                        labelStyle: const TextStyle( color: Colors.grey)
                    ),
                  ),
                ),

    const SizedBox(height: 15,),

                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: ageController,
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purpleAccent),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            labelText: 'Age',
                            labelStyle: const TextStyle( color: Colors.grey)
                        ),
                      ),
                    ),

                    const SizedBox(height: 15,),

                Container(
                  height: 67,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: phnController,
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purpleAccent),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        labelText: 'Phone Number',
                        labelStyle: const TextStyle( color: Colors.grey)
                    ),
                  ),
                ),


    const SizedBox(height: 15,),

    Container(
         height: 40,
         width: MediaQuery.of(context).size.width,
             padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
      backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10))),
      child: const Text(
        "Submit Details", style: TextStyle(color: Colors.white,
          fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );

  }
}
