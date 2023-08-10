import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windmill_crypto_app/mixins/baseClass.dart';
import 'package:windmill_crypto_app/utils/app_colors.dart';
import 'package:windmill_crypto_app/views/current_crypto/current_crypto_page.dart';
import '../favourites_page/fav_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with BaseClass, SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBar,
      appBar: AppBar(
        title: Text(
          "Windmill Crypto",
          style: GoogleFonts.plusJakartaSans(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16),
        ),
        elevation: 10,
        centerTitle: true,
        backgroundColor: AppColors.appBar,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: AppColors.titleColor,
              indicatorWeight: 2,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.titleColor,
              labelStyle:
                  GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16),
              unselectedLabelColor: AppColors.white,
              tabs: const [
                Tab(
                  text: 'CryptoCurrencies',
                ),
                Tab(
                  text: 'Favourites',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CurrentCryptoPage(),
                  const FavPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
