import 'package:ecommerce_app/widget/Gallary_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widget/Gallary_Size.dart';
import '../providers/FavoriteProvider.dart';
import '../theme/app_color.dart';
import 'package:provider/provider.dart';
class DetailsScreen extends StatelessWidget {
  static const String routeName = 'Details_Screen';
  final String productId;

  const DetailsScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final favoriteProvider = context.watch<FavoriteProvider>();
    final isFavorite = favoriteProvider.isFavorite(productId);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            
            Padding(
              padding:  EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                     // iconSize: 10,
                      onPressed: () {Navigator.pop(context);},
                      icon: SvgPicture.asset(
                        "assets/icons/back_for.svg",
                        color: isDark
                            ? appColor.primerylight
                            : appColor.primerydark,
                        //height: 15,width: 14,
                      ),
                    ),
                  ),
                  Text("Store location"),
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
                      //iconSize: 10,
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
            ),

            SizedBox(height: 01,),
            Container(
              width: width*0.93,height: height*0.25,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                color:isDark
                    ? appColor.primerydark
                    : appColor.primerylight,
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:12),
                    Container(
                        width: width*0.9,height:height*0.22 ,
                        color:isDark
                            ? appColor.primerylight
                            : appColor.primerydark
                    ),
                      ],
                    ),
                ),
            ),
            SizedBox(height: height*0.02,),
//3
            Container(
              width: width*0.93,height: height*0.46,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                color:isDark
                    ? appColor.primerydark
                    : appColor.primerylight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  Text("Best Seller",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w100,color: appColor.colorscandery),),
                    Text("967.800",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                      color: isDark
                        ? appColor.primerylight
                        : appColor.primerydark,),),
                    Text("Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200,color: isDark
                          ? appColor.primerylight
                          : appColor.primerydark,),),
                    SizedBox(height: 7,),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Gallery",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,
                            color: isDark
                                ? appColor.primerylight
                                : appColor.primerydark,),),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<FavoriteProvider>().toggleFavorite(productId);
                          },
                          icon: SvgPicture.asset(
                            "assets/icons/favoritetaps.svg",
                            colorFilter: ColorFilter.mode(
                              isFavorite
                                  ? Colors.red
                                  : (isDark
                                  ? appColor.primerylight
                                  : appColor.primerydark),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 7,),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.070,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 7),
                            child: GallaryStyle(),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 7,),
                    Text("Size",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,
                      color: isDark
                          ? appColor.primerylight
                          : appColor.primerydark,),),
                    SizedBox(height: 7,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.070,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 7),
                            child: GallarySize(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.01,),
            Container(
              width: width*0.93,height: height*0.1,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                color:isDark
                    ? appColor.primerydark
                    : appColor.primerylight,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Text("Price",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w100,
                    color: isDark
                        ? appColor.primerylight
                        : appColor.primerydark,),),
                      Text("849.69",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300,
                        color: isDark
                            ? appColor.primerylight
                            : appColor.primerydark,),),
                    ],),
                  ),
                  Container(
                    height: 40,
                    width:width*0.3,
                    decoration: BoxDecoration(
                      color: appColor.colorscandery,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                          color: appColor.primerylight,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                        ],
                    ),
              ),
            )
          
        ],//children start

        )
      
      
      
      
      
      
      ),
    );
  }
}
