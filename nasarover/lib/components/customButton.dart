import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final ImageProvider image;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.color,
    required this.image,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
        child: GestureDetector(
            onTap: () {
              onPressed();
            },
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: color),
                borderRadius: BorderRadius.circular(20),
                color:Colors.white,),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Image(image: image, width: 25),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(text, style: TextStyle(color: color, fontSize: 18)),
                          const SizedBox(
                            width: 25,
                          )
                        ],
                      ))
                ],
              ),
            )));
  }
}