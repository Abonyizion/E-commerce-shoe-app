import 'package:flutter/material.dart';
import '../HomePage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage> {
  final searchTextController = TextEditingController();
  //to clean up the controller when the widget is removed form the widget tree
  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  final List<String> data = [
    'Adidas Zurro',
    'Adidas Superstar',
    'Nike force 1',
    'Adidas Kaptir',
    'Adidas Copa 20.3',
    'Nike Revolution 7',
    'Omni multi cult',
    'Air Jordan',
    'Supreme Leather',
    'Nike ACG',
    'Nike Zegama',
    'Adidas Full force',
    'Adidas Retro',
    'Nike Air Max 90',
    'Terra Kiger',
    'NikePegasus 40',
  ];
   // search items
  List<String> searchResults = [];

  void onQueryChanged(String query) {
    setState(() {
      searchResults = data
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.purple
        ),
        backgroundColor: Colors.grey[300],
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: TextField(
              onChanged: onQueryChanged,
              controller: searchTextController,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.grey[500],),
                    onPressed: () {},
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey[500],),
                    onPressed: () {
                      searchTextController.clear();
                    },
                  ),
                  hintText: 'search for shoe...',
                  border: InputBorder.none
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[100],
                  elevation: 2,
                  margin: const EdgeInsets.all(4.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const HomePage())
                      );
                    },
                    child: ListTile(
                      //  leading: Image.asset(widget.shoe.imagePath),
                      title: Text(searchResults[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
