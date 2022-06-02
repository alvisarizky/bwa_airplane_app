import 'package:airplane_apps/cubit/seat_cubit.dart';
import 'package:airplane_apps/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItems extends StatelessWidget {
  final String id;
  final bool isAvailable;

  const SeatItems({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundStatus() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
    }

    borderStatus() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kPrimaryColor;
        }
      }
    }

    textStatus() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundStatus(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: borderStatus(),
          ),
        ),
        child: textStatus(),
      ),
    );
  }
}
