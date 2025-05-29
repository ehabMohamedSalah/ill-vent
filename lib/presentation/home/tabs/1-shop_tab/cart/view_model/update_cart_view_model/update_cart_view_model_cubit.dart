import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/cart/update_cart_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/api_result.dart';
import '../../../../../../../data_layer/model/cart/CartResponse.dart';

part 'update_cart_view_model_state.dart';

@injectable
class UpdateCartViewModelCubit extends Cubit<UpdateCartViewModelState> {
  UpdateCartUsecase updateCartUsecase;
  UpdateCartViewModelCubit(this.updateCartUsecase) : super(UpdateCartViewModelInitial());
  static UpdateCartViewModelCubit get(context) => BlocProvider.of(context);


  updateCart({required String productId, required String quantity})async{
    print("Updating cart for productId: $productId, quantity: $quantity");

    var response= await updateCartUsecase.call(quantity: quantity,productId: productId);
    if (response is SuccessApiResult<CartResponse>) {
      emit(UpdateCartViewModelSuccess(response.data));
    } else if (response is ErrorApiResult<CartResponse>) {
      emit(UpdateCartViewModelError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      emit(UpdateCartViewModelError("Unknown error"));
      print("Unknown error");
    }
  }

}
