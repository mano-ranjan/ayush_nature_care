import 'package:ayush_nature_cure/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showFirst = true;
  bool showSecond = true;
  // bool showSecond = true;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showFirst = false;
      });
    }).then((value) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          showSecond = false;
        });
      });
    });
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = 0.0;
            var end = 1.0;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Colors.white,
              Color(0xFF4CAF50),
            ],
          ),
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: showFirst
                ? const Center(
                  child: Text(
                    'Eternal Life, Nature Cure',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                )
                : showSecond
                    ? const Center(
                      child: Text(
                        "Rediscover Vitality: Nature's Cure for Eternal Life",
                        style:
                            TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    )
                    : SvgPicture.asset(
                        "assets/ayush_arogyaam_logo.svg",
              height: 200,
              width: 200,
                      ),
          ),
        ),
      ),
    );
  }
}
