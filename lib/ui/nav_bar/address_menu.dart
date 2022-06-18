import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/constants.dart';

class AddressMenu extends StatelessWidget {
  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<AddressMenuItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;
  const AddressMenu({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor =
        backgroundColor ?? Theme.of(context).navigationBarTheme.backgroundColor;

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: items.map((item) {
        var index = items.indexOf(item);
        return GestureDetector(
          onTap: () => onItemSelected(index),
          child: ItemWidget(
            item: item,
            iconSize: iconSize,
            isSelected: index == selectedIndex,
            backgroundColor: bgColor ?? Colors.white,
            itemCornerRadius: itemCornerRadius,
            animationDuration: animationDuration,
            curve: curve,
          ),
        );
      }).toList(),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final AddressMenuItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: Get.width * 0.4,
        height: Get.height * 0.07,
        duration: animationDuration,
        curve: curve,
        child: Container(
          width: Get.width * 0.4,
          height: Get.height * 0.07,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: isSelected
                  ? (Get.isDarkMode
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Colors.grey.withOpacity(.4))
                  : null),
          child: Center(
            child: DefaultTextStyle.merge(
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                    // color: Theme.of(context).dividerTheme.color,
                  ),
              maxLines: 1,
              child: item.title,
            ),
          ),
        ),
      ),
    );
  }
}

class AddressMenuItem {
  final Widget title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;

  AddressMenuItem({
    required this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });
}
