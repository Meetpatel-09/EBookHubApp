import 'package:e_book_hub/utils/routes.dart';
import 'package:flutter/material.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {

  void login() {
    Navigator.pushNamed(context, MyRoutes.adminHomePage);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Heading

              Image(image: AssetImage("assets/images/logo.jpg")),
              const SizedBox(
                height: 10,
              ),
              Text("Welcome To EBookHub"),
              SizedBox(height: 10),

              // EMAIL
              SizedBox(height: 10),
              Container(
                child: TextFormField(
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Icons.email, size: 30),
                    labelText: "EMAIL",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // Password

              SizedBox(height: 10),
              Container(
                child: TextFormField(
                  obscureText: true,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Icons.lock, size: 30),
                    labelText: "PASSWORD",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Password",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ))
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                    child: ElevatedButton(
                        onPressed: () {
                          login();
                        }, child: Text("SUBMIT"))),
              ),
              // TextButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, MyRoutes.registerPage);
              //     },
              //     child: Text(
              //       "Not Registered Yet? Register Now.",
              //       style: TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //         color: Theme.of(context).primaryColor,
              //       ),
              //     ))
            ],
          ),
        ),
      ),
    );
  }
}
