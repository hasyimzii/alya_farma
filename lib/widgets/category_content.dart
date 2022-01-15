import 'package:flutter/material.dart';
import '../common/style.dart';

class CategoryContent extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onTap;

  const CategoryContent({
    Key? key,
    required this.image,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 5, 0),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 40,
              height: 40,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: AspectRatio(
                aspectRatio: 1.0 / 1.0,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: onTap,
          ),
          Text(
            name,
            maxLines: 2,
            style: lightText(10),
          ),
        ],
      ),
    );
  }
}
