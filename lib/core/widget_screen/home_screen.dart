import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:ecommerce_app/widget/puopular_clothes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: isDark
                            ? appColor.primerydark
                            : appColor.primerylight,
                      ),
                      height: 40,
                      width: 40,
                      child: IconButton(
                        iconSize: 30,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/combo shape.svg",
                          color: isDark
                              ? appColor.primerylight
                              : appColor.primerydark,
                          //height: 15,width: 14,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text("Store location"),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/location.svg"),
                            SizedBox(width: 3),
                            Text("Mondolibug, Sylhet"),
                          ],
                        ),
                      ],
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: isDark
                            ? appColor.primerydark
                            : appColor.primerylight,
                      ),
                      height: 40,
                      width: 40,
                      child: IconButton(
                        iconSize: 30,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/shope.svg",
                          color: isDark
                              ? appColor.primerylight
                              : appColor.primerydark,
                          //height: 15,width: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.013),
                //text fiald
                Container(
                  height: height * 0.050,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: isDark
                          ? appColor.primerylight
                          : appColor.primerydark,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    color: isDark
                        ? appColor.primerydark
                        : appColor.primerylight,
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.lookingforclothes,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: SvgPicture.asset(
                          "assets/icons/Search.svg",
                          width: 13,
                          height: 13,
                          color: isDark
                              ? appColor.primerylight
                              : appColor.primerydark,
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.015),
                // text poupolar
                Container(
                  height: height * 0.029,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isDark
                        ? appColor.primerydark
                        : appColor.primerylight,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.popularclothes,
                          style: TextStyle(
                            color: isDark
                                ? appColor.primerylight
                                : appColor.primerydark,
                          ),
                        ),
                      ),
                      /*Text(AppLocalizations.of(context)!.seeall,style: TextStyle(color: appColor.colorscandery),),*/
                      SizedBox(width: width * 0.02),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.015),
                SizedBox(
                  height: height * 0.95,//double.infinity,//
                  width: width * 0.95,
                  child: GridView.builder(
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent:
                          MediaQuery.of(context).size.height * 0.230,
                    ),
                    itemBuilder: (context, index) {
                      return puopularclothes(id: "nike_jordan_1");
                    },
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
