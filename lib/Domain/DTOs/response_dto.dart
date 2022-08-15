class ResponseDTO {
  int statusCode;
  List<String> errors;

  ResponseDTO({required this.statusCode, List<String>? errors})
      : errors = errors ?? List.empty(growable: true);
}
