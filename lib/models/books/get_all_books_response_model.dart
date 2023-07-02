class GetAllBooksResponseModel {
  int? status;
  String? message;
  int? itemCount;
  List<Book>? body;

  GetAllBooksResponseModel(
      {this.status, this.message, this.itemCount, this.body});

  GetAllBooksResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    itemCount = json['itemCount'];
    if (json['books'] != null) {
      body = [];
      json['books'].forEach((v) {
        body?.add(Book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['itemCount'] = itemCount;
    if (body != null) {
      data['books'] = body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Book {
  String? bookId;
  String? title;
  String? author;
  String? category;
  String? iSBN;
  String? language;
  String? publicationyear;
  String? pages;
  String? price;
  String? bookimages;
  String? userid;
  String? userName;

  Book(
      {this.bookId,
        this.title,
        this.author,
        this.category,
        this.iSBN,
        this.language,
        this.publicationyear,
        this.pages,
        this.price,
        this.bookimages,
        this.userid,
        this.userName});

  Book.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    title = json['title'];
    author = json['author'];
    category = json['category'];
    iSBN = json['ISBN'];
    language = json['language'];
    publicationyear = json['publicationyear'];
    pages = json['pages'];
    price = json['price'];
    bookimages = json['bookimages'];
    userid = json['userid'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['book_id'] = bookId;
    data['title'] = title;
    data['author'] = author;
    data['category'] = category;
    data['ISBN'] = iSBN;
    data['language'] = language;
    data['publicationyear'] = publicationyear;
    data['pages'] = pages;
    data['price'] = price;
    data['bookimages'] = bookimages;
    data['userid'] = userid;
    data['user_name'] = userName;
    return data;
  }
}