class ValidationAddressModel {
  bool? isValid;
  String? message;

  ValidationAddressModel({
    this.isValid = false,
    this.message = 'test',
  });

  ValidationAddressModel.fromJson(json) {
    isValid = json['isValid'];
    message = json['message'];
  }

  @override
  toString() => "\n {isValid: $isValid }{message: $message ...},,";
}
