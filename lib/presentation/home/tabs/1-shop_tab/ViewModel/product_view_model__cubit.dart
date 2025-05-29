import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/getProductById_usecase.dart';
import 'package:ill_vent/data_layer/model/get_product_response/ProductsResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../Domain/usecase/products_usecase.dart';
import '../../../../../core/api/api_result.dart';

part 'product_view_model__state.dart';

@injectable
class ProductViewModelCubit extends Cubit<ProductViewModelState> {
  ProductUsecase productUsecase;
  GetProductByIdUsecase getProductByIdUsecase;
  ProductViewModelCubit(this.productUsecase,this.getProductByIdUsecase) : super(ProductViewModelInitial());

  static ProductViewModelCubit get(context) => BlocProvider.of(context);

  // internal list to manage current appointments
  List<ProductsResponse> _products = [];

  Future<void> getProducts( )async{
    if (!isClosed) emit(ProductViewModelLoading());

    var response=await productUsecase.call( );
    if (response is SuccessApiResult<List<ProductsResponse>>) {
      _products = response.data ?? [];
      emit(ProductViewModelSuccess(_products));
    } else if (response is ErrorApiResult<List<ProductsResponse>>) {
      emit(ProductViewModelError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      emit(ProductViewModelError("Unknown error"));
      print("Unknown error");
    }
  }

  Future<void> getProductById({required String productId} )async{
    if (!isClosed) emit(ProductByIdViewModelLoading());
    var response=await getProductByIdUsecase.call( productId: productId);
    if (response is SuccessApiResult<ProductsResponse>) {
       emit(ProductByIdViewModelSuccess(response.data));
    } else if (response is ErrorApiResult<ProductsResponse>) {
      emit(ProductByIdViewModelError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      emit(ProductByIdViewModelError("Unknown error"));
      print("Unknown error");
    }
  }
}
