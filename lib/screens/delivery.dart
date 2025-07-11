import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Delivery extends HookWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/maps.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 0),
            SizedBox(
              width: 315,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconButton(context, Icons.chevron_left, () => Navigator.pop(context)),
                  _iconButton(context, Iconsax.gps, () {}),
                ],
              ),
            ),
            const SizedBox(height: 300),
            Container(
              height: 322,
              width: 375,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 44,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xffEAEAEA),
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                  Text(
                    "10 minutes left",
                    style: GoogleFonts.sora(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: "Delivery to ",
                      style: GoogleFonts.sora(
                        fontSize: 12,
                        color: const Color(0xff808080),
                      ),
                      children: [
                        TextSpan(
                          text: "Jl. Kpg Sutoyo",
                          style: GoogleFonts.sora(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (_) {
                      return Row(
                        children: [
                          Container(
                            height: 4,
                            width: size.width / 4 * 0.75,
                            decoration: BoxDecoration(
                              color: const Color(0xff36C07E),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const SizedBox(width: 5),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  _orderStatusCard(),
                  const SizedBox(height: 20),
                  _courierInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(BuildContext context, IconData icon, VoidCallback onPressed) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }

  Widget _orderStatusCard() {
    return Container(
      width: 315,
      height: 90,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffEAEAEA)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffDEDEDE)),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.directions_bike_rounded,
              color: Color(0xffC67C4E),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Delivered your order",
                style: GoogleFonts.sora(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff303336),
                ),
              ),
              Text(
                "We deliver your goods to you in \nthe shortes possible time.",
                style: GoogleFonts.sora(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff808080),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _courierInfo() {
    return SizedBox(
      width: 315,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/images/user.png", fit: BoxFit.contain),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Johan Hawn",
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff303336),
                    ),
                  ),
                  Text(
                    "Personal Courier",
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff808080),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffDEDEDE)),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Iconsax.call_calling5,
              color: Color(0xff808080),
            ),
          ),
        ],
      ),
    );
  }
}
