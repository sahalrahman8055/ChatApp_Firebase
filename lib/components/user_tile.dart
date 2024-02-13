import 'package:chatapp_firebase/constant/size.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 25),
        padding: EdgeInsetsDirectional.all(20),
        child: Row(
          children: [Icon(Icons.person), kWidth20, Text(text)],
        ),
      ),
    );
  }
}
