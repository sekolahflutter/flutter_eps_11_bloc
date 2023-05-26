part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetDetailEvent extends DetailEvent {
  final int id;

  const GetDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
