import 'package:blocexample/services/model/first_model.dart';
import 'package:flutter/material.dart';
import 'package:blocexample/services/network/api.dart'; // Import your ApiService

class PageOne extends StatelessWidget {
  final ApiService apiService = ApiService(); // Create an instance of ApiService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries"),
      ),
      body: FutureBuilder<FirstModel>(
        future: apiService.fetchData(), // Use the ApiService to fetch data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            FirstModel firstModel = snapshot.data!;
            List<Country> countries = firstModel.data.countries;

            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                Country x = countries[index];
                return ListTile(
                  title: Text(x.name),
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
