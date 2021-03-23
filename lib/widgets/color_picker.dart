import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {

  final List<Color> colors;
  final Color selected;

  ColorPicker({this.colors, this.selected});

  @override
  _ColorPickerState createState() => _ColorPickerState(selected);
}

class _ColorPickerState extends State<ColorPicker> {

  Color selected;
  _ColorPickerState(this.selected);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (Color color in widget.colors)
          GestureDetector(
            onTap: () {
              setState(() {
                selected = color;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: .2,
                ),
              ),
              padding: EdgeInsets.all(2),
              width: 35,
              height: 35,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                padding: EdgeInsets.all(2),
                width: 32,
                height: 32,
                child: Center(
                  child: selected == color
                      ? Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  )
                      : null,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
