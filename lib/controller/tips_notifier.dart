import 'dart:collection';
import 'dart:math';
import 'package:deep_waste/models/Tips.dart';
import 'package:flutter/material.dart';

class TipsNotifier extends ChangeNotifier {
  List<Tips> _tips = [
    Tips("1001", "plastic", [
      "Reduce: Try to use less plastic by purchasing items with less packaging, bringing your own bags and containers to the store, and avoiding single-use plastics such as straws and water bottles.",
      "Reuse: Use plastic items multiple times before disposing of them, such as reusable shopping bags, containers for leftovers and refillable water bottles.",
      "Recycle: Sort plastic items by their recycling symbol and put them in the appropriate recycling bin.",
      "Educate: Share the importance of managing plastic waste with friends and family, and encourage others to reduce, reuse, and recycle.",
      "Support: Support businesses and organizations that are working to reduce plastic waste and promote sustainable practices.",
      "Proper Disposal: Properly dispose of plastic waste, do not litter it.",
      "Support Alternatives: consider alternatives to plastic, like reusable straws, biodegradable containers, bamboo toothbrushes, etc."
    ]),
    Tips("1002", "paper", [
      "Reduce: Try to use less paper by switching to electronic documents, using both sides of a sheet of paper, and avoiding unnecessary printing.",
      "Reuse: Use paper items multiple times before disposing of them, such as using scrap paper for notes or using old newspapers as packing material.",
      "Recycle: Sort paper items by type and put them in the appropriate recycling bin.",
      "Educate: Share the importance of managing paper waste with friends and family, and encourage others to reduce, reuse, and recycle.",
      "Support: Support businesses and organizations that are working to reduce paper waste and promote sustainable practices.",
      "Proper Disposal: Properly dispose of paper waste, do not litter it.",
      "Support Alternatives: consider alternatives to paper, like electronic documents, cloth napkins or handkerchiefs, electronic books, etc.",
      "Choose paper product with high post-consumer recycled content.",
      "Use paperless billing options, unsubscribe from unwanted paper mail."
    ]),
    Tips("1003", "biological", [
      "Reduce: Try to generate less waste by purchasing less processed foods, composting your food scraps, and avoiding single-use disposable items.",
      "Compost: Compost your food scraps and yard waste instead of sending them to the landfill. This will create nutrient-rich soil for your garden.",
      "Recycle: Some food waste can be recycled into animal feed or biofuel.",
      "Educate: Share the importance of managing biological waste with friends and family, and encourage others to reduce, compost, and recycle.",
      "Support: Support businesses and organizations that are working to reduce biological waste and promote sustainable practices.",
      "Proper Disposal: Properly dispose of biological waste, do not litter it.",
      "Support Alternatives: consider alternatives to disposables, like reusable containers and utensils, cloth napkins, compostable products.",
      "Start a community composting program.",
      "Use vermicomposting for small scale composting, it's easy and efficient."
    ]),
    Tips("1004", "glass", [
      "Reduce: Try to use less glass by purchasing items with less packaging, using reusable containers, and avoiding single-use glass items.",
      "Reuse: Use glass items multiple times before disposing of them, such as using glass jars for storage or refilling glass bottles.",
      "Recycle: Sort glass items by color and put them in the appropriate recycling bin.",
      "Educate: Share the importance of managing glass waste with friends and family, and encourage others to reduce, reuse, and recycle.",
      "Support: Support businesses and organizations that are working to reduce glass waste and promote sustainable practices.",
      "Proper Disposal: Properly dispose of glass waste, do not litter it.",
      "Support Alternatives: consider alternatives to glass, like silicone or stainless steel containers, or paper-based packaging.",
      "Use deposit return schemes on glass bottles, it encourages recycling.",
      "Consider using glass bottles instead of plastic bottles when possible, it's more environmentally friendly."
    ]),
    Tips("1005", "metal", [
      "Reduce: Try to use less metal by purchasing items with less packaging, using reusable containers, and avoiding single-use metal items.",
      "Reuse: Use metal items multiple times before disposing of them, such as using metal containers for storage or refilling metal cans.",
      "Recycle: Sort metal items by type and put them in the appropriate recycling bin.",
      "Educate: Share the importance of managing metal waste with friends and family, and encourage others to reduce, reuse, and recycle.",
      "Support: Support businesses and organizations that are working to reduce metal waste and promote sustainable practices.",
      "Proper Disposal: Properly dispose of metal waste, do not litter it.",
      "Support Alternatives: consider alternatives to metal, like bamboo or wooden utensils, or paper-based packaging.",
      "Use scrap metal recycling centers, it reduces the need for mining new raw materials.",
      "Avoid products made from mixed materials (like plastic-coated metal cans) as they are hard to recycle and are often just thrown away."
    ]),
    Tips("1006", "cardboard", [
      "Reduce: Try to use less cardboard by purchasing items with less packaging, using reusable containers, and avoiding unnecessary shipping boxes.",
      "Reuse: Use cardboard items multiple times before disposing of them, such as using cardboard boxes for storage or packing materials.",
      "Recycle: Sort cardboard items by type and put them in the appropriate recycling bin.",
      "Educate: Share the importance of managing cardboard waste with friends and family, and encourage others to reduce, reuse, and recycle.",
      "Support: Support businesses and organizations that are working to reduce cardboard waste and promote sustainable practices.",
      "Proper Disposal: Properly dispose of cardboard waste, do not litter it.",
      "Support Alternatives: consider alternatives to cardboard, like paper-based packaging or biodegradable materials.",
      "Use corrugated cardboard recycling centers, it reduces the need for cutting down trees to make new cardboard.",
      "Choose products with minimal packaging, or package-free products, and encourage others to do the same."
    ]),
    Tips("1007", "trash", [
      "Reduce: Try to generate less waste by purchasing less products, using reusable containers, and avoiding single-use disposable items.",
      "Reuse: Use items multiple times before disposing of them, such as using reusable containers for storage or refilling bottles.",
      "Recycle: Sort items by type and put them in the appropriate recycling bin.",
      "Educate: Share the importance of managing trash with friends and family, and encourage others to reduce, reuse, and recycle.",
      "Support: Support businesses and organizations that are working to reduce waste and promote sustainable practices.",
      "Proper Disposal: Properly dispose of trash, do not litter it.",
      "Support Alternatives: consider alternatives to disposables, like reusable containers and utensils, cloth napkins, biodegradable products.",
      "Start a community recycling program.",
      "Incorporate a \"waste hierarchy\" in your routine, which prioritizes reducing, reusing and recycling over sending waste to landfills or incineration.",
      "Consider using a waste audit to identify the most common types of waste in your household or office and develop a plan to reduce or recycle those items."
    ])
  ];

  UnmodifiableListView<Tips> get rewards => UnmodifiableListView(_tips);

  Tips getRandomTip() {
    final _random = new Random();
    return _tips[_random.nextInt(_tips.length)];
  }
}
