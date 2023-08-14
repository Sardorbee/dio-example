import 'package:blocexample/services/model/third_model.dart';
import 'package:blocexample/services/network/api_two%20copy.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key, required this.id});
  int id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Car Details",
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: ApiServicethree().fetchData(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                ThirdModel firstModel = snapshot.data!;

                return Expanded(
                  child: ListView(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            CarouselSlider(
                              items: [
                                ...List.generate(
                                  firstModel.carPics.length,
                                  (index) => Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        imageUrl: firstModel.carPics[index],
                                        height: 213,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                              options: CarouselOptions(
                                  aspectRatio: 1, enableInfiniteScroll: false),
                            ),
                            Text(firstModel.carModel),
                            Text(firstModel.description),
                            Text(firstModel.averagePrice.toString()),
                            Text(firstModel.establishedYear.toString()),
                  
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('No results found'));
              }
            },
          ),
        ],
      ),
    );
  }
}
