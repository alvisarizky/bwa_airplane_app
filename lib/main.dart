import 'package:airplane_apps/cubit/auth_cubit.dart';
import 'package:airplane_apps/cubit/destination_cubit.dart';
import 'package:airplane_apps/cubit/page_cubit.dart';
import 'package:airplane_apps/cubit/seat_cubit.dart';
import 'package:airplane_apps/cubit/transaction_cubit.dart';
import 'package:airplane_apps/ui/pages/bonus_page.dart';
import 'package:airplane_apps/ui/pages/get_started_page.dart';
import 'package:airplane_apps/ui/pages/main_page.dart';
import 'package:airplane_apps/ui/pages/sign_in_page.dart';
import 'package:airplane_apps/ui/pages/sign_up_page.dart';
import 'package:airplane_apps/ui/pages/splash_page.dart';
import 'package:airplane_apps/ui/pages/success_checkout_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/mainPage': (context) => MainPage(),
          '/success' :(context) => SuccessCheckOutPage(),
        },
      ),
    );
  }
}
