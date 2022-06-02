import 'package:airplane_apps/models/destination_model.dart';
import 'package:airplane_apps/shared/theme.dart';
import 'package:airplane_apps/ui/pages/choose_seat_page.dart';
import 'package:airplane_apps/ui/widgets/custom_button.dart';
import 'package:airplane_apps/ui/widgets/detail_item_interersts.dart';
import 'package:airplane_apps/ui/widgets/detail_item_photos.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;
  
  const DetailPage(this.destination, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage(){
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              destination.imgUrl,
            ),
          ),
        ),
      );
    }

    Widget customShadow(){
      return Container(
        width: double.infinity,
        height: 214,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30,),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            Container(
              width: 108,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_emblem.png',),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 256,),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          destination.city,
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_star.png'),
                          ),
                        ),
                      ),
                      Text(
                        destination.rating.toString(),
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30,),
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
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    destination.about,
                    style: blackTextStyle.copyWith(
                      height: 2,
                      fontSize: 14,
                      fontWeight: reguler,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Photos',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 6,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ItemPhotos(imgUrl: 'assets/img_photo1.png'),
                        ItemPhotos(imgUrl: 'assets/img_photo2.png'),
                        ItemPhotos(imgUrl: 'assets/img_photo3.png'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Interests',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 6,),
                  Row(
                    children: [
                      ItemInterests(titleInterest: 'Kids Park',),
                      ItemInterests(titleInterest: 'Honor Bridge',),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      ItemInterests(titleInterest: 'City Museum',),
                      ItemInterests(titleInterest: 'Central Mall',),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 31,),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'IDR ',
                            decimalDigits: 0,
                          ).format(destination.price),
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'per orang',
                          style: greyTextStyle.copyWith(
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    title: 'Book Now', 
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => ChooseSeatPage(destination),
                        ),
                      );
                    },
                    width: 170,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}