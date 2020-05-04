import 'package:flutter/material.dart';
import 'package:resort_app/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: Business',
    ),
    Text(
      'Index 3: Business',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      unselectedItemColor: Color.fromRGBO(67, 72, 155, 0.5),
      selectedItemColor: Color.fromRGBO(67, 72, 155, 1.0),
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            height: 30.0,
            width: 30.0,
            child: Image.asset('assets/images/home.png'),
          ),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 30.0,
            width: 30.0,
            child: Image.asset('assets/images/bookmark.png'),
          ),
          title: Text("Favorite"),
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 30.0,
            width: 30.0,
            child: Image.asset('assets/images/msg1.png'),
          ),
          title: Text("Chat Support"),
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 25.0,
            width: 25.0,
            child: Image.asset('assets/images/user3.png'),
          ),
          title: Text("Profile"),
        ),
      ],
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
    );
  }
}
