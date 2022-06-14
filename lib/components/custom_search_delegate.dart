import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../models/currency_model.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<CurrencyModel> searchResultsList = dataList;
  @override
  String get searchFieldLabel => 'جست و جو';
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          // ignore: deprecated_member_use
          icon: const Icon(FontAwesomeIcons.multiply),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(FontAwesomeIcons.arrowRight),
        onPressed: () => close(context, null), //colse searchbar
      );

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CurrencyModel> suggestions = searchResultsList.where((searchResult) {
      final String userInput = query.toLowerCase();
      final String result = searchResult.name!.toLowerCase();

      return result.contains(userInput);
    }).toList();
    return Column(
      children: [
        SizedBox(
          height: Get.height / 14,
        ),
        SizedBox(
          height: Get.height / 1.24,
          child: ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                final suggestion = suggestions[index];
                return ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(suggestion.name!),
                          const SizedBox(
                            width: 10,
                          ),
                          suggestion.icon!,
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                      )
                    ],
                  ),
                  onTap: () {
                    query = suggestion.name!;
                    showResults(context);
                  },
                );
              }),
        ),
      ],
    );
  }
}
