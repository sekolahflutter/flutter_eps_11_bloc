import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharing_bloc_1/api.dart';
import 'package:sharing_bloc_1/model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()) {
    on<GetUsersEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: StatuState.loading));
        final data = await ApiService.getUsers();
        emit(state.copyWith(status: StatuState.success, users: data));
      } catch (e) {
        emit(state.copyWith(status: StatuState.failure));
      }
    });
  }
}
