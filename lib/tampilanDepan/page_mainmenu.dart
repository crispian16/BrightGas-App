import 'package:customer/tampilanDepan/view_kelola.dart';
import 'package:customer/tampilanDepan/view_keranjang.dart';
import 'package:customer/tampilanDepan/view_tampilanDepan.dart';
import 'package:flutter/material.dart';

class PageMainMenu extends StatefulWidget {
  static String routeName = '/mainMenu';

  const PageMainMenu({Key? key}) : super(key: key);

  @override
  State<PageMainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<PageMainMenu> {
  int _bottomNavCurrentIndex = 0;
  final List<Widget> _container = [
    const ViewTampilanDepan(),
    const ViewKeranjang(),
    const ViewKelola(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _bottomNavCurrentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home_outlined,
              color: Color(0xFFEA609B),
            ),
            icon: Icon(
              Icons.home_outlined,
              color: Color(0xFF000000),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xFFEA609B),
            ),
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xFF000000),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.perm_identity,
              color: Color(0xFFEA609B),
            ),
            icon: Icon(
              Icons.perm_identity,
              color: Color(0xFF000000),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
