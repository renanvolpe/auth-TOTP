import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/modules/auth_module/data/abstract_repository/abstract_auth_repository.dart';
import 'package:flutter_dev_test/modules/shared/dio/error_treatment.dart';

import '../../../data/param/login_param.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(IAuthRepository repository) : super(LoginInitial()) {
    on<LoginStarted>((event, emit) async {
      emit(LoginProgress());
      var response = await repository.login(event.param);
      response.fold((failure) {
        if (failure.message!.contains(ErrorMessages.errorTotp)) {
          emit(LoginFailureTotp(failure.message!));
        } else {
          emit(LoginFailure(failure.message!));
        }
      }, (success) {
        //TODO USE CASE HERE
        emit(LoginSuccess(success));
      });
    });
  }
}
