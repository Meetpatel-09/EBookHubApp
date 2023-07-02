class UploadBookRequestModel {
  String? title;
  String? author;
  String? publicationyear;
  String? iSBN;
  String? language;
  String? pages;
  String? price;
  String? bookimages;
  String? userid;
  String? category;

  UploadBookRequestModel(
      {this.title,
        this.author,
        this.publicationyear,
        this.iSBN,
        this.language,
        this.pages,
        this.price,
        this.bookimages,
        this.userid,
        this.category});

  UploadBookRequestModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    publicationyear = json['publicationyear'];
    iSBN = json['ISBN'];
    language = json['language'];
    pages = json['pages'];
    price = json['price'];
    bookimages = json['bookimages'];
    userid = json['userid'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['author'] = this.author;
    data['publicationyear'] = this.publicationyear;
    data['ISBN'] = this.iSBN;
    data['language'] = this.language;
    data['pages'] = this.pages;
    data['price'] = this.price;
    data['bookimages'] = this.bookimages;
    data['userid'] = this.userid;
    data['category'] = this.category;
    return data;
  }
}
