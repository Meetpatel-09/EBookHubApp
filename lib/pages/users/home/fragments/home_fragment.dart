import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_book_hub/models/books/get_all_books_response_model.dart';
import 'package:e_book_hub/services/api_services.dart';
import 'package:e_book_hub/utils/api.dart';
import 'package:e_book_hub/widgets/books/book_list_item.dart';
import 'package:e_book_hub/widgets/books/books_list.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  List<Book> booksList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllBooks();
  }

  getAllBooks() async {
    APIServices.getAllBooks().then((value) {
      setState(() {
        booksList = value.body!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1610116306796-6fea9f4fae38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1526243741027-444d633d7365?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80',
      'https://images.unsplash.com/photo-1524578271613-d550eacf6090?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
    ];

    return Material(
      // height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(autoPlay: true),
              items: imgList
                  .map((item) =>
                      Image.network(item, fit: BoxFit.cover, width: 1000))
                  .toList(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Books",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            if (booksList.isEmpty)
              const Center(child: CircularProgressIndicator())
            else
              BooksList(booksList: booksList,)
          ],
        ),
      ),
    );
  }
}
