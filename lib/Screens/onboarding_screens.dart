import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled2/cubits/onboarding_cubit.dart';
import 'package:untitled2/main.dart';



class OnboardingScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/6e98204e0ed6660bd452256326feedcd.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome To",
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "The Weather",
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                    fontSize: 30,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
              ),
              // Add a placeholder for the picture here
              const SizedBox(height: 20),
              Text(
                "Stay ahead of the weather with real-time updates and forecasts. From sunny days to stormy nights, we’ve got you covered",
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/548bb5b675c0e737052b0fc7e601fd68.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Always Be Prepared",
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              // Add a placeholder for the picture here
              const SizedBox(height: 20),
              Text(
                "Get the latest weather information for your current location or any city you’re curious about. Accurate forecasts and detailed weather insights at your fingertips",
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/166f2fb74d11480fcb163c27e8794881.jpg"),
            fit: BoxFit.cover,
          ),
          
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () async {
              context.read<OnboardingCubit>().completeOnboarding();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => AuthGate(),
              ));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 100),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade900.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "Let's Start",
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class OnboardingPageView extends StatelessWidget {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              OnboardingScreen1(),
              OnboardingScreen2(),
              OnboardingScreen3(),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(
                  activeDotColor: Colors.blue.shade900,
                  dotHeight: 15,
                  dotWidth: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}