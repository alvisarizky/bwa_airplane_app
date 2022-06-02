import 'package:airplane_apps/cubit/auth_cubit.dart';
import 'package:airplane_apps/cubit/transaction_cubit.dart';
import 'package:airplane_apps/models/transaction_model.dart';
import 'package:airplane_apps/ui/pages/success_checkout_page.dart';
import 'package:airplane_apps/ui/widgets/booking_details.dart';
import 'package:airplane_apps/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:airplane_apps/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckOutPage extends StatelessWidget {
  final TransactionModel transaction;

  const CheckOutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_checkout.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGK',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Tangerang',
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TLC',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget itemsDetail() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 30,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: EdgeInsets.only(
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        transaction.destination.imgUrl,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      Text(
                        transaction.destination.city,
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.only(
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'),
                        ),
                      ),
                    ),
                    Text(
                      transaction.destination.rating.toString(),
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                'Booking Details',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
            BookingDetails(
              valueColor: kBlackColor,
              detailName: 'Traveler',
              details: '${transaction.amountOfTraveler} person',
              margin: EdgeInsets.only(top: 10),
            ),
            BookingDetails(
              valueColor: kBlackColor,
              detailName: 'Seat',
              details: transaction.selectedSeat,
              margin: EdgeInsets.only(top: 16),
            ),
            BookingDetails(
              valueColor: transaction.insurance ? kGreenColor : kRedColor,
              detailName: 'Insurance',
              details: transaction.insurance ? 'YES' : 'NO',
              margin: EdgeInsets.only(top: 16),
            ),
            BookingDetails(
              valueColor: transaction.refundable ? kGreenColor : kRedColor,
              detailName: 'Refundable',
              details: transaction.refundable ? 'YES' : 'NO',
              margin: EdgeInsets.only(top: 16),
            ),
            BookingDetails(
              valueColor: kBlackColor,
              detailName: 'VAT',
              details: '${(transaction.vat * 100).toStringAsFixed(0)}%',
              margin: EdgeInsets.only(top: 16),
            ),
            BookingDetails(
              valueColor: kBlackColor,
              detailName: 'Price',
              details: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(transaction.price),
              margin: EdgeInsets.only(top: 16),
            ),
            BookingDetails(
              valueColor: kPrimaryColor,
              detailName: 'Grand Total',
              details: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(transaction.grandTotal),
              margin: EdgeInsets.only(top: 16),
            ),
          ],
        ),
      );
    }

    Widget paymentDetail() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Payment Details',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        margin: EdgeInsets.only(
                          right: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/img_card.png'),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              margin: EdgeInsets.only(right: 6),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icon_logo.png'),
                                ),
                              ),
                            ),
                            Text(
                              'Pay',
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'IDR ',
                                decimalDigits: 0,
                              ).format(state.user.balance),
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Current Balance',
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: light,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          return SizedBox();
        },
      );
    }

    Widget payButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: 30,
              ),
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
            title: 'Pay Now',
            margin: EdgeInsets.only(top: 30),
            onPressed: () {
              context.read<TransactionCubit>().createTransaction(transaction);
            },
          );
        },
      );
    }

    Widget terms() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(
            top: 30,
            bottom: 30,
          ),
          child: Text(
            'Terms and Conditions',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            header(),
            itemsDetail(),
            paymentDetail(),
            payButton(),
            terms(),
          ],
        ));
  }
}
