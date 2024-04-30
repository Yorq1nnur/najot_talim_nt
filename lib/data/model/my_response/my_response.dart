class MyResponse {
  dynamic data;
  String errorText;
  int statusCode;

  MyResponse({
    this.data,
    this.errorText = '',
    this.statusCode = 0,
  });
}
