import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/data/storage_repository/storage_repository.dart';
import 'package:najot_talim_nt/utils/constants/app_constants.dart';

class RegisterCubit extends Cubit<String> {
  RegisterCubit({BuildContext? context}) : super('');

  void register(String v, String secondV, bool isRegistered) {
    if (v == secondV&& v.isNotEmpty) {
      StorageRepository.setString(
        key: AppConstants.pinCode,
        value: v,
      );
      StorageRepository.setBool(
        key: AppConstants.isRegistered,
        value: isRegistered,
      );


    }
    emit(v);
    debugPrint("CURRENT PIN CODE: \$\$\$\$\$\$\$\$ $v");
  }

  login<bool>(String v) {
    String newState = state;
    newState = v;
    StorageRepository.getString(
      key: AppConstants.pinCode,
    );
    emit(newState);
    debugPrint("CURRENT PIN CODE: \$\$\$\$\$\$\$\$ $newState");
  }
}
