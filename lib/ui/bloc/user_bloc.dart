import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/model/user_model.dart';
import 'package:test_flutter/service/api_data_source.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiDataSource source;
  UserBloc({required this.source}) : super(InitialState()) {
    on<GetUserEvent>(_getUserHandler);
  }

  Future<void> _getUserHandler(
      GetUserEvent event, Emitter<UserState> emitter) async {
    emit(GettingUsersState());
    List<UserModel> users = await source.getData(event.limit);
    emit(UserGettedState(users: users));
  }
}
