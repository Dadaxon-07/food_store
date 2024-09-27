class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<UnboardingContent> content = [
  UnboardingContent(
      image: "images/screen1.png",
      title: "Select from Out \n       Best Menu",
      description: "Pick your food from our menu \n    More than 35 times"),
  UnboardingContent(
      image: "images/screen2.png",
      title: "Easy and Online Payment",
      description:
          "You can pay cash on delivery and\n Card payment is available"),
  UnboardingContent(image: "images/screen3.png", title: "Quick at Your Doors", description: "Deliver your food at your\n    Doorstep")
];
