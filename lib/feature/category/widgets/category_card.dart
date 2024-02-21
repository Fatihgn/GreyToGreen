import 'package:flutter/material.dart';
import 'package:grey_to_green/feature/events/screen/event_list_screen.dart';
import 'package:grey_to_green/main.dart';
import 'package:grey_to_green/models/event.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard(this.categoryItem, {super.key});

  final String categoryItem;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            clipBehavior: Clip.hardEdge,
            useSafeArea: true,
            context: context,
            builder: (context) =>
                EventListScreen(categoryName: widget.categoryItem),
          );
        });
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            color: Color.fromRGBO(183, 183, 183, 1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              categoryIcons[widget.categoryItem],
              size: 50,
              color: Colors.green,
            ),
            Text(
              widget.categoryItem,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
