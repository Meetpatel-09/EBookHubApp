import 'dart:io';

import 'package:e_book_hub/models/users/upload/upload_book_resquest_model.dart';
import 'package:e_book_hub/services/api_services.dart';
import 'package:e_book_hub/utils/api.dart';
import 'package:e_book_hub/utils/categories.dart';
import 'package:e_book_hub/widgets/my_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UploadFragment extends StatefulWidget {
  const UploadFragment({Key? key}) : super(key: key);

  @override
  State<UploadFragment> createState() => _UploadFragmentState();
}

class _UploadFragmentState extends State<UploadFragment> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController publicationYear = TextEditingController();
  TextEditingController ISBN = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController pages = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController category = TextEditingController();

  String sTitle = "";
  String sAuthor = "";
  String sPublicationYear = "";
  String sISBN = "";
  String sLanguage = "";
  String sPages = "";
  String sPrice = "";
  String sBookImages = "";
  String sUserid = "";
  String sCategory = "";

  String selectedCategory = "Select";

  String? image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      sUserid = prefs.getString('id')!;
    });
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

  void uploadData() async {
    APIServices.uploadFile(image!).then((value) {
      String imageName = "";
      print("value.status");
      print(value.status);
      if (value.status == 201) {
        imageName = value.filename!;

        UploadBookRequestModel model = UploadBookRequestModel(
          title: sTitle,
          author: sAuthor,
          bookimages: imageName,
          category: selectedCategory,
          iSBN: sISBN,
          language: sLanguage,
          pages: sPages,
          price: sPrice,
          publicationyear: sPublicationYear,
          userid: sUserid,
        );

        APIServices.uploadBook(model).then((value) {
          if (value.status == 201) {
            print(value.status);
            showAlert("Book Uploaded Successfully");

            setState(() {
              title.text = "";
              author.text = "";
              publicationYear.text = "";
              ISBN.text = "";
              language.text = "";
              pages.text = "";
              price.text = "";
              selectedCategory = "Select";
            });
          } else {
            showAlert(value.message!);
          }
        });
      } else {
        showAlert(value.message!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const double spaceBetween = 10.0;

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),

              // NAME
              MyTextFeild(
                lb: "Title",
                obscureText: false,
                controller: title,
                prefixIcon: const Icon(Icons.title, size: 30),

                onChange: (value) {
                  sTitle = value;
                },
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Invalid Input";
                  }
                  return null;
                },
              ),
              const SizedBox(height: spaceBetween),

              //EMAIL
              MyTextFeild(
                lb: "Author",
                obscureText: false,
                controller: author,
                prefixIcon: const Icon(Icons.person, size: 30),
                onChange: (value) {
                  sAuthor = value;
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
                lb: "Publication Year",
                obscureText: false,
                controller: publicationYear,
                prefixIcon: const Icon(Icons.calendar_month, size: 30),
                onChange: (value) {
                  sPublicationYear = value;
                },
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Invalid Input";
                  }
                  return null;
                },
              ),
              SizedBox(height: spaceBetween),

              MyTextFeild(
                lb: "Language",
                obscureText: false,
                controller: language,
                prefixIcon: const Icon(Icons.language, size: 30),
                onChange: (value) {
                  sLanguage = value;
                },
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Invalid Input";
                  }
                  return null;
                },
              ),
              SizedBox(height: spaceBetween),

              MyTextFeild(
                lb: "ISBN",
                obscureText: false,
                controller: ISBN,
                prefixIcon: const Icon(Icons.language, size: 30),
                onChange: (value) {
                  sISBN = value;
                },
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Invalid Input";
                  }
                  return null;
                },
              ),

              SizedBox(height: spaceBetween),

              MyTextFeild(
                lb: "Pages",
                obscureText: false,
                controller: pages,
                prefixIcon: const Icon(Icons.pages, size: 30),
                onChange: (value) {
                  sPages = value;
                },
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Invalid Input";
                  }
                  return null;
                },
              ),

              const SizedBox(height: spaceBetween),

              MyTextFeild(
                lb: "Price",
                obscureText: false,
                controller: price,
                prefixIcon: const Icon(Icons.price_change, size: 30),
                onChange: (value) {
                  sPrice = value;
                },
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Invalid Input";
                  }
                  return null;
                },
              ),

              const SizedBox(height: spaceBetween),

              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  // labelText: widget.lb,
                  prefixIcon: const Icon(Icons.category),
                  labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold),
                ),
                value: selectedCategory,
                items: BookCategories.categories.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 15),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  //   dropName1.add("SELECT");
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
              ),

              const SizedBox(height: spaceBetween),

              ElevatedButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: const Text("Pick File")),

              const SizedBox(height: spaceBetween),

              // Submit button
              ElevatedButton(
                  onPressed: () => uploadData(), child: const Text("SUBMIT")),
            ],
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      var picked = await FilePicker.platform.pickFiles();
      image = picked!.files.first.path;
    } catch (e) {
      showAlert(e.toString());
    }
  }
}
