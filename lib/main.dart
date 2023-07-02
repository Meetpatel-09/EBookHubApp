import 'package:e_book_hub/pages/admin/add_category.dart';
import 'package:e_book_hub/pages/admin/admin_home_page.dart';
import 'package:e_book_hub/pages/auth/admin_login_page.dart';
import 'package:e_book_hub/pages/auth/user_login_page.dart';
import 'package:e_book_hub/pages/auth/user_register_page.dart';
import 'package:e_book_hub/pages/landing_page.dart';
import 'package:e_book_hub/pages/splash_page.dart';
import 'package:e_book_hub/pages/users/chat_page.dart';
import 'package:e_book_hub/pages/users/home/user_home_page.dart';
import 'package:e_book_hub/pages/users/books/view_book.dart';
import 'package:e_book_hub/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EBookHub());
}

class EBookHub extends StatelessWidget {
  const EBookHub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.light,
      // theme: MyTheme.lightTheme(),
      // darkTheme: MyTheme.darkTheme(),
      initialRoute: MyRoutes.splashPage,
      routes: {
        "/": (context) => const LandingPage(),
        MyRoutes.splashPage: (context) => const SplashPage(),
        MyRoutes.landingPage: (context) => const LandingPage(),
        MyRoutes.loginPage: (context) => const UserLoginPage(),
        MyRoutes.registerPage: (context) => const UserRegisterPage(),
        MyRoutes.adminLoginPage: (context) => const AdminLoginPage(),
        MyRoutes.adminHomePage: (context) => const AdminHomePage(),
        MyRoutes.homePage: (context) => const UserHomePage(),
        MyRoutes.addCategoryPage: (context) => const AddCategoryPage(),
        MyRoutes.viewBookPage: (context) => const ViewBookPage(),
        MyRoutes.chatPage: (context) => const ChatPage()
      },
    );
  }
}


