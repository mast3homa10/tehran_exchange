import 'package:get/get.dart';
import '../../../backend/models/currency_model.dart';

class ExchangePageController extends GetxController {
  var isChangeScreen = 0.obs;
  var currentTopItem = 0.obs;
  var isIconChange = 0.obs;
  var searchController = 0.obs;
  var firstCurrencyChoiceEnglishName = 'Tether'.obs;
  var firstCurrencyChoiceSymbol = 'USDT'.obs;
  var firstCurrencyChoiceImageUrl = ''.obs;
  var secondCurrencyChoiceEnglishName = 'Bitcoin'.obs;
  var secondCurrencyChoiceSymbol = 'BTC'.obs;
  var secondCurrencyChoiceImageUrl = ''.obs;

  updateCurrencyChoice({required CurrencyModel model, required int item}) {
    if (item == 1) {
      secondCurrencyChoiceEnglishName = model.engName!.obs;
      secondCurrencyChoiceSymbol = model.symbol!.obs;
      secondCurrencyChoiceImageUrl = model.imageUrl!.obs;
    } else {
      firstCurrencyChoiceEnglishName = model.engName!.obs;
      firstCurrencyChoiceSymbol = model.symbol!.obs;
      firstCurrencyChoiceImageUrl = model.imageUrl!.obs;
    }

    update();
  }

  cahgeSearchController(int index) {
    searchController = index.obs;
    update();
  }

  getCurrentTopItem(int index) {
    currentTopItem = index.obs;
    update();
  }

  changeScreen() {
    isChangeScreen == 0.obs ? isChangeScreen + 1 : isChangeScreen - 1;
    update();
  }

  changeIcon() {
    isIconChange = isIconChange == 0.obs ? 1.obs : 0.obs;
    update();
  }
}
