import 'package:get/get.dart';

import '../lcoal_db/database_helper.dart';
import '../models/home/crypto_model.dart';

class FavCryptoController extends GetxController {
  final dbHelper = DatabaseHelper.instance;
  List<CryptoModelData>? data;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  deleteCryptoFromFav(int id) async {
    await dbHelper.delete(id);
  }

  Future<CryptoModelData?> getSelectedFavouriteCrypto(int? id) async {
    CryptoModelData? cryptoModelData = await dbHelper.getSelectedId(id ?? -1);
    return cryptoModelData;
  }

  getFavFromLocalDb() async {
    data = await dbHelper.getData();
    update();
  }
}
