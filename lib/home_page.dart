import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/ayush_arogyaam_logo.svg",
                  width: 100,
                  height: 100,
                ),
                const Row(
                  children: [
                    Text("Services"),
                    SizedBox(width: 20,),
                    Text("About Us"),
                    SizedBox(width: 20,),
                    Text("Testimonials"),
                    SizedBox(width: 20,),
                    Text("Contact"),
                    SizedBox(width: 20,),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
