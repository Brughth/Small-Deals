import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? image;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.image,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? image,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    if (image != null) {
      result.addAll({'image': image});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, image: $image)';
  }
}
