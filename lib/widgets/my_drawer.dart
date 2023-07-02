import 'package:e_book_hub/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: const Text("EBookHub"),
              accountEmail: const Text("jaimin@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/logo2.jpg"),
              ),
            )),
        // GestureDetector(
        //   onTap: () {
        //     Navigator.pushNamed(context, MyRoutes.loginPage);
        //   },
        //   child: ListTile(
        //     leading: Icon(
        //       Icons.home,
        //       color: Theme.of(context).primaryColor,
        //     ),
        //     title: const Text(
        //       "Home",
        //       textScaleFactor: 1.2,
        //     ),
        //   ),
        // ),
        // GestureDetector(
        //   onTap: () {
        //     Navigator.pushNamed(context, MyRoutes.loginPage);
        //   },
        //   child: ListTile(
        //     leading: Icon(
        //       Icons.person,
        //       color: Theme.of(context).primaryColor,
        //     ),
        //     title: const Text(
        //       "Profile",
        //       textScaleFactor: 1.2,
        //     ),
        //   ),
        // ),

        GestureDetector(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('id');
            prefs.remove('name');
            prefs.remove('email');
            Navigator.pushNamed(context, MyRoutes.loginPage);
          },
          child: ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text(
              "Log Out",
              textScaleFactor: 1.2,
            ),
          ),
        )
      ]),
    );
  }
}
