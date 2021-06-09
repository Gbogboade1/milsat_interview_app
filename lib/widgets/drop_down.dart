// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

class CustomDropDown extends StatefulWidget {
  String? selectedItem;
  final List<String> item;

  CustomDropDown({
    Key? key,
    required this.selectedItem,
    this.item: const [
      "MALE",
      "FEMALE",
    ],
  }) : super(key: key);
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    Widget button() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "${widget.selectedItem}",
                style: TextStyle(
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );

    return MenuButton(
      child: button(),
      items: widget.item,
      topDivider: true,
      popupHeight: 200,
      scrollPhysics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (value) => Container(
          width: 83,
          height: 40,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Checkbox(value: value == widget.selectedItem, onChanged: (v) {}),
              Text("$value"),
            ],
          )),
      toggledChild: Container(
        child: button(),
      ),
      divider: Container(
        height: 1,
        color: Colors.grey,
      ),
      onItemSelected: (String value) {
        setState(() {
          widget.selectedItem = value;
        });
        // Action when new item is selected
      },
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      onMenuButtonToggle: (isToggle) {},
    );
  }
}
