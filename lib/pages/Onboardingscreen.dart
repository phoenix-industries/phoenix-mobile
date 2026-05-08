import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboard1.png",
      "title": "WELCOME TO PHOENIX!",
      "desc":
          "Welcome to Phoenix, your one-stop solution for sustainable shopping! Our app connects you with a vibrant community of buyers and sellers."
    },
    {
      "image": "assets/images/onboard2.png",
      "title": "Donate & Sell",
      "desc":
          "Make a difference by donating items you no longer need or selling items you've outgrown. Together, we can reduce waste and give new life to pre-loved goods."
    },
    {
      "image": "assets/images/onboard3.png",
      "title": "Discover & Make Deals",
      "desc":
          "Explore a wide range of products using our AI-powered search and personalized recommendations. Find unique items, connect with sellers, and make deals that benefit you."
    },
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // keeps content below status bar and above gesture area
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xfff0500a), width: 2),
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: onboardingData.length,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (context, index) {
                      final item = onboardingData[index];
                      return Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item["image"]!,
                          height: MediaQuery.of(context).size.height * 0.35, // 45% of screen height
                          width: double.infinity,
                          fit: BoxFit.cover, // keeps full image visible
                           ),
                              ),
                            const SizedBox(height: 40),
                            FittedBox(
                             fit: BoxFit.scaleDown,
                             child: Text(
                            item["title"]!,
                           style: const TextStyle(
                           fontSize: 28,
                           fontWeight: FontWeight.bold,
                           color: Color(0xfff0500a),
                             ),
                            ),
                           ),
                            const SizedBox(height: 16),
                            Text(
                              item["desc"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Dots indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingData.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 12 : 8,
                      height: _currentPage == index ? 12 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? const Color(0xfff0500a)
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),

                // Bottom buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: _currentPage == onboardingData.length - 1
                      ? SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                   padding: EdgeInsets.zero, // remove default padding
                   shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(8),
                           ),
                     backgroundColor: Colors.transparent,
                     shadowColor: Colors.transparent,
                     ),
                    onPressed: () {
                    Navigator.pushReplacementNamed(context, '/fram');
                      },
                   child: Ink(
                   decoration: BoxDecoration(
                   gradient: const LinearGradient(
                   colors: [Color(0xfffec517), Color(0xfff43f06)],
                   begin: Alignment.centerLeft,
                   end: Alignment.centerRight,
                   ),
                  borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                    alignment: Alignment.center,
                   padding: const EdgeInsets.symmetric(vertical: 14),
                  child: const Text(
                   "LET'S START",
                  style: TextStyle(
                   fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  ),
                 ),
                 ),
                 ),
                 ),
                  )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/fram');
                              },
                              child: const Text(
                                "SKIP",
                                style: TextStyle(color: Color(0xfff0500a)),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: const Text(
                                "NEXT",
                                style: TextStyle(color: Color(0xfff0500a)),
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
