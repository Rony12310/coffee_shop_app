import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeToggle extends HookWidget {
  final List<String> items;

  const TypeToggle({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex.value;
          return GestureDetector(
            onTap: () => selectedIndex.value = index,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xffC67C4E) : const Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                items[index],
                style: GoogleFonts.sora(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? Colors.white : const Color(0xff9B9B9B),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
