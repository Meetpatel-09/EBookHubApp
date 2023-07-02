class UserDetailsModel {
  int? status;
  String? message;
  UserDetails? userDetails;

  UserDetailsModel({this.status, this.message, this.userDetails});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? address;
  String? image;
  String? password;

  UserDetails(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.address,
        this.image,
        this.password});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    image = json['image'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    data['image'] = image;
    data['password'] = password;
    return data;
  }
}
