import 'package:stacked/stacked.dart';
import 'package:gaml/ui/common/app_strings.dart';

class HomeViewModel extends BaseViewModel {
  bool _isCurrencyVisible = true;
  String _currencyValue = AppStrings.currencyValue;

  bool get isCurrencyVisible => _isCurrencyVisible;
  String get currencyValue => _currencyValue;

  void changetext() {
    _currencyValue = _currencyValue == "****" ? AppStrings.currencyValue : "****";
    notifyListeners();
  }

  void toggleCurrencyVisibility() {
    _isCurrencyVisible = !_isCurrencyVisible;
    _currencyValue = _isCurrencyVisible ? AppStrings.currencyValue : "****";
    notifyListeners();
  }
}
