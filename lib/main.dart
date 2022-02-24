import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _pageIndex = 0; // 페이지 정보

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complicated UI App'), centerTitle: true, // 중앙 정렬 여부
        elevation: 6, // 상단바 그림자 강도
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.drafts,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: HomePage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            // 하단 네비게이션 바를 눌러 페이지 이동
            setState(() {
              _pageIndex = value;
            });
          },
          currentIndex: _pageIndex,
          // 현재 페이지
          selectedItemColor: Colors.amber,
          // 선택된 NavigationBar의 색상
          unselectedItemColor: Colors.black26,
          // 선택안된 NavigationBar의 색상
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              title: Text('photo'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              title: Text('more'),
            ),
          ]), // ng comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ListView(
        children: <Widget>[
          _pageOfTop(), // 상단
          _pageOfMiddle(), // 중단
          _pageOfBottom(), // 하단
        ],
      ),
    );
  }
}

Widget _pageOfTop() {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.directions_bike,
                size: 40,
              ),
              Text('자전거'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.directions_run,
                size: 40,
              ),
              Text('달리기'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.directions_bus,
                size: 40,
              ),
              Text('버스'),
            ],
          ),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      // Row와 Row사이에 위치시켜서 여백 넣기
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.directions_car,
                size: 40,
              ),
              Text('자동차'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.directions_subway,
                size: 40,
              ),
              Text('지하철'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.directions_boat,
                size: 40,
              ),
              Text('보트'),
            ],
          ),
        ],
      )
    ],
  );
}

Widget _pageOfMiddle() {
  return Text('pageOfMiddle');
}

Widget _pageOfBottom() {
  final items = List.generate(15, (i) {
    var num = i + 1;
    return ListTile(
      leading: Icon(Icons.notifications),
      title: Text('$num번째 ListTile'),
    );
  });
  return ListView(
    physics: NeverScrollableScrollPhysics(), // 해당 리스트의 스크롤 금지
    shrinkWrap: true, // 상위 리스트 위젯이 별도로 있다면 true 로 설정해야 스크롤이 가능
    children: items,
  );
}
