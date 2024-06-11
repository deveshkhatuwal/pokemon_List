import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class itemCard extends StatelessWidget {
  String imageUrl;
  String name;
  String subtitle;

  Widget onitemtap;

  itemCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.subtitle,
    required this.onitemtap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        trailing: const Icon(Icons.arrow_right),
        leading: Hero(
            tag: imageUrl,
            child: Image.network(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            )),
        title: Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => onitemtap,
            ),
          );
        },
      ),
    );
  }
}