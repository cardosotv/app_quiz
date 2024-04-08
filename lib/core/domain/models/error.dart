import 'package:equatable/equatable.dart';

class Error extends Equatable{
  String? status;
  String? datetime;
  String? message;
  String? path;  
  String? objectError;

  Error({
    this.status = "",
    this.datetime = "",
    this.message = "",
    this.path = "",
    this.objectError = "",
  });

  @override
  List<String?> get props => [status, datetime, message, path, objectError];

  fromJson(Map<String, dynamic> error){
    this.status = error['status'];
    this.datetime = error['datetime'];
    this.message = error['message'];
    this.path = error['path'];
    this.objectError = error['objectError'];
  }

}