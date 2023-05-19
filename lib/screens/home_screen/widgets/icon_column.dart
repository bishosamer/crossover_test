import 'package:flutter/material.dart';

class IconColumn extends StatefulWidget {
  const IconColumn(
      {super.key,
      required this.icon,
      required this.count,
      required this.onPressed});
  final IconData icon;
  final String count;
  final Function onPressed;
  @override
  State<IconColumn> createState() => _IconColumnState();
}

class _IconColumnState extends State<IconColumn> {
  static const double padding = 5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: padding),
      child: MaterialButton(
        onPressed: () {
          widget.onPressed();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              widget.icon,
              color: Theme.of(context).iconTheme.color,
            ),
            Text(widget.count, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
