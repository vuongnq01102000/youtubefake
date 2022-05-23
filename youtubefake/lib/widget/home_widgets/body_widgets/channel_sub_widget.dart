import 'package:flutter/material.dart';

class ChannelSub extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final Function func;
  const ChannelSub({
    Key? key,
    required this.image,
    required this.title,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: image,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () => func,
      ),
    );
  }
}
