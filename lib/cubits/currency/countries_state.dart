import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import '../../data/models/forms_status.dart';

class CountriesState {
  final FormsStatus formsStatus;
  final List<CountryModel> country;
  final String statusText;

  CountriesState({
    required this.formsStatus,
    required this.statusText,
    required this.country,
  });

  CountriesState copyWith({
    FormsStatus? formsStatus,
    List<CountryModel>? country,
    String? statusText,
  }) =>
      CountriesState(
        formsStatus: formsStatus ?? this.formsStatus,
        country: country ?? this.country,
        statusText: statusText ?? this.statusText,
      );
}
