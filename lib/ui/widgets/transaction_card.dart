import 'package:airplane_apps/models/transaction_model.dart';
import 'package:airplane_apps/shared/theme.dart';
import 'package:airplane_apps/ui/widgets/booking_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
