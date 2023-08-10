import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windmill_crypto_app/mixins/baseClass.dart';

import '../../controllers/get_crypto_controller.dart';
import '../../lcoal_db/database_helper.dart';
import '../../models/home/crypto_model.dart';
import '../../utils/app_colors.dart';
import '../crypto_detail/crypto_detail_page.dart';

class CurrentCryptoPage extends StatelessWidget with BaseClass {
  CurrentCryptoPage({Key? key}) : super(key: key);
  final GetCryptoController cryptoController = Get.put(GetCryptoController());
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBar,
      body:  GetBuilder<GetCryptoController>(
          init: cryptoController,
          builder: (snapshot) {
            return cryptoController.cryptocurrencies.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.titleColor,
                    ),
                  )
                : RefreshIndicator(
              onRefresh: cryptoController.onRefreshPage,
                  child: ListView.builder(
                      itemCount: snapshot.cryptocurrencies.length + 1,
                      itemBuilder: (context, index) {
                        if (index < snapshot.cryptocurrencies.length) {
                          return InkWell(
                            onTap: () async {
                              CryptoModelData? cryptoModelData = await dbHelper
                                  .getSelectedId(snapshot.cryptocurrencies
                                          .elementAt(index)
                                          .id ??
                                      -1);
                              if (cryptoModelData == null) {
                                snapshot.cryptocurrencies.elementAt(index).isFav =
                                    false;
                              } else {
                                snapshot.cryptocurrencies.elementAt(index).isFav =
                                    true;
                              }
                              pushToNextScreen(
                                destination: CryptoDetailPage(
                                  cryptoData:
                                      snapshot.cryptocurrencies.elementAt(index),
                                ),
                              );
                            },
                            child: _getListItemWidget(
                                snapshot.cryptocurrencies.elementAt(index)),
                          );
                        } else {
                          cryptoController.fetchNextPage();
                        }
                      }),
                );
          }),
    );
  }

  Widget _getListItemWidget(CryptoModelData? cryptoModelData) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: _getListTile(
            cryptoModelData,
            Colors.red,
          ),
        ),
        const Divider(
          color: AppColors.appBackground,
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }

  Widget _getListTile(CryptoModelData? cryptoModelData, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          _getLeadingWidget(cryptoModelData?.name ?? ""),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cryptoModelData?.symbol ?? "",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
              Text(
                cryptoModelData?.name ?? "",
                style: GoogleFonts.plusJakartaSans(
                    color: AppColors.titleColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CircleAvatar _getLeadingWidget(String currencyName) {
    return CircleAvatar(
      backgroundColor: AppColors.appBackground,
      child: Text(
        currencyName[0],
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
