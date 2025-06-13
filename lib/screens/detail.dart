import 'package:coffeeshop_application/screens/order.dart';
import 'package:coffeeshop_application/screens/widgets/coffee_size.dart';
import 'package:coffeeshop_application/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Detail extends HookWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedSize = useState<int>(1);

    useEffect(() {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
        ),
      );
      return null;
    }, const []);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.050),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Color(0xff2F2D2C),
                    ),
                  ),
                  SizedBox(width: size.width * 0.095),
                  Text(
                    'Detail',
                    style: GoogleFonts.sora(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: size.width * 0.095),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.heart,
                      color: Color(0xff2F2D2C),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.030),
            Container(
              width: 315,
              height: 226,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/images/item.png"),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.020),
            SizedBox(
              width: 315,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cappucino",
                    style: GoogleFonts.sora(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2F2D2C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "with Chocolate",
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff9B9B9B),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 340,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Iconsax.star1,
                          color: Color(0xffFBBE21),
                        ),
                      ),
                      Text(
                        "4.8",
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff2F2D2C),
                        ),
                      ),
                      SizedBox(width: size.width * 0.010),
                      Text(
                        "(230)",
                        style: GoogleFonts.sora(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.beach_access_rounded,
                          color: Color(0xffC67C4E),
                        ),
                      ),
                      SizedBox(width: size.width * 0.020),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.bolt_outlined,
                          color: Color(0xffC67C4E),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 315,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.010),
                  Container(height: 2, color: const Color(0xffEAEAEA)),
                  SizedBox(height: size.height * 0.020),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: size.height * 0.010),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text:
                          "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ",
                          style: GoogleFonts.sora(
                            color: const Color(0xff9B9B9B),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.64,
                          ),
                          children: [
                            TextSpan(
                              text: "Read More",
                              style: GoogleFonts.sora(
                                color: const Color(0xffC67C4E),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.020),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Size",
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: size.height * 0.020),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CoffeeSize(
                            title: "S",
                            index: 0,
                            selectedSize: selectedSize.value,
                            onClick: () => selectedSize.value = 0,
                          ),
                          CoffeeSize(
                            title: "M",
                            index: 1,
                            selectedSize: selectedSize.value,
                            onClick: () => selectedSize.value = 1,
                          ),
                          CoffeeSize(
                            title: "L",
                            index: 2,
                            selectedSize: selectedSize.value,
                            onClick: () => selectedSize.value = 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.020),
                ],
              ),
            ),
            Container(
              height: 121,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff9B9B9B),
                            ),
                          ),
                          Text(
                            "\$ 4.53",
                            style: GoogleFonts.sora(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xffC67C4E),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 217,
                        height: 62,
                        child: CustomButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration:
                                const Duration(milliseconds: 500),
                                pageBuilder: (_, __, ___) => const Order(),
                                transitionsBuilder:
                                    (_, animation, __, child) {
                                  final offsetAnimation = Tween<Offset>(
                                    begin: const Offset(0.0, 1.0),
                                    end: Offset.zero,
                                  ).animate(CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeOut,
                                  ));

                                  final fadeAnimation = Tween<double>(
                                    begin: 0,
                                    end: 1,
                                  ).animate(animation);

                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: FadeTransition(
                                      opacity: fadeAnimation,
                                      child: child,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          title: 'Buy Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
