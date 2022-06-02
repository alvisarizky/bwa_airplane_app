import 'package:flutter/material.dart';
import 'package:airplane_apps/shared/theme.dart';

class SeatStatus extends StatelessWidget {
  final String imgUrl;
  final String status;
  const SeatStatus({ 
    Key? key, 
    required this.imgUrl,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
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
                image: AssetImage(imgUrl),
              ),
            ),
          ),
          Text(
            status,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}