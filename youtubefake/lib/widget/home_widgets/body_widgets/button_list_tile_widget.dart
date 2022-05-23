import 'package:flutter/material.dart';

class ButtonListTileHomePage extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function func;
  const ButtonListTileHomePage({
    Key? key,
    required this.icon,
    required this.title,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () => func,
        ),
      ],
    );
  }
}
