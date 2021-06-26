class HttpException implements Exception{
  final String message;
  HttpException(this.message);

  @override
  // ignore: missing_return
  String toString()
  {
    return message;
  }

}