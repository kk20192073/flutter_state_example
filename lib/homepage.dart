import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_example/home_view_model.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          HomeState homeState = ref.watch(homeViewModelProvider);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('이름: ${homeState.user?.name ?? "정보 없음"}'),
                Text('나이: ${homeState.user?.age ?? "정보 없음"}'),
                Text(
                  '데이터 가져온 시간: ${homeState.fetchTime?.toString() ?? "정보 없음"}',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    ref.read(homeViewModelProvider.notifier).getUserInfo();
                    print("클릭!");
                  },
                  child: Text('정보 가져오기'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
