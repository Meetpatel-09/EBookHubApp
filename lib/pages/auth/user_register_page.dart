import 'package:e_book_hub/models/auth/register/register_request_model.dart';
import 'package:e_book_hub/services/auth_services.dart';
import 'package:e_book_hub/utils/routes.dart';
import 'package:e_book_hub/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({Key? key}) : super(key: key);

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String sName = "";
  String sEmail = "";
  String sAddress = "";
  String sMobile = "";
  String sPassword = "";
  String sConfirmPassword = "";

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

  void register() {
    print(sName);
    print(sEmail);
    print(sAddress);
    print(sMobile);
    print(sPassword);
    print(sConfirmPassword);

    RegisterRequestModel model = RegisterRequestModel(
        name: sName,
        email: sEmail,
        address: sAddress,
        mobile: sMobile,
        password: sPassword,
        image: "",
    );

    AuthServices.register(model).then((response) => {
      if (response.status == 201)
        {
          Navigator.pushNamed(context, MyRoutes.loginPage)
        }
      else
        {
          showAlert(response.message!)
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    double spaceBetween = 10.0;

    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Heading
                  const SizedBox(height: 20),

                  const Image(
                      image: AssetImage("assets/images/logo.jpg"), height: 100),

                  const SizedBox(height: 20),
                  const Text(
                    "Welcome To EBookHub",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // NAME
                  MyTextFeild(
                    lb: "Name",
                    obscureText: false,
                    controller: name,
                    prefixIcon: const Icon(Icons.person_2_rounded, size: 30),
                    onChange: (value) {
                      sName = value;
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "Invalid Input";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: spaceBetween),

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
                  SizedBox(height: spaceBetween),

                  // ADDRESS
                  MyTextFeild(
                    lb: "Address ",
                    obscureText: false,
                    controller: address,
                    prefixIcon: const Icon(Icons.location_on, size: 30),
                    onChange: (value) {
                      sAddress = value;
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "Invalid Input";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: spaceBetween),

                  // MOBILE
                  MyTextFeild(
                    lb: " Mobile",
                    obscureText: false,
                    controller: mobile,
                    prefixIcon:
                        const Icon(Icons.phone_android_rounded, size: 30),
                    onChange: (value) {
                      sMobile = value;
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "Invalid Input";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: spaceBetween),

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
                  SizedBox(height: spaceBetween),

                  // Re Enter Password
                  MyTextFeild(
                    lb: "Re Enter Password",
                    obscureText: true,
                    controller: confirmPassword,
                    prefixIcon: const Icon(
                      Icons.lock,
                      size: 30,
                    ),
                    onChange: (value) {
                      sConfirmPassword = value;
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "Invalid Input";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: spaceBetween),

                  // Submit button
                  ElevatedButton(
                      onPressed: () => register(), child: Text("SUBMIT")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
