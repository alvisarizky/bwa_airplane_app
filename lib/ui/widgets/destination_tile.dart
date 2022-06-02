import 'package:airplane_apps/models/destination_model.dart';
import 'package:airplane_apps/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:airplane_apps/shared/theme.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel destination;

  const DestinationTile(this.destination, { 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => DetailPage(destination),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16,),
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 10,
          right: 16,
        ),
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    destination.imgUrl,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    destination.city,
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
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
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.only(
                    right: 2,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon_star.png'),
                    ),
                  ),
                ),
                Text(
                  destination.rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}