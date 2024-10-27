class network_response {
  final bool isSuccess;
  final int statusCode;
  dynamic responseData;
  String errorMessage;

  network_response({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMessage='Something went wrong'});
}
