import 'package:flutter/material.dart';

class CardReviewVideo extends StatelessWidget {
  const CardReviewVideo({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.avtPath,
    required this.imgPath,
  }) : super(key: key);
  final String title, subtitle, imgPath, avtPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            blurStyle: BlurStyle.outer,
            color: Colors.black26,
            // offset: Offset(0, -1),
          ),
        ],
      ),
      width: 300,
      height: 300,
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.yellow,
            ),
            child: Image(
              image: NetworkImage(imgPath),
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage(avtPath),
            ),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              subtitle,
              textAlign: TextAlign.start,
              style: const TextStyle(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
