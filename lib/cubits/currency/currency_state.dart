import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import '../../data/models/forms_status.dart';

class CurrencyState {
  final FormsStatus formsStatus;
  final List<Country> currencies;
  final String statusText;

  CurrencyState({
    required this.formsStatus,
    required this.statusText,
    required this.currencies,
  });

  CurrencyState copyWith({
    FormsStatus? formsStatus,
    List<Country>? currencies,
    String? statusText,
  }) =>
      CurrencyState(
        formsStatus: formsStatus ?? this.formsStatus,
        currencies: currencies ?? this.currencies,
        statusText: statusText ?? this.statusText,
      );
}
