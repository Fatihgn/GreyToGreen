import 'package:flutter/material.dart';
import 'package:grey_to_green/custom_widgets/category_view/category_card.dart';
import 'package:grey_to_green/models/event.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
      itemCount: categories.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => CategoryCard(categories[index]),
    );
  }
}
