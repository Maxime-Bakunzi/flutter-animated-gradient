import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          elevation: 5,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: AnimatedGradientContainer(),
    );
  }
}

class AnimatedGradientContainer extends StatefulWidget {
  @override
  _AnimatedGradientContainerState createState() =>
      _AnimatedGradientContainerState();
}

class _AnimatedGradientContainerState extends State<AnimatedGradientContainer> {
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _colors.length;
      });
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Gradient Container'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add functionality here
            },
          ),
        ],
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _colors[_currentIndex],
                _colors[(_currentIndex + 1) % _colors.length],
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: 300,
          height: 300,
          child: Center(
            child: Text(
              'Hola colegas!',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
