import 'package:flutter/material.dart';

import '../core/theme/app_color.dart';

class GallaryStyle extends StatelessWidget {
  const GallaryStyle({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return  Container(
      height: height*0.070,width: width*0.170,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
        color:isDark
            ? appColor.primerylight
            : appColor.primerydark,
      ),
      child:  Image.asset("assets/images/t_shirt.png",width: double.infinity,height: double.infinity,fit: BoxFit.contain,),
    );
  }
}
