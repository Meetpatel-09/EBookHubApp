import 'package:e_book_hub/models/auth/login/login_request_model.dart';
import 'package:e_book_hub/services/auth_services.dart';
import 'package:e_book_hub/utils/routes.dart';
import 'package:e_book_hub/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String sEmail = "";
  String sPassword = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('id') != null) {
      Navigator.pushNamedAndRemoveUntil(context, MyRoutes.homePage, (route) => false,);
    }
  }

  void showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text('EBookhub'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              ),
            ],
          ),
        );
      },
    );
  }

  addStringToSF(String id, String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
    prefs.setString('name', name);
    prefs.setString('email', email);
  }

  void login() {
    print(sEmail);
    print(sPassword);

    LoginRequestModel model =
    LoginRequestModel(email: sEmail, password: sPassword);

    AuthServices.login(model).then((response) {
      print(response.status);
      if (response.status == 200) {
        addStringToSF(response.data!.id!, response.data!.name!, response.data!.email!);
        Navigator.pushNamed(context, MyRoutes.homePage);
      } else {
        showAlert(response.message!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
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
                //EMAIL
                MyTextFeild(
                  lb: "Email",
                  obscureText: false,
                  controller: email,
                  prefixIcon: const Icon(Icons.email_rounded, size: 30),
                  onChange: (value) {
                    sEmail = value;
                  },
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Invalid Input";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),

                // Password

                // Password
                MyTextFeild(
                  lb: "Password",
                  obscureText: true,
                  controller: password,
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  onChange: (value) {
                    sPassword = value;
                  },
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Invalid Input";
                    }
                    return null;
                  },
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
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.registerPage);
                    },
                    child: Text(
                      "Not Registered Yet? Register Now.",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
