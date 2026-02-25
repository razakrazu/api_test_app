class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String city;
  final String company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.city,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      city: json['address']['city'],
      company: json['company']['name'],
    );
  }
}