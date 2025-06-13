import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends HookWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffC67C4E),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.sora(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
