import 'package:flutter/material.dart';
import 'package:news_app/screens/widgets/text_widget.dart';

class RadioButtonWidget extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onPressed;
  const RadioButtonWidget(
      {super.key,
      required this.isSelected,
      required this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: Row(
        children: [
          Icon(isSelected
              ? Icons.radio_button_checked_rounded
              : Icons.radio_button_off_rounded),
          TextWidget(text: title)
        ],
      ),
    );
  }
}
