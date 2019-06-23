using System;

namespace Messages.Postbridge
{
	public enum MessageFields
	{
		MTI = -1,
		PAN = 2,
		ProcessingCode,
		TransactionAmount,
		SettlementAmount,
		TransmissionDateAndTime = 7,
		SettlementConversionRate = 9,
		SystemsTraceAuditNumber = 11,
		LocalTransactionTime,
		LocalTransactionDate,
		ExpirationDate,
		SettlementDate,
		ConversionDate,
		MerchantType = 18,
		POSEntryMode = 22,
		CardSequenceNumber,
		POSConditionCode = 25,
		POSPINCaptureCode,
		AuthIDResponseLength,
		TransactionFee,
		SettlementFee,
		TransactionProcessingFee,
		SettleProcessingFee,
		AcquiringInstututionID,
		ForwardingInstututionID,
		Track2Data = 35,
		RetrievalReferenceNumber = 37,
		AuthIDResponse,
		ResponseCode,
		ServiceRestrictionCode,
		CardAcceptorTerminalID,
		CardAcceptorID,
		CardAcceptorNameLocation,
		AdditionalResponseData,
		Track1Data,
		AdditionalData = 48,
		TransactionCurrencyCode,
		SettlementCurrencyCode,
		PINData = 52,
		SecurityRelatedControlInformation,
		AdditionalAmounts,
		MessageReasonCode = 56,
		AuthorizationLifeCycleMode,
		AuthorizingAgentIDCode,
		EchoData,
		SettlementCode = 66,
		ExtendedPaymentCode,
		NetworkManagementInformationCode = 70,
		ActionDate = 73,
		CreditNumber,
		CreditReversalsNumber,
		DebitNumber,
		DebitReversalsNumber,
		TransferNumber,
		TransferReversalsNumber,
		InquiriesNumber,
		AuthorizationsNumber,
		CreditsProcessingFeeAmount,
		CreditsTransactionFeeAmount,
		DebitsProcessingFeeAmount,
		DebitsTransactionFeeAmount,
		CreditAmount,
		CreditReversalsAmount,
		DebitAmount,
		DebitReversalAmount,
		OriginalDataElements,
		FileUpdateCode,
		ReplacementAmounts = 95,
		NetSettlementAmount = 97,
		Payee,
		ReceivingInstitutionIDCode = 100,
		FileName,
		Account1,
		Account2,
		PaymentNumber = 118,
		PaymentReversalsNumber,
		POSDataCode = 123,
		NetworkManagementInformation = 125,
		PrivateField = 127,
		MACExtended
	}
}
