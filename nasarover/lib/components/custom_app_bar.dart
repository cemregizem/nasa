
import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mars/components/dropdownlistbutton.dart';




class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final String title;
  final AppBar appBar;
  final List<Widget> widgets;
  
  

  /// you can add more fields that meet your needs

  const BaseAppBar({Key? key,  required this.title, required this.appBar, required this.widgets })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      backgroundColor: Colors.black,
      actions:widgets,
      /*[  
        const SizedBox(height: 30),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline( 
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: const [
             
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  'Camera',
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
                  .map((item) =>
                  DropdownMenuItem<String>(
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
            /*setState(() {
              selectedValue = value as String;
            }); */
          },
        
          buttonHeight: 50,
          buttonWidth: 160,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
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
        ),
      ),
            
  )],*/
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);



}