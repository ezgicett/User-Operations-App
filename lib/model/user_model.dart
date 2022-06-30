class UserModel {
  String? uid;
  String? email;
  String? name;
  String? gender;
  String? age;
  String? weight;
  String? length;

  UserModel(
      {this.uid,
        this.email,
        this.name,
        this.gender,
        this.age,
        this.weight,
        this.length});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    gender = json['gender'];
    age = json['age'];
    weight = json['weight'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['length'] = this.length;
    return data;
  }
}