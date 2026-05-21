void main() async {

  List<User> users = await Users();

  for (var user in users) {
    print("${user.name} - ${user.email}");
  }
}

class User {

  String name;
  String email;

  User(this.name, this.email);

  factory User.fromJson(Map<String, dynamic> json) {

    return User(
      json['name'],
      json['email'],
    );
  }
}

Future<List<User>> Users() async {

  await Future.delayed(Duration(seconds: 1));

  List<Map<String, dynamic>> jsonData = [
    {
      "name": "Duong1",
      "email": "duong1@gmail.com"
    },
    {
      "name": "Duong2",
      "email": "duong2@gmail.com"
    }
  ];

  return jsonData
      .map((json) => User.fromJson(json))
      .toList();
}