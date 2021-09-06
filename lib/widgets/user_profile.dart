import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final double size;
  final String image;
  const UserProfile({
    Key? key,
    this.size = 48.0,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: Image.network(
        image,
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
