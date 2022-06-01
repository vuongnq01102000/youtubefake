import 'package:flutter/material.dart';

class ButtonActiveBelowVideo extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function func;
  const ButtonActiveBelowVideo({
    Key? key,
    required this.title,
    required this.icon,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => func.call(),
          splashRadius: 10,
          icon: Icon(icon),
          color: Colors.black,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
