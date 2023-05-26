import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharing_bloc_1/api.dart';
import 'package:sharing_bloc_1/model.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<GetDetailEvent>((event, emit) async {
      try {
        emit(LoadingDetail());
        final data = await ApiService.getDetailUser(event.id);
        emit(SuccessDetail(data));
      } catch (e) {
        emit(FailureDetail());
      }
    });
  }
}
