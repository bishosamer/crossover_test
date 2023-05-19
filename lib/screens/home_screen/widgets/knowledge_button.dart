import 'package:flutter/material.dart';

class KnowledgeButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;

  final bool? isSelected;
  const KnowledgeButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected == null || isSelected!
        ? AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            height: 50,
            width: isSelected == null
                ? ((MediaQuery.of(context).size.width * 0.7) / 5) - 10
                : MediaQuery.of(context).size.width * 0.7,
            child: MaterialButton(
              color: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                onPressed();
              },
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        : Container();
  }
}
