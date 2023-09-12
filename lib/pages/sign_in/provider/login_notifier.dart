import 'package:freefish/pages/sign_in/provider/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginState build() {
    return LoginState();
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}
