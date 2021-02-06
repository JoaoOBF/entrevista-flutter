abstract class ApiResponse {}

class Success implements ApiResponse {
  int statusCode;
  Map<String, dynamic> data;
  String message;
  Success({
    this.statusCode,
    this.data,
  });
}

class Failure implements ApiResponse {
  int statusCode;
  String message;

  Failure({
    this.statusCode,
    this.message,
  });
}
