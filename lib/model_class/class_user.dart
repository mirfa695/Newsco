class User1 {
  String? name;
  String? email;
  String? dob;

  User1({this.name, this.email, this.dob});

  User1.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['dob'] = dob;
    return data;
  }
}

