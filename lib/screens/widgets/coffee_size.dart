import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeSize extends HookWidget {
  final String title;
  final int index;
  final int selectedSize;
  final VoidCallback onClick;

  const CoffeeSize({
    super.key,
    required this.title,
    required this.index,
    required this.selectedSize,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedSize;

    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 96,
        height: 43,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffFFF5EE) : const Color(0xFFFFFFFF),
          border: Border.all(
            color: isSelected ? const Color(0xffC67C4E) : const Color(0xffDEDEDE),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isSelected ? const Color(0xffC67C4E) : Colors.black,
          ),
        ),
      ),
    );
  }
}
