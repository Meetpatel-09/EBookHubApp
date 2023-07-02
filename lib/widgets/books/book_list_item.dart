import 'package:e_book_hub/models/books/get_all_books_response_model.dart';
import 'package:e_book_hub/pages/users/books/book_details.dart';
import 'package:e_book_hub/pages/users/books/books_category_wise.dart';
import 'package:e_book_hub/utils/api.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  final List<Book> booksList;
  final int index;
  const BookListItem({Key? key, required this.booksList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetails(book: booksList.elementAt(index)),
            ));
      },
      child: Card(
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  MyAPI.getImage + booksList.elementAt(index).bookimages!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booksList.elementAt(index).title!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      booksList.elementAt(index).category!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "₹${booksList.elementAt(index).price!}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
