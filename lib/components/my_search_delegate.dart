import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/currency_model.dart';

class MySearchDelegate extends SearchDelegate {
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
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
        });
  }
}
