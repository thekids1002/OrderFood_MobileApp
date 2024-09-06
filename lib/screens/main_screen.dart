import 'package:flutter/material.dart';
import 'history_screen.dart';
import 'home_screen.dart';
import '../widgets/rounded_image.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getBody(),
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xFFFA4A0C),
            backgroundColor: const Color(0xFFF2F2F2),
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _selectedIndex == 1 ? Icons.favorite : Icons.favorite_border,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _selectedIndex == 2 ? Icons.person : Icons.person_outline,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _selectedIndex == 3 ? Icons.history : Icons.history_outlined,
                  size: 30,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    switch (_selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Text("Favorites");
      case 2:
        return const Text("Personal");
      case 3:
        return const HistoryScreen();
      default:
        return const Center(child: Text('Page not found'));
    }
  }
}




