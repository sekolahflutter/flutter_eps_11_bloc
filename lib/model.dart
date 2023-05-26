import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String email;
  final String name;
  final String avatar;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: '${json['first_name']} ${json['last_name']}',
      avatar: json['avatar'],
    );
  }

  @override
  List<Object?> get props => [id, email, name, avatar];
}
