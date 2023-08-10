import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:windmill_crypto_app/models/crypto_details/crypto_details_model.dart';
import 'package:windmill_crypto_app/models/home/crypto_model.dart';
import 'package:windmill_crypto_app/utils/constants.dart';

class GetCryptoController extends GetxController {
  //CryptoModel? cryptoModel;
  int currentPage = 1;
  int itemsPerPage = 10;
  List<CryptoModelData> cryptocurrencies = [];
  CryptoDetailsModel? cryptoDetailsModel;

  Future<void> _getPrices({int start = 1, int limit = 10}) async {
    try {
      bool isConnected = await AppConstants.checkInternet();
      if(!isConnected){
        AppConstants.showError(title: "Internet", message: "please check your internet connection");
        return ;
      }
      String api =
          '${AppConstants.baseUrl}listings/latest?start=$start&limit=$limit';

      http.Response response = await http.get(Uri.parse(api),
          headers: {"X-CMC_PRO_API_KEY": AppConstants.apiKey});
      if (response.statusCode == 200) {
        CryptoModel cryptoModel =
            CryptoModel.fromJson(json.decode(response.body));
        cryptocurrencies.addAll(cryptoModel.data as List<CryptoModelData>);
        update();
      } else {
        throw Exception('Failed to load data');
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  getDetails(int? id) async {
    try {
      cryptoDetailsModel = null;
      bool isConnected = await AppConstants.checkInternet();
      if(!isConnected){
        AppConstants.showError(title: "Internet", message: "please check your internet connection");
        return ;
      }

      String api = '${AppConstants.baseUrl}info?id=$id';
      http.Response response = await http.get(Uri.parse(api),
          headers: {"X-CMC_PRO_API_KEY": AppConstants.apiKey});
      if (response.statusCode == 200) {
        dynamic data = json.decode(response.body);
        cryptoDetailsModel =
            CryptoDetailsModel.fromJson(data["data"][id.toString()]);

        update();
      } else {
        throw Exception('Failed to load data');
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> onRefreshPage() async {
    bool isConnected = await AppConstants.checkInternet();
    if(!isConnected){
      AppConstants.showError(title: "Internet", message: "please check your internet connection");
      return ;
    }
    currentPage = 1;
    itemsPerPage = 10;
    print("REFRESH");
    print(cryptocurrencies.length);
    cryptocurrencies.clear();
    update();
    print(cryptocurrencies.length);
    await _getPrices(
        start: (currentPage - 1) * itemsPerPage + 1, limit: itemsPerPage);
    currentPage++;
    update();
  }

  Future<void> fetchNextPage() async {
    bool isConnected = await AppConstants.checkInternet();
    if(!isConnected){
      AppConstants.showError(title: "Internet", message: "please check your internet connection");
      return ;
    }
    await _getPrices(
        start: (currentPage - 1) * itemsPerPage + 1, limit: itemsPerPage);
    currentPage++;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchNextPage();
  }
}
