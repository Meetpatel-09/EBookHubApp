import 'package:e_book_hub/models/books/get_all_books_response_model.dart';
import 'package:e_book_hub/widgets/books/book_list_item.dart';
import 'package:flutter/material.dart';

class BooksList extends StatefulWidget {
  final List<Book> booksList;
  const BooksList({Key? key, required this.booksList}) : super(key: key);

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: widget.booksList.length * 154,
      child: ListView.builder(
        itemCount: widget.booksList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return BookListItem(booksList: widget.booksList, index: index);
        },
      ),
    );
  }
}
