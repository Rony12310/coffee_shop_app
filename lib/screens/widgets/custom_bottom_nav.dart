import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      Iconsax.home,
      Iconsax.heart,
      Iconsax.shopping_bag,
      Iconsax.location,
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final isSelected = index == currentIndex;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  items[index],
                  color: isSelected ? const Color(0xffC67C4E) : Colors.grey,
                ),
                if (isSelected)
                  Container(
                    width: 18,
                    height: 4,
                    margin: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: const Color(0xffC67C4E),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
