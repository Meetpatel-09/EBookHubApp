import 'dart:convert';

import 'package:e_book_hub/models/books/get_all_books_response_model.dart';
import 'package:e_book_hub/models/users/upload/upload_book_resquest_model.dart';
import 'package:e_book_hub/models/users/user_details_model.dart';
import 'package:e_book_hub/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:e_book_hub/models/users/upload/upload_image_response_model.dart';

class APIServices {
  static var client = http.Client();

  static Future<UploadImageResponseModel> uploadFile(String path) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(MyAPI.uploadImage));

      request.files.add(await http.MultipartFile.fromPath('sendimage', path));

      http.StreamedResponse response = await request.send();

      // print(await response.stream.bytesToString());
      String data = await response.stream.bytesToString();
      // print(data);
      UploadImageResponseModel model =
          UploadImageResponseModel.fromJson(jsonDecode(data));

      return model;
    } catch (e) {
      return UploadImageResponseModel(status: 502, message: e.toString());
    }
  }

  static Future<UploadImageResponseModel> uploadBook(
      UploadBookRequestModel model) async {
    print(model.title);

    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var url = Uri.parse(MyAPI.uploadBook);

      final response = await client.post(url,
          headers: requestHeaders, body: jsonEncode(model.toJson()));

      print(response.body);

      if (response.statusCode == 200) {
        final UploadImageResponseModel responseModel =
            UploadImageResponseModel.fromJson(jsonDecode(response.body));
        return responseModel;
      } else {
        return UploadImageResponseModel(
            status: response.statusCode, message: response.body);
      }
    } catch (e) {
      return UploadImageResponseModel(status: 404, message: e.toString());
    }
  }

  static Future<GetAllBooksResponseModel> getAllBooks() async {
    var url = Uri.parse(MyAPI.getAllBooks);
    try {
      final response = await http.get(url);
      print(response.body);
        final GetAllBooksResponseModel model = GetAllBooksResponseModel.fromJson(jsonDecode(response.body));
        return model;
    } catch (e) {
      return GetAllBooksResponseModel(status: 500, message: e.toString());
    }
  }

  static Future<GetAllBooksResponseModel> getAllBooksCategoryWise(String category) async {
    var url = Uri.parse(MyAPI.getAllBooksCategoryWise + category);
      print(url);
    try {
      final response = await http.get(url);
      print(response.body);
        final GetAllBooksResponseModel model = GetAllBooksResponseModel.fromJson(jsonDecode(response.body));
        return model;
    } catch (e) {
      return GetAllBooksResponseModel(status: 500, message: e.toString());
    }
  }

  static Future<UserDetailsModel> getUserDetails(String id) async {
    var url = Uri.parse(MyAPI.getUserDetails + id);
    try {
      final response = await http.get(url);
      final UserDetailsModel model = UserDetailsModel.fromJson(jsonDecode(response.body));
      return model;
    } catch (e) {
      return UserDetailsModel(status: 500, message: e.toString());
    }
  }
}
