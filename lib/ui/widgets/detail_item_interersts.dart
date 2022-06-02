import 'package:flutter/material.dart';
import 'package:airplane_apps/shared/theme.dart';

class ItemInterests extends StatelessWidget {
  final String titleInterest;
  const ItemInterests({ 
    Key? key,
    required this.titleInterest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(
              right: 6,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Text(
            titleInterest,
            style: blackTextStyle,
          )
        ],
      ),
    );
  }
}