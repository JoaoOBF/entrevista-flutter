abstract class ApiResponse {}

abstract class Error implements Exception {}

class Success implements ApiResponse {
  int statusCode;
  Map<String, dynamic> data;
  String message;
  Success({
    this.statusCode,
    this.data,
  });
}

class Failure extends Error implements ApiResponse {
  int statusCode;
  String message;

  Failure({
    this.statusCode,
    this.message,
  });
}
