import 'failure.dart';

class ServerFailure extends Failure {
  String? statusMsg;
  String? message;

  ServerFailure({
    required super.statusCode,
    this.statusMsg,
    this.message,
  });

  factory ServerFailure.fromJson(int? statusCode, dynamic json) {
    return ServerFailure(
      statusCode: statusCode.toString(),
      statusMsg: json['statusMsg'],
      message: json['message'],
    );
  }
}
