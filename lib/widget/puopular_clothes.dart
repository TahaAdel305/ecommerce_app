import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/theme/app_color.dart';
import '../core/widget/Details_Screen.dart';

class puopularclothes extends StatelessWidget {
  final String id;
  final String name;
  final String price;

  const puopularclothes({
    super.key,
    required this.id,
    this.name = "Nike Jordan",
    this.price = "493.00",
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DetailsScreen(
              productId: "nike_jordan_1",
            ),
          ),
        );
      },
      child: Container(
        width: width*0.45,height: height*0.230,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
          color:isDark
              ? appColor.primerydark
              : appColor.primerylight,
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(height:12),
              Container(
                  width: 160,height:100 ,
                  color:isDark
                      ? appColor.primerylight
                      : appColor.primerydark
              ),
              Text("Best Seller",style: TextStyle(
                color: isDark
                    ? appColor.primerylight
                    : appColor.primerydark, ),),
              Expanded(
                child: Text(name,style: TextStyle(
                  color: isDark
                      ? appColor.primerylight
                      : appColor.primerydark, ),),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(price,style: TextStyle(
                      color: isDark
                          ? appColor.primerylight
                          : appColor.primerydark, ),),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: appColor.colorscandery
                      ),height: 35,width: 35,
                      child:Center(
                        child:  SvgPicture.asset("assets/icons/plus.svg" ,width: 18,
                          height: 18,
                          colorFilter: ColorFilter.mode(
                            appColor.primerylight,
                            BlendMode.srcIn,
                          ),),
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.05,),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
