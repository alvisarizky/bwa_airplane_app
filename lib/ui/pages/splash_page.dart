import 'dart:async';

import 'package:airplane_apps/cubit/auth_cubit.dart';
import 'package:airplane_apps/ui/pages/get_started_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:airplane_apps/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5), (){
      User? user = FirebaseAuth.instance.currentUser;

      if(user == null){
        Navigator.pushNamedAndRemoveUntil(
          context, '/get-started', (route) => false
        );
      } else {
        print(user.email);
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(
          context, '/mainPage', (route) => false
        );
      }
      
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_logo.png'
                  ),
                ),
              ),
            ),
            Text(
              'AIRPLANE',
              style: whiteTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium,
                letterSpacing: 10,
              ),
            ),
          ],
        ),
      ),        
    );
  }
}