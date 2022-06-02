import 'package:flutter/material.dart';
import 'package:airplane_apps/shared/theme.dart';

class BookingDetails extends StatelessWidget {
  final Color valueColor;
  final String detailName;
  final String details;
  final EdgeInsets margin;

  const BookingDetails({ 
    Key? key, 
    required this.detailName,
    required this.details,
    this.margin = EdgeInsets.zero, 
    required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: margin,
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Expanded(
            child: Text(
              detailName,
              style: blackTextStyle,
            ),
          ),
          Text(
            details,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}