import 'package:app/constant/app_color.dart';
import 'package:app/constant/app_images.dart';
import 'package:app/constant/app_size.dart';
import 'package:app/constant/app_typography.dart';
import 'package:app/presentation/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'We serve incomparable delicacies',
      'description':
          'All the best restaurants with their top menu waiting for you, they can’t wait for your order!',
      'image': AppImages.onb1,
    },
    {
      'title': 'We serve incomparable delicacies',
      'description':
          'All the best restaurants with their top menu waiting for you, they can’t wait for your order!',
      'image': AppImages.onb2,
    },
    {
      'title': 'We serve incomparable delicacies',
      'description':
          'All the best restaurants with their top menu waiting for you, they can’t wait for your order!',
      'image': AppImages.onb2,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return OnboardingPage(
                title: _onboardingData[index]['title']!,
                description: _onboardingData[index]['description']!,
                image: _onboardingData[index]['image']!,
              );
            },
          ),
          Positioned(
            bottom: AppResponsive.getHeight(context, 5),
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppResponsive.getWidth(context, 5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _navigateToLogin,
                    child: Text(
                      'Skip',
                      style: AppTypography.bodyMediumRegular.copyWith(
                        color: AppColors.neutral10,
                      ),
                    ),
                  ),
                  Row(
                    children: List.generate(
                      _onboardingData.length,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: AppResponsive.getWidth(context, 1),
                        ),
                        width: _currentPage == index ? 12.0 : 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color:
                              _currentPage == index
                                  ? AppColors.neutral10
                                  : AppColors.neutral10.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  _currentPage == _onboardingData.length - 1
                      ? IconButton(
                        onPressed: _navigateToLogin,
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.neutral10,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          shape: const CircleBorder(),
                        ),
                      )
                      : TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          'Next',
                          style: AppTypography.bodyMediumRegular.copyWith(
                            color: AppColors.neutral10,
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الصورة تاخد كل الشاشة بدون أي فراغ
        Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),

        // تعتيم خفيف لتحسين وضوح النص
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.4))),

        // النص في الوسط
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppResponsive.getWidth(context, 5),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppResponsive.getWidth(context, 5),
              vertical: AppResponsive.getHeight(context, 4),
            ),
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.85),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTypography.heading1Medium.copyWith(
                    color: AppColors.neutral10,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppResponsive.getHeight(context, 2)),
                Text(
                  description,
                  style: AppTypography.bodyMediumRegular.copyWith(
                    color: AppColors.neutral10.withOpacity(0.9),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
