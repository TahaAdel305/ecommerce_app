import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../services/auth_service.dart';
import 'Login_Screen.dart';

class Account extends StatelessWidget {
  static const String routeName = "Account";
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDark?appColor.background_dark
            :appColor.background_light,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,
                      color: isDark?appColor.primerylight
                        :appColor.primerydark,),
                  ),
                ],
              ),
            ),
            SizedBox(height: height*0.03,),
            Container(
              height: height*0.070,
              width: width*0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: isDark
                    ?appColor.primerydark
                    :appColor.primerylight,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: ()async {
                    try {
                      await AuthService().signOut();

                      if (!context.mounted) return;

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Login_Screen.routeName,
                            (route) => false,
                      );
                    } catch (e) {
                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Failed to sign out. Please try again.'),
                        ),
                      );
                    }
                  },

                  child: Row(
                    children: [
                      Expanded(
                        child: Text("sign out",style: TextStyle(
                            fontSize: 26,color: isDark
                            ?appColor.textdark
                            :appColor.textlight),
                        ),
                      ),
                      SvgPicture.asset("assets/icons/Sign Out.svg",
                          color: isDark
                              ?appColor.primerylight
                              :appColor.primerydark),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),


      ),
    );
  }
}
