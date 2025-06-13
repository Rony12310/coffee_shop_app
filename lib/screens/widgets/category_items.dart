import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends HookWidget {
  final int index;
  final String title;
  final VoidCallback onClick;
  final int selectedCategory;

  const CategoryItem({
    super.key,
    required this.index,
    required this.title,
    required this.onClick,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedCategory;

    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 121,
        height: 38,
        margin: const EdgeInsets.only(right: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffC67C4E) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withValues(alpha: 230),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Text(
          title,
          style: GoogleFonts.sora(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
