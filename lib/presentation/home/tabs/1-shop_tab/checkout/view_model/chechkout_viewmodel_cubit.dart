import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/checkout/chechkout_usecase.dart';
import 'package:ill_vent/Domain/usecase/checkout/delete_order-usecase.dart';
import 'package:ill_vent/Domain/usecase/checkout/getOrder_usecase.dart';
import 'package:ill_vent/data_layer/model/checkout/CheckoutResponse.dart';
import 'package:ill_vent/data_layer/model/dataclasses/chekout_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../../../data_layer/model/checkout/orders/OrdersResponse.dart';

part 'chechkout_viewmodel_state.dart';

@injectable
class CheckoutViewmodelCubit extends Cubit<ChechkoutViewmodelState> {
  ChechkoutUsecase chechkoutUsecase;
  GetOrderUsecase getOrderUsecase;
DeleteOrderUsecase deleteOrderUsecase;
  CheckoutViewmodelCubit(this.chechkoutUsecase,this.getOrderUsecase,this.deleteOrderUsecase) : super(ChechkoutViewmodelInitial());
  static CheckoutViewmodelCubit get(context) => BlocProvider.of(context);


  Future<void> checkout(  CheckoutModel checkoutModel)async{
    if (!isClosed) emit(ChechkoutViewmodelLoading());
    var response=await chechkoutUsecase.call(checkoutModel );
    if (response is SuccessApiResult<CheckoutResponse>) {
      emit(ChechkoutViewmodelSuccess(response.data));
    } else if (response is ErrorApiResult<CheckoutResponse>) {
      emit(ChechkoutViewmodelError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      emit(ChechkoutViewmodelError("Unknown error"));
      print("Unknown error");
    }
  }

  Future<void> getOrder( )async{
    if (!isClosed) emit(ChechkoutViewmodelLoading());
    var response=await getOrderUsecase.call(  );
    if (response is SuccessApiResult<List<OrdersResponse>>) {
      emit(GetorderViewmodelSuccess(response.data));
    } else if (response is ErrorApiResult<List<OrdersResponse>>) {
      emit(GetorderViewmodelError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      emit(GetorderViewmodelError("Unknown error"));
      print("Unknown error");
    }
  }


}
