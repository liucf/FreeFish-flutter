import 'package:freefish/pages/sign_up/provider/register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifer extends _$RegisterNotifer {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void onNameChange(String name) {
    state = state.copyWith(name: name);
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setRePassword(String rePassword) {
    state = state.copyWith(rePassword: rePassword);
  }
}
