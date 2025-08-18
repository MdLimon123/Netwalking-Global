import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/image/image1.png",
      "text": "Welcome to NetWalking Global!",
      "subText": "Connecting people for wellness, networking, and growth."
    },
    {
      "image": "assets/image/image2.png",
      "text": "Walking Together Is More Than Just Exercise",
      "subText": "Discover the physical, emotional, and social power of walking in community."
    },
    {
      "image": "assets/image/image3.png",
      "text": "Gentle Movement, Powerful Impact",
      "subText": "Boost your heart, joints, & immune system by walking your body with ease."
    },
    {
      "image": "assets/image/image4.png",
      "text":
          "Your Mind Needs a Walk Too",
      "subText": "Reduce stress, anxiety & tension. Practice mindfulness in motion."
    },
    {
      "image": "assets/image/image5.png",
      "text":
          "Replace Coffee Chats with Connection Walks",
      "subText": "Talk while moving, meet intentions, network while staying healthy."
    },
    {
      "image": "assets/image/image6.png",
      "text":
          "Walk Into A Better Version of Yourself",
      "subText": "Build confidence, reflect deeply, and practice being a better version of yourself."
    },
    {
      "image": "assets/image/image7.jpg",
      "text":
          "Walk, Connect, Thrive!",
      "subText": "Meaningful conversations happen best when we’re in motion."
    },
    {
      "image": "assets/image/image8.png",
      "text":
          "Let’s Get Moving!",
      "subText": "Start your journey towards connection and well-being."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${_currentPage+1} of 8",
                        style:  TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF333333)
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          /// Login screen
                        },
                        child:  Text(
                          "Skip",
                          style: TextStyle(color: Color(0xFF0957AA), fontSize: 14,
                          fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  LinearProgressIndicator(
                    value: (_currentPage + 1) / _onboardingData.length,
                    minHeight: 5,
                    backgroundColor: Color(0xFFE6EEF7),
                    borderRadius: BorderRadius.circular(8),
                    valueColor:  AlwaysStoppedAnimation<Color>(
                      AppColors.primaryColor
                    ),
                  ),

                ],
              ),
            ),


            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image for each onboarding page
                     Container(
                       height: 180,
                       width: 180,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         image:    DecorationImage(image: AssetImage(_onboardingData[index]["image"] ?? ""),
                         fit: BoxFit.cover)
                       ),
                     ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            _onboardingData[index]["text"] ?? "",
                            textAlign: TextAlign.center,
                            style:  TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            _onboardingData[index]["subText"] ?? "",
                            textAlign: TextAlign.center,
                            style:  TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingData.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            // Action Button (Next or Start)
            Padding(
              padding: const EdgeInsets.all( 40.0),
              child: GestureDetector(
                onTap: () {
                  if (_currentPage == _onboardingData.length - 1) {

                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Container(
                height: 52,
                  width: 88,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        Color(0xFF15AABA),
                      ]
                    )
                  ),
                  child: Text(
                    _currentPage == _onboardingData.length - 1
                        ? "Start"
                        : "Next",
                    style:  TextStyle(color: Colors.white, fontSize: 16,
                    fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
