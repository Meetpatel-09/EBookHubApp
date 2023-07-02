import 'package:e_book_hub/pages/users/books/books_category_wise.dart';
import 'package:e_book_hub/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class CategoryFragment extends StatefulWidget {
  const CategoryFragment({Key? key}) : super(key: key);

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  List<String> categories = [
    'Comic',
    'Education',
    'Fantasy',
    'History',
    'Motivation',
    'Self-Help book',
    'Story',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BooksCategoryWisePage(title: categories.elementAt(index)),));
              },
              title: Text(categories[index]),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
      ),
    );
  }
}
