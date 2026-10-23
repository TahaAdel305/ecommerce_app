import 'package:flutter/material.dart';

import '../core/theme/app_color.dart';

class GallarySize extends StatelessWidget {
  const GallarySize({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height*0.070,width: width*0.170,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
        color:isDark
            ? appColor.primerylight
            : appColor.primerydark,
      ),
      child: Center(
        child: Text("15",style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w200,
          color: isDark
            ? appColor.primerydark
            : appColor.primerylight,),),
      ),
    );
  }
}
