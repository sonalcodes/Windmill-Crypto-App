import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windmill_crypto_app/models/home/crypto_model.dart';
import '../../controllers/fav_crypto_controller.dart';
import '../../controllers/get_crypto_controller.dart';
import '../../lcoal_db/database_helper.dart';
import '../../utils/app_colors.dart';

class CryptoDetailPage extends StatefulWidget {
  final CryptoModelData? cryptoData;

  CryptoDetailPage({
    required this.cryptoData,
    Key? key,
  }) : super(key: key);

  @override
  State<CryptoDetailPage> createState() => _CryptoDetailPageState();
}

class _CryptoDetailPageState extends State<CryptoDetailPage> {
  final GetCryptoController cryptoController = Get.put(GetCryptoController());
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.cryptoData?.id != null) {
      cryptoController.getDetails(widget.cryptoData?.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBar,
      appBar: AppBar(
        title: Text(
          widget.cryptoData?.name ?? "",
          style: GoogleFonts.plusJakartaSans(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16),
        ),
        elevation: 10,
        centerTitle: true,
        backgroundColor: AppColors.appBar,
        actions: [
          IconButton(
              onPressed: () async {
                if (widget.cryptoData?.isFav ?? false) {
                  await dbHelper.delete(widget.cryptoData?.id ?? -1);
                  widget.cryptoData?.isFav = false;
                } else {
                  await dbHelper.insertData(widget.cryptoData?.toJson() ?? {});
                  widget.cryptoData?.isFav = true;
                }
                setState(() {});
              },
              icon: widget.cryptoData?.isFav ?? false
                  ? const Icon(
                      Icons.star,
                      color: Colors.amber,
                    )
                  : const Icon(
                      Icons.star_rate_outlined,
                      color: Colors.amber,
                    ))
        ],
      ),
      body: SingleChildScrollView(
        child: GetBuilder<GetCryptoController>(
            init: cryptoController,
            builder: (snapshot) {
              return snapshot.cryptoDetailsModel == null
                  ? Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 100),
                        child: const CircularProgressIndicator(
                          color: AppColors.titleColor,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.appBackground,
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Image(
                                  image: NetworkImage(
                                      snapshot.cryptoDetailsModel?.logo ?? ""),
                              height: 100,width: 100,),
                              _getData(
                                  title: "Name",
                                  value:
                                      snapshot.cryptoDetailsModel?.name ?? ""),
                              _getData(
                                  title: "Symbol",
                                  value: snapshot.cryptoDetailsModel?.symbol ??
                                      ""),
                              _getData(
                                  title: "Category",
                                  value:
                                      snapshot.cryptoDetailsModel?.category ??
                                          ""),

                              _getData(
                                  title: "Subreddit",
                                  value:
                                      snapshot.cryptoDetailsModel?.subreddit ??
                                          ""),
                              _getData(
                                  title: "Date added",
                                  value:
                                      snapshot.cryptoDetailsModel?.dateAdded ??
                                          ""),
                              _getData(
                                  title: "Twitter Username",
                                  value: snapshot.cryptoDetailsModel
                                          ?.twitterUsername ??
                                      ""),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        snapshot
                            .cryptoDetailsModel?.description!=null ? Container(
                          decoration: BoxDecoration(
                              color: AppColors.appBackground,
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          child:  Text(
                            snapshot
                                .cryptoDetailsModel?.description ??
                                "",
                            style: GoogleFonts.roboto(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ):Container(),
                      ],
                    );
            }),
      ),
    );
  }

  Widget _getData({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.roboto(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
