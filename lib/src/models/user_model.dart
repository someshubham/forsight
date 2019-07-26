
class UserModel {
  String accessToken;
  String name;
  String email;
  String phone;
  String regno;
  String status;
  String cePoints;
  String validity;

  UserModel(
      {this.accessToken,
      this.name,
      this.email,
      this.phone,
      this.regno,
      this.status,
      this.cePoints,
      this.validity});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    regno = json['regno'];
    status = json['status'];
    cePoints = json['cePoints'];
    validity = json['validity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['regno'] = this.regno;
    data['status'] = this.status;
    data['cePoints'] = this.cePoints;
    data['validity'] = this.validity;
    return data;
  }
}