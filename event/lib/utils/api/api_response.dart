class ApiResponse {
  int status;
  String message;
  dynamic data;

  ApiResponse.fromJson(Map<String, dynamic> item)
      : status = item['status'],
        message = item['message'],
        data = item['data'];

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
  };
}