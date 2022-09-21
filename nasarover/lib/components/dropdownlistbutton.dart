import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropDownListButton extends StatelessWidget {


  final String value;
  //final List<String> labels;
  final ValueChanged<String> onChanged;
  final List<String> items;
  String? selectedValue;

  DropDownListButton({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      isExpanded: true,
      hint: Row(
        children: const [
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              'Select Cam',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  //overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (value) {

          selectedValue = value as String;

      },
      buttonHeight: 50,
      buttonWidth: 160,
      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
      buttonDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white,
        ),
        color: Colors.grey[800],
      ),
      buttonElevation: 2,
      itemHeight: 40,
      itemPadding: const EdgeInsets.only(left: 14, right: 14),
      dropdownMaxHeight: 200,
      dropdownWidth: 160,
      dropdownPadding: null,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.grey[800],
      ),
      dropdownElevation: 8,
      scrollbarRadius: const Radius.circular(20),
      scrollbarThickness: 6,
      scrollbarAlwaysShow: true,
      offset: const Offset(-20, 0),
    );
  }
}
