import 'package:flutter/material.dart';
import 'package:grey_to_green/feature/category/widgets/category_card.dart';
import 'package:grey_to_green/models/event.dart';

class EventCategoriesScreen extends StatefulWidget {
  const EventCategoriesScreen({super.key});

  @override
  State<EventCategoriesScreen> createState() => _EventCategoriesScreenState();
}

class _EventCategoriesScreenState extends State<EventCategoriesScreen> {
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
