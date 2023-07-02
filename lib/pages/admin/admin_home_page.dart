import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Category',

        ),
      ),
      body: Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container( height: 50,width: 500,
            child: Card( shadowColor: Colors.black,
              child: Text("Anthology"),
            ),
          ) ,
          Container( height: 50,width: 500,
            child: Card(shadowColor: Colors.black,
              child: Text("Autobiography"),
            ),
          ),
          Container( height: 50,width: 500,
            child: Card(shadowColor: Colors.black,
              child: Text("Bipgraphy"),
            ),
          ),
          Container( height: 50,width: 500,
            child: Card(shadowColor: Colors.black,
              child: Text("Business"),
            ),
          ),
          Container( height: 50,width: 500,
            child: Card(shadowColor: Colors.black,
              child: Text("Children"),
            ),
          ),
          Container( height: 50,width: 500,
            child: Card(shadowColor: Colors.black,
              child: Text("Comic book"),
            ),
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
