import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_nav_notifier.g.dart';

@riverpod
class ApplicationNavIndex extends _$ApplicationNavIndex {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}
