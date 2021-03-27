import 'package:faq_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {

  final int selected;
  final Function(int selected) onTap;

  ColorPicker({this.selected, this.onTap});

  @override
  _ColorPickerState createState() => _ColorPickerState(selected);
}

class _ColorPickerState extends State<ColorPicker> {

  int selected;
  _ColorPickerState(this.selected);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < COLORS.length; i++)
          GestureDetector(
            onTap: () {
              widget.onTap(i);
              setState(() {
                selected = i;
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
                  color: COLORS[i],
                ),
                padding: EdgeInsets.all(2),
                width: 32,
                height: 32,
                child: Center(
                  child: selected == i
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
