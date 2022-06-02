import 'package:airplane_apps/shared/theme.dart';
import 'package:flutter/material.dart';

class SeatNumbers extends StatelessWidget {
  final String details;

  const SeatNumbers({ 
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      child: Center(
        child: Text(
          details,
          style: greyTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}