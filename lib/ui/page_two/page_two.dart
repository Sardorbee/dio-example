import 'package:blocexample/services/model/second_model.dart';
import 'package:blocexample/services/network/api_two.dart';
import 'package:blocexample/ui/page_two/details.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  final ApiServiceTwo apiService =
      ApiServiceTwo(); // Create an instance of ApiService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries"),
      ),
      body: FutureBuilder<SecondModel>(
        future: apiService.fetchData(), // Use the ApiService to fetch data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            SecondModel firstModel = snapshot.data!;
            List<Datum> countries = firstModel.data;

            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                Datum x = countries[index];
                return ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(id: x.id),
                      )),
                  // leading: Image.network(x.logo),
                  title: Text(x.carModel),
                );
              },
            );
          } else {
            return const Center(child: Text('No results found'));
          }
        },
      ),
    );
  }
}
