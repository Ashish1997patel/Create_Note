class Response {
  String code;
  String message;
  List<dynamic> data;

  Response({
    required this.code,
    required this.message,
    required this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? List<dynamic>.from(json['data']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
