import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windmill_crypto_app/mixins/baseClass.dart';
import 'package:windmill_crypto_app/utils/app_colors.dart';
import 'package:windmill_crypto_app/views/home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with BaseClass {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () {
      pushReplaceAndClearStack(
        context: context,
        destination:  HomePage(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBar,
      body: Center(
        child: Text(
          "WindMill\nCrypto",
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
