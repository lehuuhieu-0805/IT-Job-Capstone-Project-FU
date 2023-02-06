class User {
  final String name;
  final String imagePath;
  final int gender;
  final String dob;
  final String address;
  final String phone;
  final String email;

  const User({
    required this.name,
    required this.imagePath,
    required this.gender,
    required this.dob,
    required this.address,
    required this.phone,
    required this.email,
  });

  User copy({
    String? name,
    String? imagePath,
    int? gender,
    String? dob,
    String? address,
    String? phone,
    String? email,
  }) =>
      User(
        name: name ?? this.name,
        imagePath: imagePath ?? this.imagePath,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        email: email ?? this.email,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        imagePath: json['imagePath'],
        gender: json['gender'],
        dob: json["dob"],
        address: json['address'],
        phone: json['phone'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'imagePath': imagePath,
        'gender': gender,
        'dob': dob,
        'address': address,
        'phone': phone,
        'email': email,
      };
}
