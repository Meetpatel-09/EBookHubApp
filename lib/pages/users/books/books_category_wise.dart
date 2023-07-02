import 'package:e_book_hub/models/books/get_all_books_response_model.dart';
import 'package:e_book_hub/services/api_services.dart';
import 'package:e_book_hub/widgets/books/books_list.dart';
import 'package:flutter/material.dart';

class BooksCategoryWisePage extends StatefulWidget {
  final String title;
  const BooksCategoryWisePage({Key? key, required this.title})
      : super(key: key);

  @override
  State<BooksCategoryWisePage> createState() => _BooksCategoryWisePageState();
}

class _BooksCategoryWisePageState extends State<BooksCategoryWisePage> {
  bool dataLoaded = false;
  List<Book> booksList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllBooks();
  }

  getAllBooks() async {
    APIServices.getAllBooksCategoryWise(widget.title).then((value) {
      setState(() {
        if (value.status == 200) {
          booksList = value.body!;
        }
        dataLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: !dataLoaded
          ? const Center(child: CircularProgressIndicator())
          : (booksList.isEmpty) ? Center(child: Text("No ${widget.title} Books"),) :BooksList(
              booksList: booksList,
            ),
    );
  }
}
