class UploadImageResponseModel {
  int? status;
  String? message;
  String? filename;

  UploadImageResponseModel({this.status, this.message, this.filename});

  UploadImageResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['filename'] = this.filename;
    return data;
  }
}