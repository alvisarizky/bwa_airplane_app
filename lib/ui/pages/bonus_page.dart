import 'package:airplane_apps/cubit/auth_cubit.dart';
import 'package:airplane_apps/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:airplane_apps/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard(){
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              width: 300,
              height: 211,
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_card.png'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: medium,
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
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Balance',
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        'IDR 280.000.000',
                        style: whiteTextStyle.copyWith(
                          fontSize: 26,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget title(){
      return Container(
        margin: EdgeInsets.only(top: 80),
        child: Text(
          'Big Bonus ????',
          style: blackTextStyle.copyWith(
            fontSize: 32,
            fontWeight: semiBold,
          )
        ),
      );
    }

    Widget subTitle(){
      return Container(
        margin: EdgeInsets.only(top: 10, bottom: 50),
        child: Text(
          'We give you early credit so that\nyou can buy a flight ticket',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget startButton(){
      return CustomButton(
        title: 'Start Fly Now', 
        width: 220,
        onPressed: (){
          Navigator.pushNamedAndRemoveUntil(
            context, '/mainPage', (route) => false
          );
        }
      );
    }
    
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            title(),
            subTitle(),
            startButton(),
          ],
        ),
      ),      
    );
  }
}