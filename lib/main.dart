import 'package:ecommerce_app/main_screen.dart';
import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:ecommerce_app/core/widget/Details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/AppLanguageProvider.dart';
import 'core/providers/FavoriteProvider.dart';
import 'core/providers/theme_provider.dart';
import 'core/services/product_service.dart';
import 'core/widget/Account.dart';
import 'core/widget/Recovery_Password.dart';
import 'core/widget/login_screen.dart';
import 'core/widget/signup_screen.dart';
import 'core/widget/splash_screen.dart';
import 'core/widget_screen/favorite_screen.dart';
import 'l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    // التطبيق الحالي بتاعك
  );
}
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final productService = ProductService();
  productService.fetchProducts();



  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => AppLanguageProvider(),

        ),
        ChangeNotifierProvider(
            create: (_) => ThemeProvider(),
      ),
        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(),
        ),
      ],
      child: MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.watch<AppLanguageProvider>().locale,

      localizationsDelegates:
      AppLocalizations.localizationsDelegates,

      supportedLocales:
      AppLocalizations.supportedLocales,

      debugShowCheckedModeBanner: false,

      initialRoute: SplashScreen.routeName,
      routes: {

        MainScreen.routeName: (context) =>  MainScreen(),
        DetailsScreen.routeName: (context) =>  DetailsScreen(productId: "nike_jordan_1",),
        SplashScreen.routeName:(context) =>  SplashScreen(),
        Login_Screen.routeName:(context) =>  Login_Screen(),
        Signup_Screen.routeName:(context) =>  Signup_Screen(),
        RecoveryPassword.routeName:(context) =>  RecoveryPassword(),
        Account.routeName:(context) =>  Account(),
      },
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      //themeMode: ThemeMode.light,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,



    );
  }
}

