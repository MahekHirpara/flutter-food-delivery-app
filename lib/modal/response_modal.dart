

class ResponseModal{
  bool? _isSuccess ;
  String? _message;

 ResponseModal(this._isSuccess,this._message);

 bool get isSuccess => _isSuccess!;
 String get message => _message!;
}