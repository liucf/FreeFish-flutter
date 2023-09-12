import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
class HomeBannerDots extends _$HomeBannerDots {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}
