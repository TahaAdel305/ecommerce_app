import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/widget/Account.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:ecommerce_app/widget/profile_setteing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../widget/ThemeSwitch.dart';
import '../providers/AppLanguageProvider.dart';
import '../providers/theme_provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_app/core/services/auth_service.dart';
import 'package:ecommerce_app/core/widget/Login_Screen.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.04,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  color:isDark
                  ?appColor.textdark
                      :appColor.textlight ,
                ),
                  height: height*0.090,
                  width: width*0.20,
                ),
                SizedBox(height: height*0.025,),

                Text("hy ",style: TextStyle(
                    fontSize: 20,color: isDark
                    ?appColor.textdark
                    :appColor.textlight),),
                Text("taha",style: TextStyle(
                    fontSize: 26,color: isDark
                        ?appColor.textdark
                        :appColor.textlight),),

                SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                height: height*0.070,
                width: width*0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isDark
                      ?appColor.primerydark
                      :appColor.primerylight,
                ),
                child:InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Account(),));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [

                        Text(AppLocalizations.of(context)!.account,style: TextStyle(
                            fontSize: 20,color: isDark
                            ?appColor.textdark
                            :appColor.textlight),)
                    ],),
                  ),
                )),
            ),


                SizedBox(height: height*0.02,),


                profileSetteing(
                  title: AppLocalizations.of(context)!.themedark,
                  leadingIcon:Icons.wb_sunny_outlined ,
                  trailingIcon: const ThemeSwitch(),
                  trailingIsInteractive: true,
                  onPressed: (){
                    Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  ).changeTheme;
                    },

                ),
                SizedBox(height: height*0.03,),
                profileSetteing(
                    title: AppLocalizations.of(context)!.localization,
                    leadingIcon: Icons.language,
                  onPressed: () => showLanguageDialog(context),
                  trailingIcon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
                SizedBox(height: height*0.03,),
              ],
            ),
          ),
        )
      ),
    );
  }


  void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        final currentLocale =
            dialogContext.watch<AppLanguageProvider>().locale;

        return AlertDialog(
          title: const Text('اختار اللغة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<Locale>(
                title: const Text('العربية'),
                value: const Locale('ar'),
                groupValue: currentLocale,
                onChanged: (locale) {
                  if (locale != null) {
                    context.read<AppLanguageProvider>()
                        .changeLanguage(locale);

                    Navigator.pop(dialogContext);
                  }
                },
              ),
              RadioListTile<Locale>(
                title: const Text('English'),
                value: const Locale('en'),
                groupValue: currentLocale,
                onChanged: (locale) {
                  if (locale != null) {
                    context.read<AppLanguageProvider>()
                        .changeLanguage(locale);

                    Navigator.pop(dialogContext);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }


}
