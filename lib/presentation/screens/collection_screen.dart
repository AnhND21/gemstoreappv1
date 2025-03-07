import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/core/widgets/button.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  final List<String> images = [
    'https://www.shutterstock.com/image-photo/young-fashion-model-stylish-beige-600nw-2382157791.jpg',
    'https://polamarketing.com/wp-content/uploads/2024/06/On_Model-13@2x.jpg',
    'https://www.shutterstock.com/image-photo/young-black-woman-cream-suit-600nw-2491218847.jpg',
    'https://images.pexels.com/videos/4820383/best-friends-bff-friendship-girlfriends-4820383.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final extraData = state.extra as Map<String, dynamic>?;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.network(
            extraData?['image'] ?? 'https://via.placeholder.com/500',
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          // Custom AppBar
          GAppBar(
            bgColor: Colors.transparent,
          ),
          // Text label for "Autumn Collection 2021"
          Positioned(
            top: kToolbarHeight + 8,
            right: 16,
            child: Text(
              'Autumn\nCollection\n2021',
              style: TextStyle(
                color: Color(GColors.whiteColor),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          // Container for the staggered grid of images
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(GColors.whiteColor),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 32),
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    StaggeredGrid.count(
                      crossAxisCount: 2, // Total columns in the grid
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: [
                        // Map images to the staggered tiles
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              images[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1.5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              images[1],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1.4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              images[2],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1.4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              images[3],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 0.3,
                          child: Button(
                            title: 'View All',
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
