class Category {
  int id;
  String name;
  String timeStamp;
  String emailAddress;
  String phoneNumber;
  String requestContent;

  Category(
      {this.id,
      this.name,
      this.timeStamp,
      this.emailAddress,
      this.phoneNumber,
      this.requestContent});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    timeStamp = json['time_stamp'];
    emailAddress = json['email_address'];
    phoneNumber = json['phone_number'];
    requestContent = json['request_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['time_stamp'] = this.timeStamp;
    data['email_address'] = this.emailAddress;
    data['phone_number'] = this.phoneNumber;
    data['request_content'] = this.requestContent;
    return data;
  }
}
