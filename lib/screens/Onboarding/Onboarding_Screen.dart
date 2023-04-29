import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  _Onboardingscreenstate createState() => _Onboardingscreenstate();
}

class _Onboardingscreenstate extends State<Onboardingscreen> {
  PageController ctrl = PageController();
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 55, 0, 55),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: ctrl,
                  onPageChanged: (int index) {
                      setState(() {
                        currentindex = index;
                      });
                    },
                  children: [
                    Container(
                      child: Column(children: [
                        const Text(
                          'TOKOTO',
                          style: TextStyle(
                            color: Color(0xffF9794E),
                            fontSize: 35,
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Welcome to ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "os",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              'Tokoto',
                              style: TextStyle(
                                color: Color(0xff9A9A9A),
                                fontFamily: "os",
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Text(
                              ', Let\'s shop! ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "os",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 105),
                        Container(
                          height: 300,
                          width: 300,
                          child: Image.network(
                              'https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/main/assets/images/splash_1.png'),
                          color: const Color.fromARGB(0, 160, 132, 132),
                        ),
                      ]),
                    ),
                    Container(
                      child: Column(children: [
                        const Text(
                          'TOKOTO',
                          style: TextStyle(
                            color: Color(0xffF9794E),
                            fontSize: 35,
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'We show the easy way to shop \n just stay at home with us',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "os",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 85,
                        ),
                        Container(
                          height: 300,
                          width: 300,
                          child: Image.network(
                              'https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/main/assets/images/splash_2.png'),
                          color: const Color.fromARGB(0, 160, 132, 132),
                        ),
                      ]),
                    ),
                    Container(
                      child: Column(children: [
                        const Text(
                          'TOKOTO',
                          style: TextStyle(
                            color: Color(0xffF9794E),
                            fontSize: 35,
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                             Text(
                              'We help people connect with store \n around United States of America',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "os",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 85,
                        ),
                        Container(
                          height: 300,
                          width: 300,
                          color: const Color.fromARGB(0, 160, 132, 132),
                          child: Image.network(
                              'https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/main/assets/images/splash_3.png'),
                          
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 100),
                height: 20,
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xffF77547),
                        dotColor: Color(0xffD1D1D1),
                        dotHeight: 8.5,
                        dotWidth: 8.5,
                      ),
                      controller: ctrl,
                      count: 3,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(55, 60, 55, 0),
                height: 130,
                width: 400,
                child: currentindex == 2 ? TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffF77547),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, "login");
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: "os",
                      fontSize: 16,
                      letterSpacing: 0.2,
                    ),
                  ),
                ) 
                : 
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffF77547),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: (){
                    ctrl.nextPage(
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.ease);
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontFamily: "os",
                      fontSize: 16,
                      letterSpacing: 0.2,
                    ),
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
