import 'package:flutter/material.dart';
import 'package:native_designs/views/contact-screen.dart';
import 'package:native_designs/views/home-screen.dart';
import 'package:native_designs/views/services-screen.dart';

void main() {
  runApp(const MyApp());
}

const String home = "Home";
const String services = "Services";
const String contact = "Contact";
const String title = "Demo";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> _pages;
  late Widget _home;
  late Widget _services;
  late Widget _contact;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _home = const HomeScreen();
    _services = const ServicesScreen();
    _contact = ContactScreen(changePage: _changeTab);
    _pages = [_home, _services, _contact];
    _currentIndex = 0;
    _currentPage = _home;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _changeTab(index);
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: home,
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: services,
              icon: Icon(Icons.home_repair_service),
            ),
            BottomNavigationBarItem(
              label: contact,
              icon: Icon(Icons.person),
            ),
          ]),
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              _navigationItemListTitle(home, 0),
              _navigationItemListTitle(services, 1),
              _navigationItemListTitle(contact, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navigationItemListTitle(String title, int index) {
    return ListTile(
      title: Text(
        '$title Page',
        style: TextStyle(color: Colors.blue[400], fontSize: 22.0),
      ),
      onTap: () {
        Navigator.pop(context);
        _changeTab(index);
      },
    );
  }
}
