import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/cart/delete_cart_item.dart';
import 'package:ill_vent/data_layer/model/cart/CartResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/api_result.dart';

part 'delete_item_view_model_state.dart';

@injectable
class DeleteItemViewModelCubit extends Cubit<DeleteItemViewModelState> {
  DeleteCartItemUsecase deleteCartItemUsecase;
  static DeleteItemViewModelCubit get(context) => BlocProvider.of(context);


  DeleteItemViewModelCubit(this.deleteCartItemUsecase) : super(DeleteItemViewModelInitial());


  deleteCartItem({required String cartItemId})async{
    emit(DeleteItemViewModelLoading());
    var response= await deleteCartItemUsecase.call( cartItemId: cartItemId);
    if (response is SuccessApiResult<void>) {
      emit(DeleteItemViewModelSuccess());
    } else if (response is ErrorApiResult<void>) {
      emit(DeleteItemViewModelError(response.exception.toString()??"Unknown error"));
      print(response.exception.toString());
    } else {
      emit(DeleteItemViewModelError("Unknown error"));
      print("Unknown error");
    }
  }


}
