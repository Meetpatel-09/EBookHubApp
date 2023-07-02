import 'package:e_book_hub/models/books/get_all_books_response_model.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  final Book book;
  const AddToCart({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all(const StadiumBorder())),
      child: const Text("Chat", style: TextStyle(fontSize: 18),),
    );
  }
}