import 'package:flutter/material.dart';
import 'package:sintomas_bd/pages/explore_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Icon(Icons.health_and_safety, size: 40, color: Colors.pink),
                  SizedBox(width: 10),
                  Text('Lutar',
                      style: TextStyle(color: Colors.pink, fontSize: 24)),
                  Text('AR',
                      style: TextStyle(color: Colors.black, fontSize: 24)),
                ]),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:  Size(40, 40),
                    maximumSize:  Size(80, 80),
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: () {},
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ExplorePage(),
            ),
          ),
        ),
        BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
          backgroundColor: Colors.white,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
        ),
      ]),
    );
  }
}
