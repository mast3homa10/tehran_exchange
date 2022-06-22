import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/backend/api/currency_list_api.dart';
import 'package:tehran_exchange/frontend/pages/exchange/exchange_page_controller.dart';

import '../../backend/models/currency_model.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({this.item = 0});
  int item;
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
    return FutureBuilder<List<CurrencyModel>?>(
        future: CurrencyListApi().getList(),
        builder: (context, snapShot) {
          log('${snapShot.data}');
          List<CurrencyModel> suggestions = snapShot.data ??
              searchResultsList.where((searchResult) {
                final String userInput = query.toLowerCase();
                final String result = searchResult.engName!.toLowerCase();

                return result.contains(userInput);
              }).toList();
          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return Column(
                children: [
                  SizedBox(
                    height: Get.height / 30,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: suggestions.length,
                        itemBuilder: (context, index) {
                          final suggestion = suggestions[index];
                          return ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        suggestion.engName ?? "test",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                    ),
                                    SvgPicture.network(
                                      suggestion.imageUrl!,
                                      semanticsLabel: 'A shark?!',
                                      placeholderBuilder:
                                          (BuildContext context) => Container(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child:
                                                  const CircularProgressIndicator()),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 2,
                                )
                              ],
                            ),
                            onTap: () {
                              if (item == 1) {
                                final controller =
                                    Get.put(ExchangePageController());
                                query = suggestion.engName ?? "test";
                                controller.updateCurrencyChoice(
                                    model: suggestion, item: item);
                                log('test');
                                close(context, null);
                              } else {
                                final controller =
                                    Get.put(ExchangePageController());
                                query = suggestion.engName ?? "test";
                                controller.updateCurrencyChoice(
                                    model: suggestion, item: item);
                                close(context, null);
                              }

                              // showResults(context);
                            },
                          );
                        }),
                  ),
                ],
              );
          }
        });
  }
}
