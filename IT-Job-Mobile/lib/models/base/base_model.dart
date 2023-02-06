import 'dart:convert';

class BaseModel<T> {
  String? message;
  T? data;
  int? statusCode;

  BaseModel({
    this.message,
    this.data,
    this.statusCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'data': data,
      'statusCode': statusCode,
    };
  }

  factory BaseModel.fromMap(Map<String, dynamic> map) {
    return BaseModel<T>(
      message: map['message'],
      data: map['data'],
      statusCode: map['statusCode']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseModel.fromJson(String source) =>
      BaseModel.fromMap(json.decode(source));
}
