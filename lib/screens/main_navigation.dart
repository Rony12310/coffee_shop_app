import 'package:coffeeshop_application/constants/app_routes.dart';
import 'package:coffeeshop_application/screens/delivery.dart';
import 'package:coffeeshop_application/screens/home.dart';
import 'package:coffeeshop_application/screens/order.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Home(),
    Order(),
    Delivery(),
  ];

  final List<IconData> _icons = [
    Iconsax.home,
    Iconsax.shopping_bag,
    Iconsax.location,
  ];

  final List<String> _labels = [
    'Home',
    'Order',
    'Delivery',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_icons.length, (index) {
            final isSelected = index == _selectedIndex;

            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _icons[index],
                    size: 24,
                    color: isSelected ? const Color(0xffC67C4E) : const Color(0xff8D8D8D),
                  ),
                  const SizedBox(height: 6),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xffC67C4E) : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
