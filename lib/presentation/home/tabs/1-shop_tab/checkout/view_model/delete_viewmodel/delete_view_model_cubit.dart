import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/checkout/delete_order-usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/api_result.dart';

part 'delete_view_model_state.dart';
@injectable
class DeleteViewModelCubit extends Cubit<DeleteViewModelState> {
  DeleteOrderUsecase deleteOrderUsecase;
  DeleteViewModelCubit(this.deleteOrderUsecase) : super(DeleteViewModelInitial());
  static DeleteViewModelCubit get(context) => BlocProvider.of(context);



  Future<void> deleteOrder({required String orderId}) async {
    if (!isClosed) emit(DeleteOrderViewmodelLoading());
    var response = await deleteOrderUsecase.call(orderId: orderId);
    if (response is SuccessApiResult<void>) {
      emit(DeleteOrderViewmodelSuccess());
    } else if (response is ErrorApiResult<void>) {
      emit(DeleteOrderViewmodelError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      emit(DeleteOrderViewmodelError("Unknown error"));
      print("Unknown error");
    }
  }

}
