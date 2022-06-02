import 'package:airplane_apps/cubit/seat_cubit.dart';
import 'package:airplane_apps/models/destination_model.dart';
import 'package:airplane_apps/models/transaction_model.dart';
import 'package:airplane_apps/ui/pages/checkout_page.dart';
import 'package:airplane_apps/ui/widgets/custom_button.dart';
import 'package:airplane_apps/ui/widgets/seat_items.dart';
import 'package:airplane_apps/ui/widgets/seat_numbers.dart';
import 'package:airplane_apps/ui/widgets/seat_status.dart';
import 'package:flutter/material.dart';
import 'package:airplane_apps/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;

  const ChooseSeatPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Row(
          children: [
            SeatStatus(
              imgUrl: 'assets/icon_available.png',
              status: 'Available',
            ),
            SeatStatus(
              imgUrl: 'assets/icon_selected.png',
              status: 'Selected',
            ),
            SeatStatus(
              imgUrl: 'assets/icon_unavailable.png',
              status: 'Unavailable',
            ),
          ],
        ),
      );
    }

    Widget selectedSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: kWhiteColor,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatNumbers(
                      details: 'A',
                    ),
                    SeatNumbers(
                      details: 'B',
                    ),
                    SeatNumbers(
                      details: '',
                    ),
                    SeatNumbers(
                      details: 'C',
                    ),
                    SeatNumbers(
                      details: 'D',
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItems(
                        id: 'A1',
                      ),
                      SeatItems(
                        id: 'B1',
                      ),
                      SeatNumbers(
                        details: '1',
                      ),
                      SeatItems(
                        id: 'C1',
                      ),
                      SeatItems(
                        id: 'D1',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItems(
                        id: 'A2',
                      ),
                      SeatItems(
                        id: 'B2',
                      ),
                      SeatNumbers(
                        details: '2',
                      ),
                      SeatItems(
                        id: 'C2',
                      ),
                      SeatItems(
                        id: 'D2',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItems(
                        id: 'A3',
                      ),
                      SeatItems(
                        id: 'B3',
                      ),
                      SeatNumbers(
                        details: '3',
                      ),
                      SeatItems(
                        id: 'C3',
                      ),
                      SeatItems(
                        id: 'D3',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItems(
                        id: 'A4',
                      ),
                      SeatItems(
                        id: 'B4',
                      ),
                      SeatNumbers(
                        details: '4',
                      ),
                      SeatItems(
                        id: 'C4',
                      ),
                      SeatItems(
                        id: 'D4',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItems(
                        id: 'A5',
                      ),
                      SeatItems(
                        id: 'B5',
                      ),
                      SeatNumbers(
                        details: '5',
                      ),
                      SeatItems(
                        id: 'C5',
                      ),
                      SeatItems(
                        id: 'D5',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Your seat',
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              state.join(', '),
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'IDR ',
                                decimalDigits: 0,
                              ).format(state.length * destination.price),
                              style: purpleTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget buttonCheckOut() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            title: 'Continue to Checkout',
            margin: EdgeInsets.only(top: 30, bottom: 30),
            onPressed: () {
              int price = destination.price * state.length;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckOutPage(
                    TransactionModel(
                      destination: destination,
                      amountOfTraveler: state.length,
                      selectedSeat: state.join(', '),
                      insurance: true,
                      refundable: false,
                      vat: 0.35,
                      price: price,
                      grandTotal: price + (price * 0.35).toInt(),
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          header(),
          seatStatus(),
          selectedSeat(),
          buttonCheckOut(),
        ],
      ),
    );
  }
}
