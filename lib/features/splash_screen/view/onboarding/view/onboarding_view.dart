import 'package:event_hub_app/core/utils/app_colors.dart';
import 'package:event_hub_app/features/splash_screen/view/auth/view/sign_in_view.dart';
import 'package:event_hub_app/features/splash_screen/view/onboarding/view/models/onboarding_model.dart';
import 'package:flutter/material.dart';

 

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingContents.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Image.asset(
                      onboardingContents[index].image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  const Spacer(flex: 4), 
                ],
              );
            },
          ),
          
          
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.42, 
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              decoration: const BoxDecoration(
                color: AppColors.primary, 
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
              ),
              child: Column(
                children: [
                  Text(
                    onboardingContents[_currentIndex].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    onboardingContents[_currentIndex].description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                  const Spacer(),
                  
                  _buildNavigationRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignInView()),
            );
          }, 
          child: const Text('Skip', style: TextStyle(color: Colors.white70))
        ),
        
       
        Row(
          children: List.generate(3, (index) => Container(
            margin: const EdgeInsets.all(3),
            height: 8, width: _currentIndex == index ? 15 : 8,
            decoration: BoxDecoration(
              color: _currentIndex == index ? Colors.white : Colors.white38,
              borderRadius: BorderRadius.circular(5),
            ),
          )),
        ),
        
       
        TextButton(
          onPressed: () {
            if (_currentIndex == onboardingContents.length - 1) {
             
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignInView()),
              );
            } else {
              
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300), 
                curve: Curves.easeInOut
              );
            }
          },
          child: Text(
            _currentIndex == onboardingContents.length - 1 ? 'Done' : 'Next', 
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}