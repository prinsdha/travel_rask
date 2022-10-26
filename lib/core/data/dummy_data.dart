import 'package:travelapp/core/const/app_icon.dart';

class BeachResortModel {
  final String image, name, description, price;
  final String? location;
  bool isFavourite;
  final double rate;

  BeachResortModel(
      {required this.image,
      required this.price,
      this.location,
      required this.name,
      this.description =
          "One of the most happening beaches in Goa, Baga Beach is where you will find water sports, fine dining restaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.",
      required this.rate,
      this.isFavourite = false});
}

class BeachCategory {
  final String image, name;

  BeachCategory({required this.image, required this.name});
}

List<BeachResortModel> beachResortList = [
  BeachResortModel(
      price: "\u{20B9}20,000",
      location: "Bali, Indonesia",
      image: AppAssets.kutaBeach,
      name: "Kuta Resort",
      rate: 4.2),
  BeachResortModel(
      price: "\u{20B9}15,000",
      image: AppAssets.bagaBeach,
      location: "Goa, India",
      name: "Baga Beach",
      rate: 4.8)
];

List<BeachResortModel> beachList = [
  BeachResortModel(
      image: AppAssets.kutaBeach,
      name: "Kuta Beach",
      description:
          "A resort is a place used for vacation, relaxation or as a day...",
      price: "\u{20B9}20000",
      rate: 4.8),
  BeachResortModel(
      description:
          "A resort is a place used for vacation, relaxation or as a day...",
      image: AppAssets.bagaBeach,
      name: "Baga Beach",
      rate: 5,
      price: '\u{20B9}15000'),
];

List<BeachCategory> beachCategoryList = [
  BeachCategory(image: AppAssets.beach, name: "Beach"),
  BeachCategory(image: AppAssets.mountain, name: "Mountain"),
];
