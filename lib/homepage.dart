import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
      body: Column(
        children: [
          Text('이름: '),
          Text('나이: ${homeState.user?.age ?? ""}'),
          Text('데이터 가져온 시간 : '),
          GestureDetector(
            onTap: () {
              print("클릭!");
            },
            child: Text('정보 가져오기'),
          ),
        ],
      ),
    );
  }
}
