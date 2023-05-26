part of 'user_bloc.dart';

enum StatuState { initial, loading, success, failure }

class UserState extends Equatable {
  const UserState({
    this.status = StatuState.initial,
    this.users = const [],
  });

  factory UserState.initial() {
    return const UserState();
  }

  final StatuState status;
  final List<UserModel> users;

  UserState copyWith({
    StatuState? status,
    List<UserModel>? users,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }

  @override
  List<Object> get props => [status, users];
}
