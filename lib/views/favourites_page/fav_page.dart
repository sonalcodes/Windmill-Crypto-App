import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windmill_crypto_app/controllers/fav_crypto_controller.dart';
import 'package:windmill_crypto_app/mixins/baseClass.dart';

import '../../lcoal_db/database_helper.dart';
import '../../models/home/crypto_model.dart';
import '../../utils/app_colors.dart';
import '../crypto_detail/crypto_detail_page.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> with BaseClass {
  FavCryptoController cryptoController = Get.put(FavCryptoController());
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cryptoController.getFavFromLocalDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBar,
        body: GetBuilder<FavCryptoController>(
            init: cryptoController,
            builder: (snapshot) {
              return ListView.builder(
                  itemCount: cryptoController.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        CryptoModelData? cryptoModelData =
                            await cryptoController.getSelectedFavouriteCrypto(
                                cryptoController.data?.elementAt(index).id);
                        if (cryptoModelData == null) {
                          snapshot.data?.elementAt(index).isFav = false ;
                        } else {
                          snapshot.data?.elementAt(index).isFav = true ;
                        }
                        if (mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CryptoDetailPage(
                              cryptoData: snapshot.data?.elementAt(index),
                            )),
                          ).then((value) {
                            cryptoController.getFavFromLocalDb();
                          });

                        }
                      },
                      child:
                          _getListItemWidget(snapshot.data?.elementAt(index)),
                    );
                  });
            }));
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
