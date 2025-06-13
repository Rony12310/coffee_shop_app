import 'package:coffeeshop_application/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'widgets/banner.dart';
import 'widgets/category_items.dart';
import 'widgets/item.dart';
import 'widgets/custom_bottom_nav.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = useState<int>(0);
    final currentIndex = useState<int>(0);
    final list = ['Cappuccino', 'Machiato', 'Latte', 'Americano'];
    final images = [
      "assets/images/1.png",
      "assets/images/2.png",
      "assets/images/3.png",
      "assets/images/4.png",
    ];

    final controller = useAnimationController(
      duration: const Duration(milliseconds: 1000),
    )..forward();

    final fadeAnim = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    final slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 280.h,
                    width: 1.sw,
                    color: const Color(0xff131313),
                  ),
                  Column(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 315.w,
                          child: FadeTransition(
                            opacity: fadeAnim,
                            child: SlideTransition(
                              position: slideAnim,
                              child: Column(
                                children: [
                                  SizedBox(height: 20.h),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Location",
                                            style: GoogleFonts.sora(
                                              color: const Color(0xffB7B7B7),
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Bilzen, Tanjungbalai",
                                                style: GoogleFonts.sora(
                                                  color:
                                                  const Color(0xffDDDDDD),
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 44.w,
                                        height: 44.h,
                                        child: Image.asset(
                                            "assets/images/avatar.png"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  SizedBox(
                                    height: 52.h,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color(0xff313131),
                                        hintText: "Search coffee",
                                        hintStyle: GoogleFonts.sora(
                                          color: const Color(0xff989898),
                                          fontSize: 14.sp,
                                        ),
                                        prefixIcon: const Icon(
                                          Iconsax.search_normal,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        suffixIcon: Container(
                                          width: 44.w,
                                          height: 44.h,
                                          padding: EdgeInsets.all(8.r),
                                          decoration: BoxDecoration(
                                            color: const Color(0xffC67C4E),
                                            borderRadius:
                                            BorderRadius.circular(12.r),
                                          ),
                                          child: const Icon(
                                            Iconsax.setting_4,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(16.r),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),

                                  /// Carousel
                                  FadeTransition(
                                    opacity: fadeAnim,
                                    child: SlideTransition(
                                      position: slideAnim,
                                      child: SizedBox(
                                        height: 140.h,
                                        child: CarouselSlider(
                                          options: CarouselOptions(
                                            viewportFraction: 1,
                                            enlargeFactor: 0.3,
                                            height: 140.h,
                                            enlargeCenterPage: true,
                                            autoPlay: true,
                                          ),
                                          items: List.generate(
                                            5,
                                                (index) => const BannerCard(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),

                                  /// Categories
                                  FadeTransition(
                                    opacity: fadeAnim,
                                    child: SlideTransition(
                                      position: slideAnim,
                                      child: SizedBox(
                                        height: 40.h,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: list.length,
                                          itemBuilder: (context, index) {
                                            return CategoryItem(
                                              index: index,
                                              title: list[index],
                                              selectedCategory:
                                              selectedCategory.value,
                                              onClick: () => selectedCategory
                                                  .value = index,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// Grid Items
                      Expanded(
                        child: FadeTransition(
                          opacity: fadeAnim,
                          child: SlideTransition(
                            position: slideAnim,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15.w,
                                mainAxisSpacing: 10.h,
                                childAspectRatio: 0.75,
                                children: images.map((image) {
                                  return Item(
                                    image: image,
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          transitionDuration:
                                          const Duration(milliseconds: 500),
                                          pageBuilder: (_, __, ___) =>
                                          const Detail(),
                                          transitionsBuilder: (_, animation,
                                              __, child) {
                                            final offsetAnimation =
                                            Tween<Offset>(
                                              begin: const Offset(0.0, 1.0),
                                              end: Offset.zero,
                                            ).animate(CurvedAnimation(
                                                parent: animation,
                                                curve: Curves.easeOut));

                                            final fadeAnimation =
                                            Tween<double>(begin: 0, end: 1)
                                                .animate(animation);

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
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// Bottom Navigation
            CustomBottomNavBar(
              currentIndex: currentIndex.value,
              onTabSelected: (index) {
                currentIndex.value = index;
              },
            ),
          ],
        ),
      ),
    );
  }
}
