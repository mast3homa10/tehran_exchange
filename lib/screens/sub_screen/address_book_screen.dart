import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tehran_exchange/ui/nav_bar/address_menu.dart';

import '../../components/custom_big_button.dart';

class AddressBookScreen extends StatefulWidget {
  const AddressBookScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  int submentIndex = 0;
  final subScreen = [
    Container(
      child: Text('test1'),
    ),
    Container(
      child: Text('test2'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          height: Get.height * 0.1,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(
                width: 1.0,
                color: Theme.of(context).dividerTheme.color ?? Colors.white),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
              child: Column(
            children: [
              Expanded(
                child: AddressMenu(
                  onItemSelected: (index) => setState(() {
                    submentIndex = index;
                  }),
                  items: [
                    AddressMenuItem(
                      title: Text('موردعلاقه ها'),
                    ),
                    AddressMenuItem(
                      title: Text('آدرس های اخیر'),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
        SizedBox(
          height: Get.height / 2.85,
          child: Column(
            children: [
              subScreen[submentIndex],
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomBigButton(
            label: 'اضافه کردن کیف پول',
            onPressed: () {
              Get.snackbar('توجه!', "در حال توسعه ...");
            },
          ),
        ),
      ],
    );
  }
}

class AddressMenuButton extends StatelessWidget {
  AddressMenuButton(
      {Key? key,
      this.label = "کلیک",
      this.isActive = false,
      required this.onItemSelected,
      required this.selectedIndex,
      required this.items})
      : super(key: key);
  final bool isActive;
  final String label;
  final List<NewWidget> items;
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((item) {
            var index = items.indexOf(item);
            return GestureDetector(
              onTap: () => onItemSelected(index),
              child: NewWidget(
                label: item.label,
                isSelected: index == selectedIndex,
              ),
            );
          }).toList(),
        ));
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      selected: isSelected,
      container: true,
      child: Container(
          width: Get.width * 0.4,
          height: Get.height * 0.07,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: isSelected ? Theme.of(context).cardColor : null),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).dividerTheme.color),
            ),
          )),
    );
  }
}
