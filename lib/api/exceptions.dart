class ApiException implements Exception {
  final String message;
  //Passing the user readable message
  ApiException(this.message);
}
