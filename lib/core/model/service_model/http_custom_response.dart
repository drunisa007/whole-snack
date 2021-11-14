class HttpCustomResponse{
  bool isSuccessful=true;
  String errorMessage='';
  int stateCode = 400;
  dynamic mData='';

  HttpCustomResponse(this.errorMessage, this.stateCode, this.mData,this.isSuccessful);
}