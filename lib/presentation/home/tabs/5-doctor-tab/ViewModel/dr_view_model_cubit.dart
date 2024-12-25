import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/entity/dr_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../Domain/usecase/dr_usecase.dart';

part 'dr_view_model_state.dart';

@injectable
class DrViewModelCubit extends Cubit<DrViewModelState> {
  DoctorUsecase doctorUsecase;
  DrViewModelCubit(this.doctorUsecase) : super(DrViewModelInitial());
  static DrViewModelCubit get(context){
    return BlocProvider.of(context);
  }
  FetchDr()async{
    emit(DrLoading());
    var response=await doctorUsecase.call();
    response.fold(
            (drEntity) => emit(DrSuccess(drEntity)),
            (error) => emit(DrError(error))
    );
  }
}
