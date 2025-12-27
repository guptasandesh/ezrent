import 'package:flutter/material.dart';
import '../../viewmodel/search_viewmodel.dart';
import '../../model/property_model.dart';
import '../widgets/property_card.dart';
import 'property_details_page.dart';

class SearchPage extends StatelessWidget {
  final SearchViewModel viewModel = SearchViewModel();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Properties')),
      body: ListView.builder(
        itemCount: viewModel.properties.length,
        itemBuilder: (context, index) {
          final property = viewModel.properties[index];
          return PropertyCard(
            property: property,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PropertyDetailsPage(property: property),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
