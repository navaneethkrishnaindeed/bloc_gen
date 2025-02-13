// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

extension AddCardRequestModelCopyWithExtension on AddCardRequestModel {
  AddCardRequestModel copyWith({
    int? cardTypeId,
    String? nickName,
    String? nameOnCard,
    bool? isActiveCardHolder,
    String? expenseDescription,
    int? shippingAddressId,
    int? userId,
    double? requestedLimit,
    int? intervalId,
    bool? resetToPreviousLimit,
    bool? isBillPayment,
    int? cardPaymentTypeId,
    bool? isRequestedLimitValid,
    bool? isNickNameValid,
    bool? isExpenseDescriptionValid,
    bool? isCardPaymentTypeValid,
  }) {
    return AddCardRequestModel(
      cardTypeId: cardTypeId ?? this.cardTypeId,
      nickName: nickName ?? this.nickName,
      nameOnCard: nameOnCard ?? this.nameOnCard,
      isActiveCardHolder: isActiveCardHolder ?? this.isActiveCardHolder,
      expenseDescription: expenseDescription ?? this.expenseDescription,
      shippingAddressId: shippingAddressId ?? this.shippingAddressId,
      userId: userId ?? this.userId,
      requestedLimit: requestedLimit ?? this.requestedLimit,
      intervalId: intervalId ?? this.intervalId,
      resetToPreviousLimit: resetToPreviousLimit ?? this.resetToPreviousLimit,
      isBillPayment: isBillPayment ?? this.isBillPayment,
      cardPaymentTypeId: cardPaymentTypeId ?? this.cardPaymentTypeId,
      isRequestedLimitValid:
          isRequestedLimitValid ?? this.isRequestedLimitValid,
      isNickNameValid: isNickNameValid ?? this.isNickNameValid,
      isExpenseDescriptionValid:
          isExpenseDescriptionValid ?? this.isExpenseDescriptionValid,
      isCardPaymentTypeValid:
          isCardPaymentTypeValid ?? this.isCardPaymentTypeValid,
    );
  }
}

extension AddCardRequestModelDummyCopyWithExtension
    on AddCardRequestModelDummy {
  AddCardRequestModelDummy copyWith({
    int? cardTypeId,
    String? nickName,
    String? nameOnCard,
    bool? isActiveCardHolder,
  }) {
    return AddCardRequestModelDummy(
      cardTypeId: cardTypeId ?? this.cardTypeId,
      nickName: nickName ?? this.nickName,
      nameOnCard: nameOnCard ?? this.nameOnCard,
      isActiveCardHolder: isActiveCardHolder ?? this.isActiveCardHolder,
    );
  }
}
