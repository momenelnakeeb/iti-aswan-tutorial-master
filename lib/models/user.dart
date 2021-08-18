class User {
  int id;
  String name, image, email;
  User({this.id, this.name, this.image, this.email});
  User.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.email = json['email'];
    this.name = "${json['first_name']} ${json['last_name']}";
    this.image = json['avatar'];
  }
}
