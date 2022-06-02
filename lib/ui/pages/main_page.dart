import 'package:airplane_apps/cubit/page_cubit.dart';
import 'package:airplane_apps/ui/pages/home_page.dart';
import 'package:airplane_apps/ui/pages/setting_page.dart';
import 'package:airplane_apps/ui/pages/transaction_page.dart';
import 'package:airplane_apps/ui/pages/wallet_page.dart';
import 'package:airplane_apps/ui/widgets/bottom_navigation_items.dart';
import 'package:flutter/material.dart';
import 'package:airplane_apps/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget bottomBackground() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 95,
          decoration: BoxDecoration(
            color: kBackgroundColor,
          ),
        ),
      );
    }

    Widget bottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, bottom: 30),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItems(
                index: 0,
                imageUrl: 'assets/icon_explore.png',
              ),
              CustomBottomNavigationItems(
                index: 1,
                imageUrl: 'assets/icon_books.png'
              ),
              CustomBottomNavigationItems(
                index: 2,
                imageUrl: 'assets/icon_card.png'
              ),
              CustomBottomNavigationItems(
                index: 3,
                imageUrl: 'assets/icon_setting.png'
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: SafeArea(
            child: Stack(
              children: [
                buildContent(currentIndex),
                bottomBackground(),
                bottomNavigation(),
              ],
            ),
          ),
        );
      },
    );
  }
}
