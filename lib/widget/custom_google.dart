import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/theme/app_color.dart';

class custom_google extends StatelessWidget {

  const custom_google({
    super.key,



  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: width * 0.95,
          height: height * 0.060,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isDark ? appColor.primerydark : appColor.primerylight,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/google.svg"),
              SizedBox(width: width * 0.050),
              Text("Sign in with google",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300,color: isDark
                  ?appColor.primerylight
                  :appColor.primerydark,),)
              /*Text:(
                "Sign in with google",

              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
