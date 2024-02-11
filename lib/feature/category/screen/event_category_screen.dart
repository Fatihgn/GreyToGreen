import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grey_to_green/models/event.dart';
import 'package:grey_to_green/feature/category/widgets/category_card.dart';

@RoutePage()
class EventCategoryScreen extends StatefulWidget {
  const EventCategoryScreen({super.key});

  @override
  State<EventCategoryScreen> createState() => _EventCategoryScreenState();
}

class _EventCategoryScreenState extends State<EventCategoryScreen> {
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
