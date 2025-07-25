import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_example/user.dart';
import 'package:flutter_state_example/user_repository.dart';

// 1. HomePage에서 사용하는 상태 클래스 정의
class HomeState {
  HomeState({required this.user, required this.fetchTime});

  // 유저 정보를 가지고 오지 않았을 때에는 User가 null!
  User? user;

  // 데이터를 가지고 온 시간. 마찬가지로 초기에는 null
  DateTime? fetchTime;
}

// 2. ViewModel 구현 Notifier를 상속
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(user: null, fetchTime: null);
  }

  // 유저 정보 가져오기
  void getUserInfo() async {
    UserRepository userRepository = UserRepository();
    User user = await userRepository.getUser();

    // 새로운 상태로 업데이트
    state = HomeState(user: user, fetchTime: DateTime.now());
  }
}

// 3. NotifierProvider를 통해 ViewModel을 앱 전체에 공유
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
