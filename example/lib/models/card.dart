import 'package:fbloc_event_gen/annotations.dart';
part 'card.g.dart';

@generateCopyWith
class AddCardRequestModel {
  int? cardTypeId;
  String? nickName;
  String? nameOnCard;
  bool? isActiveCardHolder;
  String? expenseDescription;
  int? shippingAddressId;
  int? userId;
  double? requestedLimit;
  int? intervalId;
  bool? resetToPreviousLimit;
  bool? isBillPayment;
  int? cardPaymentTypeId;
  bool isRequestedLimitValid;
  bool isNickNameValid;
  bool isExpenseDescriptionValid;
  bool isCardPaymentTypeValid;

  AddCardRequestModel({
    this.cardTypeId,
    this.nickName,
    this.nameOnCard,
    this.isActiveCardHolder,
    this.expenseDescription,
    this.shippingAddressId,
    this.userId,
    this.requestedLimit,
    this.intervalId,
    this.resetToPreviousLimit,
    this.isBillPayment,
    this.cardPaymentTypeId,
    this.isExpenseDescriptionValid = false,
    this.isNickNameValid = false,
    this.isRequestedLimitValid = false,
    this.isCardPaymentTypeValid = false,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (cardTypeId != null) data['cardTypeId'] = cardTypeId;
    if (nickName != null) data['nickName'] = nickName;
    if (nameOnCard != null) data['nameOnCard'] = nameOnCard;
    if (isActiveCardHolder != null) {
      data['isActiveCardHolder'] = isActiveCardHolder;
    }
    if (expenseDescription != null) {
      data['expenseDescription'] = expenseDescription;
    }
    if (shippingAddressId != null) {
      data['shippingAddressId'] = shippingAddressId;
    }
    if (userId != null) data['userId'] = userId;
    if (requestedLimit != null) data['requestedLimit'] = requestedLimit;
    if (intervalId != null) data['intervalId'] = intervalId;
    if (resetToPreviousLimit != null) {
      data['resetToPreviousLimit'] = resetToPreviousLimit;
    }
    if (isBillPayment != null) data['isBillPayment'] = isBillPayment;
    if (cardPaymentTypeId != null) {
      data['cardPaymentTypeId'] = cardPaymentTypeId;
    }
    return data;
  }
}

@generateCopyWith
class AddCardRequestModelDummy {
  int? cardTypeId;
  String? nickName;
  String? nameOnCard;
  bool? isActiveCardHolder;

  AddCardRequestModelDummy({
    this.cardTypeId,
    this.nickName,
    this.nameOnCard,
    this.isActiveCardHolder,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (cardTypeId != null) data['cardTypeId'] = cardTypeId;
    if (nickName != null) data['nickName'] = nickName;
    if (nameOnCard != null) data['nameOnCard'] = nameOnCard;
    if (isActiveCardHolder != null) {
      data['isActiveCardHolder'] = isActiveCardHolder;
    }

    return data;
  }
}
