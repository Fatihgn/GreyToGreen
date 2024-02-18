import 'package:flutter/material.dart';
import 'package:grey_to_green/feature/profile/widgets/container_in_profile.dart';

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  final List<Map<String, dynamic>> gridMap = [
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 170,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const ContainerInProfile(),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.amber,
            ),
            child: Column(
              children: [
                Image.network("${gridMap.elementAt(index)['images']}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
