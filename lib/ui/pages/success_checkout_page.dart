import 'package:airplane_apps/cubit/page_cubit.dart';
import 'package:airplane_apps/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:airplane_apps/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckOutPage extends StatelessWidget {
  const SuccessCheckOutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_success.png')
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Text(
                    'Well Booked 😍',
                    style: blackTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Are you ready to explore the new\nworld of experiences?',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            CustomButton(
              title: 'My Bookings',
              width: 220,
              margin: EdgeInsets.only(top: 50,), 
              onPressed: (){
                context.read<PageCubit>().setPage(1);
                Navigator.pushNamedAndRemoveUntil(
                  context, '/mainPage', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}