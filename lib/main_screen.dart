import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/widget_screen/card_screen.dart';
import 'package:ecommerce_app/core/widget_screen/favorite_screen.dart';
import 'package:ecommerce_app/core/widget_screen/profile_screen.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';


import 'package:flutter_svg/flutter_svg.dart';

import 'core/widget_screen/Notifications_taps.dart';
import 'core/widget_screen/home_screen.dart';


class MainScreen extends StatefulWidget {
  static const String routeName = 'main_Screen';

  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectIndex = 0;

  final List<Widget> pages = [
    Home_Screen(),
    Favorite_Screen(),
    Card_Screen(),
    Notifications_screen(),
    Profile_Screen(),
  ];


  Widget _navIcon(String path, int index) {
    final navTheme = Theme.of(context).bottomNavigationBarTheme;

    final color = selectIndex == index
        ? navTheme.selectedItemColor
        : navTheme.unselectedItemColor;

    return SvgPicture.asset(
      path,
      height: 20,
      width: 20,
      colorFilter: ColorFilter.mode(color ?? Colors.grey, BlendMode.srcIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: pages[selectIndex],
      floatingActionButton: Transform.translate(
        offset:  Offset(0, -3),

        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: appColor.colorscandery,
          onPressed: () {},
          child: IconButton(
            onPressed: () {
              setState(() {
                selectIndex = 2;
              });
            },
            icon: SvgPicture.asset(
              "assets/icons/centertaps.svg",
              height: 22,
              width: 22,
            ),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Column(
        mainAxisSize:MainAxisSize. min,
        children: [
          ClipRRect(

            borderRadius: BorderRadiusGeometry.circular(35),
            child: BottomAppBar(

              //color: Colors.transparent,
              height: height*0.070,
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              padding: EdgeInsets.only(top: height*0.01,),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(//only(left: width*0.05)
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                    child: Column(//mainAxisSize: MainAxisSize.min,

                      children: [

                        IconButton(//iconSize: 25,
                          onPressed: () {
                            setState(() {
                              selectIndex = 0;

                            });
                          },
                          icon: _navIcon("assets/icons/hometapss.svg", 0,),

                        ),
                       /* Text(AppLocalizations.of(context)!.homescreen,
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),*/

                      ],

                    ),
                  ),//only(right: width*0.1)
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
                    child: Column(

                      children: [

                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectIndex = 1;

                            });
                          },
                          icon: _navIcon("assets/icons/favoritetaps.svg", 1),

                        ),/* Text(AppLocalizations.of(context)!.favorite,
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                        ),*/
                      ],
                    ),
                  ),
                  //only(left: width*0.1)
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
                    child: Column(//mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectIndex = 3;

                            });
                          },
                          icon: _navIcon("assets/icons/notifacationtaps.svg", 3),
                        ),
                        /*Text(AppLocalizations.of(context)!.notifacation,
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                    */
                      ],
                    ),
                  ),
                  //only(right: width*0.05)
                  Padding(
                    padding:EdgeInsetsGeometry.symmetric(horizontal: 20),
                    child: Column(//mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectIndex = 4;

                            });
                          },
                          icon: _navIcon("assets/icons/profeiltaps.svg", 4,),


                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: height*0.010,)
        ],
      ),
    );
  }
}

/*bottomNavigationBar: BottomAppBar(
  shape: CircularNotchedRectangle(),
  notchMargin: 10,

  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [

      // الشمال
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.shopping_cart),
      ),

      IconButton(
        onPressed: () {},
        icon: Icon(Icons.favorite),
      ),

      // مساحة للزرار اللي في المنتصف
      SizedBox(width: 48),

      // اليمين
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.person),
      ),

      IconButton(
        onPressed: () {},
        icon: Icon(Icons.settings),
      ),

    ],
  ),
),*/