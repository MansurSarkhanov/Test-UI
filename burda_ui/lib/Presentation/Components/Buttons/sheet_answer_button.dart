import 'package:burda_ui/Core/Constants/colors.dart';
import 'package:flutter/material.dart';

class SheetAnswerButton extends StatelessWidget {
  const SheetAnswerButton({
    super.key,
    required this.text,
    required this.onPress,
    required this.isYes,
  });
  final String text;
  final VoidCallback onPress;
  final bool isYes;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: isYes ? AppColors.orangeColor : Colors.white,
            border: isYes ? null : Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: isYes ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    ));
  }
}
