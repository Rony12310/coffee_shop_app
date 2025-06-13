import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Item extends HookWidget {
  final String image;
  final VoidCallback? onTap;

  const Item({
    super.key,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scale = useState(1.0);

    return GestureDetector(
      onTapDown: (_) => scale.value = 0.97,
      onTapUp: (_) => scale.value = 1.0,
      onTapCancel: () => scale.value = 1.0,
      onTap: onTap,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 150),
        scale: scale.value,
        child: Container(
          height: 239,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 142,
                      height: 132,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      left: -1,
                      child: Container(
                        width: 51,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(128),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.star1,
                              color: Color(0xfffFBBE21),
                              size: 14,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              "4.9",
                              style: GoogleFonts.sora(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Cappucino",
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff2F2D2C),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'with Chocolate',
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff9B9B9B),
                  ),
                ),
                const SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ 4.53",
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2F4B4E),
                      ),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffC67C4E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
