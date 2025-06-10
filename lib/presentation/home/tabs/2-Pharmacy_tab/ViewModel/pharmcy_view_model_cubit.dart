import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/pharmcy_usecase.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/data_layer/model/Pharmacy_response.dart';
import 'package:ill_vent/presentation/home/tabs/2-Pharmacy_tab/ViewModel/pharmcy_intent.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'pharmcy_view_model_state.dart';

@injectable
class PharmcyViewModelCubit extends Cubit<PharmcyViewModelState> {
  static PharmcyViewModelCubit get(context) => BlocProvider.of(context);

  List<PharmacyResponse> pharmcy = [];
  final PharmcyUsecase pharmcyUsecase;

  PharmcyViewModelCubit(this.pharmcyUsecase) : super(PharmcyViewModelInitial());

  void doIntent(PharmcyIntent intent) {
    if (intent is GetPharmcyIntent) {
      _getPharmcy();
    }
  }

  Future<void> _getPharmcy() async {
    // Don't reload if we already have data
    if (pharmcy.isNotEmpty) {
      if (!isClosed) emit(PharmcyViewModelSuccess(pharmcy));
      return;
    }

    if (!isClosed) emit(PharmcyViewModelLoading());

    final response = await pharmcyUsecase.call();

    if (response is SuccessApiResult<List<PharmacyResponse>>) {
      final newData = response.data ?? [];
      if (newData.isNotEmpty) {
        pharmcy = newData;
        if (!isClosed) emit(PharmcyViewModelSuccess(pharmcy));
      } else {
        if (!isClosed) emit(PharmcyViewModelNoData("No pharmacies available"));
      }
    } else if (response is ErrorApiResult<List<PharmacyResponse>>) {
      if (!isClosed) emit(PharmcyViewModelError(response.exception.toString()));
    }
  }
}
