import 'package:coffeeshop_application/screens/widgets/custom_button.dart';
import 'package:coffeeshop_application/screens/widgets/type_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/app_routes.dart';
import 'delivery.dart'; // Import the destination screen directly for custom animation

class Order extends HookWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    final quantity = useState<int>(1);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Order',
          style: GoogleFonts.sora(fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left, color: Color(0xff2F2D2C)),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.050),
              TypeToggle(items: ['Delivery', 'Pick Up']),
              SizedBox(height: size.height * 0.040),
              _buildDeliveryAddressSection(),
              const SizedBox(height: 20),
              _buildItemSummary(quantity),
              const SizedBox(height: 20),
              Container(height: 4, color: const Color(0xffF4F4F4)),
              const SizedBox(height: 20),
              _buildDiscountBanner(),
              const SizedBox(height: 20),
              _buildPaymentSummary(),
              _buildBottomBar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryAddressSection() {
    return Container(
      width: 315,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery Address", style: GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          Text("Jl. Kpg Sutoyo", style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(
            "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
            style: GoogleFonts.sora(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xff808080)),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _optionButton(Iconsax.edit, "Edit Address"),
              const SizedBox(width: 8),
              _optionButton(Iconsax.note_1, "Add Note"),
            ],
          ),
          const SizedBox(height: 20),
          Container(height: 2, color: const Color(0xffEAEAEA)),
        ],
      ),
    );
  }

  Widget _optionButton(IconData icon, String label) {
    return Container(
      height: 27,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffDEDEDE)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14),
          const SizedBox(width: 4),
          Text(label, style: GoogleFonts.sora(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildItemSummary(ValueNotifier<int> quantity) {
    return Container(
      width: 315,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset("assets/images/1.png", width: 54, height: 54, fit: BoxFit.contain),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cappucino", style: GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xff2F2D2C))),
                  const SizedBox(height: 4),
                  Text("with Chocolate", style: GoogleFonts.sora(fontSize: 12, fontWeight: FontWeight.w400, color: const Color(0xff9B9B9B))),
                ],
              ),
            ],
          ),
          Row(
            children: [
              _quantityButton("-", () => quantity.value > 1 ? quantity.value-- : null),
              const SizedBox(width: 15),
              Text("${quantity.value}", style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w600)),
              const SizedBox(width: 15),
              _quantityButton("+", () => quantity.value++),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quantityButton(String symbol, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 28,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: const Color(0xffEAEAEA)),
        ),
        child: Text(
          symbol,
          style: GoogleFonts.sora(color: const Color(0xffAAADB0), fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _buildDiscountBanner() {
    return Container(
      width: 315,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xffEAEAEA)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Iconsax.discount_shape5, size: 24, color: Color(0xffC67C4E)),
              const SizedBox(width: 12),
              Text("1 Discount is applied", style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          ),
          const Icon(Icons.chevron_right, size: 20),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return SizedBox(
      width: 315,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment Summary", style: GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 13),
          _paymentRow("Price", "\$ 4.53"),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Fee", style: GoogleFonts.sora(fontSize: 14)),
              Row(
                children: [
                  Text("\$ 2.0", style: GoogleFonts.sora(decoration: TextDecoration.lineThrough, fontSize: 14)),
                  const SizedBox(width: 8),
                  Text("\$ 1.0", style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 7),
          _paymentRow("Total Payment", "\$ 5.53"),
        ],
      ),
    );
  }

  Widget _paymentRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.sora(fontSize: 14)),
        Text(value, style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      width: 376,
      height: 161,
      padding: const EdgeInsets.only(top: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 315,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.moneys, color: Color(0xffC67C4E), size: 24),
                    const SizedBox(width: 10),
                    Container(
                      width: 112,
                      height: 24,
                      decoration: BoxDecoration(color: const Color(0xffF6F6F6), borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Container(
                            width: 51,
                            height: 24,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: const Color(0xffC67C4E), borderRadius: BorderRadius.circular(20)),
                            child: Text("Cash", style: GoogleFonts.sora(fontSize: 12, color: Colors.white)),
                          ),
                          const SizedBox(width: 10),
                          Text("\$ 5.53", style: GoogleFonts.sora(fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(color: const Color(0xff808080), borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Iconsax.more, size: 19.2, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 315,
            height: 62,
            child: CustomButton(
              title: 'Order',
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (_, __, ___) => const Delivery(), // Replace with your actual screen
                    transitionsBuilder: (_, animation, __, child) {
                      final offsetAnimation = Tween<Offset>(
                        begin: const Offset(0.0, 1.0),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

                      final fadeAnimation = Tween<double>(begin: 0, end: 1).animate(animation);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: FadeTransition(opacity: fadeAnimation, child: child),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
