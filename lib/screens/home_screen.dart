import 'package:flutter/material.dart';
import '../pages/page1.dart';
import '../pages/page2.dart';
import '../pages/page3.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({super.key, this.initialIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;

  final List<Widget> pages = [
    const Page1(),
    const Page2(),
    const DropdownMenuApp(),
  ];


  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MotosApp'),
      ),
      body: pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
        
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Page 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Page 2',
        ),
      ])
      ,
    );
  }
}