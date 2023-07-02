import 'dart:convert';

import 'package:e_book_hub/models/users/chat/chat_model.dart';
import 'package:e_book_hub/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatFragment extends StatefulWidget {
  const ChatFragment({Key? key}) : super(key: key);

  @override
  State<ChatFragment> createState() => _ChatFragmentState();
}

class _ChatFragmentState extends State<ChatFragment> {
  List<ChatModel> chatModel = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/chat.json");
    final decodedData = jsonDecode(catalogJson);
    print(decodedData);
    List<dynamic> list = decodedData;

    list.forEach(
      (element) => chatModel.add(ChatModel.fromJson(element)),
    );

    print(chatModel.elementAt(0).name);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chatModel.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {

            },
            title: Text(chatModel[index].name!),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
    );
  }
}
