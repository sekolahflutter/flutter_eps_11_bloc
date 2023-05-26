part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class LoadingDetail extends DetailState {}

class SuccessDetail extends DetailState {
  final UserModel user;

  const SuccessDetail(this.user);

  @override
  List<Object> get props => [user];
}

class FailureDetail extends DetailState {}
