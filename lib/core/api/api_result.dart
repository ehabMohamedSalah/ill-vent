sealed class ApiResult<T> {}

class SuccessApiResult<T> extends ApiResult<T> {
  final T? data;
  SuccessApiResult(this.data);
}

class ErrorApiResult<T> extends ApiResult<T> {
  final Exception exception;
  ErrorApiResult(this.exception);
}

class MessageErrorApiResult<T> extends ApiResult<T> {
  final String message;
  final Exception? exception;

  MessageErrorApiResult(this.message, [this.exception]);
}
