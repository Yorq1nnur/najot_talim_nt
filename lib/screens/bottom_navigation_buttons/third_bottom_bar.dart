// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:najot_talim_nt/screens/home_screen/home_screen.dart';
import 'package:najot_talim_nt/screens/my_cards_screen/my_cards_screen.dart';
import 'package:najot_talim_nt/screens/transfer_actions_screen/trans_actions_screen.dart';
import 'package:najot_talim_nt/screens/transfer_screen/transfer_screen.dart';

class TabBox3 extends StatefulWidget {
  const TabBox3({super.key});

  @override
  State<TabBox3> createState() => _TabBox3State();
}

class _TabBox3State extends State<TabBox3> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
          switch (newActiveIndex) {
            case 1:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyCardsScreen(
                        onTap: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
            case 2:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TransActionsScreen(
                        onTap: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
            case 3:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TransferScreen(
                        onTap: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
          }
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
