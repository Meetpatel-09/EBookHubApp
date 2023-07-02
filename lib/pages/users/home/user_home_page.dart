
import 'package:e_book_hub/pages/users/home/fragments/categort_fragment.dart';
import 'package:e_book_hub/pages/users/home/fragments/chat_fragment.dart';
import 'package:e_book_hub/pages/users/home/fragments/home_fragment.dart';
import 'package:e_book_hub/pages/users/home/fragments/profile_fragment.dart';
import 'package:e_book_hub/pages/users/home/fragments/upload_fragment.dart';
import 'package:e_book_hub/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int selectedIndex = 0;

  List<Widget> fragments = const [
    HomeFragment(),
    CategoryFragment(),
    UploadFragment(),
    ChatFragment(),
    ProfileFragment(),
  ];
  
  List<String> titles = ['Home', 'Category', 'Upload', 'Chat', 'Profile'];
  
  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      appBar: AppBar(
        title: Text(titles.elementAt(selectedIndex)),
      ),
      body: fragments.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.black,
        fixedColor: Colors.black,
        backgroundColor: Colors.black,
        unselectedIconTheme: const IconThemeData(
            color: Colors.black
        ),
        selectedIconTheme: const IconThemeData(
            color: Colors.black
        ),
        onTap: (value)  {
          setState(() {
            print(value);
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,

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
      drawer: const MyDrawer(),
    );
  }
}
