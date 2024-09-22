import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/modules/auth_module/data/abstract_repository/abstract_auth_repository.dart';

import '../../../data/param/recovery_secret_param.dart';

part 'recovery_secret_event.dart';
part 'recovery_secret_state.dart';

class RecoverySecretBloc extends Bloc<RecoverySecretEvent, RecoverySecretState> {
  RecoverySecretBloc(IAuthRepository repository) : super(RecoverySecretInitial()) {
    on<RecoverySecretStarted>((event, emit) async {
      emit(RecoverySecretProgress());
      await Future.delayed(const Duration(seconds: 2));
      var response = await repository.recoverySecret(event.recoverySecretParam);
      response.fold(
        (failure) => emit(RecoverySecretFailure(failure.message!)),
        (success) {
          //TODO USE CASE HERE
          emit(RecoverySecretSuccess(success));
        },
      );
    });
  }
}
