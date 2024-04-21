import 'package:najot_talim_nt/bloc/scanner_event.dart';
import 'package:najot_talim_nt/bloc/scanner_state.dart';

import '../data/local/local_database.dart';
import '../data/models/form_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc()
      : super(
          const ScannerState(
            status: FormStatus.pure,
            products: [],
            statusText: "",
          ),
        ) {
    on<LoadScannerEvent>(loadScanners);
    on<AddScannerEvent>(insertScanners);
    on<RemoveScannerEvent>(deleteScanner);
  }

  Future<void> loadScanners(LoadScannerEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    emit(
      state.copyWith(
          status: FormStatus.success,
          products: await LocalDB.getAllScanners()),
    );
  }

  Future<void> insertScanners(AddScannerEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    emit(
      state.copyWith(status: FormStatus.success, products: [
        ...state.products,
        await LocalDB.insertScanner(event.scannerModel)
      ]),
    );
  }

  Future<void> deleteScanner(RemoveScannerEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    await LocalDB.deleteScannerId(event.scannerId);
    add(LoadScannerEvent());
    emit(state.copyWith(status: FormStatus.success));
  }
}
