import 'package:e_book_hub/models/books/get_all_books_response_model.dart';
import 'package:e_book_hub/utils/api.dart';
import 'package:e_book_hub/widgets/books/add_to_cart.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final Book book;
  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    Book book = widget.book;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Details"),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 220,
            child: Hero(
              tag: Key(book.bookId.toString()),
              child: Image.network(MyAPI.getImage + book.bookimages!),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    book.title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                   const SizedBox(
                  height: 10,
                   ),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Author: ${book.author!}",
                        style: const TextStyle(
                             fontSize: 16),
                      )),
                  const SizedBox(
                    height: 10,
                  ),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Category: " +
                          book.category!,
                        style: const TextStyle(
                            fontSize: 16),
                      )),
                  const SizedBox(
                    height: 10,
                  ),

                  Align(
                       alignment: Alignment.centerLeft,
                        child: Text("ISBN: " +
                          book.iSBN!,
                            style: const TextStyle(
                              fontSize: 16),
                        )),
                  const SizedBox(
                     height: 10),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Language: " +
                          book.language!,
                        style: const TextStyle(
                            fontSize: 16),
                      )),
                  const SizedBox(
                    height: 10),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Publicationyear: " +
                          book.publicationyear!,
                        style: const TextStyle(
                            fontSize: 16),
                      )),
                  const SizedBox(
                    height: 10),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Pages: " +
                          book.pages!,
                        style: const TextStyle(
                            fontSize: 16),
                      )),
                  const SizedBox(
                      height: 10),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Price: " +
                          book.price!,
                        style: const TextStyle(
                            fontSize: 16),
                      )),

                  const SizedBox(
                      height: 10),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Seller Name: " +
                          book.userName!,
                        style: const TextStyle(
                            fontSize: 16),
                      )),
                  const SizedBox(
                      height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12.0),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            Text(
              "₹${book.price!}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              width: 120,
              height: 50,
              child: AddToCart(
                book: book,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
