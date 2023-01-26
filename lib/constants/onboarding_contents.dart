class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    this.title,
    this.image,
    this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "",
    image: "assets/images/onboarding1.png",
    desc: "Every day, the average person generates about 4.4 pounds of trash.",
  ),
  OnboardingContents(
    title: "",
    image: "assets/images/onboarding2.png",
    desc:
        "Identification of waste is an important step in managing waste effectively.",
  ),
  OnboardingContents(
    title: "",
    image: "assets/images/onboarding3.png",
    desc:
        "Increasing awareness of proper waste treatment and making recycling easy and fun.",
  ),
];
