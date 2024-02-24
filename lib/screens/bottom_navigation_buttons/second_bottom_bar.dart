// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:najot_talim_nt/screens/home_screen/home_screen.dart';
import 'package:najot_talim_nt/screens/my_cards_screen/my_cards_screen.dart';
import 'package:najot_talim_nt/screens/transfer_actions_screen/trans_actions_screen.dart';
import 'package:najot_talim_nt/screens/transfer_screen/transfer_screen.dart';

class SecondBottomBar extends StatefulWidget {
  const SecondBottomBar({super.key});

  @override
  State<SecondBottomBar> createState() => _SecondBottomBarState();
}

class _SecondBottomBarState extends State<SecondBottomBar> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      HomeScreen(),
      MyCardsScreen(),
      TransActionsScreen(),
      TransferScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _activeIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
