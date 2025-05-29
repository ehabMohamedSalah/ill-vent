part of 'delete_item_view_model_cubit.dart';

@immutable
sealed class DeleteItemViewModelState {}

final class DeleteItemViewModelInitial extends DeleteItemViewModelState {}

final class DeleteItemViewModelLoading extends DeleteItemViewModelState {}
final class DeleteItemViewModelError extends DeleteItemViewModelState {
  String err;
  DeleteItemViewModelError(this.err);
}
final class DeleteItemViewModelSuccess extends DeleteItemViewModelState {

}
