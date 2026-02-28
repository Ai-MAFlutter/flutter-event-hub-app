class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({required this.image, required this.title, required this.description});
}

List<OnboardingModel> onboardingContents = [
  OnboardingModel(
    image: 'assets/images/image2.png', 
    title: 'Explore Upcoming and Nearby Events',
    description: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly.',
  ),
  OnboardingModel(
    image: 'assets/images/image3.png',
    title: 'Web Have Modern Events Calendar Feature',
    description: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly.',
  ),
  OnboardingModel(
    image: 'assets/images/image4.png',
    title: 'To Look Up More Events or Activities Nearby By Map',
    description: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly.',
  ),
];