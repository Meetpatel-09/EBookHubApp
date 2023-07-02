class RegisterRequestModel {
  String? name;
  String? email;
  String? image;
  String? address;
  String? mobile;
  String? password;

  RegisterRequestModel(
      {this.name,
        this.email,
        this.image,
        this.address,
        this.mobile,
        this.password});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    image = json['image'];
    address = json['address'];
    mobile = json['mobile'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    return data;
  }
}