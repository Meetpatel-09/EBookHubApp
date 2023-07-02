import 'package:e_book_hub/utils/routes.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  greetingMessage(),
                  style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              const Image(image: AssetImage("assets/images/logo.jpg")),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.loginPage);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      maximumSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    child: const Text("User Login"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.registerPage);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      maximumSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    child: const Text("User Register"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.adminLoginPage);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      maximumSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    child: const Text("Admin Login"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String greetingMessage() {
    // getting the current time hours
    var timeNow = DateTime.now().hour;

    if (timeNow < 12) {
      // from mid-night 12:00 A.M. to to 11:59 A.M.
      return 'Good Morning';
    } else if ((timeNow >= 12) && (timeNow <= 16)) {
      // from 12:00 P.M. to to 03:59 P.M.
      return 'Good Afternoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      // from 4:00 P.M. to to 07:59 P.M.
      return 'Good Evening';
    } else {
      // from 08:00 P.M. to to 11:59 P.M.
      return 'Good Night';
    }
  }
}
