import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffeeshop_application/screens/widgets/custom_button.dart';
import 'home.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  late AnimationController _textController;
  late AnimationController _buttonController;
  late Animation<double> _textOpacity;
  late Animation<Offset> _textOffset;
  late Animation<double> _buttonOpacity;
  late Animation<Offset> _buttonOffset;

  @override
  void initState() {
    super.initState();

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeIn),
    );
    _textOffset = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOut),
    );

    _buttonOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeIn),
    );
    _buttonOffset = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeOut),
    );

    _textController.forward().then((_) => _buttonController.forward());
  }

  @override
  void dispose() {
    _textController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, _, _) => const Home(), // Make sure `Home` is imported properly
        transitionsBuilder: (_, animation, _, child) {
          final fade = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
          final scale = Tween<double>(begin: 0.95, end: 1.0).animate(animation);
          return FadeTransition(
            opacity: fade,
            child: ScaleTransition(
              scale: scale,
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: size.height * 0.68,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/welcome.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.60,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SlideTransition(
                    position: _textOffset,
                    child: FadeTransition(
                      opacity: _textOpacity,
                      child: Column(
                        children: [
                          Text(
                            "Coffee so good, \nyour taste buds\nwill love it.",
                            style: GoogleFonts.sora(
                              fontSize: 34,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "The best grain, the finest roast, \nthe powerful flavor.",
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFA9A9A9),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SlideTransition(
                    position: _buttonOffset,
                    child: FadeTransition(
                      opacity: _buttonOpacity,
                      child: SizedBox(
                        height: 62,
                        width: size.width * 0.80,
                        child: CustomButton(
                          title: 'Get Started',
                          onPressed: _navigateToHome,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
