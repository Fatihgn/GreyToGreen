import 'package:flutter/material.dart';

class ContainerInProfile extends StatefulWidget {
  const ContainerInProfile({super.key});

  @override
  State<ContainerInProfile> createState() => _ConState();
}

class _ConState extends State<ContainerInProfile> {
  final List<Map<String, dynamic>> gridMap = [
    {
      'title': 'aaaaaaaa',
      'price': '2',
      'images':
          'https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    }
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Column(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return Center(
                      child: Container(
                        width: screenWidth,
                        height: screenHeight / 2.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.amber,
                          image: DecorationImage(
                            image: NetworkImage(
                              "${gridMap.elementAt(index)['images']}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Column(
                  children: [
                    Text(
                      'About:',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Text(
                      'wegjpljefpsdojpkewlfdskpvegwofdjpslewgokprokvdsvdpkmşlvsdpkmşlvdspolvdsvds',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    const Text(''),
                    Text(
                      'Date:',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Text(
                      '17.08.2024',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    const Text(''),
                    Text(
                      'Location:',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Text(
                      'Bolu,Turkiye',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    const Text(''),
                    Text(
                      'Max Participant:',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Text(
                      '10',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    const Text(''),
                    Text(
                      'Category:',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Text(
                      'Environment',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    const Text(''),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
