USE [POSDashboard]
GO
/****** Object:  StoredProcedure [dbo].[InsupdCreateFleetOwner]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsupdCreateFleetOwner]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCompany]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelCompany]
GO
/****** Object:  StoredProcedure [dbo].[InSupdFleetOwnerRequestDetails]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InSupdFleetOwnerRequestDetails]
GO
/****** Object:  StoredProcedure [dbo].[PSInSupdFleetOwnerRequestDetails]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInSupdFleetOwnerRequestDetails]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelRoutes]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdDelRoutes]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdTypeGroups]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[InsUpdTypeGroups]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdTypes]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[InsUpdTypes]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdLicenseTypes]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdLicenseTypes]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoles]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelRoles]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdelStops]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdelStops]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoutes]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelRoutes]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSubCategory]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelSubCategory]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdUsers]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[InsUpdUsers]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCompanyRoles]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelCompanyRoles]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetAvailability]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelFleetAvailability]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetBTPOS]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelFleetBTPOS]
GO
/****** Object:  StoredProcedure [dbo].[InsupddelFleetDetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsupddelFleetDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRoutes]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelFleetOwnerRoutes]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteStops]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelFleetOwnerRouteStops]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerVehicleLayout]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelFleetOwnerVehicleLayout]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetRoutes]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelFleetRoutes]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetStaff]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelFleetStaff]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFORouteFare]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelFORouteFare]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFORouteFleetSchedule]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelFORouteFleetSchedule]
GO
/****** Object:  StoredProcedure [dbo].[InsupdDelInventoryItem]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsupdDelInventoryItem]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenseDetails]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelLicenseDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSDetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBTPOSDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSFaultsCatageries]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBTPOSFaultsCatageries]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSInventorySales]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBTPOSInventorySales]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSMoitoringPage]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBTPOSMoitoringPage]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSPortSettings]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBTPOSPortSettings]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSRecords]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBTPOSRecords]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSRegistration]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBTPOSRegistration]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSSecheduledUpdates]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBTPOSSecheduledUpdates]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSSheduleUploads]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBTPOSSheduleUploads]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSTrans]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBTPOSTrans]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCarouselImages]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelCarouselImages]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBlocklist]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBlocklist]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBookedSeats]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBookedSeats]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBookingDetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBookingDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSAuditDetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelBTPOSAuditDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetAppUserPaymentModes]    Script Date: 10/16/2017 18:42:13 ******/
DROP PROCEDURE [dbo].[GetAppUserPaymentModes]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelAppUserPaymentModes]    Script Date: 10/16/2017 18:43:33 ******/
DROP PROCEDURE [dbo].[InsUpdDelAppUserPaymentModes]
GO
/****** Object:  StoredProcedure [dbo].[getNotficationConfiguration]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getNotficationConfiguration]
GO
/****** Object:  StoredProcedure [dbo].[GetNotifications]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetNotifications]
GO
/****** Object:  StoredProcedure [dbo].[GetObjectAccesses]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetObjectAccesses]
GO
/****** Object:  StoredProcedure [dbo].[GetObjectHierarchy]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetObjectHierarchy]
GO
/****** Object:  StoredProcedure [dbo].[getObjects]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getObjects]
GO
/****** Object:  StoredProcedure [dbo].[getpalce]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getpalce]
GO
/****** Object:  StoredProcedure [dbo].[HVGetallocatedriver]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVGetallocatedriver]
GO
/****** Object:  StoredProcedure [dbo].[HVGetBookingHistory]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVGetBookingHistory]
GO
/****** Object:  StoredProcedure [dbo].[HVgetClosingReport]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVgetClosingReport]
GO
/****** Object:  StoredProcedure [dbo].[HVgetdriver]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVgetdriver]
GO
/****** Object:  StoredProcedure [dbo].[HVgetdrivermaster]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVgetdrivermaster]
GO
/****** Object:  StoredProcedure [dbo].[HVGetHistory]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVGetHistory]
GO
/****** Object:  StoredProcedure [dbo].[HVgetnearestvehicles]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVgetnearestvehicles]
GO
/****** Object:  StoredProcedure [dbo].[HVGetprebookingdetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVGetprebookingdetails]
GO
/****** Object:  StoredProcedure [dbo].[HVgetprice]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVgetprice]
GO
/****** Object:  StoredProcedure [dbo].[HVGetreport]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVGetreport]
GO
/****** Object:  StoredProcedure [dbo].[HVGetTariff]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVGetTariff]
GO
/****** Object:  StoredProcedure [dbo].[HVgetvehilcetypes]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVgetvehilcetypes]
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdbooking]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVInsUpdbooking]
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdcancelbooking]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVInsUpdcancelbooking]
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdDelClosingReport]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVInsUpdDelClosingReport]
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdDelreport]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVInsUpdDelreport]
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdDelTariff]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVInsUpdDelTariff]
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpddrivers]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVInsUpddrivers]
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdlandmark]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVInsUpdlandmark]
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdMOTPverification]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVInsUpdMOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdtravelling]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVInsUpdtravelling]
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdUserlocations]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVInsUpdUserlocations]
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdVehicles]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[HVInsUpdVehicles]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicensePayments]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelLicensePayments]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicensePricing]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelLicensePricing]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelMenu]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelMenu]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelMOTPverification]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelMOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelmulitiplicationsave]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelmulitiplicationsave]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelInventoryReceivings]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelInventoryReceivings]
GO
/****** Object:  StoredProcedure [dbo].[InsupddelInventorySales]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsupddelInventorySales]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenceCatergories]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelLicenceCatergories]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenceStatus]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelLicenceStatus]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelInventory]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelInventory]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetScheduleList]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelFleetScheduleList]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteFare]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelFleetOwnerRouteFare]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCOUNTRY]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelCOUNTRY]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelEOTPverification]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelEOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelExpenses]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelExpenses]
GO
/****** Object:  StoredProcedure [dbo].[getTransactionDetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getTransactionDetails]
GO
/****** Object:  StoredProcedure [dbo].[getTransactionMaster]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getTransactionMaster]
GO
/****** Object:  StoredProcedure [dbo].[getTransactions]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getTransactions]
GO
/****** Object:  StoredProcedure [dbo].[getTransactionTypes]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getTransactionTypes]
GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingCategories]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getTroubleTicketingCategories]
GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingDetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getTroubleTicketingDetails]
GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingDevice]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getTroubleTicketingDevice]
GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingHandlers]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getTroubleTicketingHandlers]
GO
/****** Object:  StoredProcedure [dbo].[GetTroubleTicketingSlaType]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetTroubleTicketingSlaType]
GO
/****** Object:  StoredProcedure [dbo].[GetTroubleTicketingStatus]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetTroubleTicketingStatus]
GO
/****** Object:  StoredProcedure [dbo].[getTypeGroups]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getTypeGroups]
GO
/****** Object:  StoredProcedure [dbo].[getTypes]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getTypes]
GO
/****** Object:  StoredProcedure [dbo].[GetTypesByGroupId]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetTypesByGroupId]
GO
/****** Object:  StoredProcedure [dbo].[GetULFeatures]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetULFeatures]
GO
/****** Object:  StoredProcedure [dbo].[GetULPymtTransDetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetULPymtTransDetails]
GO
/****** Object:  StoredProcedure [dbo].[Getusercards]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[Getusercards]
GO
/****** Object:  StoredProcedure [dbo].[GetStops]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetStops]
GO
/****** Object:  StoredProcedure [dbo].[GetSubCategories]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetSubCategories]
GO
/****** Object:  StoredProcedure [dbo].[Gettable2]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[Gettable2]
GO
/****** Object:  StoredProcedure [dbo].[GetTicketDetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetTicketDetails]
GO
/****** Object:  StoredProcedure [dbo].[getTicketGeneration]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getTicketGeneration]
GO
/****** Object:  StoredProcedure [dbo].[GetTicketHistory]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetTicketHistory]
GO
/****** Object:  StoredProcedure [dbo].[GetTicketsForCancellation]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetTicketsForCancellation]
GO
/****** Object:  StoredProcedure [dbo].[GetTrackVehicle]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetTrackVehicle]
GO
/****** Object:  StoredProcedure [dbo].[GetUserLicense]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetUserLicense]
GO
/****** Object:  StoredProcedure [dbo].[GetUserLicensePayments]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetUserLicensePayments]
GO
/****** Object:  StoredProcedure [dbo].[GetUserLicensePymtTransactions]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetUserLicensePymtTransactions]
GO
/****** Object:  StoredProcedure [dbo].[GetUserpreferences]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetUserpreferences]
GO
/****** Object:  StoredProcedure [dbo].[GetUserRoles]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetUserRoles]
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetUsers]
GO
/****** Object:  StoredProcedure [dbo].[Getusertickets]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[Getusertickets]
GO
/****** Object:  StoredProcedure [dbo].[getVehicleDetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getVehicleDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetWebsiteUserInfo]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetWebsiteUserInfo]
GO
/****** Object:  StoredProcedure [dbo].[GetZipCode]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetZipCode]
GO
/****** Object:  StoredProcedure [dbo].[InsEditHistory]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsEditHistory]
GO
/****** Object:  StoredProcedure [dbo].[InsEditHistoryDetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsEditHistoryDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsupdAdd]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsupdAdd]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdAppusers]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdAppusers]
GO
/****** Object:  StoredProcedure [dbo].[InsupdBiopw]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsupdBiopw]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdBookedTicket]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdBookedTicket]
GO
/****** Object:  StoredProcedure [dbo].[InsupdCartPaymentDetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsupdCartPaymentDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdCountry]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdCountry]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdwebsiteresetpassword]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[InsUpdwebsiteresetpassword]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdWebsiteUserInfo]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[InsUpdWebsiteUserInfo]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTicketGeneration]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelTicketGeneration]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionDetails]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelTransactionDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionMaster]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelTransactionMaster]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactions]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelTransactions]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionTypes]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelTransactionTypes]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingDetails]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelTroubleTicketingDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingDevice]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelTroubleTicketingDevice]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingHandlers]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelTroubleTicketingHandlers]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingSlaType]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelTroubleTicketingSlaType]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDeltypes]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDeltypes]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelULFeatures]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelULFeatures]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelULPymtTransDetails]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelULPymtTransDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoutesConfiguration]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelRoutesConfiguration]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSalesOrder]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelSalesOrder]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSalesordernw]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelSalesordernw]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSEmailConfiguration]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelSMSEmailConfiguration]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSEmailSubscribers]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelSMSEmailSubscribers]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSGatewayConfiguration]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelSMSGatewayConfiguration]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSProviderConfig]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelSMSProviderConfig]
GO
/****** Object:  StoredProcedure [dbo].[GetPayablesMaster]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetPayablesMaster]
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentCatergory]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetPaymentCatergory]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelObjects]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelObjects]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPasswordverification]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelPasswordverification]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayablesMaster]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelPayablesMaster]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayment]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelPayment]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentCatergory]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelPaymentCatergory]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentGatewaySettings]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelPaymentGatewaySettings]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentGatewayType]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelPaymentGatewayType]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentReceivings]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelPaymentReceivings]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayments]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelPayments]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelplace]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelplace]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelReceivings]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelReceivings]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelReceivingsMaster]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelReceivingsMaster]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelregisterform]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelregisterform]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRegistrationBTPOS]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelRegistrationBTPOS]
GO
/****** Object:  StoredProcedure [dbo].[InsUpDelTroubleTicketingCategories]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpDelTroubleTicketingCategories]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdFaqs]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdFaqs]
GO
/****** Object:  StoredProcedure [dbo].[InSupdFleetOwnerRequest]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InSupdFleetOwnerRequest]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRouteDetails]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelRouteDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsupdInventoryPurchases]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsupdInventoryPurchases]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicense]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelUserLicense]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicenseConfirmDetails]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelUserLicenseConfirmDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicenseDetails]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelUserLicenseDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicensePayments]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelUserLicensePayments]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicensePymtTransactions]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelUserLicensePymtTransactions]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserRoles]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelUserRoles]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelVehicleDetails]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelVehicleDetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelVehicleLayout]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelVehicleLayout]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelZipCode]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelZipCode]
GO
/****** Object:  StoredProcedure [dbo].[MOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[MOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[Passwordreset]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[Passwordreset]
GO
/****** Object:  StoredProcedure [dbo].[Passwordverification]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[Passwordverification]
GO
/****** Object:  StoredProcedure [dbo].[EOTPverification]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[EOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[ChangePwd]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[ChangePwd]
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableServices]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetAvailableServices]
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableServicesWithOptions]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetAvailableServicesWithOptions]
GO
/****** Object:  StoredProcedure [dbo].[GetAvailablevehicles]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetAvailablevehicles]
GO
/****** Object:  StoredProcedure [dbo].[GetBlockList]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBlockList]
GO
/****** Object:  StoredProcedure [dbo].[GetBlockListNew]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBlockListNew]
GO
/****** Object:  StoredProcedure [dbo].[GetBookedHistory]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBookedHistory]
GO
/****** Object:  StoredProcedure [dbo].[GetBookedTicketDetails]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBookedTicketDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetBookingDetails]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBookingDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSAuditDetails]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTPOSAuditDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSDetails]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTPOSDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSDetails1]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTPOSDetails1]
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSFaultsCatageries]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTPOSFaultsCatageries]
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSId]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTPOSId]
GO
/****** Object:  StoredProcedure [dbo].[getBTPOSInventorySales]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[getBTPOSInventorySales]
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSMonitoring]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTPOSMonitoring]
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSPortSettings]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTPOSPortSettings]
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSRecords]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTPOSRecords]
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSRegistration]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTPOSRegistration]
GO
/****** Object:  StoredProcedure [dbo].[GetBTposRoutes]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTposRoutes]
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSSecheduledUpdates]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTPOSSecheduledUpdates]
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSSheduleUploads]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTPOSSheduleUploads]
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSTransactions]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetBTPOSTransactions]
GO
/****** Object:  StoredProcedure [dbo].[GetCarouselImages]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetCarouselImages]
GO
/****** Object:  StoredProcedure [dbo].[GetCartPaymentDetails]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetCartPaymentDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetCategories]
GO
/****** Object:  StoredProcedure [dbo].[getcheckout]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[getcheckout]
GO
/****** Object:  StoredProcedure [dbo].[getClosingReport]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[getClosingReport]
GO
/****** Object:  StoredProcedure [dbo].[getCompanies]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[getCompanies]
GO
/****** Object:  StoredProcedure [dbo].[GetCompanyDetails]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetCompanyDetails]
GO
/****** Object:  StoredProcedure [dbo].[getCompanyRoles]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getCompanyRoles]
GO
/****** Object:  StoredProcedure [dbo].[GetCountries]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetCountries]
GO
/****** Object:  StoredProcedure [dbo].[GetCOUNTRY]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetCOUNTRY]
GO
/****** Object:  StoredProcedure [dbo].[getcurrency]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getcurrency]
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardDetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetDashboardDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetFare]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFare]
GO
/****** Object:  StoredProcedure [dbo].[GetFileContent]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFileContent]
GO
/****** Object:  StoredProcedure [dbo].[GetFileContentAuthentication]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFileContentAuthentication]
GO
/****** Object:  StoredProcedure [dbo].[GetFileContentBTPOSDetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFileContentBTPOSDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetFileContentIndex]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFileContentIndex]
GO
/****** Object:  StoredProcedure [dbo].[GetFileContentRouteFare]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFileContentRouteFare]
GO
/****** Object:  StoredProcedure [dbo].[GetFileContentRoutes]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFileContentRoutes]
GO
/****** Object:  StoredProcedure [dbo].[GetFileContentStops]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFileContentStops]
GO
/****** Object:  StoredProcedure [dbo].[Getfiledetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[Getfiledetails]
GO
/****** Object:  StoredProcedure [dbo].[GetFleetAvailability]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFleetAvailability]
GO
/****** Object:  StoredProcedure [dbo].[GetFleetBtpos]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFleetBtpos]
GO
/****** Object:  StoredProcedure [dbo].[GetFleetDetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFleetDetails]
GO
/****** Object:  StoredProcedure [dbo].[getFleetOwner]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getFleetOwner]
GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRoute]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFleetOwnerRoute]
GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteAssigned]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFleetOwnerRouteAssigned]
GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteDetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFleetOwnerRouteDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteFare]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFleetOwnerRouteFare]
GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteStop]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFleetOwnerRouteStop]
GO
/****** Object:  StoredProcedure [dbo].[GetfleetRoutes]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetfleetRoutes]
GO
/****** Object:  StoredProcedure [dbo].[GetFleetScheduleList]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFleetScheduleList]
GO
/****** Object:  StoredProcedure [dbo].[GetFleetStaff]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFleetStaff]
GO
/****** Object:  StoredProcedure [dbo].[GetFORouteFare]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFORouteFare]
GO
/****** Object:  StoredProcedure [dbo].[getFORVehicleSchedule]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getFORVehicleSchedule]
GO
/****** Object:  StoredProcedure [dbo].[GetFOVehicleFareConfig]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetFOVehicleFareConfig]
GO
/****** Object:  StoredProcedure [dbo].[gethelp]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[gethelp]
GO
/****** Object:  StoredProcedure [dbo].[getInventory]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getInventory]
GO
/****** Object:  StoredProcedure [dbo].[GetInventoryItem]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetInventoryItem]
GO
/****** Object:  StoredProcedure [dbo].[GetInventoryPurchases]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetInventoryPurchases]
GO
/****** Object:  StoredProcedure [dbo].[getInventoryReceivings]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getInventoryReceivings]
GO
/****** Object:  StoredProcedure [dbo].[GetInventorySales]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetInventorySales]
GO
/****** Object:  StoredProcedure [dbo].[GetInventorySubCategories]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetInventorySubCategories]
GO
/****** Object:  StoredProcedure [dbo].[GetInvoices]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetInvoices]
GO
/****** Object:  StoredProcedure [dbo].[GetLicenceCatergories]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetLicenceCatergories]
GO
/****** Object:  StoredProcedure [dbo].[GetLicenceStatus]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetLicenceStatus]
GO
/****** Object:  StoredProcedure [dbo].[GetLicenseConfigDetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetLicenseConfigDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetLicenseDetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetLicenseDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetLicensePageDetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetLicensePageDetails]
GO
/****** Object:  StoredProcedure [dbo].[getLicensePayments]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getLicensePayments]
GO
/****** Object:  StoredProcedure [dbo].[GetLicensePricing]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetLicensePricing]
GO
/****** Object:  StoredProcedure [dbo].[GetLicenseTypes]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetLicenseTypes]
GO
/****** Object:  StoredProcedure [dbo].[getlogin]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getlogin]
GO
/****** Object:  StoredProcedure [dbo].[getloginpage]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getloginpage]
GO
/****** Object:  StoredProcedure [dbo].[getmenu]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getmenu]
GO
/****** Object:  StoredProcedure [dbo].[Getmulitiplicationsave]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[Getmulitiplicationsave]
GO
/****** Object:  StoredProcedure [dbo].[Getnearestvechiles]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[Getnearestvechiles]
GO
/****** Object:  StoredProcedure [dbo].[documents]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[documents]
GO
/****** Object:  StoredProcedure [dbo].[Get LicenceCatergories]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[Get LicenceCatergories]
GO
/****** Object:  StoredProcedure [dbo].[Get TroubleTicketingSlaType]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[Get TroubleTicketingSlaType]
GO
/****** Object:  StoredProcedure [dbo].[GetAlerts]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetAlerts]
GO
/****** Object:  StoredProcedure [dbo].[GetAlertsConfiguration]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetAlertsConfiguration]
GO
/****** Object:  StoredProcedure [dbo].[Getallocatedriver]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[Getallocatedriver]
GO
/****** Object:  StoredProcedure [dbo].[Getalltickets]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[Getalltickets]
GO
/****** Object:  StoredProcedure [dbo].[GetDownloadCount]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetDownloadCount]
GO
/****** Object:  StoredProcedure [dbo].[getEditHistory]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getEditHistory]
GO
/****** Object:  StoredProcedure [dbo].[getEditHistoryDetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getEditHistoryDetails]
GO
/****** Object:  StoredProcedure [dbo].[getExpenses]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getExpenses]
GO
/****** Object:  StoredProcedure [dbo].[getPaymentGatewaySettings]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getPaymentGatewaySettings]
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentGatewayType]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetPaymentGatewayType]
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentHistory]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetPaymentHistory]
GO
/****** Object:  StoredProcedure [dbo].[getPaymentReceivings]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getPaymentReceivings]
GO
/****** Object:  StoredProcedure [dbo].[getPayments]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getPayments]
GO
/****** Object:  StoredProcedure [dbo].[getpaysmart]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getpaysmart]
GO
/****** Object:  StoredProcedure [dbo].[GetPOSDetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetPOSDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetPurchaseOrder]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetPurchaseOrder]
GO
/****** Object:  StoredProcedure [dbo].[GetReceivings]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetReceivings]
GO
/****** Object:  StoredProcedure [dbo].[GetReceivingsMaster]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetReceivingsMaster]
GO
/****** Object:  StoredProcedure [dbo].[Getregister]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[Getregister]
GO
/****** Object:  StoredProcedure [dbo].[getRegistrationBTPOS]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getRegistrationBTPOS]
GO
/****** Object:  StoredProcedure [dbo].[getRoledetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getRoledetails]
GO
/****** Object:  StoredProcedure [dbo].[GetRoleObjectAccesses]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetRoleObjectAccesses]
GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetRoles]
GO
/****** Object:  StoredProcedure [dbo].[getRouteDetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getRouteDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetRouteFare]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetRouteFare]
GO
/****** Object:  StoredProcedure [dbo].[getRoutes]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getRoutes]
GO
/****** Object:  StoredProcedure [dbo].[getRoutesConfiguration]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getRoutesConfiguration]
GO
/****** Object:  StoredProcedure [dbo].[GetSchedules]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetSchedules]
GO
/****** Object:  StoredProcedure [dbo].[GetShippingOrder]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetShippingOrder]
GO
/****** Object:  StoredProcedure [dbo].[getShoppingCart]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getShoppingCart]
GO
/****** Object:  StoredProcedure [dbo].[getSMSEmailConfiguration]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getSMSEmailConfiguration]
GO
/****** Object:  StoredProcedure [dbo].[getSMSEmailSubscribers]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getSMSEmailSubscribers]
GO
/****** Object:  StoredProcedure [dbo].[getSmsGatewayeConfiguration]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getSmsGatewayeConfiguration]
GO
/****** Object:  StoredProcedure [dbo].[GetSMSProviderConfig]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetSMSProviderConfig]
GO
/****** Object:  StoredProcedure [dbo].[Getsp_Availableseats]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[Getsp_Availableseats]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdOnlineTicketTransactions]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdOnlineTicketTransactions]
GO
/****** Object:  StoredProcedure [dbo].[InsupdTroubleTicket]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsupdTroubleTicket]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFares]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[InsUpdDelFares]
GO
/****** Object:  StoredProcedure [dbo].[InsupdUserPreferences]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[InsupdUserPreferences]
GO
/****** Object:  StoredProcedure [dbo].[InsupdUsercard]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[InsupdUsercard]
GO
/****** Object:  StoredProcedure [dbo].[InsupdUserdownloads]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[InsupdUserdownloads]
GO
/****** Object:  StoredProcedure [dbo].[PSbookingdetail]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSbookingdetail]
GO
/****** Object:  StoredProcedure [dbo].[PSChangePwd]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSChangePwd]
GO
/****** Object:  StoredProcedure [dbo].[PSdocuments]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSdocuments]
GO
/****** Object:  StoredProcedure [dbo].[PSGetUserpreferences]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetUserpreferences]
GO
/****** Object:  StoredProcedure [dbo].[PSGetusertickets]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetusertickets]
GO
/****** Object:  StoredProcedure [dbo].[PSGetvechicletypes]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetvechicletypes]
GO
/****** Object:  StoredProcedure [dbo].[PSGetVechlogin]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetVechlogin]
GO
/****** Object:  StoredProcedure [dbo].[PSGetVechlogout]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetVechlogout]
GO
/****** Object:  StoredProcedure [dbo].[PSGetVehicleBookingDetails]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetVehicleBookingDetails]
GO
/****** Object:  StoredProcedure [dbo].[PSgetvehiclemaster]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetvehiclemaster]
GO
/****** Object:  StoredProcedure [dbo].[PSgetvehilcetypes]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetvehilcetypes]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdAdd]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsupdAdd]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdallocatedriver]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdallocatedriver]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdAppDrivers]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdAppDrivers]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdAppusers]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdAppusers]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdBiopw]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsupdBiopw]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdbooking]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdbooking]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelDistanceBasePricing]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdDelDistanceBasePricing]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelEOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdDelEOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelHourBasePricing]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdDelHourBasePricing]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelMOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdDelMOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelPasswordverification]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdDelPasswordverification]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelplace]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdDelplace]
GO
/****** Object:  StoredProcedure [dbo].[PSdrivers]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSdrivers]
GO
/****** Object:  StoredProcedure [dbo].[PSDriversChangePwd]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSDriversChangePwd]
GO
/****** Object:  StoredProcedure [dbo].[PSDriversEOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSDriversEOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[PSDriversInsUpdDelEOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSDriversInsUpdDelEOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[PSDriversInsUpdDelMOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSDriversInsUpdDelMOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[PSDriversInsUpdDelPasswordverification]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSDriversInsUpdDelPasswordverification]
GO
/****** Object:  StoredProcedure [dbo].[PSDriversMOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSDriversMOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[PSDriversMOTPverifying]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSDriversMOTPverifying]
GO
/****** Object:  StoredProcedure [dbo].[PSDriversPasswordreset]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSDriversPasswordreset]
GO
/****** Object:  StoredProcedure [dbo].[PSDriversPasswordverification]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSDriversPasswordverification]
GO
/****** Object:  StoredProcedure [dbo].[PSDriversRetrivePassword]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSDriversRetrivePassword]
GO
/****** Object:  StoredProcedure [dbo].[PSDriversValidateCredentials]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSDriversValidateCredentials]
GO
/****** Object:  StoredProcedure [dbo].[PSEOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSEOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[PSGetalltickets]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetalltickets]
GO
/****** Object:  StoredProcedure [dbo].[PSGetAllUserTickets]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetAllUserTickets]
GO
/****** Object:  StoredProcedure [dbo].[PSGetAvailableServices]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetAvailableServices]
GO
/****** Object:  StoredProcedure [dbo].[PSGetAvailablevehicles]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetAvailablevehicles]
GO
/****** Object:  StoredProcedure [dbo].[PSGetBookedHistory]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetBookedHistory]
GO
/****** Object:  StoredProcedure [dbo].[PSGetBookingHistory]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetBookingHistory]
GO
/****** Object:  StoredProcedure [dbo].[PSgetcountry]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetcountry]
GO
/****** Object:  StoredProcedure [dbo].[PSgetcurrency]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetcurrency]
GO
/****** Object:  StoredProcedure [dbo].[PSgetdetails]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetdetails]
GO
/****** Object:  StoredProcedure [dbo].[PSGetDistanceBasePricing]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetDistanceBasePricing]
GO
/****** Object:  StoredProcedure [dbo].[PSGetDownloadCount]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetDownloadCount]
GO
/****** Object:  StoredProcedure [dbo].[PSgetdriver]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetdriver]
GO
/****** Object:  StoredProcedure [dbo].[PSGetDriverLogin]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetDriverLogin]
GO
/****** Object:  StoredProcedure [dbo].[PSgetdrivermaster]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetdrivermaster]
GO
/****** Object:  StoredProcedure [dbo].[PSGetfaqs]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetfaqs]
GO
/****** Object:  StoredProcedure [dbo].[PSGetFileContent]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetFileContent]
GO
/****** Object:  StoredProcedure [dbo].[PSGetfiledetails]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetfiledetails]
GO
/****** Object:  StoredProcedure [dbo].[PSgethelp]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgethelp]
GO
/****** Object:  StoredProcedure [dbo].[PSGetHistory]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetHistory]
GO
/****** Object:  StoredProcedure [dbo].[PSGetHourBasePricing]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetHourBasePricing]
GO
/****** Object:  StoredProcedure [dbo].[PSgetlogin]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetlogin]
GO
/****** Object:  StoredProcedure [dbo].[PSgetnearestvehicles]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetnearestvehicles]
GO
/****** Object:  StoredProcedure [dbo].[PSgetpalce]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetpalce]
GO
/****** Object:  StoredProcedure [dbo].[PSgetpaysmart]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetpaysmart]
GO
/****** Object:  StoredProcedure [dbo].[PSgetprice]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetprice]
GO
/****** Object:  StoredProcedure [dbo].[PSgetRoutes]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgetRoutes]
GO
/****** Object:  StoredProcedure [dbo].[PSGetsp_Availableseats]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetsp_Availableseats]
GO
/****** Object:  StoredProcedure [dbo].[PSGetstops]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetstops]
GO
/****** Object:  StoredProcedure [dbo].[PSGetTicketDetails]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetTicketDetails]
GO
/****** Object:  StoredProcedure [dbo].[PSGetTicketHistory]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetTicketHistory]
GO
/****** Object:  StoredProcedure [dbo].[PSGettickets]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGettickets]
GO
/****** Object:  StoredProcedure [dbo].[PSgettypes]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSgettypes]
GO
/****** Object:  StoredProcedure [dbo].[PSGetusercards]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetusercards]
GO
/****** Object:  StoredProcedure [dbo].[RetrivePassword]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[RetrivePassword]
GO
/****** Object:  StoredProcedure [dbo].[RetriveWebSitePassword]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[RetriveWebSitePassword]
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsTypeGroups]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[Sp_InsTypeGroups]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDeltypes]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdDeltypes]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDriverLogin]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdDriverLogin]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdFaqs]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsUpdFaqs]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdTroubleTicket]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsupdTroubleTicket]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUsercard]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsupdUsercard]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUserdownloads]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSInsupdUserdownloads]
GO
/****** Object:  StoredProcedure [dbo].[PSVehicles]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSVehicles]
GO
/****** Object:  StoredProcedure [dbo].[registerbtpos]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[registerbtpos]
GO
/****** Object:  StoredProcedure [dbo].[ValidateCredentials]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[ValidateCredentials]
GO
/****** Object:  StoredProcedure [dbo].[ValidateFleetOwnerCode]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[ValidateFleetOwnerCode]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUserPreferences]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSInsupdUserPreferences]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdVechlogin]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSInsUpdVechlogin]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdVechlogout]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSInsUpdVechlogout]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdVehicleBookingDetails]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSInsUpdVehicleBookingDetails]
GO
/****** Object:  StoredProcedure [dbo].[PSMOTPverification]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSMOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[PSMOTPverifying]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSMOTPverifying]
GO
/****** Object:  StoredProcedure [dbo].[PSPasswordreset]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSPasswordreset]
GO
/****** Object:  StoredProcedure [dbo].[PSPasswordverification]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSPasswordverification]
GO
/****** Object:  StoredProcedure [dbo].[PSprebookingdetails]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSprebookingdetails]
GO
/****** Object:  StoredProcedure [dbo].[PSRetrivePassword]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSRetrivePassword]
GO
/****** Object:  StoredProcedure [dbo].[PSTrackVehicleHistory]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSTrackVehicleHistory]
GO
/****** Object:  StoredProcedure [dbo].[PStravelling]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PStravelling]
GO
/****** Object:  StoredProcedure [dbo].[PSUserlocations]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSUserlocations]
GO
/****** Object:  StoredProcedure [dbo].[PSValidateCred]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSValidateCred]
GO
/****** Object:  StoredProcedure [dbo].[PSValidateCredentials]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSValidateCredentials]
GO
/****** Object:  StoredProcedure [dbo].[PSValidateFleetOwnerCode]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSValidateFleetOwnerCode]
GO
/****** Object:  StoredProcedure [dbo].[updatebtpos]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[updatebtpos]
GO
/****** Object:  StoredProcedure [dbo].[VehicleConfiguration]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[VehicleConfiguration]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsPassengerDetails]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[sp_InsPassengerDetails]
GO
/****** Object:  StoredProcedure [dbo].[PSSTARTBOOKING_VALUE]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSSTARTBOOKING_VALUE]
GO
/****** Object:  StoredProcedure [dbo].[WebsiteValidateCredentials]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[WebsiteValidateCredentials]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsPaymentDetails]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[sp_InsPaymentDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsPnrDetails]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[sp_InsPnrDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsPnrToSeats]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[sp_InsPnrToSeats]
GO
/****** Object:  StoredProcedure [dbo].[getUserdetails]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getUserdetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDeluserdetails]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDeluserdetails]
GO
/****** Object:  StoredProcedure [dbo].[InsupdUserinfo]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[InsupdUserinfo]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUserinfo]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSInsupdUserinfo]
GO
/****** Object:  StoredProcedure [dbo].[GetUserinfo]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[GetUserinfo]
GO
/****** Object:  StoredProcedure [dbo].[PSGetUserinfo]    Script Date: 08/04/2017 19:28:14 ******/
DROP PROCEDURE [dbo].[PSGetUserinfo]
GO
/****** Object:  StoredProcedure [dbo].[PSsp_addextendedproc]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSsp_addextendedproc]
GO
/****** Object:  StoredProcedure [dbo].[PSsp_dropextendedproc]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSsp_dropextendedproc]
GO
/****** Object:  StoredProcedure [dbo].[PSsp_InsPaymentDetails]    Script Date: 08/04/2017 19:28:15 ******/
DROP PROCEDURE [dbo].[PSsp_InsPaymentDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetSTATE]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetSTATE]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSTATE]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelSTATE]
GO
/****** Object:  StoredProcedure [dbo].[getTrans]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[getTrans]
GO
/****** Object:  StoredProcedure [dbo].[getdetails]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getdetails]
GO
/****** Object:  StoredProcedure [dbo].[getfaqs]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[getfaqs]
GO
/****** Object:  StoredProcedure [dbo].[GetAuditDetails]    Script Date: 08/04/2017 19:28:10 ******/
DROP PROCEDURE [dbo].[GetAuditDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetNOCBTPOSTracking]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetNOCBTPOSTracking]
GO
/****** Object:  StoredProcedure [dbo].[Insupddelfaqs]    Script Date: 08/04/2017 19:28:12 ******/
DROP PROCEDURE [dbo].[Insupddelfaqs]
GO
/****** Object:  StoredProcedure [dbo].[GetPayables]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetPayables]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayables]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelPayables]
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentgateway]    Script Date: 08/04/2017 19:28:11 ******/
DROP PROCEDURE [dbo].[GetPaymentgateway]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentgateway]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelPaymentgateway]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelNOCBTPOSTracking]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelNOCBTPOSTracking]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoledetails]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelRoledetails]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelObjectAccess]    Script Date: 08/04/2017 19:28:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelObjectAccess]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelObjectAccess]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelObjectAccess](@Id int,
@ObjectId int,
@AccessId int,@Name varchar(50))

as
begin
insert into ObjectAccess (ObjectId,AccessId,Name) values(@ObjectId,@AccessId,@Name)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoledetails]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsUpdDelRoledetails](@Id int,

@ObjectName varchar(50),
@Path varchar(50)
)
as
begin
insert into Object (ObjectName,Path) values(@ObjectName, @Path)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelNOCBTPOSTracking]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelNOCBTPOSTracking](@Id numeric(10),              
           @BTPOSId numeric(10),
           @Xcord varchar(50),
           @Ycord Varchar(50),
           @Time varchar(20),
           @Date Datetime)
AS
BEGIN
	

INSERT INTO 
[NOCBTPOSTracking] VALUES
           (@Id,
              
           @BTPOSId,
           @Xcord,
           @Ycord,
           @Time,
           @Date)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentgateway]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelPaymentgateway](@Id numeric(20),
           @ProviderName varchar(20),
           @BTPOSGRPID VARCHAR(20),
           @Active numeric(20),
           @userId numeric(20),
           @Passkey varchar(20),
           @Url varchar(20),
           @Testurl varchar(20),
           @Salt varchar(20),
           @Hash varchar(20),
           @PaymentGatwayTypeId varchar(20))
AS
BEGIN
	

INSERT INTO 
[Paymentgateway] VALUES
           (@Id,
           @ProviderName,
           @BTPOSGRPID,
           @Active,
           @userId,
           @Passkey,
           @Url,
           @Testurl,
           @Salt,
           @Hash,
           @PaymentGatwayTypeId)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentgateway]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPaymentgateway]
AS
BEGIN
	
select * from Paymentgateway
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayables]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelPayables](@Id numeric(30),
           @Amount VARCHAR(50),
           @MasterId numeric(30),
           @Paidby varchar(50))
AS
BEGIN
	

INSERT INTO 
[Payables] VALUES
           (@Id, 
          @Amount,
           @MasterId,
           @Paidby)
          
   
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPayables]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPayables]
AS
BEGIN
	
select * from Payables
end
GO
/****** Object:  StoredProcedure [dbo].[Insupddelfaqs]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Insupddelfaqs]
@flag varchar,@id int=-1,@question varchar(250),@answer varchar(1000),@createdon varchar(50),@createdby varchar(50),@updatedon datetime,@updatedby varchar(50),@active int,@category int
  as
begin
if @flag='I'
begin
insert into POSDashboard.dbo.faqs
([question],[answer],[createdon],[createdby],[updatedon],[updatedby],[active],[category])
values
(@question,@answer,@createdon,@createdby,@updatedon,@updatedby,@active,@category)
end
if @flag='U'
begin
update POSDashboard.dbo.faqs
set[question]=@question ,
   [answer]=@answer ,
   [createdon]= @createdon,
   [createdby]=@createdby,
   [updatedon]=@updatedon,
   [updatedby]=@updatedby,
   [active]=@active,
   [category]=@category
   where id=@id
   end
   if @flag='D'
   begin
   delete from faqs
   where id=@id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[GetNOCBTPOSTracking]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetNOCBTPOSTracking]
AS
BEGIN
	
select * from NOCBTPOSTracking
end
GO
/****** Object:  StoredProcedure [dbo].[GetAuditDetails]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAuditDetails]
AS
BEGIN
	
select * from AuditDetails
end
GO
/****** Object:  StoredProcedure [dbo].[getfaqs]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getfaqs]
as
begin
select * from faqs
end
GO
/****** Object:  StoredProcedure [dbo].[getdetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getdetails]
as
begin
select*from uer
end
GO
/****** Object:  StoredProcedure [dbo].[getTrans]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getTrans]
as
begin
select * from Trans 
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSTATE]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelSTATE](@Id NUMERIC(10),
           @Name VARCHAR(20),
           @Count VARCHAR(20),
           @Code VARCHAR(20),
           @Active varchar(20))
AS
BEGIN
	

INSERT INTO 
[STATE] VALUES
           (@Id,
           @Name,
           @Count,
           @Code,
           @Active)
	END
GO
/****** Object:  StoredProcedure [dbo].[GetSTATE]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSTATE]
AS
BEGIN
	
select * from STATE
end
GO
/****** Object:  StoredProcedure [dbo].[PSsp_InsPaymentDetails]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSsp_InsPaymentDetails] 
	 (
      @Transaction_Number varchar(30)=null
      ,@Amount int=null,
      @Paymentmode int=null,@dateandtime datetime=null,@Gateway_transId varchar(20)=null,@Pnr_Id int=null
      ,@Pnr_No varchar(20)=null, @TransactionStatus int
      )
AS
BEGIN
	
	SET NOCOUNT ON;
INSERT INTO PaymentDetails
(Transaction_Number,Amount,Paymentmode,dateandtime,Pnr_Id,Pnr_No,Gateway_transId,TransactionStatus) 
     VALUES 
(@Transaction_Number,@Amount,@Paymentmode,@dateandtime,@Pnr_Id,@Pnr_No,@Gateway_transId,@TransactionStatus)  	
END
GO
/****** Object:  StoredProcedure [dbo].[PSsp_dropextendedproc]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create procedure [dbo].[PSsp_dropextendedproc] 
@functname nvarchar(517) -- name of function 
as 
-- If we're in a transaction, disallow the dropping of the 
-- extended stored procedure. 
set implicit_transactions off 
if @@trancount > 0 
begin 
raiserror(15002,-1,-1,'sys.sp_dropextendedproc') 
return (1) 
end 

-- Drop the extended procedure mapping. 
dbcc dropextendedproc( @functname ) 
return (0) -- sp_dropextendedproc
GO
/****** Object:  StoredProcedure [dbo].[PSsp_addextendedproc]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create procedure [dbo].[PSsp_addextendedproc] --- 1996/08/30 20:13
@functname nvarchar(517),/* (owner.)name of function to call */
@dllname varchar(255)/* name of DLL containing function */
as
set implicit_transactions off
if @@trancount > 0
begin
raiserror(15002,-1,-1,'sp_addextendedproc')
return (1)
end
dbcc addextendedproc( @functname, @dllname)
return (0) -- sp_addextendedproc
GO
/****** Object:  StoredProcedure [dbo].[PSGetUserinfo]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetUserinfo]
as
begin
select * from dbo.Userinfo
end
GO
/****** Object:  StoredProcedure [dbo].[GetUserinfo]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserinfo]
as
begin
select * from dbo.Userinfo
end
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUserinfo]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsupdUserinfo]
@flag varchar,@id int, @Firstname varchar(20),@lastname varchar(20),@username varchar(20),@Emailid varchar(50),@Phonenumber varchar(20),@Mobileotp varchar(5),@Emailotp varchar(5),@Pwdotp varchar(5),@Password varchar(20),@statusId int,@AccountNo varchar(50),@AuthTypeId int,@AltPhonenumber varchar(20),@Altemail varchar(50)
as
begin
if @flag ='I'
begin
Insert into UserInfo
([Firstname],[lastname],[username],[Emailid],[Phonenumber],[Mobileotp],[Emailotp],[Pwdotp],[Password],[statusId],[AccountNo],[AuthTypeId],[AltPhonenumber],[Altemail])
values
(@Firstname,@lastname,@username,@Emailid,@Phonenumber,@Mobileotp,@Emailotp,@Pwdotp,@Password,@statusId,@AccountNo,@AuthTypeId,@AltPhonenumber,@Altemail)
end
if @flag ='U'
begin
update dbo.UserInfo
set[Firstname]=@Firstname,
   [lastname]=@lastname,
   [Emailid]=@Emailid,
   [Phonenumber]=@Phonenumber,
   [Mobileotp]=@Mobileotp,
   [Emailotp]=@Emailotp,
   [Pwdotp]=@Pwdotp,
   [Password]=@Password,
   [statusId]=@statusId,
   [AccountNo]=@AccountNo,
   [AuthTypeId]=@AuthTypeId,
   [AltPhonenumber]=@AltPhonenumber,
   [Altemail]=@Altemail
   where id=@id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[InsupdUserinfo]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsupdUserinfo]
@flag varchar,@id int, @Firstname varchar(20),@lastname varchar(20),@username varchar(20),@Emailid varchar(50),@Phonenumber varchar(20),@Mobileotp varchar(5),@Emailotp varchar(5),@Pwdotp varchar(5),@Password varchar(20),@statusId int,@AccountNo varchar(50),@AuthTypeId int,@AltPhonenumber varchar(20),@Altemail varchar(50)
as
begin
if @flag ='I'
begin
Insert into UserInfo
([Firstname],[lastname],[username],[Emailid],[Phonenumber],[Mobileotp],[Emailotp],[Pwdotp],[Password],[statusId],[AccountNo],[AuthTypeId],[AltPhonenumber],[Altemail])
values
(@Firstname,@lastname,@username,@Emailid,@Phonenumber,@Mobileotp,@Emailotp,@Pwdotp,@Password,@statusId,@AccountNo,@AuthTypeId,@AltPhonenumber,@Altemail)
end
if @flag ='U'
begin
update dbo.UserInfo
set[Firstname]=@Firstname,
   [lastname]=@lastname,
   [Emailid]=@Emailid,
   [Phonenumber]=@Phonenumber,
   [Mobileotp]=@Mobileotp,
   [Emailotp]=@Emailotp,
   [Pwdotp]=@Pwdotp,
   [Password]=@Password,
   [statusId]=@statusId,
   [AccountNo]=@AccountNo,
   [AuthTypeId]=@AuthTypeId,
   [AltPhonenumber]=@AltPhonenumber,
   [Altemail]=@Altemail
   where id=@id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDeluserdetails]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDeluserdetails]
@flag varchar,@Id int ,@username varchar(50),@Accountnumber varchar(50),@balance varchar(50),@expirydate datetime,@startdate datetime,@status int
as
begin
if @flag='i'
begin
insert into [POSDashboard].[dbo].[Userdetails]

([username],[Accountnumber],[balance] ,[expirydate] ,[startdate],[status])
values
 
(@username,@Accountnumber,@balance,@expirydate,@startdate,@status)
end
if @flag='u'
begin
update [POSDashboard].[dbo].[Userdetails]
set[username]=@username,
[Accountnumber]=@Accountnumber,
[balance]=@balance,
[expirydate]=@expirydate,
[startdate]=@startdate,
[status]=@status
where Id=@Id
end
if @flag='d'
begin
delete from [POSDashboard].[dbo].[Userdetails]
where Id=@Id
end
end
GO
/****** Object:  StoredProcedure [dbo].[getUserdetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getUserdetails]
as
begin
select * from Userdetails 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsPnrToSeats]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsPnrToSeats]
      @Pnr_ID int,
      @Pnr_No varchar(20),@SeatNo varchar(20), @Date varchar(20),@VehicleNo int=null, @SeatId int
      AS
BEGIN
	
	SET NOCOUNT ON;
INSERT INTO PnrToSeats
          (Pnr_ID,Pnr_No,SeatNo,VehicleNo,Date,SeatId) 
     VALUES 
          (@Pnr_ID,@Pnr_No,@SeatNo,@VehicleNo,@Date,@SeatId)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsPnrDetails]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsPnrDetails] 
	 
      @Pnr_No varchar(20) = null,
      @No_Seats int  = null,
      @cost int  = null,
      @dateandtime varchar(30)=null,
      @src varchar(30)= null,
      @dest varchar(30) = null,
      @vehicle_No varchar(20) = null,
      @JourneyDate varchar(30)=null,
      @ArrivalTime varchar(30)=null,
      @DeptTime varchar(30)=null,
      @RouteId int=null,
      @fleetOwnerId int=null,
      @JourneyType int,
      @AuthCode varchar(10),
      @LastInsPnrID INT OUTPUT
AS
BEGIN
declare @startId int
	SET NOCOUNT ON
INSERT INTO PnrDetails
          (Pnr_No,No_Seats,cost,dateandtime,src,dest,vehicle_No,JourneyDate, ArrivalTime, 
DeptTime,fleetOwnerId,RouteId,JourneyType,AuthCode) 
     VALUES 
          (@Pnr_No,@No_Seats,@cost,@dateandtime,@src,@dest,@vehicle_No,@JourneyDate, @ArrivalTime, 
@DeptTime,@fleetOwnerId,@RouteId,@JourneyType,@AuthCode) 
          
          SELECT @LastInsPnrID = SCOPE_IDENTITY()
         	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsPaymentDetails]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsPaymentDetails] 
	 (
      @Transaction_Number varchar(30)=null
      ,@Amount int=null,
      @Paymentmode int=null,@dateandtime datetime=null,@Gateway_transId varchar(20)=null,@Pnr_Id int=null
      ,@Pnr_No varchar(20)=null, @TransactionStatus int
      )
AS
BEGIN
	
	SET NOCOUNT ON;
INSERT INTO PaymentDetails
(Transaction_Number,Amount,Paymentmode,dateandtime,Pnr_Id,Pnr_No,Gateway_transId,TransactionStatus) 
     VALUES 
(@Transaction_Number,@Amount,@Paymentmode,@dateandtime,@Pnr_Id,@Pnr_No,@Gateway_transId,@TransactionStatus)  	
END
GO
/****** Object:  StoredProcedure [dbo].[WebsiteValidateCredentials]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[WebsiteValidateCredentials](@logininfo varchar(50) = null, @passkey varchar(50) = null,
@userTypeId int = -1)
as
begin

SELECT [Id]
      ,[FirstName]
      ,[LastName]
      ,[UserName]
      ,[EmailAddress]
      ,[Password]
      ,[Mobile]
      ,[Gender]
      ,[UserTypeId]
      ,[UserId]
      ,[Active]
      ,[IsEmailVerified]
      ,[CreatedOn]
      ,[EVerificationCode]
      ,[EVerifiedOn]
      ,[ENoOfAttempts]
      ,[MVerificationCode]
      ,[MVerifiedOn]
      ,[MNoOfAttempts]
      ,[isMobileVerified]
  FROM [dbo].[WebsiteUserInfo]  
  where ((UserName = @logininfo or EmailAddress = @logininfo
   or Mobile = @logininfo)
  and ([Password] = @passkey))
  and (@userTypeId = -1 or UserTypeId = @userTypeId)

end



/****** Object:  Table [dbo].[ResetPassword]    Script Date: 06/07/2016 19:40:00 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[PSSTARTBOOKING_VALUE]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSSTARTBOOKING_VALUE]
  (
    @EntryDate datetime,
    @BookingType nvarchar(20),
    @ReqDate datetime,
    @Reqtime time,
    @Calltime time,
    @ReqVehicle nvarchar(20),
    @Customername nvarchar(50),
    @CusID nvarchar(20),
    @PhoneNo nvarchar(20),
    @PickupAddress nvarchar(255),
    @LandMark nvarchar(255),
    @Package nvarchar(255),
    @PickupPalce nvarchar(255),
    @DropPalce nvarchar(255),
    @ExtraCharge INT,
    @NoofVehicle INT,
    @ExecutiveName nvarchar(50),
    @RETURNVALUE INT =0 OUT
  )
  AS
    DECLARE @COUNT INT
    DECLARE @BNO INT
    DECLARE @BNO_CHILD decimal(18,1)
    DECLARE @CBNO nvarchar(5)
    
  BEGIN
  SELECT @COUNT=COUNT(*)+1 FROM StartBooking WHERE ReqDate=@ReqDate;
  SELECT @BNO=MAX(BNo)+1 FROM StartBooking WHERE ReqDate=@ReqDate;
    --SET @BNO=@COUNT;
   if (@COUNT =1)
	  begin
	 	set @COUNT=500;
	 	set @BNO=500;
	 end
    IF(@NoofVehicle =1)
             BEGIN
  
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@BNO,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO);    

              SET @RETURNVALUE = @BNO;
                               
               RETURN @RETURNVALUE
              END
       ELSE IF(@NoofVehicle =2)
            BEGIN
              SET @CBNO=cast(@BNO as varchar) +'.1';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
              SET @CBNO=cast(@BNO as varchar)+'.2';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
               SET @RETURNVALUE = @BNO;
               RETURN @RETURNVALUE
           END
           ELSE IF(@NoofVehicle =3)
            BEGIN
              SET @CBNO=cast(@BNO as varchar) +'.1';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
              SET @CBNO=cast(@BNO as varchar)+'.2';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
              SET @CBNO=cast(@BNO as varchar)+'.3';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
              
               SET @RETURNVALUE = @BNO;
               RETURN @RETURNVALUE
           END
           ELSE IF(@NoofVehicle =4)
            BEGIN
              SET @CBNO=cast(@BNO as varchar) +'.1';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
              SET @CBNO=cast(@BNO as varchar)+'.2';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
              SET @CBNO=cast(@BNO as varchar)+'.3';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
              SET @CBNO=cast(@BNO as varchar)+'.4';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
               SET @RETURNVALUE = @BNO;
               RETURN @RETURNVALUE
           END
		ELSE IF(@NoofVehicle =5)
            BEGIN
              SET @CBNO=cast(@BNO as varchar) +'.1';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
              SET @CBNO=cast(@BNO as varchar)+'.2';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
              SET @CBNO=cast(@BNO as varchar)+'.3';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
              SET @CBNO=cast(@BNO as varchar)+'.4';
              SET @BNO_CHILD=CAST(@CBNO AS decimal(18,1));
              Insert into StartBooking(EntryDate,BNo,BookingType,ReqDate,ReqTime,CallTime,ReqVehicle,Customername,CusID,PhoneNo,PickupAddress,LandMark,Package,PickupPalce,DropPalce,ExtraCharge,NoofVehicle,ExecutiveName,BookingStatus,CBNo)values(@EntryDate,@Bno,@BookingType,@ReqDate,@ReqTime,@CallTime,@ReqVehicle,@Customername,@CusID,@PhoneNo,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ExtraCharge,@NoofVehicle,@ExecutiveName,'Book',@BNO_CHILD);
               SET @RETURNVALUE = @BNO;
               RETURN @RETURNVALUE
           END
       END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsPassengerDetails]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsPassengerDetails] 
	 
     @Pnr_No varchar(20),@Pnr_Id int,
     @Fname varchar(30),@Lname varchar(30), @Age int, @Sex int,@datetime varchar(30), @Identityproof 
varchar(30)
AS
BEGIN
	
	SET NOCOUNT ON;
INSERT INTO PassengerDetails
          (Fname,Lname,Age,Sex,datetime,Pnr_Id,Pnr_No,Identityproof) 
     VALUES 
          (@Fname,@Lname,@Age,@Sex,@datetime,@Pnr_Id,@Pnr_No,@Identityproof) 
END
GO
/****** Object:  StoredProcedure [dbo].[VehicleConfiguration]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VehicleConfiguration]	
	@needRoutes int =0,
	@needRoles int =0,		
	@needvehicleRegno int = 0,
	@needvehicleType int = 0,    
    @needServiceType int = 0,
    @needfleetowners int =0,
    @needCompanyName int = 0,
    @needVehicleLayout int = 0, 
    @needHireVehicle int =0,   
    @needbtpos int = 0,
    @cmpId int = -1,
    @fleetownerId int = -1,
    @needFleetOwnerRoutes int = -1,
    @needvehicleMake int =0,
    @needVehicleGroup int =0
AS
BEGIN
	

	if @needRoutes  = 1
	select routename,ID,Code from routes order by routename

	if @needRoles  = 1 
	select name,ID from Roles order by name
		
	if @needvehicleRegno  = 1
    select VehicleRegNo,Id from FleetDetails
    where ((fleetownerid = @fleetownerId or @fleetownerid =-1)
    and (CompanyId = @cmpId or @cmpId = -1))
    order by VehicleRegNo
		
	--vehicle type data
	if @needvehicleType = 1
	select Name, Id from Types where TypeGroupId = 4 order by Name
	
	--vehicle Model data
	if @needvehicleMake = 1
	select Name, Id from Types where TypeGroupId = 10 order by Name
		
	--service type data
	if @needServiceType = 1
	select Name, Id from Types where TypeGroupId = 5 order by Name
	
	--Vehicle Group type data
	if @needVehicleGroup  = 1
	select Name, Id from Types where TypeGroupId = 11 order by Name
	
	--fleet owners
	if @needfleetowners = 1
	select u.FirstName+' '+u.LastName as Name,
	c.Name as CompanyName
	,FO.FleetOwnerCode
	,FO.CompanyId
	,FO.Id
	,FO.UserId
	 from FleetOwner FO
	inner join Users u on  u.Id = FO.UserId
	inner join Company c on c.Id = FO.companyId
    where (FO.companyId = @cmpId or @cmpId =-1)
	order by u.FirstName,u.LastName
	
	--companys
	if @needCompanyName = 1
	select Name,Id from Company order by Name
	
	--vehicle layout type
	if @needVehicleLayout = 1
	select Name, Id from Types where TypeGroupId = 6 order by Name
	
	if @needbtpos = 1		
SELECT b.[Id]
      ,b.POSID            
      ,[IMEI]
      ,[ipconfig]
      ,b.[active]
      ,fleetownerid
  FROM [POSDashboard].[dbo].[BTPOSDetails] b
  where (fleetownerid = @fleetownerId or @fleetownerid =-1)
order by POSID
	 
if @needHireVehicle = 1
select VehicleRegNo,Id from FleetDetails
    where ((fleetownerid = @fleetownerId or @fleetownerid =-1) 
    and (servicetypeId = 11))
	order by VehicleRegNo
	
	if @needFleetOwnerRoutes = 1
	SELECT 
      fr.[Id]
      ,fr.[FleetOwnerId]
      ,fr.[CompanyId]
      ,r.routename
      ,r.code
      ,r.[Id] RouteId
      ,src.name Source
      ,dest.name Destination
      ,[FromDate]
      ,[ToDate]
      ,fr.[Active]     
  FROM routes r
inner join stops src on src.id = r.sourceid
inner join stops dest on dest.id = r.destinationid
inner join [POSDashboard].[dbo].[FleetOwnerRoute] fr on r.id = fr.routeid
 inner join fleetowner f on f.id = fr.fleetownerid 
  inner join users u on f.userid = u.id 
  where f.Id = @fleetownerId
order by routename
	
END
GO
/****** Object:  StoredProcedure [dbo].[updatebtpos]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updatebtpos]
	@fleetownercode varchar(15),
	@units int,
	@result int out 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	declare @fleetownerid int
	declare @cmpid int
	
	select @fleetownerid = userID from FleetOwner where UPPER(FleetOwnerCode) = UPPER(@fleetownercode)
	
	select @cmpid = CompanyId from Users where Id = @fleetownerid
	
	UPDATE BTPOSDetails
        SET FleetOwnerId = @fleetownerid
        ,CompanyId = @cmpid
    FROM BTPOSDetails
    INNER JOIN (
        SELECT TOP(@units) ID FROM BTPOSDetails WHERE FleetOwnerId = 1
         ORDER BY ID
    ) AS InnerMyTable ON BTPOSDetails.ID = InnerMyTable.ID
	
	select @result = COUNT(*) from FleetOwner where UPPER(FleetOwnerCode) = UPPER(@fleetownercode)

    -- Insert statements for procedure here
	return @result
END
GO
/****** Object:  StoredProcedure [dbo].[PSValidateFleetOwnerCode]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PSValidateFleetOwnerCode]
	@fleetownercode varchar(15),
	@result int out 
AS
BEGIN
declare @fid int = 0


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	select @fid = id from FleetOwner where UPPER(ltrim(rtrim(FleetOwnerCode))) = UPPER(ltrim(rtrim(@fleetownercode)))
	
	if @fid is not null
	begin	
	select f.id foid, u.id userid, f.FleetOwnerCode from FleetOwner f inner join Users u on f.UserId = u.Id and UPPER(FleetOwnerCode) = UPPER(@fleetownercode)
			
	SELECT [Id]
      ,[UserId]
      ,[FOId]
      ,[LicenseTypeId]
      ,[StartDate]
      ,[ExpiryOn]
      ,[GracePeriod]
      ,[ActualExpiry]
      ,[LastUpdatedOn]
      ,[Active]
      ,[StatusId]
      ,[RenewFreqTypeId]
    FROM [dbo].[UserLicense] ul
    where ul.foid = @fid
    	
	end
	
    Set @result = @fid    
    -- Insert statements for procedure here
	return @result
END
GO
/****** Object:  StoredProcedure [dbo].[PSValidateCredentials]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSValidateCredentials]
@Mobilenumber varchar(20),@Password varchar(50)
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Mobilenumber',16,1);
				return;
   end
   
select @cnt = COUNT(*) from Appusers where Password = @Password

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Password or mobile number',16,1);
				return;
   end
else

begin

  select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Password = @Password 
  if @cnt = 1
	begin
	
	select
	[Id]
      ,[Username]
      ,[Email]
      ,[Mobilenumber]    
      ,[StatusId]     
      ,[Firstname]
      ,[lastname]
      ,[AuthTypeId]
      from Appusers where Mobilenumber = @Mobilenumber and Password = @Password   		
	
	end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSValidateCred]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSValidateCred]
@Mobilenumber varchar(20),@Password varchar(50)
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Mobilenumber',16,1);
				return;
   end
   
select @cnt = COUNT(*) from Appusers where Password = @Password

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Password or mobile number',16,1);
				return;
   end
else

begin

  select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Password = @Password 
  if @cnt = 1
	begin
	
	select
	[Id]
      ,[Username]
      ,[Email]
      ,[Mobilenumber]    
      ,[StatusId]     
      ,[Firstname]
      ,[lastname]
      ,[AuthTypeId]
      from Appusers where Mobilenumber = @Mobilenumber and Password = @Password   		
	
	end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSUserlocations]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSUserlocations]
@latitude numeric(10,6),
@longitude numeric(10,6),
@PhoneNo varchar(50)
as
begin
insert into dbo.StartBooking

([latitude],[longitude],[PhoneNo])
values(@latitude,@longitude,@PhoneNo)


update StartBooking
set [latitude] =@latitude,
[longitude] =@longitude,
[PhoneNo]  = @PhoneNo

select [VID],[RegistrationNo],[Type]  from VechileMaster  

end
GO
/****** Object:  StoredProcedure [dbo].[PStravelling]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PStravelling]
@flag varchar,@SlNo int,@EntryDate date,@VechID int,@RegistrationNo nvarchar(255) = null
,@DriverName nvarchar(255),@PartyName varchar(255),@PickupPlace nvarchar(255),
@DropPlace nvarchar(255),@StartMeter int,@PickupTime datetime,
@ExecutiveName nvarchar(255) ,@BookingNo decimal(18,1),@EntryTime datetime,@CloseStatus nvarchar(255)
AS
BEGIN


 declare @dt datetime   
set @dt = GETDATE()
 if @flag='i'
 begin
	
	insert into StartReport
	([EntryDate] ,[VechID] ,[RegistrationNo],[DriverName],[PartyName] ,
	[PickupPlace] ,[DropPlace] ,[StartMeter],[PickupTime],[ExecutiveName],
	[BookingNo],[EntryTime] ,[CloseStatus])	values
	(@dt,@VechID ,@RegistrationNo ,@DriverName,@PartyName 
	,@PickupPlace ,@DropPlace ,@StartMeter,@dt,@ExecutiveName,
	@BookingNo,@dt,@CloseStatus)
	
end
		
	if @flag='u'
	begin
	Update  StartReport
	set [EntryDate]= @EntryDate,	
	[VechID]= @VechID,	
	[RegistrationNo]= @RegistrationNo,
	[DriverName]=@DriverName ,
	[PartyName]= @PartyName,
	[PickupPlace]= @PickupPlace,
	[DropPlace]=@DropPlace,
	[StartMeter]= @StartMeter,
	[PickupTime]=@PickupTime,
	[ExecutiveName]=@ExecutiveName,
	[BookingNo]=@BookingNo,
	[EntryTime]=@EntryTime,
	[CloseStatus]=@CloseStatus
	end
	
select [RegistrationNo],[DriverName],[PickupPlace],[DropPlace] from StartReport where BookingNo =@BookingNo
END
GO
/****** Object:  StoredProcedure [dbo].[PSTrackVehicleHistory]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSTrackVehicleHistory](
@Mobilenumber varchar(50),
@Latitude numeric(10,6),
@Longitude numeric(10,6),
@Status varchar(50) = null)
as
begin
declare @did int = null,@vid int = null,
@lat numeric(10,6) = 0,
@long numeric(10,6) = 0

select @did =  DId from PSDriverMaster where PMobNo = @Mobilenumber
	

	if @did is null
		begin
				RAISERROR ('Invalid mobile number',16,1);
				return;	
		end
	else		
	begin
	select @vid = VechID from PSVehicleAssign where DriverId = @did

		select top 1 @lat = Latitude,@long = longitude from PSTrackVehicle where Mobilenumber = @Mobilenumber 
		order by id desc 

		if @lat <> @Latitude or @long <> @Longitude
		begin
			Insert into PSTrackVehicle(Mobilenumber, Latitude, Longitude, Date, Time,Status) 
			values (@Mobilenumber, @Latitude,@Longitude,convert(date,GETDATE()), CONVERT(time,GETDATE()),@Status)
		end	
			update dbo.PSCurrentLocationStatus set Latitude  = @Latitude, Longitude = @Longitude
			,[Date] = GETDATE(), [Time]= CONVERT(time,GETDATE()) where vid = @vid and did = @did
			
			if @@ROWCOUNT = 0
			begin
			  INSERT INTO [POSDashboard].[dbo].[PSCurrentLocationStatus]
           ([VId],[DId],[Latitude],[Longitude],[Date],[Time],[Status])
			VALUES(@vid,@did,@latitude,@longitude,GETDATE(), CONVERT(time,GETDATE()),1)



			
		end
    
	END
end
GO
/****** Object:  StoredProcedure [dbo].[PSRetrivePassword]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSRetrivePassword]
	-- Add the parameters for the stored procedure here
	@Email varchar(50)
	
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
        
    select a.Mobilenumber,a.Email from Appusers a
    where upper(a.Passwordotp) = upper(Passwordotp)
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[PSprebookingdetails]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSprebookingdetails]
@PartyName varchar(255)
as
begin
select  PickupPlace,DropPlace,EntryDate,EntryTime from ClosingReport where PartyName = @PartyName
select status from Customer_SMS_booking
select vechType from AvilableVehicle

end
GO
/****** Object:  StoredProcedure [dbo].[PSPasswordverification]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSPasswordverification]
@Password varchar(50),@Passwordotp varchar(10),@Email varchar(50), @mobileno varchar(15)
as
begin

declare @otp varchar(10) = null

select @otp = @Passwordotp from Appusers where Mobilenumber = @mobileno and Email = @Email 

if @otp is null
begin
  
				RAISERROR ('Invalid mobile number or email address',16,1);
				return;
end
else
begin

  if @otp <> @Passwordotp
  begin
    
					RAISERROR ('Invalid Password OTP',16,1);
					return;
  end
   else
   begin
      update Appusers set Passwordotp  = null,Password = @Password where Mobilenumber = @mobileno and Email = @Email  
     select [Username] ,[Email] ,[Mobilenumber]  from Appusers where Mobilenumber = @mobileno and Email = @Email
  end
 
end
end
GO
/****** Object:  StoredProcedure [dbo].[PSPasswordreset]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSPasswordreset]
@Password varchar(50),@Passwordotp varchar(10),@Email varchar(50), @Mobilenumber varchar(15)
as
begin

declare @otp int

select @otp = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Email = @Email 

if @otp = 0
begin
  
				RAISERROR ('Mobile number or email address is not Registered',16,1);
				return;
end
else
begin

  if @otp > @Passwordotp
  begin
    
					RAISERROR ('Invalid Password OTP',16,1);
					return;
  end
   else
   begin
      update Appusers set Passwordotp  = null ,Password = @Password where Mobilenumber = @Mobilenumber and Email = @Email  
     select 1 --[Username] ,[Email] ,[Mobilenumber]  from Appusers where Mobilenumber = @Mobilenumber and Email = @Email
  end
 
end
end
GO
/****** Object:  StoredProcedure [dbo].[PSMOTPverifying]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSMOTPverifying]
@Mobilenumber varchar(20),@Mobileotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update Appusers set Mobileotp = null where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
     --select [Mobilenumber],[Username],[StatusId] from Appusers where Mobilenumber = @Mobilenumber
     select 1
  end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSMOTPverification]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSMOTPverification]
@PhoneNo varchar(50),@Mobileotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from StartBooking where PhoneNo = @PhoneNo

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from StartBooking where PhoneNo = @PhoneNo and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update StartBooking set Mobileotp = null where PhoneNo = @PhoneNo and [Mobileotp] = @Mobileotp
     select [PhoneNo],[BNo],[EntryDate] from StartBooking where PhoneNo = @PhoneNo
  end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdVehicleBookingDetails]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdVehicleBookingDetails]
(
@id int = null
,@BNo varchar(20) = null
           ,@BookedDate date 
           ,@BookedTime time(7) 
           ,@DepartureDate date  = null
           ,@DepartureTime time(7) = null 
           ,@BookingType varchar(10)=null 
           ,@Src varchar(50)
           ,@Dest varchar(50)
           ,@SrcId int
           ,@DestId int
           ,@SrcLatitude numeric(18,6)=null 
           ,@SrcLongitude numeric(18,6)=null 
           ,@DestLatitude numeric(18,6)=null 
           ,@DestLongitude numeric(18,6)=null 
           ,@VechId int 
           ,@PackageId int 
           ,@Pricing decimal(10,0) 
           ,@DriverId int 
           ,@DriverPhoneNo varchar(20) 
           ,@CustomerPhoneNo varchar(20) 
           ,@CustomerId int 
           ,@BookingStatus varchar(50) 
           ,@NoofVehicles int 
           ,@NoofSeats int 
           ,@ClosingDate date =null
           ,@ClosingTime time(7)=null 
           ,@CancelledOn datetime =null
           ,@CancelledBy varchar(50)=null 
           ,@BookingChannel varchar(50) 
           ,@Reasons varchar(500)
           ,@CompanyId int =null
           ,@flag varchar(1) = null)
as
begin


declare @b varchar(5)
select @b = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5 

if @flag = 'I'
begin
INSERT INTO [dbo].[PSVehicleBookingDetails]
           ([BNo]
           ,[BookedDate]
           ,[BookedTime]
           ,[DepartueDate]
           ,[DepartureTime]
           ,[BookingType]
           ,[Src]
           ,[Dest]
           ,[SrcId]
           ,[DestId]
           ,[SrcLatitude]
           ,[SrcLongitude]
           ,[DestLatitude]
           ,[DestLongitude]
           ,[VechId]
           ,[PackageId]
           ,[Pricing]
           ,[DriverId]
           ,[DriverPhoneNo]
           ,[CustomerPhoneNo]
           ,[CustomerId]
           ,[BookingStatus]
           ,[NoofVehicles]
           ,[NoofSeats]
           ,[ClosingDate]
           ,[ClosingTime]
           ,[CancelledOn]
           ,[CancelledBy]
           ,[BookingChannel]
           ,[CompanyId]
           ,[Reasons])
     VALUES
           (@b
           ,@BookedDate
           ,@BookedTime 
           ,@DepartureDate
           ,@DepartureTime 
           ,@BookingType 
           ,@Src 
           ,@Dest 
           ,@SrcId
           ,@DestId 
           ,@SrcLatitude
           ,@SrcLongitude 
           ,@DestLatitude
           ,@DestLongitude 
           ,@VechId
           ,@PackageId
           ,@Pricing 
           ,@DriverId
           ,@DriverPhoneNo
           ,@CustomerPhoneNo 
           ,@CustomerId
           ,@BookingStatus 
           ,@NoofVehicles
           ,@NoofSeats
           ,@ClosingDate
           ,@ClosingTime
           ,@CancelledOn
           ,@CancelledBy 
           ,@BookingChannel 
           ,@Reasons 
           ,@CompanyId)
end
else
  if @flag = 'U' 
  begin
  UPDATE [dbo].[PSVehicleBookingDetails]
   SET 
      [BookedDate] = @BookedDate
      ,[BookedTime] = @BookedTime
      ,[DepartueDate] = @DepartureDate
      ,[DepartureTime] = @DepartureTime
      ,[BookingType] = @BookingType
      ,[Src] = @Src
      ,[Dest] = @Dest
      ,[SrcId] = @SrcId
      ,[DestId] = @DestId
      ,[SrcLatitude] = @SrcLatitude
      ,[SrcLongitude] = @SrcLongitude
      ,[DestLatitude] = @DestLatitude
      ,[DestLongitude] = @DestLongitude
      ,[VechId] = @VechId
      ,[PackageId] = @PackageId
      ,[Pricing] = @Pricing
      ,[DriverId] = @DriverId
      ,[DriverPhoneNo] = @DriverPhoneNo
      ,[CustomerPhoneNo] = @CustomerPhoneNo
      ,[CustomerId] = @CustomerId
      ,[BookingStatus] = @BookingStatus
      ,[NoofVehicles] = @NoofVehicles
      ,[NoofSeats] = @NoofSeats
      ,[ClosingDate] = @ClosingDate
      ,[ClosingTime] = @ClosingTime
      ,[CancelledOn] = @CancelledOn
      ,[CancelledBy] = @CancelledBy
      ,[BookingChannel] = @BookingChannel
      ,[Reasons] = @Reasons
      ,[CompanyId]=@CompanyId
 WHERE [Id]=@Id



  end

end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdVechlogout]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PSInsUpdVechlogout]
@flag varchar,@Id int,@CompanyId int,@LogoutDate datetime=null
,@LogoutTime time(7)=null,
@VechId int=null,@RegNo nvarchar(50),
@DriverName nvarchar(50)=null,@LoginLandMark nvarchar(50)=null,
@CurrentLandMark nvarchar(50)=null,@EndMtr nvarchar(50)=null,
@CurStatus nvarchar(50)=null,
@DriverMobileNo nvarchar(50) = null,@ExecutiveName nvarchar(50)=null,
@Remarks nvarchar(255)=null,@GenratedAmount int=null,
@NoofTimesLogin int=null,@EntryDate datetime=null,
@TotalGeneratedAmount int=null,@LastVacantTime time(7)=null,
@VechType nvarchar(255)=null,@EntryTime time(7)=null,@VehicleModelId int=null,
@ServiceTypeId int =null,@VehicleGroupId int=null   
AS
BEGIN

declare @cnt int
declare @dt datetime,@t time(7)
set @dt = GETDATE()
set @t = GETDATE()

 
if @flag = 'I'
	begin	
	insert into dbo.PSVechLogOut
	([CompanyId],
	[LogoutDate]
      ,[LogoutTime]
      ,[VechId]
      ,[RegNo]
      ,[DriverName]
      ,[LoginLandMark]
      ,[CurrentLandMark]
      ,[EndMtr]
      ,[CurStatus]
      ,[DriverMobileNo]
      ,[ExecutiveName]
      ,[Remarks]
      ,[GenratedAmount]
      ,[NoofTimesLogin]
      ,[EntryDate]
      ,[TotalGeneratedAmount]
      ,[LastVacantTime]
      ,[VechType]
      ,[EntryTime]
      ,[VehicleModelId]
      ,[ServiceTypeId]
      ,[VehicleGroupId])
      	values      	
	(@CompanyId, @dt,@t,@VechId,@RegNo,@DriverName,
	@LoginLandMark,@CurrentLandMark,@EndMtr,
	@CurStatus,@DriverMobileNo,@ExecutiveName,@Remarks,@GenratedAmount,
	@NoofTimesLogin,@dt,@TotalGeneratedAmount,@t,@VechType
	,@t,@VehicleModelId,@ServiceTypeId,@VehicleGroupId)
	
	
	end
   
	
	
	if @flag ='U'
	begin
	select @cnt = COUNT(*) from PSVechLogOut where VechId = @VechId 
	
	Update  dbo.PSVechLogOut
	
	set [CompanyId]=@CompanyId	
       ,[LogoutDate]=@LogoutDate
       ,[LogoutTime]=@LogoutTime
      ,[VechId]=@VechId
      ,[RegNo]=@RegNo
      ,[DriverName]=@DriverName
      ,[LoginLandMark]=@LoginLandMark
      ,[CurrentLandMark]=@CurrentLandMark
      ,[EndMtr]=@EndMtr
      ,[CurStatus]=@CurStatus
      ,[DriverMobileNo]=@DriverMobileNo
      ,[ExecutiveName]=@ExecutiveName
      ,[Remarks]=@Remarks
      ,[GenratedAmount]=@GenratedAmount
      ,[NoofTimesLogin]=@NoofTimesLogin
      ,[EntryDate]=@EntryDate
      ,[TotalGeneratedAmount]=@TotalGeneratedAmount
      ,[LastVacantTime]=@LastVacantTime
      ,[VechType]=@VechType
      ,[EntryTime]=@EntryTime
      ,[VehicleModelId] = @VehicleModelId
        ,[ServiceTypeId]=@ServiceTypeId
	,[VehicleGroupId]=@VehicleGroupId
	from PSVechLogOut
	
	where VechId = @VechId 	
   end
	select [CompanyId],[LogoutDate],[LogoutTime],[VechId],[RegNo],[DriverName],[EndMtr] , [VehicleModelId],[ServiceTypeId],[VehicleGroupId] from  PSVechLogOut
	
	where VechId = @VechId 
	

END
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdVechlogin]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PSInsUpdVechlogin]
@flag varchar,@Id int,@CompanyId int,@LoginDate datetime=null
,@LoginTime time(7)=null,
@VechId int=null,@RegNo nvarchar(50)=null,
@DriverName nvarchar(50)=null,@LoginLandMark nvarchar(50)=null,
@CurrentLandMark nvarchar(50)=null,@StartKiloMtr nvarchar(50)=null,
@CurStatus nvarchar(50)=null,
@DriverMobileNo nvarchar(50) = null,@ExecutiveName nvarchar(50)=null,
@Remarks nvarchar(255)=null,@GenratedAmount int=null,
@NoofTimesLogin int=null,@EntryDate datetime=null,
@TotalGeneratedAmount int=null,@LastVacantTime time(7)=null,
@VechType nvarchar(255)=null,@EntryTime time(7)=null,@VehicleModelId int=null,@ServiceTypeId int =null,@VehicleGroupId int=null 
AS
BEGIN

declare @cnt int
declare @dt datetime,@t time(7)
set @dt = GETDATE()
set @t = GETDATE()

 
if @flag = 'I'
	begin	
	insert into dbo.PSVechLogin
	([CompanyId],
	[LoginDate]
      ,[LoginTime]
      ,[VechId]
      ,[RegNo]
      ,[DriverName]
      ,[LoginLandMark]
      ,[CurrentLandMark]
      ,[StartKiloMtr]
      ,[CurStatus]
      ,[DriverMobileNo]
      ,[ExecutiveName]
      ,[Remarks]
      ,[GenratedAmount]
      ,[NoofTimesLogin]
      ,[EntryDate]
      ,[TotalGeneratedAmount]
      ,[LastVacantTime]
      ,[VechType]
      ,[EntryTime]
      ,[VehicleModelId]
      ,[ServiceTypeId]
      ,[VehicleGroupId])
      	values      	
	(@CompanyId, @dt,@t,@VechId,@RegNo,@DriverName,
	@LoginLandMark,@CurrentLandMark,@StartKiloMtr,
	@CurStatus,@DriverMobileNo,@ExecutiveName,@Remarks,@GenratedAmount,
	@NoofTimesLogin,@dt,@TotalGeneratedAmount,@t,@VechType
	,@t,@VehicleModelId,@ServiceTypeId,@VehicleGroupId)
	
	
	end
	
	
	
	if @flag ='U'
	begin 		
	Update  dbo.PSVechLogin
	
	set [CompanyId]=@CompanyId 
      ,[LoginLandMark]=@LoginLandMark
      ,[CurrentLandMark]=@CurrentLandMark
      ,[StartKiloMtr]=@StartKiloMtr
      ,[CurStatus]=@CurStatus 
      ,[NoofTimesLogin]=@NoofTimesLogin
      ,[VechType]=@VechType
     ,[VehicleModelId] = @VehicleModelId,
     [ServiceTypeId]=@ServiceTypeId,
	[VehicleGroupId]=@VehicleGroupId
      
	from dbo.PSVechLogin
	
	where VechId = @VechId  
	end	
	select [CompanyId],[LoginDate],[LoginTime],[VechId],[RegNo],[DriverName],[VehicleModelId],[ServiceTypeId],[VehicleGroupId]   from dbo.PSVechLogin	
	where VechId = @VechId 
	

END
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUserPreferences]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsupdUserPreferences]
@flag varchar,@Id int, 
@userid int,@email varchar(50),
@Address varchar(250),@Accountid int,
@preferenceTypeId int,@PreferenceId int
as
begin
declare @cnt int

if @flag ='I'
begin

Insert into dbo.Userpreferences
([userid],[email],[Address],
[Accountid],[preferenceTypeId],
[PreferenceId])
values
(@userid,@email,@Address ,
@Accountid,@preferenceTypeId,
@PreferenceId)

end
if @flag ='U'
begin
update dbo.Userpreferences
set[userid]=@userid,
   [email]=@email,
   [Address]=@Address,
   [Accountid]=@Accountid,
   [preferenceTypeId]=@preferenceTypeId,
   [PreferenceId]=@PreferenceId
   
   where Id=@Id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[ValidateFleetOwnerCode]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidateFleetOwnerCode]
	@fleetownercode varchar(15),
	@result int out 
AS
BEGIN
declare @fid int = 0


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	select @fid = id from FleetOwner where UPPER(ltrim(rtrim(FleetOwnerCode))) = UPPER(ltrim(rtrim(@fleetownercode)))
	
	if @fid is not null
	begin	
	select f.id foid, u.id userid, f.FleetOwnerCode from FleetOwner f inner join Users u on f.UserId = u.Id and UPPER(FleetOwnerCode) = UPPER(@fleetownercode)
			
	SELECT [Id]
      ,[UserId]
      ,[FOId]
      ,[LicenseTypeId]
      ,[StartDate]
      ,[ExpiryOn]
      ,[GracePeriod]
      ,[ActualExpiry]
      ,[LastUpdatedOn]
      ,[Active]
      ,[StatusId]
      ,[RenewFreqTypeId]
    FROM [POSDashboard].[dbo].[UserLicense] ul
    where ul.foid = @fid
    	
	end
	
    Set @result = @fid    
    -- Insert statements for procedure here
	return @result
END
GO
/****** Object:  StoredProcedure [dbo].[ValidateCredentials]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ValidateCredentials](@logininfo varchar(50) = null, @passkey varchar(50) = null)
as
begin

select logininfo,firstname, lastname,u.Id,firstname+' '+lastname as uname ,r.Name as RoleName,ur.roleid,u.CompanyId,FO.UserId
from userlogins ul 
inner join users u on 
u.id = ul.userid
left outer join UserRoles ur on ur.UserId=u.Id
left outer join roles r on r.id = ur.roleid
left outer join FleetOwner FO on FO.UserId=u.Id
where LoginInfo=@logininfo and [PassKey]=@passkey and ul.Active = 1

end
GO
/****** Object:  StoredProcedure [dbo].[registerbtpos]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registerbtpos]
	@fleetownercode varchar(10),
	@ipconfig varchar(20),
	@result int out 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	declare @fleetownerid int
	declare @posid int
	
	select @fleetownerid = userID from FleetOwner where UPPER(FleetOwnerCode) = UPPER(@fleetownercode)
	select @posid = ID from BTPOSDetails where FleetOwnerId = @fleetownerid and ipconfig = @ipconfig
	
	UPDATE BTPOSDetails
        SET POSID = 'POS'+ UPPER(@fleetownercode)+ cast(@posid as varchar(3))
    FROM BTPOSDetails
    where FleetOwnerId = @fleetownerid and ipconfig = @ipconfig
   
	select @result = COUNT(*) from BTPOSDetails where  POSID = 'POS'+ UPPER(@fleetownercode)+ cast(@posid as varchar(3))

    -- Insert statements for procedure here
	return @result
END

/****** Object:  StoredProcedure [dbo].[InsUpdDelVehicleDetails]    Script Date: 07/18/2016 17:16:58 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[PSVehicles]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSVehicles]
@SrNo int,@VID int,@RegistrationNo nvarchar(50),@Type nvarchar(50)
,@OwnerName nvarchar(50)
,@ChasisNo nvarchar(50),@Engineno nvarchar(50),
@WirelessFleetNo nvarchar(50),
@AllotmentType nvarchar(50),@RoadNo nvarchar(50)
,@RoadTaxDate date,
@InsuranceNo nvarchar(50),@InsDate date,
@PolutionNo nvarchar(50),
@PolExpDate date,@RCBookNo nvarchar(50)
,@RCExpDate date,@CompanyVechile int,
@OwnerPhoneNo nvarchar(50),@HomeLandmark nvarchar(255),
@ModelYear nvarchar(255),@DayOnly nvarchar(255),
@DayNight nvarchar(255),@InsProvider nvarchar(255),
@VechMobileNo nvarchar(50),@EntryDate date,
@NewEntry nvarchar(50),@AirPortCab nvarchar(255),
@deletedVech nvarchar(20),@Carrier nvarchar(20),
@PayGroup varchar(10)
as
begin
declare @cnt int, @m varchar(5) 


insert into VechileMaster
	([VID] ,[RegistrationNo] ,[Type],[OwnerName] ,
	[ChasisNo] ,[Engineno] ,[WirelessFleetNo],[AllotmentType],
	[RoadNo],[RoadTaxDate],[InsuranceNo],[InsDate],[PolutionNo],
	[PolExpDate],
	[RCBookNo],[RCExpDate],[CompanyVechile],[OwnerPhoneNo],
	[HomeLandmark]
	,[ModelYear],[DayOnly],[DayNight],
	[InsProvider]
	,[VechMobileNo],[EntryDate],[NewEntry],[AirPortCab]
	,[deletedVech],[Carrier],[PayGroup])	
	values
	( @VID,@RegistrationNo ,@Type ,@OwnerName,
	@ChasisNo ,@Engineno ,@WirelessFleetNo ,@AllotmentType,
	@RoadNo,@RoadTaxDate,@InsuranceNo,@InsDate,@PolutionNo,
	@PolExpDate,@RCBookNo,@RCExpDate,@CompanyVechile,@OwnerPhoneNo,
	@HomeLandmark,@ModelYear,@DayOnly,@DayNight,@InsProvider,
	@VechMobileNo,@EntryDate,@NewEntry,@AirPortCab,@deletedVech,
	@Carrier,@PayGroup)
	
	


if @cnt = 0
		begin
				RAISERROR ('No user registered with given mobile number',16,1);
				return;
		end
		
		
		
		Update  VechileMaster
	set [VID]= @VID ,	
	[RegistrationNo]= @RegistrationNo,	
	[Type]= @Type,
	[OwnerName]=@OwnerName ,
	[ChasisNo]= @ChasisNo,
	[Engineno]= @Engineno,
	[WirelessFleetNo]=@WirelessFleetNo,
	[AllotmentType]= @AllotmentType,
	[RoadNo]= @RoadNo,
	[RoadTaxDate]= @RoadTaxDate,
	[InsuranceNo]= @InsuranceNo,
	[InsDate]= @InsDate,
	[PolutionNo]= @PolutionNo,
	[PolExpDate]= @PolExpDate,
	[RCBookNo]= @RCBookNo,
	[RCExpDate]= @RCExpDate,
	[CompanyVechile]= @CompanyVechile,
	[OwnerPhoneNo]=@OwnerPhoneNo,
	[HomeLandmark]=@HomeLandmark,
	[ModelYear]=@ModelYear,
	[DayOnly]=@DayOnly,
	[DayNight]=@DayNight,
	[InsProvider]=@InsProvider,
	[VechMobileNo]=@VechMobileNo,
	[EntryDate]=@EntryDate,
	[NewEntry]=@NewEntry,
	[AirPortCab]=@AirPortCab,
	[deletedVech]=@deletedVech,
	[Carrier]=@Carrier,
	[PayGroup]=@PayGroup
	
	
	from VechileMaster
	
	where VechMobileNo = @VechMobileNo
	
	 
	
	
	select [RegistrationNo] ,[Type] ,[OwnerName],[OwnerPhoneNo] ,[VechMobileNo],[EntryDate]  from VechileMaster where VechMobileNo = @VechMobileNo
	

END
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUserdownloads]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsupdUserdownloads]
@flag varchar,@id int, @Android varchar(50),@Win varchar(50),@Ios varchar(50),@Websitedown varchar(50),@Iosdown varchar(50),@Wincount varchar(50)
as
begin
if @flag ='I'
begin
Insert into UserDownloads
([Android],[Win],[Ios],[Websitedown],[Iosdown],[Wincount])
values
(@Android,@Win,@Ios,@Websitedown,@Iosdown,@Wincount)
end
if @flag ='U'
begin
update UserDownloads
set[Android]=@Android,
   [Win]=@Win,
   [Ios]=@Ios,
   [Websitedown]=@Websitedown,
   [Iosdown]=@Iosdown,
   [Wincount]=@Wincount  
   where id=@id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUsercard]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSInsupdUsercard]
@flag varchar,@id int, @AccId int,@Cardno varchar(20),@ccv varchar(5),@Expyear varchar(10),@expmonth varchar(10),@Statusid int,@isDefault varchar(10)
as
begin
if @flag ='I'
begin
Insert into Usercards
([AccId],[Cardno],[ccv],[Expyear],[expmonth],[Statusid],[isDefault])
values
(@AccId,@Cardno,@ccv ,@Expyear,@expmonth,@Statusid ,@isDefault )
end
if @flag ='U'
begin
update Usercards
set[AccId]=@AccId,
   [Cardno]=@Cardno,
   [ccv]=@ccv,
   [Expyear]=@Expyear,
   [expmonth]=@expmonth,
   [Statusid]=@Statusid,
   [isDefault]=@isDefault
   where Id=@id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdTroubleTicket]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsupdTroubleTicket]
(@flag varchar,@id int=null,
@Userid int=null,@EmailId varchar(50)=null,@CreatedOn date,@Onbehalfofph Varchar(20)=null,
@TicketNo varchar(20)=null,@Catid int=null,@Description varchar(50)=null,@Emailsent int=null,@Smssent int=null,
@TicketTypeId int=null,@PhoneNumber varchar(20)=null,@StatusId int=null)
as
begin
declare
@currDate date ,@t int
set @currDate = getdate()
select @t = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))

if @flag = 'I'
begin
insert into [dbo].[TroubleTicket]
([Userid],[EmailId],[CreatedOn],[On behalf of ph],[TicketNo],[Catid],[Description],[Emailsent],[Sms sent],[TicketTypeId],[PhoneNumber],[StatusId]) 
values
(@Userid,@EmailId,@currDate,@Onbehalfofph,@t,@Catid,@Description,@Emailsent,@Smssent,@TicketTypeId,@PhoneNumber,@StatusId)
end
if @flag = 'U'
begin
update[dbo].[TroubleTicket]
set [Userid]=@Userid,
[EmailId]=@EmailId,
[CreatedOn]=@currDate,
[On behalf of ph]=@Onbehalfofph,
[TicketNo]=@TicketNo,
[Catid]=@Catid,
[Description]=@Description,
[Emailsent] =@Emailsent,
[Sms sent]=@Smssent, 
[TicketTypeId]=@TicketTypeId,
[PhoneNumber]=@PhoneNumber ,
[StatusId] =@StatusId
where PhoneNumber=@PhoneNumber

end
end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdFaqs]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdFaqs]
@flag varchar,@Id int,@Question varchar(500),@Answer varchar(500),@Catid int,@CreatedOn date,@Createdby int
as
begin
declare @cnt int,
 @dt datetime
set @dt = GETDATE()
if @flag = 'I'
begin
insert into [dbo].[Appfaqs]
([Question],[Answer],[Catid],[CreatedOn],[Createdby])
values
(@Question,@Answer,@Catid,@dt,@Createdby)
end
if @flag = 'U'
begin
update [dbo].[Appfaqs]
set 
 [Question]=@Question,
 [Answer]=@Answer,
 [Catid]=@Catid,
 [CreatedOn]=@dt,
 [Createdby]=@Createdby
 where Id=@Id
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDriverLogin]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PSInsUpdDriverLogin]
(@id int = null
           ,@DId int
           ,@VId int
           ,@LoginDate date=null
           ,@LoginTime time(7)=null
           ,@LogoutDate date=null
           ,@LogoutTime time(7)=null
           ,@Reason varchar(500)=null
           ,@Status varchar(50)=null
           ,@LoginLatitude numeric(18,6)=null
           ,@LoginLongitude numeric(18,6)=null
           ,@LogoutLatitude numeric(18,6)=null
           ,@LogoutLongitude numeric(18,6)=null
           ,@CompanyId int=null
           ,@flag varchar(1) = null)
as
begin

if @flag = 'I'
begin
INSERT INTO [dbo].[PSDriverLogin]
           ([DId]
           ,[VId]
           ,[LoginDate]
           ,[LoginTime]           
           ,[Reason]
           ,[Status]
           ,[LogoutLatitude]
           ,[LogoutLongitude]
           ,[CompanyId]
		   ,[Status])
     VALUES
           (@DId 
           ,@VId 
           ,@LoginDate 
           ,@LoginTime
           ,@LogoutDate 
           ,@LogoutTime
           ,@Reason 
           ,@Status 
           ,@LoginLatitude 
           ,@LoginLongitude
           ,@LogoutLatitude
           ,@LogoutLongitude
           ,@CompanyId
		   ,@Status) 
end
else
  if @flag = 'U' 
  begin
  UPDATE [dbo].[PSDriverLogin]
   SET      [DId] = @DId,
             [VId] = @VId,         
           [LogoutDate] = @LogoutDate,
           [LogoutTime] = @LogoutTime,
           [Reason] = @Reason ,
           [Status] = @Status,
           [LogoutLatitude] = @LogoutLatitude, 
           [LogoutLongitude] = @LogoutLongitude,
           [CompanyId] = @CompanyId
                 where Id=@Id
           
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDeltypes]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdDeltypes]
@flag varchar,@id int=-1,@name varchar(50),@description varchar(50),@active int
,@typegroupid varchar(50),@listkey varchar(50),@listvalue varchar(50)
as
begin
if @flag ='I'
begin
Insert into dbo.types
([name],[description],[active],[typegroupid],[listkey],[listvalue])
values
(@name,@description,@active,@typegroupid,@listkey,@listvalue)
end
if @flag ='U'
begin
Update  dbo.types
set [name]=@name,
[description]=@description,
[active]=@active,
[typegroupid]=@typegroupid,
[listkey]=@listkey,
[listvalue]=@listvalue
where id=@id
end
if @flag ='D'
begin
delete from dbo.types
where id=@id
end
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsTypeGroups]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_InsTypeGroups](@Id int,@Name varchar(50),@Description varchar(50) =null,@Active int)
as
begin
insert into TypeGroups (Name,[Description],Active) values(@Name,@Description,@Active)
end
GO
/****** Object:  StoredProcedure [dbo].[RetriveWebSitePassword]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RetriveWebSitePassword]
	-- Add the parameters for the stored procedure here
	@email varchar(100)
	
AS
BEGIN

      SELECT [FirstName]
      ,[LastName]
      ,[UserName]
      ,[EmailAddress]
      ,[Password]     
  FROM [dbo].[WebsiteUserInfo]  
  where UPPER([EmailAddress]) = UPPER(ltrim(rtrim(@email))) or [UserName] = @email
   
    
END
GO
/****** Object:  StoredProcedure [dbo].[RetrivePassword]    Script Date: 08/04/2017 19:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RetrivePassword]
	-- Add the parameters for the stored procedure here
	@email varchar(100)
	
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
        
    select ul.LoginInfo,ul.PassKey from Users u
    inner join UserLogins ul on ul.UserId = u.Id
    where upper(u.EmailId) = upper(@email)
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[PSGetusercards]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetusercards]
as
begin
select * from dbo.Usercards
end
GO
/****** Object:  StoredProcedure [dbo].[PSgettypes]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSgettypes]
as
begin
select* from types
end
GO
/****** Object:  StoredProcedure [dbo].[PSGettickets]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGettickets]
@TicketId int
as
begin
select * from dbo.Resolutionhistory where TicketId = @TicketId
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetTicketHistory]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetTicketHistory]
as
begin
select * from dbo.Resolutionhistory
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetTicketDetails]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetTicketDetails]
@TicketId int
as
begin
 select * from TroubleTicket where id = @ticketid
select * from Resolutionhistory where TicketId = @TicketId
 end
GO
/****** Object:  StoredProcedure [dbo].[PSGetstops]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetstops]
as
begin
select * from dbo.Stops
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetsp_Availableseats]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSGetsp_Availableseats]
@Src_Id int,
@Des_Id int
AS
BEGIN
SELECT  [Id]
      ,[Bus_Id]
      ,[Bustype]
      ,[From_Time]
      ,[To_Time]
      ,[Availableseats]
      ,[Cost]
      ,[Sourcename]
      ,[Destinationname]
      ,[SourceId]
      ,[DestinationId]
      ,[Travelsname]
      ,[Duration]
  FROM [dbo].[Ex_Availableseats] where SourceId=@Src_Id and DestinationId=@Des_Id
END
GO
/****** Object:  StoredProcedure [dbo].[PSgetRoutes]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PSgetRoutes]
as
begin
SELECT r.[Id]
      ,[RouteName]
      ,r.[Code]
      ,r.[Description]
      ,r.[Active]
      ,src.name as Source
      ,dest.name as Destination
      ,[SourceId]
      ,[DestinationId]
      ,[Distance]
  FROM [dbo].[Routes] r
  inner join stops src on src.id = r.sourceid
  inner join stops dest on dest.id = destinationid
  order by RouteName
end
GO
/****** Object:  StoredProcedure [dbo].[PSgetprice]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetprice]
@VechID int
as
begin
select  PickupPlace,DropPlace,GeneratedAmount,ActualAmount,EntryDate,EntryTime,DropTime,PickupTime from ClosingReport where  VechID = @VechID
select distance from distance_cal
select Type from VechileMaster

end
GO
/****** Object:  StoredProcedure [dbo].[PSgetpaysmart]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSgetpaysmart]
as
begin
select* from types
end
GO
/****** Object:  StoredProcedure [dbo].[PSgetpalce]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSgetpalce]
as
begin
select* from place
end
GO
/****** Object:  StoredProcedure [dbo].[PSgetnearestvehicles]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetnearestvehicles]
@PhoneNo nvarchar(50)
as
begin
select  latitude,longitude from StartBooking where PhoneNo = @PhoneNo
select Type from VechileMaster
end
GO
/****** Object:  StoredProcedure [dbo].[PSgetlogin]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSgetlogin]
as
begin
select*from login
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetHourBasePricing]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[PSGetHourBasePricing]
as
begin
select H.[Id],
vm.[Name] as VehicleModel
      ,vm.Id AS VehicleModelId
,Hours,FromTime,ToTime,Price 
From [dbo].[PSHoursBasePricing] H
inner join Types vm on vm.Id=H.VehicleModelId
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetHistory]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetHistory]
@PhoneNo nvarchar(50)
as
begin
select [EntryDate]
,[BNo],[BookingType],[ReqDate],[ReqTime],[CallTime],[ReqVehicle],
[Customername],[CusID],[PhoneNo],[CAddress],[PickupAddress],[LandMark]
,[Package],[PickupPalce],[DropPalce],[ReqType],[ExtraCharge],[NoofVehicle],[ExecutiveName],
[VID],[BookingStatus],[CustomerSMS],[CancelReason],[CBNo],
[ModifiedBy],[CancelBy],[ReconfirmedBy],[AssignedBy],[ActionDate],[ActionTime]
,[latitude],[longitude]
from StartBooking where PhoneNo = @PhoneNo
end
GO
/****** Object:  StoredProcedure [dbo].[PSgethelp]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSgethelp]
as
begin
select* from help
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetfiledetails]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetfiledetails] 
@Filename varchar(20)
as
begin
select * from dbo.Attachments where Filename = @Filename
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetFileContent]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetFileContent]
 @fileid INT 
as
begin
 
select * from Attachments where id = @fileid end
GO
/****** Object:  StoredProcedure [dbo].[PSGetfaqs]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetfaqs]
as
begin
select * from Appfaqs 
end
GO
/****** Object:  StoredProcedure [dbo].[PSgetdrivermaster]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetdrivermaster]
@DId int
as
begin
select * from DriverMaster where DId = @DId
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetDriverLogin]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PSGetDriverLogin]
as
begin
SELECT [Id]
      ,[DId]
      ,[VId]
      ,[LoginDate]
      ,[LoginTime]
      ,[LogoutDate]
      ,[LogoutTime]
      ,[Reason]
      ,[Status]
      ,[LoginLatitude]
      ,[LoginLongitude]
      ,[LogoutLatitude]
       ,[LogoutLongitude]
       ,[CompanyId]       
  FROM [dbo].[PSDriverLogin]
  end
GO
/****** Object:  StoredProcedure [dbo].[PSgetdriver]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSgetdriver]
@DId int
as
begin
select * from DriverMaster where DId = @DId
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetDownloadCount]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetDownloadCount]

as
begin
select * from dbo.UserDownloads
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetDistanceBasePricing]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[PSGetDistanceBasePricing]
as
begin
select D.[Id],
vm.[Name] as VehicleModel
      ,vm.Id AS VehicleModelId
      ,FromKm
      ,ToKm,Pricing,FromTime,ToTime from PSDistancePricing D
      inner join Types vm on vm.Id=D.VehicleModelId
end
GO
/****** Object:  StoredProcedure [dbo].[PSgetdetails]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetdetails]
as
begin
select*from Appusers
end
GO
/****** Object:  StoredProcedure [dbo].[PSgetcurrency]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSgetcurrency]
as
begin
select* from currency
end
GO
/****** Object:  StoredProcedure [dbo].[PSgetcountry]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetcountry]
as
begin
select* from Country
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetBookingHistory]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetBookingHistory]
as
begin
select [EntryDate]
,[BNo],[BookingType],[ReqDate],[ReqTime],[CallTime],[ReqVehicle],
[Customername],[CusID],[PhoneNo],[CAddress],[PickupAddress],[LandMark]
,[Package],[PickupPalce],[DropPalce],[ReqType],[ExtraCharge],[NoofVehicle],[ExecutiveName],
[VID],[BookingStatus],[CustomerSMS],[CancelReason],[CBNo],
[ModifiedBy],[CancelBy],[ReconfirmedBy],[AssignedBy],[ActionDate],[ActionTime]
,[latitude],[longitude]
from StartBooking
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetBookedHistory]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PSGetBookedHistory]
	@emailAddress varchar(50),@mobileno varchar(15), @fromDate date = null, @todate date = null
AS
BEGIN
	
	SELECT [Id]
      ,[TicketNo]
      ,[TransId]
      ,[EmailId]
      ,[MobileNo]
      ,[AltMobileNo]
      ,[TravelDate]
      ,[TravelTime]
      ,[Src]
      ,[Dest]
      ,[SrcId]
      ,[DestId]
      ,[RouteId]
      ,[VehicleId]
      ,[NoOfSeats]
      ,[Seats]
      ,[Status]
      ,[StatusId]
      ,[BookedBy]
      ,[BookedById]
      ,[Amount]
      ,[BookingType]
      ,[BookingTypeId]
      ,[JourneyType]
      ,[JourneyTypeId]
      ,[UserId]
      ,[Address]
      ,[BookedOn]
      ,[BookedOnTime]
      ,[ArrivalTime]
      ,[DepartureTime]
      ,[ArrivalDate]
      ,[DepartueDate]
  FROM [dbo].[BookingDetails]
  where(
  (([EmailId]) = (@emailAddress) or @emailAddress is null)
or
  ([MobileNo] = @mobileno or @mobileno is null)
  and
  ([BookedOn] >= @fromDate or @fromDate is null  
  and [BookedOn] <= @todate or @todate is null 
  )
)
order by BookedOn desc


	
END
GO
/****** Object:  StoredProcedure [dbo].[PSGetAvailablevehicles]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetAvailablevehicles]
as
begin

 select [VehicleModel],[Pricing] from PSDistancePricing 
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetAvailableServices]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PSGetAvailableServices]
	@srcId int, 
	@destId int
AS
BEGIN
	
	SET NOCOUNT ON;


select distinct rs.Id, rs.RouteId,fofare.VehicleTypeId,fofare.VehicleId
, t.Name VehicleType, fofare.Amount,rs.FromStopId,rs.ToStopId, frs1.ArrivalTime,frs2.DepartureTime ,frs1.Duration
,src.Name srcName,dest.name destName,c.Name cmpName
from RouteStops rs
inner join FleetOwnerRouteStop fors on fors.RouteStopId = rs.Id
inner join [FleetOwnerRouteFare] fofare on fofare.FORouteStopId = rs.Id
inner join Types t on t.Id = fofare.VehicleTypeId
inner  join FORouteFleetSchedule frs1 on frs1.StopId = rs.FromStopId and frs1.FleetOwnerId = fors.FleetOwnerId and frs1.RouteId = rs.RouteId and frs1.VehicleId = fofare.VehicleId
inner join FORouteFleetSchedule frs2 on frs2.StopId = rs.ToStopId and frs2.FleetOwnerId = fors.FleetOwnerId and frs2.RouteId = rs.RouteId and frs2.VehicleId = fofare.VehicleId
inner join Stops src on src.Id = rs.FromStopId
inner join Stops dest on dest.Id = rs.ToStopId
inner join FleetDetails fd on fd.id = fofare.VehicleId
inner join Company c on c.Id = fd.CompanyId
where FromStopId = @srcId and ToStopId = @destId

   
	
END
GO
/****** Object:  StoredProcedure [dbo].[PSGetAllUserTickets]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetAllUserTickets]
@Userid int
as
begin
 select * from TroubleTicket where Userid = @Userid
 end
GO
/****** Object:  StoredProcedure [dbo].[PSGetalltickets]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetalltickets]
@CreatedOn date 
as
begin
 
select * from TroubleTicket where CreatedOn=@CreatedOn AND (TicketNo like '%'+TicketNo+'%')
 end
GO
/****** Object:  StoredProcedure [dbo].[PSEOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSEOTPverification]
@Email varchar(50),@Emailotp varchar(10),@mobileno varchar(20)
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Email = @Email and Mobilenumber = @mobileno

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Email address or mobile number',16,1);
				return;
   end

else

begin

  select @cnt = COUNT(*) from Appusers where Email = @Email and [Emailotp] = @Emailotp and Mobilenumber = @mobileno
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid Email address or Email OTP',16,1);
					return;
	end
 
  else
 
   begin
     update Appusers set Emailotp  = null where Email  = @Email  and [Emailotp]  = @Emailotp and Mobilenumber = @mobileno
   
     --select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts] 
     -- from Appusers where Email  = @Email and Mobilenumber = @mobileno
      select 1
   end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSDriversValidateCredentials]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversValidateCredentials]
@Mobilenumber varchar(20),@Password varchar(50)
as
begin

declare @cnt int

select @cnt = COUNT(*) from PSAppDrivers where Mobilenumber = @Mobilenumber

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Mobilenumber',16,1);
				return;
   end
   
select @cnt = COUNT(*) from PSAppDrivers where Password = @Password

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Password or mobile number',16,1);
				return;
   end
else

begin

  select @cnt = COUNT(*) from PSAppDrivers where Mobilenumber = @Mobilenumber and Password = @Password 
  if @cnt = 1
	begin
	
	select
	[Id]
      ,[Drivername]
      ,[Email]
      ,[Mobilenumber]    
      ,[StatusId]     
      ,[Firstname]
      ,[lastname]
      ,[AuthTypeId]
      from PSAppDrivers where Mobilenumber = @Mobilenumber and Password = @Password   		
	
	end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSDriversRetrivePassword]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSDriversRetrivePassword]
	-- Add the parameters for the stored procedure here
	@Email varchar(50)
	
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
        
    select a.Mobilenumber,a.Email from PSAppDrivers a
    where upper(a.Passwordotp) = upper(Passwordotp)
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[PSDriversPasswordverification]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversPasswordverification]
@Password varchar(50),@Passwordotp varchar(10),@Email varchar(50), @mobileno varchar(15)
as
begin

declare @otp varchar(10) = null

select @otp = @Passwordotp from PSAppDrivers where Mobilenumber = @mobileno and Email = @Email 

if @otp is null
begin
  
				RAISERROR ('Invalid mobile number or email address',16,1);
				return;
end
else
begin

  if @otp <> @Passwordotp
  begin
    
					RAISERROR ('Invalid Password OTP',16,1);
					return;
  end
   else
   begin
      update PSAppDrivers set Passwordotp  = null,Password = @Password where Mobilenumber = @mobileno and Email = @Email  
     select [Drivername] ,[Email] ,[Mobilenumber]  from PSAppDrivers where Mobilenumber = @mobileno and Email = @Email
  end
 
end
end
GO
/****** Object:  StoredProcedure [dbo].[PSDriversPasswordreset]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversPasswordreset]
@Password varchar(50),@Passwordotp varchar(10),@Email varchar(50), @Mobilenumber varchar(15)
as
begin

declare @otp int

select @otp = COUNT(*) from PSAppDrivers where Mobilenumber = @Mobilenumber and Email = @Email 

if @otp = 0
begin
  
				RAISERROR ('Mobile number or email address is not Registered',16,1);
				return;
end
else
begin

  if @otp > @Passwordotp
  begin
    
					RAISERROR ('Invalid Password OTP',16,1);
					return;
  end
   else
   begin
      update PSAppDrivers set Passwordotp  = null ,Password = @Password where Mobilenumber = @Mobilenumber and Email = @Email  
     select 1 --[Username] ,[Email] ,[Mobilenumber]  from Appusers where Mobilenumber = @Mobilenumber and Email = @Email
  end
 
end
end
GO
/****** Object:  StoredProcedure [dbo].[PSDriversMOTPverifying]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversMOTPverifying]
@Mobilenumber varchar(20),@Mobileotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from PSAppDrivers where Mobilenumber = @Mobilenumber

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from PSAppDrivers where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update PSAppDrivers set Mobileotp = null where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
     --select [Mobilenumber],[Username],[StatusId] from Appusers where Mobilenumber = @Mobilenumber
     select 1
  end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSDriversMOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversMOTPverification]
@PhoneNo varchar(50),@Mobileotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from StartBooking where PhoneNo = @PhoneNo

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from StartBooking where PhoneNo = @PhoneNo and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update StartBooking set Mobileotp = null where PhoneNo = @PhoneNo and [Mobileotp] = @Mobileotp
     select [PhoneNo],[BNo],[EntryDate] from StartBooking where PhoneNo = @PhoneNo
  end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSDriversInsUpdDelPasswordverification]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversInsUpdDelPasswordverification]
@Mobilenumber varchar(20) = null,
@Email varchar(50) =null
as
begin


declare @cnt int,@p varchar(5)
declare @dt datetime
 
set @dt = GETDATE()
select @p = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))


	select @cnt = COUNT(*) from PSAppDrivers where Mobilenumber = @Mobilenumber and Email = @Email
	if @cnt = 0
	begin
	            RAISERROR ('Invalid mobile number or email address',16,1);
				return;	
	end
	else
	begin
	    update dbo.PSAppDrivers 
	    set [Passwordotp] = @p  
	    where Mobilenumber = @Mobilenumber and Email = @Email
		 select @p
	end

   
end
GO
/****** Object:  StoredProcedure [dbo].[PSDriversInsUpdDelMOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversInsUpdDelMOTPverification]
@flag varchar,@Id int=-1,@Mobilenumber varchar(20),@Mobileotp varchar(10),@Email varchar(50) =null
as
begin

declare @cnt int

select @cnt = COUNT(*) from PSAppDrivers where Mobilenumber = @Mobilenumber

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from PSAppDrivers where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update PSAppDrivers set Mobileotp = null where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
     select [Drivername] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts]  from PSAppDrivers where Mobilenumber = @Mobilenumber
  end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSDriversInsUpdDelEOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversInsUpdDelEOTPverification]
@flag varchar,@Id int=-1,@Email varchar(50),@Emailotp varchar(10),@Mobilenumber varchar(20) = null
as
begin

declare @cnt int

select @cnt = COUNT(*) from PSAppDrivers where Email = @Email

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Email',16,1);
				return;
   end

else

begin

  select @cnt = COUNT(*) from PSAppDrivers where Email = @Email and [Emailotp] = @Emailotp 
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid Email OTP',16,1);
					return;
	end
 
  else
 
   begin
     update PSAppDrivers set Emailotp  = null where Email  = @Email  and [Emailotp]  = @Emailotp
     select [Drivername] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts]  from PSAppDrivers where Email  = @Email
   end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSDriversEOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSDriversEOTPverification]
@Email varchar(50),@Emailotp varchar(10),@mobileno varchar(20)
as
begin

declare @cnt int

select @cnt = COUNT(*) from PSAppDrivers where Email = @Email and Mobilenumber = @mobileno

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Email address or mobile number',16,1);
				return;
   end

else

begin

  select @cnt = COUNT(*) from PSAppDrivers where Email = @Email and [Emailotp] = @Emailotp and Mobilenumber = @mobileno
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid Email address or Email OTP',16,1);
					return;
	end
 
  else
 
   begin
     update PSAppDrivers set Emailotp  = null where Email  = @Email  and [Emailotp]  = @Emailotp and Mobilenumber = @mobileno
   
     --select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts] 
     -- from Appusers where Email  = @Email and Mobilenumber = @mobileno
      select 1
   end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSDriversChangePwd]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversChangePwd]
@Password varchar(50),@Email varchar(50), @Mobilenumber varchar(15),@NewPassword varchar(50)
as
begin

declare @pwd int

select @pwd = COUNT(*) from PSAppDrivers where Mobilenumber = @Mobilenumber and Email = @Email 

if @pwd = 0
begin
  
				RAISERROR ('Mobile number or email address is not Registered',16,1);
				return;
end

  if @pwd > @Password
  begin
    
					RAISERROR ('Invalid Password',16,1);
					return;
										
  end
  else 

begin  
      update PSAppDrivers set Password = @NewPassword where Mobilenumber = @Mobilenumber and Email = @Email  
     select 1 --[Username] ,[Email] ,[Mobilenumber]  from Appusers where Mobilenumber = @Mobilenumber and Email = @Email
  end

end
GO
/****** Object:  StoredProcedure [dbo].[PSdrivers]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSdrivers]
@DId int=-1,@NAme nvarchar(50),@Address nvarchar(50),@City nvarchar(50),@Pin nvarchar(50),@PAddress nvarchar(50),@PCity nvarchar(50),@PPin nvarchar(50),@OffMobileNo float,@PMobNo nvarchar(50),@DOB date,@DOJ date,@BloodGroup nvarchar(50),@LicenceNo nvarchar(50),@LiCExpDate date,@BadgeNo nvarchar(50),@BadgeExpDate date,@Remarks nvarchar(50)
as
begin
declare @cnt int, @m varchar(5) 


insert into DriverMaster
	([NAme] ,[Address] ,[City],[Pin] ,
	[PAddress] ,[PCity] ,[PPin],[OffMobileNo],
	[PMobNo],[DOB],[DOJ],[BloodGroup],[LicenceNo],[LiCExpDate],
	[BadgeNo],[BadgeExpDate],[Remarks] )	
	values
	( @NAme,@Address ,@City ,@Pin,
	@PAddress ,@PCity ,@PPin ,@OffMobileNo,
	@PMobNo,@DOB,@DOJ,@BloodGroup,@LicenceNo,
	@LiCExpDate,@BadgeNo,@BadgeExpDate,@Remarks)
	
	


if @cnt = 0
		begin
				RAISERROR ('No user registered with given mobile number',16,1);
				return;
		end
		
		Update  DriverMaster
	set [NAme]= @NAme ,	
	[Address]= @Address,	
	[City]= @City,
	[Pin]=@Pin ,
	[PAddress]= @PAddress,
	[PCity]= @PCity,
	[PPin]=@PPin,
	[OffMobileNo]= @OffMobileNo,
	[PMobNo]= @PMobNo,
	[DOB]= @DOB,
	[DOJ]= @DOJ,
	[BloodGroup]= @BloodGroup,
	[LicenceNo]= @LicenceNo,
	[LiCExpDate]= @LiCExpDate,
	[BadgeNo]= @BadgeNo,
	[BadgeExpDate]= @BadgeExpDate,
	[Remarks]= @Remarks
	
	
	from DriverMaster
	
	where PMobNo = @PMobNo 
	
	 
	
	
	select [NAme] ,[Address] ,[City],[PAddress] ,[PCity]  from DriverMaster where PMobNo = @PMobNo
	

END
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelplace]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSInsUpdDelplace]
@flag varchar,@id int=-1,@name varchar(50),@countryid varchar(50),@code varchar(50)

as
begin
if @flag ='I'
begin
Insert into dbo.place
([name],[countryid],[code])
values
(@name,@countryid,@code)
end
if @flag ='U'
begin
Update  dbo.place
set [name]=@name,
[countryid]=@countryid,
[code]=@code
where id=@id
end
if @flag ='D'
begin
delete from  dbo.place
where id=@id
end
end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelPasswordverification]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdDelPasswordverification]
@Mobilenumber varchar(20) = null,
@Email varchar(50) =null
as
begin


declare @cnt int,@p varchar(5)
declare @dt datetime
 
set @dt = GETDATE()
select @p = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))


	select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Email = @Email
	if @cnt = 0
	begin
	            RAISERROR ('Invalid mobile number or email address',16,1);
				return;	
	end
	else
	begin
	    update dbo.Appusers 
	    set [Passwordotp] = @p  
	    where Mobilenumber = @Mobilenumber and Email = @Email
		 select @p
	end

   
end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelMOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdDelMOTPverification]
@flag varchar,@Id int=-1,@Mobilenumber varchar(20),@Mobileotp varchar(10),@Email varchar(50) =null
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update Appusers set Mobileotp = null where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
     select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts]  from Appusers where Mobilenumber = @Mobilenumber
  end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelHourBasePricing]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[PSInsUpdDelHourBasePricing]
@Id int = -1,
@VehicleModelId int,
--@VehicleModel varchar(50),

@hours varchar(5),
@price decimal(18, 0),
@FromTime [Time](7),
@ToTime [Time](7),

@insupddelflag varchar
as
begin
if @insupddelflag = 'I'
begin
INSERT INTO [dbo].[PSHoursBasePricing]
           ([VehicleModelId]
           ,[Hours]
           ,[FromTime]
            ,[ToTime]
           
           ,[Price])
     VALUES
           (@VehicleModelId
           ,@Hours
           ,@FromTime
           ,@ToTime                      
           ,@Price)
        end
        
    if @insupddelflag = 'U'
begin    

UPDATE [dbo].[PSHoursBasePricing]
   SET [VehicleModelId] = @VehicleModelId
      ,[Hours] = @Hours
      ,[Price] = @Price
       ,FromTime = @FromTime
       ,ToTime = @ToTime
     
 WHERE Id=@Id
 end
 
 if @insupddelflag = 'D'
 begin
 
 Delete from [dbo].[PSHoursBasePricing]
where Id = @Id
end
end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelEOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdDelEOTPverification]
@flag varchar,@Id int=-1,@Email varchar(50),@Emailotp varchar(10),@Mobilenumber varchar(20) = null
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Email = @Email

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Email',16,1);
				return;
   end

else

begin

  select @cnt = COUNT(*) from Appusers where Email = @Email and [Emailotp] = @Emailotp 
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid Email OTP',16,1);
					return;
	end
 
  else
 
   begin
     update Appusers set Emailotp  = null where Email  = @Email  and [Emailotp]  = @Emailotp
     select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts]  from Appusers where Email  = @Email
   end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelDistanceBasePricing]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PSInsUpdDelDistanceBasePricing]
@Id int = -1,
	@VehicleModelId int,
	@FromKm [int] ,
	@ToKm [int],
	@Pricing [decimal](18, 0),
	@FromTime [Time](7),
	@ToTime [Time](7),
	
	@insupddelflag varchar
as
begin
if @insupddelflag = 'I'
begin
INSERT INTO [dbo].[PSDistancePricing]
           ([VehicleModelId]
           ,[FromKm]
           ,[ToKm]
           ,[Pricing]
           ,[FromTime]
           ,[ToTime]
           )
     VALUES
           (@VehicleModelId,
           @FromKm,
           @ToKm,
           @Pricing,
           @FromTime,
           @ToTime)
  end
    if @insupddelflag = 'U'
begin
 UPDATE [dbo].[PSDistancePricing]
   SET [VehicleModelId] = @VehicleModelId,
      FromKm = @FromKm      
      ,ToKm = @ToKm
      ,Pricing = @Pricing
       ,FromTime = @FromTime
      ,ToTime = @ToTime
     
 WHERE Id=@Id
 end
 if @insupddelflag = 'D'
 begin
  delete from [dbo].[PSDistancePricing]
where Id = @Id
End

select [VehicleModelId],[FromKm],[ToKm],[FromTime],[ToTime],[Pricing] from PSDistancePricing where VehicleModelId = @VehicleModelId
end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdbooking]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PSInsUpdbooking]
@flag varchar,@EntryDate datetime=null,@BNo int=null,
@BookingType nvarchar(255)=null,@ReqDate datetime=null,
@ReqTime time(7)=null,@CallTime time(7)=null,
@ReqVehicle nvarchar(255)=null,@Customername nvarchar(255)=null,
@CusID nvarchar=null,
@PhoneNo nvarchar(50) = null,@AltPhoneNo nvarchar(255)=null,
@CAddress nvarchar(max)=null,@PickupAddress nvarchar(max),
@LandMark nvarchar(255)=null,@Package nvarchar(255)=null,
@PickupPalce nvarchar(255)=null,@DropPalce nvarchar(255)=null,
@ReqType nvarchar(255)=null,@ExtraCharge int=null,
@NoofVehicle int=null,
@ExecutiveName nvarchar(255)=null,@VID int=null,
@BookingStatus nvarchar(255)=null,@CustomerSMS nvarchar(255)=null,
@CancelReason nvarchar(255)=null,@CBNo decimal(18,1)=null,
@ModifiedBy nvarchar(255)=null,@CancelBy nvarchar(255)=null,
@ReconfirmedBy nvarchar(255)=null,
@AssignedBy nvarchar(255)=null,@ActionDate datetime=null,
@ActionTime time(7)=null,@latitude float=null,
@longitude float=null,@Mobileotp varchar(5)=null


AS
BEGIN

declare @cnt int, @m varchar(5) 
 declare @dt datetime
set @dt = GETDATE()


select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
if @flag = 'I'
	begin
	 
	insert into dbo.StartBooking
	([EntryDate]
      ,[BNo]
      ,[BookingType]
      ,[ReqDate]
      ,[ReqTime]
      ,[CallTime]
      ,[ReqVehicle]
      ,[Customername]
      ,[CusID]
      ,[PhoneNo]
      ,[AltPhoneNo]
      ,[CAddress]
      ,[PickupAddress]
      ,[LandMark]
      ,[Package]
      ,[PickupPalce]
      ,[DropPalce]
      ,[ReqType]
      ,[ExtraCharge]
      ,[NoofVehicle]
      ,[ExecutiveName]
      ,[VID]
      ,[BookingStatus]
      ,[CustomerSMS]
      ,[CancelReason]
      ,[CBNo]
      ,[ModifiedBy]
      ,[CancelBy]
      ,[ReconfirmedBy]
      ,[AssignedBy]
      ,[ActionDate]
      ,[ActionTime],[latitude],[longitude],[Mobileotp])
      	values
	( @dt,@BNo,@BookingType,@dt,@dt,@dt,@ReqVehicle,@Customername,@CusID,@PhoneNo,@AltPhoneNo,@CAddress,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ReqType,@ExtraCharge,@NoofVehicle,@ExecutiveName,@VID,@BookingStatus,@CustomerSMS,@CancelReason,@CBNo,@ModifiedBy,@CancelBy,@ReconfirmedBy,@AssignedBy,@dt,@dt,@latitude ,@longitude ,@m)
	
	
	end
	
	
	
	if @flag ='U'
	begin
	select @cnt = COUNT(*) from StartBooking where PhoneNo = @PhoneNo
	

	if @cnt = 0
		begin
				RAISERROR ('No user registered with given mobile number',16,1);
				return;
		end
	else
    begin
	
	
	Update  dbo.StartBooking
	set[EntryDate] = @dt
      ,[BNo]=@BNo
      ,[BookingType]=@BookingType
      ,[ReqDate]=@dt
      ,[ReqTime]=@dt
      ,[CallTime]=@dt
      ,[ReqVehicle]=@ReqVehicle
      ,[Customername]=@Customername
      ,[CusID]=@CusID
      ,[PhoneNo]=@PhoneNo
      ,[AltPhoneNo]=@AltPhoneNo
      ,[CAddress]=@CAddress
      ,[PickupAddress]=@PickupAddress
      ,[LandMark]=@LandMark
      ,[Package]=@Package
      ,[PickupPalce]=@PickupPalce
      ,[DropPalce]=@DropPalce
      ,[ReqType]=@ReqType
      ,[ExtraCharge]=@ExtraCharge
      ,[NoofVehicle]=@NoofVehicle
      ,[ExecutiveName]=@ExecutiveName
      ,[VID]=@VID
      ,[BookingStatus]=@BookingStatus
      ,[CustomerSMS]=@CustomerSMS
      ,[CancelReason]=@CancelReason
      ,[CBNo]=@CBNo
      ,[ModifiedBy]=@ModifiedBy
      ,[CancelBy]=@CancelBy
      ,[ReconfirmedBy]=@ReconfirmedBy
      ,[AssignedBy]=@AssignedBy
      ,[ActionDate]=@dt
      ,[ActionTime]=@dt
      ,[latitude]=@latitude
      ,[longitude]=@longitude
      ,[Mobileotp]=@Mobileotp
      
	from StartBooking
	
	where PhoneNo = @PhoneNo 
	
	 end
	
	end
	
	
	select [BNo] ,[Bookingtype],[ReqVehicle],[Customername],[PhoneNo],[latitude],[longitude]   from StartBooking where PhoneNo = @PhoneNo
	

END
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdBiopw]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSInsupdBiopw]
@flag varchar,@id int, @accid int,@biometricdata varchar(50),@datatype varchar(50),@active int,@datecreatedon date,@updatedon date,@Emailotp varchar(5),@Pwdotp varchar(5),@Password varchar(20),@statusId int,@AccountNo varchar(50),@AuthTypeId int,@AltPhonenumber varchar(20),@Altemail varchar(50)
as
begin
if @flag ='I'
begin
Insert into UserBiometricPwd
([accid],[biometricdata],[datatype],[active],[datecreatedon],[updatedon])
values
(@accid,@biometricdata,@datatype,@active,@datecreatedon,@updatedon)
end
if @flag ='U'
begin
update UserBiometricPwd
set[accid]=@accid,
   [biometricdata]=@biometricdata,
   [datatype]=@datatype,
   [active]=@active,
   [datecreatedon]=@datecreatedon,
   [updatedon]=@updatedon  
   where Id=@id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdAppusers]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PSInsUpdAppusers]
@flag varchar,@Id int=-1,@Username varchar(50) = null,@Email varchar(50) = null
,@Mobilenumber varchar(20),@Password varchar(50) = null,@Mobileotp varchar(10) = null
,@Emailotp varchar(10) = null,@Passwordotp varchar(10) = null,@StatusId int = null
,@CreatedOn datetime = null,
@Mobileotpsenton datetime = null,
@emailotpsenton datetime = null,
@noofattempts int = null,
@Firstname varchar(20),@lastname varchar(20),
@AuthTypeId int,@AltPhonenumber varchar(20),
@Altemail varchar(50),@AccountNo varchar(50)
AS
BEGIN

declare @cnt int, @m varchar(4), @p varchar(4),@e varchar(4)
declare @dt datetime
set @dt = GETDATE()

select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
select @e = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5

	if @flag = 'I'
	begin
	
	select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber 

	if @cnt > 0
		begin
				RAISERROR ('Already user registered with given mobile number',16,1);
				return;	
		end
		select @cnt = COUNT(*) from Appusers where Email = @Email
		
		if @cnt > 0
		begin
				RAISERROR ('Already user registered with given Email Address',16,1);
				return;	
		end
	else
    begin
    
	
	insert into dbo.Appusers 
	([Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts],[Firstname],[lastname],[AuthTypeId],[AltPhonenumber],[Altemail],[AccountNo] )
	values
	(@Username ,@Email ,@Mobilenumber ,@Password ,@m ,@e ,null ,@StatusId ,@dt ,@dt ,@dt ,0,@Firstname,@lastname,@AuthTypeId,@AltPhonenumber,@Altemail,@AccountNo)
	end
	
	end
	
	
	
	if @flag ='U'
	begin
	select @cnt = COUNT(*) from Appusers where (upper(UserName) = upper(@UserName) or Mobilenumber = @Mobilenumber
	or Email = @Email) and Id <> @Id

	if @cnt = 0
		begin
				RAISERROR ('No user registered with given mobile number',16,1);
				return;
		end
	else
    begin
	
	
	Update dbo.Appusers 
	set [Username]= @Username ,	
	[Email]= @Email,	
	[Password]= @Password,
	[Mobileotp]=@Mobileotp ,
	[Emailotp]= @Emailotp,
	[Passwordotp]= @Passwordotp,
	[StatusId]=@StatusId,
	[CreatedOn]= @CreatedOn,
	[Mobileotpsenton]= @Mobileotpsenton,
	[emailotpsenton]= @emailotpsenton,
	[noofattempts]= @noofattempts,
	[Firstname] =@Firstname,
	[lastname] =@lastname,
	[AuthTypeId] =@AuthTypeId,
	[AltPhonenumber] =@AltPhonenumber,
	[Altemail] =@Altemail,
	[AccountNo] =@AccountNo
	where Mobilenumber = @Mobilenumber 
	
	 end
	
	end
	
	
	select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts],[Firstname],[lastname],[AuthTypeId],[AltPhonenumber],[Altemail],[AccountNo]  from Appusers where Mobilenumber = @Mobilenumber
	

END
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdAppDrivers]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PSInsUpdAppDrivers]
@flag varchar,@Id int=-1,@Drivername varchar(50) = null,@Email varchar(50) = null
,@Mobilenumber varchar(20),@Password varchar(50) = null,@Mobileotp varchar(10) = null
,@Emailotp varchar(10) = null,@Passwordotp varchar(10) = null,@StatusId int = null
,@CreatedOn datetime = null,
@Mobileotpsenton datetime = null,
@emailotpsenton datetime = null,
@noofattempts int = null,
@Firstname varchar(20),@lastname varchar(20),
@AuthTypeId int,@AltPhonenumber varchar(20),
@Altemail varchar(50),@AccountNo varchar(50)
AS
BEGIN

declare @cnt int, @m varchar(4), @p varchar(4),@e varchar(4)
declare @dt datetime
set @dt = GETDATE()

select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
select @e = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5

	if @flag = 'I'
	begin
	
	select @cnt = COUNT(*) from PSAppDrivers where Mobilenumber = @Mobilenumber 

	if @cnt > 0
		begin
				RAISERROR ('Already user registered with given mobile number',16,1);
				return;	
		end
		select @cnt = COUNT(*) from PSAppDrivers where Email = @Email
		
		if @cnt > 0
		begin
				RAISERROR ('Already user registered with given Email Address',16,1);
				return;	
		end
	else
    begin
    
	
	insert into dbo.PSAppDrivers 
	([Drivername] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts],[Firstname],[lastname],[AuthTypeId],[AltPhonenumber],[Altemail],[AccountNo] )
	values
	(@Drivername ,@Email ,@Mobilenumber ,@Password ,@m ,@e ,null ,@StatusId ,@dt ,@dt ,@dt ,0,@Firstname,@lastname,@AuthTypeId,@AltPhonenumber,@Altemail,@AccountNo)
	end
	
	end
	
	
	
	if @flag ='U'
	begin
	select @cnt = COUNT(*) from PSAppDrivers where (upper(Drivername) = upper(@Drivername) or Mobilenumber = @Mobilenumber
	or Email = @Email) and Id <> @Id

	if @cnt = 0
		begin
				RAISERROR ('No user registered with given mobile number',16,1);
				return;
		end
	else
    begin
	
	
	Update dbo.PSAppDrivers 
	set [Drivername]= @Drivername ,	
	[Email]= @Email,	
	[Password]= @Password,
	[Mobileotp]=@Mobileotp ,
	[Emailotp]= @Emailotp,
	[Passwordotp]= @Passwordotp,
	[StatusId]=@StatusId,
	[CreatedOn]= @CreatedOn,
	[Mobileotpsenton]= @Mobileotpsenton,
	[emailotpsenton]= @emailotpsenton,
	[noofattempts]= @noofattempts,
	[Firstname] =@Firstname,
	[lastname] =@lastname,
	[AuthTypeId] =@AuthTypeId,
	[AltPhonenumber] =@AltPhonenumber,
	[Altemail] =@Altemail,
	[AccountNo] =@AccountNo
	where Mobilenumber = @Mobilenumber 
	
	 end
	
	end
	
	
	select [Drivername] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts],[Firstname],[lastname],[AuthTypeId],[AltPhonenumber],[Altemail],[AccountNo]  from PSAppDrivers where Mobilenumber = @Mobilenumber
	

END
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdallocatedriver]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PSInsUpdallocatedriver]
@flag varchar,@Id int=-1,@CompanyId int,@EntryDate datetime = null,@BookingNo int = null,@ReqDate datetime = null
,@ReqTime datetime = null,@CallTime datetime = null,@CustomerName nvarchar(255)= null,@CusID nvarchar(255) = null
,@PhoneNo nvarchar(255) = null,@AltPhoneNo nvarchar(255) = null,
@Address nvarchar(max) = null,@PickupAddress nvarchar(max) = null,@LandMark nvarchar(255) = null,
@PickupPlace nvarchar(255) = null,@DropPlace nvarchar(255) = null,@Package nvarchar(255)= null,
@VehicleType nvarchar(255)= NULL,@NoofVehicle int = NULL,@VechID int = NULL,@RegistrationNo nvarchar(255)= NULL,
@DriverName nvarchar(255)= NULL
,@PresentDriverLandMark nvarchar(255) =NULL,@ExecutiveName nvarchar(255)=NULL,@EffectiveDate date=null,
@EffectiveTill date=null
,@DriverId int,@VehicleModelId int = null,@ServiceTypeId int =null,@VehicleGroupId int=null
AS
BEGIN
declare @dt datetime
set @dt = GETDATE()

    if @flag='I'
	begin
	insert into dbo.PSVehicleAssign
	([CompanyId],[EntryDate],[BookingNo],[ReqDate],[ReqTime] ,[CallTime] ,[CustomerName] ,[CusID], [PhoneNo],[AltPhoneNo],[Address],[PickupAddress],[LandMark],[PickupPlace],[DropPlace],[Package],[VehicleType],
	[NoofVehicle],[VechID] ,[RegistrationNo],[DriverName],[PresentDriverLandMark],[ExecutiveName]
	,[EffectiveDate],[EffectiveTill],[DriverId],[VehicleModelId],[ServiceTypeId],[VehicleGroupId])	
	values
	(@CompanyId, @dt ,@BookingNo ,@dt,@dt ,@dt ,@CustomerName ,@CusID ,@PhoneNo,@AltPhoneNo,@Address,@PickupAddress,@LandMark,@PickupPlace,@DropPlace,@Package,@VehicleType,@NoofVehicle
	,@VechID,@RegistrationNo,@DriverName,@PresentDriverLandMark,@ExecutiveName,@EffectiveDate,@EffectiveTill,@DriverId,@VehicleModelId,@ServiceTypeId,@VehicleGroupId)
	end
	
	
	if @flag='U'
	begin   
	
	Update  [dbo].PSVehicleAssign
	set  [CompanyId]=@CompanyId,
	[EntryDate]= @dt,	
	[BookingNo]= @BookingNo,
	[ReqDate]=@dt ,
	[ReqTime]= @dt,
	[CallTime]= @dt,
	[CustomerName]=@CustomerName,
	[CusID]= @CusID,
	[PhoneNo]=@PhoneNo,
	[AltPhoneNo] =@AltPhoneNo,
	[Address] =@Address,
	[PickupAddress] = @PickupAddress,
	[LandMark] =@LandMark,
	[PickupPlace] =@PickupPlace,
	[DropPlace] =@DropPlace,
	[Package] =@Package,
	[VehicleType] =@VehicleType,
	[NoofVehicle] =@NoofVehicle,	
	[RegistrationNo] =@RegistrationNo,
	[DriverName] =@DriverName,
	[PresentDriverLandMark] =@PresentDriverLandMark,
	[ExecutiveName] =@ExecutiveName,
	[EffectiveDate] =@EffectiveDate,
	[EffectiveTill] =@EffectiveTill,
	[DriverId] = @DriverId,
	[VehicleModelId] =@VehicleModelId,
	[ServiceTypeId]=@ServiceTypeId,
	[VehicleGroupId]=@VehicleGroupId
    where VechID = @VechID
    	end
	
	select [CompanyId], [EntryDate] , [PhoneNo],[Address]
	,[Package],[VehicleType],[NoofVehicle]
	,[RegistrationNo],[DriverName],[EffectiveDate],[EffectiveTill],[DriverId],[VehicleModelId],[ServiceTypeId],[VehicleGroupId]
	from PSVehicleAssign where Id =@Id
END
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdAdd]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSInsupdAdd]
@flag varchar,@id int, @userid int,@email varchar(50),@Address varchar(250),@Accountid int,@preferenceTypeId int,@preferenceId int,@Emailotp varchar(5),@Pwdotp varchar(5),@Password varchar(20),@statusId int,@AccountNo varchar(50),@AuthTypeId int,@AltPhonenumber varchar(20),@Altemail varchar(50)
as
begin
if @flag ='I'
begin
Insert into Userpreferences
([userid],[email],[Address],[Accountid],[preferenceTypeId],[preferenceId])
values
(@userid,@email,@Address,@Accountid,@preferenceTypeId,@preferenceId)
end
if @flag ='U'
begin
update Userpreferences
set[userid]=@userid,
   [email]=@email,
   [Address]=@Address,
   [Accountid]=@Accountid,
   [preferenceTypeId]=@preferenceTypeId,
   [preferenceId]=@preferenceId  
   where Id=@id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[PSgetvehilcetypes]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetvehilcetypes]
@VID int 
as
begin
select * from PSVechileMaster --where VID = @VID
end
GO
/****** Object:  StoredProcedure [dbo].[PSgetvehiclemaster]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetvehiclemaster]
@VID int 
as
begin
select *from VechileMaster where VID = @VID
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetVehicleBookingDetails]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PSGetVehicleBookingDetails]
as
begin
SELECT [Id]
      ,[BNo]
      ,[BookedDate]
      ,[BookedTime]
      ,[DepartueDate]
      ,[DepartureTime]
      ,[BookingType]
      ,[Src]
      ,[Dest]
      ,[SrcId]
      ,[DestId]
      ,[SrcLatitude]
      ,[SrcLongitude]
      ,[DestLatitude]
      ,[DestLongitude]
      ,[VechId]
      ,[PackageId]
      ,[Pricing]
      ,[DriverId]
      ,[DriverPhoneNo]
      ,[CustomerPhoneNo]
      ,[CustomerId]
      ,[BookingStatus]
      ,[NoofVehicles]
      ,[NoofSeats]
      ,[ClosingDate]
      ,[ClosingTime]
      ,[CancelledOn]
      ,[CancelledBy]
      ,[BookingChannel]
      ,[Reasons]
      ,[CompanyId]
  FROM [dbo].[PSVehicleBookingDetails]
  end
GO
/****** Object:  StoredProcedure [dbo].[PSGetVechlogout]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetVechlogout]
@VechId int
as
begin
select       [CompanyId]
      ,[LogoutDate]
      ,[LogoutTime]
      ,[VechId]
      ,[RegNo]
      ,[DriverName]
      ,[LoginLandMark]
      ,[CurrentLandMark]
      ,[EndMtr]
      ,[CurStatus]
      ,[DriverMobileNo]
      ,[ExecutiveName]
      ,[Remarks]
      ,[GenratedAmount]
      ,[NoofTimesLogin]
      ,[EntryDate]
      ,[TotalGeneratedAmount]
      ,[LastVacantTime]
      ,[VechType]
      ,[EntryTime] 
      ,[VehicleModelId]
       ,[ServiceTypeId]
      ,[VehicleGroupId] from PSVechLogout
      
      end
GO
/****** Object:  StoredProcedure [dbo].[PSGetVechlogin]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetVechlogin]
@VechId int
as
begin
select       [CompanyId]
      ,[LoginDate]
      ,[LoginTime]
      ,[VechId]
      ,[RegNo]
      ,[DriverName]
      ,[LoginLandMark]
      ,[CurrentLandMark]
      ,[StartKiloMtr]
      ,[CurStatus]
      ,[DriverMobileNo]
      ,[ExecutiveName]
      ,[Remarks]
      ,[GenratedAmount]
      ,[NoofTimesLogin]
      ,[EntryDate]
      ,[TotalGeneratedAmount]
      ,[LastVacantTime]
      ,[VechType]
      ,[EntryTime] 
      ,[VehicleModelId]
       ,[ServiceTypeId]
      ,[VehicleGroupId] from PSVechLogin
      
      end

/****** Object:  StoredProcedure [dbo].[PSGetVechlogout]    Script Date: 07/29/2017 10:12:42 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[PSGetvechicletypes]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetvechicletypes]
as
begin
select [VID],[RegistrationNo],[Type] from PSVechileMaster
select [NAme] from PSDriverMaster
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetusertickets]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetusertickets]
@PhoneNumber varchar(20)
as
begin
select * from dbo.TroubleTicket where PhoneNumber = @PhoneNumber
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetUserpreferences]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetUserpreferences]
as
begin
select * from dbo.Userpreferences
end
GO
/****** Object:  StoredProcedure [dbo].[PSdocuments]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSdocuments]
(@flag varchar,@Id int,
@TicketId int,@Filename varchar(50),
@Content varchar(50),@CreatedOn datetime,
@Createdby  int,@ParentTypeId int)
as
begin
if @flag = 'I'
begin
insert into [dbo].[Attachments]
([TicketId],[Filename],[Content],[CreatedOn],[Createdby],[ParentTypeId])
values
(@TicketId,@Filename,@Content,@CreatedOn,@Createdby,@ParentTypeId)
end
if @flag = 'U'
begin
update [dbo].[Attachments]
set [TicketId]=@TicketId,
[Filename]=@Filename,
[Content]=@Content,
[CreatedOn]=@CreatedOn,
[Createdby]=@Createdby,
[ParentTypeId]=@ParentTypeId
where Id=@Id

end
end
GO
/****** Object:  StoredProcedure [dbo].[PSChangePwd]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSChangePwd]
@Password varchar(50),@Email varchar(50), @Mobilenumber varchar(15),@NewPassword varchar(50)
as
begin

declare @pwd int

select @pwd = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Email = @Email 

if @pwd = 0
begin
  
				RAISERROR ('Mobile number or email address is not Registered',16,1);
				return;
end

  if @pwd > @Password
  begin
    
					RAISERROR ('Invalid Password',16,1);
					return;
										
  end
  else 

begin  
      update Appusers set Password = @NewPassword where Mobilenumber = @Mobilenumber and Email = @Email  
     select 1 --[Username] ,[Email] ,[Mobilenumber]  from Appusers where Mobilenumber = @Mobilenumber and Email = @Email
  end

end
GO
/****** Object:  StoredProcedure [dbo].[PSbookingdetail]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSbookingdetail]
@PartyName varchar(50)
as
begin
select PickupPlace,DropPlace,EntryDate,EntryTime from ClosingReport where PartyName = @PartyName
select Status from Customer_SMS_booking
select vechType from AvilableVehicle
end
GO
/****** Object:  StoredProcedure [dbo].[InsupdUserdownloads]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsupdUserdownloads]
@flag varchar,@id int, @Android varchar(50),@Win varchar(50),@Ios varchar(50),@Websitedown varchar(50),@Iosdown varchar(50),@Wincount varchar(50)
as
begin
if @flag ='I'
begin
Insert into UserDownloads
([Android],[Win],[Ios],[Websitedown],[Iosdown],[Wincount])
values
(@Android,@Win,@Ios,@Websitedown,@Iosdown,@Wincount)
end
if @flag ='U'
begin
update UserDownloads
set[Android]=@Android,
   [Win]=@Win,
   [Ios]=@Ios,
   [Websitedown]=@Websitedown,
   [Iosdown]=@Iosdown,
   [Wincount]=@Wincount  
   where id=@id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[InsupdUsercard]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsupdUsercard]
@flag varchar,@id int, @AccId int,@Cardno varchar(20),@ccv varchar(5),@Expyear varchar(10),@expmonth varchar(10),@Statusid int,@isDefault varchar(10)
as
begin
if @flag ='I'
begin
Insert into Usercards
([AccId],[Cardno],[ccv],[Expyear],[expmonth],[Statusid],[isDefault])
values
(@AccId,@Cardno,@ccv ,@Expyear,@expmonth,@Statusid ,@isDefault )
end
if @flag ='U'
begin
update Usercards
set[AccId]=@AccId,
   [Cardno]=@Cardno,
   [ccv]=@ccv,
   [Expyear]=@Expyear,
   [expmonth]=@expmonth,
   [Statusid]=@Statusid,
   [isDefault]=@isDefault
   where Id=@id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[InsupdUserPreferences]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsupdUserPreferences]
@flag varchar,@Id int, 
@userid int,@email varchar(50),
@Address varchar(250),@Accountid int,
@preferenceTypeId int,@PreferenceId int
as
begin
declare @cnt int

if @flag ='I'
begin

Insert into dbo.Userpreferences
([userid],[email],[Address],
[Accountid],[preferenceTypeId],
[PreferenceId])
values
(@userid,@email,@Address ,
@Accountid,@preferenceTypeId,
@PreferenceId)

end
if @flag ='U'
begin
update dbo.Userpreferences
set[userid]=@userid,
   [email]=@email,
   [Address]=@Address,
   [Accountid]=@Accountid,
   [preferenceTypeId]=@preferenceTypeId,
   [PreferenceId]=@PreferenceId
   
   where Id=@Id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFares]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelFares](@Id int,@FromStop varchar(50),@ToStop varchar(50),@Fare varchar(50),@Active varchar(50),@RouteId varchar(50),@Name varchar(50))
as
begin
insert into Fares values(@Id,@FromStop,@ToStop,@Fare,@Active,@RouteId,@Name)
end



/****** Object:  StoredProcedure [dbo].[Sp_InsTypeGroups]    Script Date: 05/04/2016 11:24:12 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InsupdTroubleTicket]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsupdTroubleTicket]
(@flag varchar,@id int=null,
@Userid int=null,@EmailId varchar(50)=null,@CreatedOn date,@Onbehalfofph Varchar(20)=null,
@TicketNo varchar(20)=null,@Catid int=null,@Description varchar(50)=null,@Emailsent int=null,@Smssent int=null,
@TicketTypeId int=null,@PhoneNumber varchar(20)=null,@StatusId int=null)
as
begin
declare
@currDate date 
set @currDate = getdate()

if @flag = 'I'
begin
insert into [dbo].[TroubleTicket]
([Userid],[EmailId],[CreatedOn],[On behalf of ph],[TicketNo],[Catid],[Description],[Emailsent],[Sms sent],[TicketTypeId],[PhoneNumber],[StatusId]) 
values
(@Userid,@EmailId,@currDate,@Onbehalfofph,@TicketNo,@Catid,@Description,@Emailsent,@Smssent,@TicketTypeId,@PhoneNumber,@StatusId)
end
if @flag = 'U'
begin
update[dbo].[TroubleTicket]
set [Userid]=@Userid,
[EmailId]=@EmailId,
[CreatedOn]=@currDate,
[On behalf of ph]=@Onbehalfofph,
[TicketNo]=@TicketNo,
[Catid]=@Catid,
[Description]=@Description,
[Emailsent] =@Emailsent,
[Sms sent]=@Smssent, 
[TicketTypeId]=@TicketTypeId,
[PhoneNumber]=@PhoneNumber ,
[StatusId] =@StatusId
where id=@id

end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdOnlineTicketTransactions]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsUpdOnlineTicketTransactions]
@Id int = -1,
@TicketNo varchar(30)
           ,@Amount decimal(18,0)
           ,@PaymentMode varchar(50)
           ,@transDate datetime
           ,@BookingId int
           ,@GateWayTransId varchar(50)
           ,@TransStatus varchar(20)
           ,@TransStatusId int
           ,@TransType varchar(50)
           ,@TransTypeId int
           ,@insupddelflag varchar
AS
BEGIN
if @insupddelflag = 'I' 
	begin
	INSERT INTO [POSDashboard].[dbo].[BookingPaymentDetails]
           ([TicketNo]
           ,[Amount]
           ,[PaymentMode]
           ,[transDate]
           ,[BookingId]
           ,[GateWayTransId]
           ,[TransStatus]
           ,[TransStatusId]
           ,[TransType]
           ,[TransTypeId])
     VALUES
           (@TicketNo
           ,@Amount
           ,@PaymentMode
           ,@transDate
           ,@BookingId
           ,@GateWayTransId
           ,@TransStatus
           ,@TransStatusId
           ,@TransType
           ,@TransTypeId
           )
           
           select SCOPE_IDENTITY()
           
end
else
if @insupddelflag = 'U'
begin
UPDATE [POSDashboard].[dbo].[BookingPaymentDetails]
   SET [TicketNo] = @TicketNo
      ,[Amount] = @Amount
      ,[PaymentMode] = @PaymentMode
      ,[transDate] = @transDate
      ,[BookingId] = @BookingId
      ,[GateWayTransId] = @GateWayTransId
      ,[TransStatus] = @TransStatus
      ,[TransStatusId] = @TransStatusId
      ,[TransType] = @TransType
      ,[TransTypeId] = @TransTypeId
 WHERE id = @Id

   select @Id
   
end


	
END
GO
/****** Object:  StoredProcedure [dbo].[Getsp_Availableseats]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getsp_Availableseats]
@Src_Id int,
@Des_Id int
AS
BEGIN
SELECT  [Id]
      ,[Bus_Id]
      ,[Bustype]
      ,[From_Time]
      ,[To_Time]
      ,[Availableseats]
      ,[Cost]
      ,[Sourcename]
      ,[Destinationname]
      ,[SourceId]
      ,[DestinationId]
      ,[Travelsname]
      ,[Duration]
  FROM [POSDashboard].[dbo].[Ex_Availableseats] where SourceId=@Src_Id and DestinationId=@Des_Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetSMSProviderConfig]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetSMSProviderConfig]
AS
BEGIN
	
select * from SMSProviderConfig
end
GO
/****** Object:  StoredProcedure [dbo].[getSmsGatewayeConfiguration]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[getSmsGatewayeConfiguration]
as
begin
SELECT Distinct [Id]
      ,[username]
      ,[pwd]   
      ,[providername]
      ,[saltkey]
      ,[startdate]
      ,[hashkey]
      ,[ClientId]
      ,[SecretId]
     
  FROM [POSDashboard].[dbo].[SmsGatewayeConfiguration] 
    
  
    
end

/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSGatewayConfiguration]    Script Date: 07/18/2016 17:10:33 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[getSMSEmailSubscribers]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getSMSEmailSubscribers]
as
begin
select * from SMSEmailSubscribers
end
GO
/****** Object:  StoredProcedure [dbo].[getSMSEmailConfiguration]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[getSMSEmailConfiguration]
as
begin
 SELECT  Distinct 
      [enddate]
      ,[hashkey]
      ,[Id]
      ,[providername]
      ,[pwd]
      ,[saltkey]
      ,[startdate]
      ,[username] 
     ,[Port]
     ,[ClientId]
     ,[SecretId]
  FROM [POSDashboard].[dbo].[SMSEmailConfiguration] 

end


/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSEmailConfiguration]    Script Date: 07/18/2016 17:07:36 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[getShoppingCart]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getShoppingCart]
(@ItemId int =-1)
as
begin
SELECT distinct 
      [ItemId]
      ,i.[ItemName]
      ,[UnitPrice]
      ,s.[Id]
      ,[TransactionId]
      ,[Transaction_Num]
      ,[amount]
      ,[Quantity]
      ,[Status]
      ,[SalesOrderNum]
      ,[PaymentMode]
      ,[Date]
      ,[Transactionstatus]
      ,[Gateway_transid]
      ,ty.[Name]
      
  FROM [POSDashboard].[dbo].[ShoppingCart]s 
  inner join InventoryItem i on i.Id=s.ItemId
  inner join Types ty on ty.Id=s.Transactionstatus
  
  order by [ItemId]
end
GO
/****** Object:  StoredProcedure [dbo].[GetShippingOrder]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetShippingOrder]

as begin 
SELECT [Id]
      ,[ShippingOrderNum]
      ,[TransactionId]
      ,[Date]
      ,[amount]
      ,[Status]
      ,[SalesOrderId]
  FROM [POSDashboard].[dbo].[ShippingOrder]

         
end
GO
/****** Object:  StoredProcedure [dbo].[GetSchedules]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSchedules]

as begin 
SELECT  [Id]
      ,[SNo]
      ,[ServiceNo]
      ,[From]
      ,[To]
      ,[CoachType]
      ,[DepartureTime]
      ,[ApproxJourneytime]
  FROM [POSDashboard].[dbo].[Schedules]
         
end
GO
/****** Object:  StoredProcedure [dbo].[getRoutesConfiguration]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRoutesConfiguration]
as
begin
select * from RoutesConfiguration
end
GO
/****** Object:  StoredProcedure [dbo].[getRoutes]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRoutes]
as
begin
SELECT r.[Id]
      ,[RouteName]
      ,r.[Code]
      ,r.[Description]
      ,r.[Active]
      ,src.name as Source
      ,dest.name as Destination
      ,[SourceId]
      ,[DestinationId]
      ,[Distance]
  FROM [POSDashboard].[dbo].[Routes] r
  inner join stops src on src.id = r.sourceid
  inner join stops dest on dest.id = destinationid
  order by RouteName
end
GO
/****** Object:  StoredProcedure [dbo].[GetRouteFare]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetRouteFare]
(@RouteId int)
AS
BEGIN
	
SELECT 
      rs.[Id]
      ,rs.[RouteId]     
      ,rs.[FromStopId]
      ,rs.[ToStopId]
      ,rs.[Distance]     
      ,case when rf.perunitprice is null then 0 else rf.perunitprice 
end as PerUnitPrice
          ,case when rf.Amount is null then 0 else rf.Amount 
end as Amount
  FROM [POSDashboard].[dbo].[RouteStops] rs
left outer join [POSDashboard].[dbo].[RouteFare] rf
on rf.routestopid = rs.id
  where rs.RouteId = @RouteId

select S.Name,S.Id from routedetails rd
inner join stops S on rd.StopId = S.Id 
where rd.RouteId = @RouteId

end
GO
/****** Object:  StoredProcedure [dbo].[getRouteDetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRouteDetails]
(@routeid int = -1)
as
begin

SELECT r.[Id]
      ,r.routename as routename
	  ,r.code as routecode      
      ,src.name source
      , dest.name dest
  FROM [POSDashboard].[dbo].[Routes] r
inner join stops src on src.id = r.sourceid
inner join stops dest on dest.id = r.destinationid
where r.Id = @routeid or @routeid = -1

SELECT rd.[Id]
      ,r.routename as routename
	  ,r.code as routecode
      ,[RouteId]      
      ,stopid
      ,src.name StopName
      ,src.code StopCode
	  ,[PreviousStopId]
      ,[NextStopId]
      ,prevstops.name prevstop
      ,nextstops.name nextstop
      ,[DistanceFromSource]
      ,[DistanceFromDestination]
      ,[DistanceFromPreviousStop]
      ,[DistanceFromNextStop]   
	  ,[StopNo]   
  FROM [POSDashboard].[dbo].[RouteDetails] rd
  inner join stops src on src.id = rd.stopid
inner join routes r on r.id = rd.routeid
inner join stops prevstops on prevstops.id =previousstopid
inner join stops nextstops on nextstops.id = nextstopid
  where (@routeid = -1 or routeid = @routeid)
  order by stopno

end


/****** Object:  StoredProcedure [dbo].[InsUpdDelRouteDetails]    Script Date: 07/18/2016 16:58:29 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetRoles]
(@allroles int = -1)
as
begin

if @allroles = -1

select distinct Roles.Id, Roles.Name, Description, Roles.Active,IsPublic
from Roles

else

if @allroles = 0

select distinct Roles.Id, Roles.Name, Description, Roles.Active,IsPublic
from Roles 
where ispublic = 0

else
 
select distinct Roles.Id, Roles.Name, Description, Roles.Active,IsPublic
from Roles 
where ispublic = 1

end
GO
/****** Object:  StoredProcedure [dbo].[GetRoleObjectAccesses]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRoleObjectAccesses] 	
@roleid int = -1
AS
BEGIN
	select t.name,t.ID accessid, o.Name  as objname, r.Name as rolename from Types t
inner join RoleObjectAccesses roa on roa.AccessId = t.Id
inner join Objects o on o.Id = roa.ObjectId
inner join Roles r on r.Id = roa.RoleId
where r.Id = @roleid or @roleid = -1

END
GO
/****** Object:  StoredProcedure [dbo].[getRoledetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRoledetails]
as begin 
select * from Roles
end
GO
/****** Object:  StoredProcedure [dbo].[getRegistrationBTPOS]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getRegistrationBTPOS]
as
begin
select * from RegistrationBTPOS
end
GO
/****** Object:  StoredProcedure [dbo].[Getregister]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Getregister]
as begin
select * from register
end
GO
/****** Object:  StoredProcedure [dbo].[GetReceivingsMaster]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetReceivingsMaster]
AS
BEGIN
	
select * from ReceivingsMaster
end
GO
/****** Object:  StoredProcedure [dbo].[GetReceivings]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetReceivings]
AS
BEGIN
	
select * from Receivings
end
GO
/****** Object:  StoredProcedure [dbo].[GetPurchaseOrder]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetPurchaseOrder]

as begin 
SELECT po.[Id]
      ,[PONum]
      ,[TransactionId]
      ,[Date]
      ,[amount]
      ,[itemId]
      ,[Quantity]
      ,t.name Status
      ,i.ItemName
  FROM [POSDashboard].[dbo].[PurchaseOrder] po
  inner join Types t on t.Id = po.StatusId
  inner join InventoryItem i on i.Id = po.itemId
       
end



SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetPOSDetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPOSDetails]
AS
BEGIN

SELECT t.[Id]
      ,[POSId]
      ,[Status]
      ,g.GroupName
      ,g.Id
      ,[Location]
  FROM [POSDashboard].[dbo].[POSTerminal] t
  inner join dbo.Groups g on g.Id = t.GroupId

END

/****** Object:  Table [dbo].[TroubleTicketingDetails]    Script Date: 06/08/2016 17:03:12 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[getpaysmart]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getpaysmart]
as
begin
select* from types
end
GO
/****** Object:  StoredProcedure [dbo].[getPayments]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getPayments]
as
begin
select * from Payment
end
GO
/****** Object:  StoredProcedure [dbo].[getPaymentReceivings]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getPaymentReceivings]
as
begin
select * from PaymentReceivings
end
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentHistory]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetPaymentHistory]

as begin 
SELECT * from PaymentHistory

       
end
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentGatewayType]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetPaymentGatewayType]
AS
BEGIN
	
select * from PaymentGatewayType
end
GO
/****** Object:  StoredProcedure [dbo].[getPaymentGatewaySettings]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getPaymentGatewaySettings]
as
begin
SELECT  [enddate]
      ,[hashkey]
      ,p.[Id]
      ,[PaymentGatewayTypeId]
      ,[providername]
      ,[pwd]
      ,[saltkey]
      ,[startdate]
      ,[username]
	  ,[ClientId]
      ,[SecretId]
      ,Ty.Name
    
  FROM [POSDashboard].[dbo].[PaymentGatewaySettings] p
  inner join TypeGroups Ty on Ty.Id = p.Id 
    
end
GO
/****** Object:  StoredProcedure [dbo].[getExpenses]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getExpenses]
as
begin
select * from Expenses
end
GO
/****** Object:  StoredProcedure [dbo].[getEditHistoryDetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getEditHistoryDetails]
(@edithistoryid int =-1)
as
begin
SELECT [EditHistoryId]
      ,[FromValue]
      ,[ToValue]
      ,[ChangeType]
      ,[Field1]
      ,[Field2]
      ,e.Task
      ,e.SubItem
  FROM [POSDashboard].[dbo].[EditHistoryDetails] ed
  inner join EditHistory e on e.Id = ed.EditHistoryId
  WHERE EditHistoryId = @edithistoryid
  
end
GO
/****** Object:  StoredProcedure [dbo].[getEditHistory]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getEditHistory]
as
begin
SELECT [Field]
      ,[SubItem]
      ,[Comment]
      ,[Date]
      ,[ChangedBy]
      ,[ChangedType]
      ,[Task]
      ,[Id]
  FROM [POSDashboard].[dbo].[EditHistory]
end
GO
/****** Object:  StoredProcedure [dbo].[GetDownloadCount]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetDownloadCount]

as
begin
select * from dbo.UserDownloads
end
GO
/****** Object:  StoredProcedure [dbo].[Getalltickets]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Getalltickets]

as
begin
select * from dbo.Resolutionhistory
end
GO
/****** Object:  StoredProcedure [dbo].[Getallocatedriver]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Getallocatedriver]
@VechID int
as
begin
select * from [dbo].[VehicleAssign]
end
GO
/****** Object:  StoredProcedure [dbo].[GetAlertsConfiguration]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAlertsConfiguration]
(@roleId int = -1)
as
begin

select a.Id atypeid,r.Name,r.Id as roleid,AlertTypeId
,t.Name AlertType
,case when a.AlertTypeId IS null then 0 else 1 end as assigned
 from Types t
left outer join [AlertsConfiguration] a on a.AlertTypeId = t.Id 
left outer join Roles r on a.RoleId = r.id
where ((r.Id = @roleId or @roleId = -1)
and t.TypeGroupId = 8)


END
GO
/****** Object:  StoredProcedure [dbo].[GetAlerts]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetAlerts]

as begin 
select t1.Id,
t1.Date,
t1.Message,
t1.MessageTypeId,
t1.StatusId,
t1.UserId,
t1.Name,
t2.FirstName+' '+t2.LastName as Username

 from Alerts t1
 inner join Users t2 on t2.Id=t1.UserId
                        
                         
                     
end
GO
/****** Object:  StoredProcedure [dbo].[Get TroubleTicketingSlaType]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Get TroubleTicketingSlaType]
AS
BEGIN
	
select * from TroubleTicketingSlaType
end
GO
/****** Object:  StoredProcedure [dbo].[Get LicenceCatergories]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Get LicenceCatergories]
AS
BEGIN
	
select * from LicenceCatergories
end
GO
/****** Object:  StoredProcedure [dbo].[documents]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[documents]
(@flag varchar,@Id int,
@TicketId int,@Filename varchar(50),
@Content varchar(50),@CreatedOn datetime,
@Createdby  int,@ParentTypeId int)
as
begin
if @flag = 'I'
begin
insert into [Paysmart].[dbo].[Attachments]
([TicketId],[Filename],[Content],[CreatedOn],[Createdby],[ParentTypeId])
values
(@TicketId,@Filename,@Content,@CreatedOn,@Createdby,@ParentTypeId)
end
if @flag = 'U'
begin
update [Paysmart].[dbo].[Attachments]
set [TicketId]=@TicketId,
[Filename]=@Filename,
[Content]=@Content,
[CreatedOn]=@CreatedOn,
[Createdby]=@Createdby,
[ParentTypeId]=@ParentTypeId
where Id=@Id

end
end
GO
/****** Object:  StoredProcedure [dbo].[Getnearestvechiles]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Getnearestvechiles]
as
begin
declare @logt numeric(10,6),
@lat numeric(10,6)
 select
 @lat = Latitude,@logt = longitude from StartBooking where  Id=Id
 select Id
 from StartBooking where dbo.PSStartBooking(latitude,longitude,@lat,@logt)<=5000
 and Id!=Id
 end
GO
/****** Object:  StoredProcedure [dbo].[Getmulitiplicationsave]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getmulitiplicationsave]
AS
BEGIN
	
select * from mulitiplicationsave
end
GO
/****** Object:  StoredProcedure [dbo].[getmenu]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getmenu]
as
begin
select * from menu
end
GO
/****** Object:  StoredProcedure [dbo].[getloginpage]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getloginpage]
as
begin
select * from loginpage	
end
GO
/****** Object:  StoredProcedure [dbo].[getlogin]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getlogin]
as
begin
select*from login
end
GO
/****** Object:  StoredProcedure [dbo].[GetLicenseTypes]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetLicenseTypes]
(@licenseCategoryId int =-1)
AS
BEGIN
	SELECT lt.[Id]
      ,[LicenseCatId]
      ,[LicenseType]
      ,lt.[Description]
      ,t.Name as licenseCategory
	  ,lt.[Active]
  FROM [POSDashboard].[dbo].[LicenseTypes] lt
inner join Types t on t.Id = licensecatid
  where ([LicenseCatId] = @licenseCategoryId or @licenseCategoryId = -1)
END
GO
/****** Object:  StoredProcedure [dbo].[GetLicensePricing]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetLicensePricing]
(@categoryid int = -1)
as 
begin 

SELECT lp.[Id]
      ,[LicenseId]
	  ,LicenseType
      ,[RenewalFreqTypeId]
      ,[RenewalFreq]
      ,[UnitPrice]
      ,[fromdate]
      ,[todate]
      ,t.Name as licensefreq
      , case when t.id = 15 then 'Every' +str(lp.renewalfreq)+ ' Week(s)'
		 when t.id = 16 then 'Every' +str(lp.renewalfreq)+ ' Month(s)'
		 when t.id = 17 then 'Every' +str(lp.renewalfreq)+ ' Quarter(s)'
		 when t.id = 18 then 'Every' +str(lp.renewalfreq)+ ' Half Year(s)'
        else 'Every'+str(lp.renewalfreq)+' year(s)'
       end as freq
  FROM [POSDashboard].[dbo].[LicensePricing] lp
inner join types t on t.id = lp.renewalfreqtypeid
 inner join licensetypes lt on lt.id = lp.licenseid
 where (lt.LicenseCatId = @categoryid or @categoryid = -1)


end


/****** Object:  StoredProcedure [dbo].[InsUpdDelLicensePricing]    Script Date: 07/18/2016 16:48:16 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[getLicensePayments]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getLicensePayments]
as
begin
SELECT 
us.FirstName + '' + us.LastName as UName
,'LC001' as licenseCode
,lt.LicenseType
,[StartDate]
,[ExpiryOn]
,r.Name as RenewFreq
,lc.Name as LicenseCat
,u.[Id]
,u.[UserId]           
,[FOId]      
,[LicenseTypeId]            
      ,[GracePeriod]
      ,[ActualExpiry]
      ,[LastUpdatedOn]
      ,[RenewFreqTypeId]

      ,u.[Active]
      ,u.[StatusId]
     ,f.FleetOwnerCode
   --  ,uld.Tax
   --  ,uld.Discount
     --,ulp.UnitPrice
  FROM [POSDashboard].[dbo].[UserLicense]u
  inner join Users us on us.Id=u.UserId
  inner join FleetOwner f on f.Id=u.FOId
  inner join Types r on r.Id = RenewFreqTypeId
  inner join LicenseTypes lt on lt.Id = LicenseTypeId
  inner join Types lc on lc.Id = lt.LicenseCatId
  --inner join UserLicensePayments ulp on ulp.Id = u.Id
  --inner join ULPymtTransDetails uld on uld.Id = u.id
end
GO
/****** Object:  StoredProcedure [dbo].[GetLicensePageDetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetLicensePageDetails]
(@catId int = -1)
as
begin

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Id]
      ,[LicenseCatId]
      ,[LicenseType]
      ,[Description]
      ,[Active]
  FROM [POSDashboard].[dbo].[LicenseTypes]
  where (LicenseCatId = @catId or @catId = -1)
  
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 ld.[Id]
      ,[LicenseTypeId]
      ,t.Id FeatureTypeId
      ,t.name [FeatureName]
      ,[FeatureLabel]
      ,[FeatureValue]
      ,[LabelClass]
      ,ld.[Active]
      ,[fromDate]
      ,[toDate]
  FROM [POSDashboard].[dbo].[LicenseDetails]ld
  inner join Types t on t.id = ld.featuretypeid
  
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 lp.[Id]
      ,[LicenseId]
      ,t.name [RenewalFreqType]
      ,t.id [RenewalFreqTypeId]
      ,[RenewalFreq]
      ,[UnitPrice]
      ,[fromdate]
      ,[todate]
      ,lp.[Active]
  FROM [POSDashboard].[dbo].[LicensePricing] lp
  inner join Types t on t.id = lp.renewalFreqTypeId
  
  end
GO
/****** Object:  StoredProcedure [dbo].[GetLicenseDetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetLicenseDetails]
@ltypeId int = -1
as begin 
SELECT ld.[Id]
      ,[LicenseTypeId]
      ,t.name [FeatureName]
      ,t.id FeatureTypeId
      ,[FeatureLabel]
      ,[FeatureValue]
      ,[LabelClass]
      ,ld.[Active]
      ,[fromDate]
      ,[toDate]
  FROM [POSDashboard].[dbo].[LicenseDetails] ld
  inner join Types t on t.id = ld.featuretypeid
  where ([LicenseTypeId] = @ltypeId or @ltypeId = -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetLicenseConfigDetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetLicenseConfigDetails]
@ltypeId int = -1
as 
begin 

SELECT [Id]
      ,[LicenseType]
      ,[LicenseCode]
      ,[LicenseCatId]
      ,[Description]
      ,[Active]
      ,[EffectiveFrom]
      ,[EffectiveTill]
  FROM [POSDashboard].[dbo].[LicenseTypes]
  where Id = @ltypeId

 

SELECT ld.[Id]
      ,[LicenseTypeId]
      ,t.name [FeatureName]
      ,t.id FeatureTypeId
      ,t.TypeGroupId
      ,[FeatureLabel]
      ,[FeatureValue]
      ,[LabelClass]
      ,ld.[Active]
      ,[fromDate]
      ,[toDate]
      --,[LicenseTypeGroupId]
      ,case when ld.id IS null then 0 else 1 end assigned
  FROM Types t
  left outer join [POSDashboard].[dbo].[LicenseDetails] ld on t.id = ld.featuretypeid
  and ([LicenseTypeId] = @ltypeId)
  where t.typegroupId = 9 
   
  SELECT [Id]
      ,[LicenseId]
      ,[RenewalFreqTypeId]
      ,[RenewalFreq]
      ,[UnitPrice]
      ,[fromdate]
      ,[todate]
      ,[Active]
  FROM [POSDashboard].[dbo].[LicensePricing]
  where LicenseId = @ltypeId

 
  SELECT I.[Id]
  ,[ItemName]
  ,[Code]
      ,[LicenseTypeId]
      ,[BTPOSTypeId]
      ,[NoOfUnits]
      ,[Label]
      ,[LableClass]
      ,[fromdate]
      ,[todate]
      ,[Active]
       ,case when b.id IS null then 0 else 1 end assigned
  FROM [POSDashboard].[dbo].[InventoryItem] I
  left outer join [POSDashboard].[dbo].[LicenseBTPOS] b on b.btpostypeid = I.Id
  and licensetypeid = @ltypeId
  where I.SubCategoryId = 1
  
  
end
GO
/****** Object:  StoredProcedure [dbo].[GetLicenceStatus]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLicenceStatus]
AS
BEGIN
	
select * from LicenceStatus
end
GO
/****** Object:  StoredProcedure [dbo].[GetLicenceCatergories]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLicenceCatergories]
AS
BEGIN
	
SELECT t.Id, t.Name, t.[Description],t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 from [Types] t
	 inner join TypeGroups tg on tg.Id = t.TypeGroupId	 
	  where (TypeGroupId = 3)


SELECT t.Id, t.Name, t.[Description],t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 from [Types] t
	 inner join TypeGroups tg on tg.Id = t.TypeGroupId	 
	  where (TypeGroupId = 7)
  
  
SELECT t.Id, t.Name, t.[Description],t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 from [Types] t
	 inner join TypeGroups tg on tg.Id = t.TypeGroupId	 
	  where (TypeGroupId = 9)
  
  
  SELECT [Id]
      ,[ItemName]
      ,[Code]
      ,[Description]
      ,[CategoryId]
      ,[SubCategoryId]      
      ,[ItemImage]
  FROM [POSDashboard].[dbo].[InventoryItem] I
  where I.SubCategoryId = 1
  
  
end
GO
/****** Object:  StoredProcedure [dbo].[GetInvoices]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetInvoices]

as begin 
SELECT Io.[Id]
      ,[Invoices]
      ,[TransactionId]
      ,[Date]
      ,[amount]
      ,[item]
      ,[Quantity]
      ,t.Name Status
      ,i.ItemName
  FROM [POSDashboard].[dbo].[Invoices] Io
  inner join Types t on t.Id =Io.Id
  inner join InventoryItem i on i.Id = Io.Id


       
end

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetInventorySubCategories]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInventorySubCategories] 	
AS
BEGIN
	
	SELECT S.[Id]
      ,S.[Name]
      ,S.[Description]
      ,[CategoryId]
      ,t.NAME CATEGORY
      ,S.[Active]
  FROM [POSDashboard].[dbo].[SubCategory] S
  INNER JOIN Types T ON T.ID = S.CATEGORYID
  INNER JOIN TypeGroups TG ON TG.Id = T.TypeGroupId AND TG.ID = 1
   



	
END
GO
/****** Object:  StoredProcedure [dbo].[GetInventorySales]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetInventorySales]
As
BEGIN
SELECT sl.[Id]
      ,sl. ItemName
      ,sl.[Quantity]
      ,sl.PerUnitPrice
      ,sl.[PurchaseDate]
      ,sl.[InVoiceNumber]
  FROM [POSDashboard].[dbo].[InventorySales] sl
  


 


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
END



/****** Object:  StoredProcedure [dbo].[InsupddelInventorySales]    Script Date: 04/27/2016 17:49:02 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[getInventoryReceivings]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getInventoryReceivings]
as
begin
select * from InventoryReceivings
end
GO
/****** Object:  StoredProcedure [dbo].[GetInventoryPurchases]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetInventoryPurchases]
as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id]
      ,[ItemName]
      ,[Quantity]
      ,[PerUnitPrice]
      ,[PurchaseDate]
      ,[PurchaseOrderNumber]
  FROM [POSDashboard].[dbo].[InventoryPurchases]



END
GO
/****** Object:  StoredProcedure [dbo].[GetInventoryItem]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetInventoryItem]
@subCatId int = -1
as 
begin
SELECT I.[Id]
      ,[ItemName]
      ,[Code]
      ,I.[Description]
      ,t.name as Category
      ,t.id as categoryid
      ,s.name as SubCategory
      ,s.id as SubCategoryId
      ,[ReOrderPoint]
  FROM [POSDashboard].[dbo].[InventoryItem]I
 inner join types t on t.id = i.categoryid
 INNER JOIN SubCategory s  ON s.id = I.SubCategoryid
  where s.Id  = @subCatId or @subCatId = -1
  
end
GO
/****** Object:  StoredProcedure [dbo].[getInventory]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getInventory]
as
begin
select * from Inventory
end
GO
/****** Object:  StoredProcedure [dbo].[gethelp]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[gethelp]
as
begin
select* from help
end
GO
/****** Object:  StoredProcedure [dbo].[GetFOVehicleFareConfig]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetFOVehicleFareConfig]
(@vehicleid int, @routeId int)
as
begin

SELECT [VehicleId]
      ,[Id]
      ,[RouteId]
      ,[Amount]
      ,[PricingTypeId]
      ,[FromDate]
      ,[ToDate]
      ,[UnitPrice]
      ,[SourceId]
      ,[DestinationId]
  FROM [POSDashboard].[dbo].[FORouteFare]
  where vehicleid = @vehicleid and RouteId = @routeId

SELECT distinct
      src.name Src
      ,src.Id FromStopId
	  ,dest.name Dest
	  ,dest.Id ToStopId
	  ,f.[FORouteStopId]
      ,[VehicleTypeId]
      ,r.[Distance]
      ,[PerUnitPrice]
      ,[Amount]
      ,[FareTypeId]
      --,[Active]
      ,[FromDate]
      ,[ToDate]
      ,[VehicleId]
     
  FROM [POSDashboard].[dbo].fleetownerroutestop fs    
  inner join routestops r on r.id = fs.routestopid
  inner join stops src on src.id =r.fromstopid
  inner join stops dest on dest.id =r.tostopid
  left outer join [FleetOwnerRouteFare] f on (fs.routestopid = f.foroutestopid and f.vehicleid = @vehicleid)
where r.routeId = @routeId
order by src.Id 

end


/****** Object:  StoredProcedure [dbo].[GetLicensePageDetails]    Script Date: 06/03/2016 10:09:29 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[getFORVehicleSchedule]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getFORVehicleSchedule]
(@fleetOwnerId int, @routeid int, @vehicleId int)
as
begin

SELECT distinct 
      rd.stopid
      ,src.name StopName
      ,src.code StopCode	 
	  ,[StopNo]
      ,fs.arrivalhr
      ,fs.arrivalmin
      ,fs.arrivalampm
      ,fs.departurehr
      ,fs.departuremin
      ,fs.departureampm
	  ,fs.ArrivalTime
	  ,fs.DepartureTime
  FROM [POSDashboard].[dbo].[RouteDetails] rd
  inner join stops src on src.id = rd.stopid
  inner join fleetownerstops fos 
on (fos.stopid = rd.stopid and fos.fleetownerid = @fleetownerid and fos.routeid = @routeid)
left outer join FORouteFleetSchedule fs 
on fs.stopid = fos.stopid and (fs.fleetownerid = @fleetownerid and fs.routeid = @routeid
and fs.vehicleId = @vehicleId)
  where  (rd.routeid = @routeid )
  order by stopno

end


/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetAvailability]    Script Date: 07/18/2016 14:56:34 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetFORouteFare]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFORouteFare]
AS
BEGIN
	
SELECT fo.[Id]
      ,[VehicleId]
      ,[RouteId]
      ,[PricingTypeId]
      ,[UnitPrice]
      ,[Amount]
      ,fo.[SourceId]
      ,fo.[DestinationId]
      ,f.[VehicleRegNo]
      ,r.RouteName
      ,r.Code
   
      ,[FromDate]
      ,[ToDate]
     
  FROM [POSDashboard].[dbo].[FORouteFare]fo
  inner join FleetDetails f on f.Id = fo.Id
  inner join Routes r on r.Id = fo.Id


end
GO
/****** Object:  StoredProcedure [dbo].[GetFleetStaff]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFleetStaff]
	-- Add the parameters for the stored procedure here
	(@fleetowner int = -1, @cmpId int = -1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT fs.[Id]
      ,fs.[RoleId]
      ,[UserId]
      ,[FromDate]
      ,[ToDate]
      ,[VehicleId]
      ,FD.VehicleRegNo
      ,u.FirstName + ' ' +u.LastName as UserName
      ,r.Name as rolename
  FROM [POSDashboard].[dbo].[FleetStaff] FS
      inner join FleetDetails FD on FD.Id = FS.vehicleId
      inner join Users u on fs.UserId=u.id
inner join Roles r on r.Id = FS.Roleid
where ((FD.FleetOwnerId = @fleetowner or @fleetowner = -1)
 and (FD.CompanyId = @cmpId or @cmpId  = -1))

END
GO
/****** Object:  StoredProcedure [dbo].[GetFleetScheduleList]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFleetScheduleList]
(@fleetId int = -1, @RouteId int =-1)
as
begin
SELECT fsl.[Id]
      ,[ScheduleName]
      ,fd.VehicleRegNo
      ,r.RouteName
      ,[FleetId]
      ,[RouteId]
      ,[StartTime]
      ,[EndTime]
      ,[CreatedOn]
      ,[UpdatedOn]
      ,[CreatedBy]
      ,[UpdatedBy]
  FROM [POSDashboard].[dbo].[FleetScheduleList] fsl
  inner join FleetDetails fd on fsl.fleetid = fd.Id
  inner join Routes r on r.Id = fsl.routeid
  where (FleetId= @fleetId or @fleetId = -1)
  and (RouteId = @RouteId or @RouteId = -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetfleetRoutes]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetfleetRoutes] 	
(@routeid int =-1, @fleetownerId int = -1, @cmpId int = -1)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT fr.[Id]
      ,fr.[VehicleId]
      ,fr.[RouteId]
      ,fd.VehicleRegNo
      ,t.name vehicleType
      ,t.Id as VehicleTypeId
      ,r.RouteName
      ,[EffectiveFrom]
      ,[EffectiveTill]
      ,[RouteName]
  FROM [POSDashboard].[dbo].[FleetRoutes] fr
  inner join FleetDetails fd on fd.Id = fr.VehicleId
  inner join Routes r on r.Id = fr.RouteId
  inner join types t on t.id = fd.vehicletypeid
  where ((@routeid = -1 or fr.RouteId = @routeid)
and (fd.CompanyId = @cmpid or @cmpId = -1)
and (fd.fleetownerid = @fleetownerId or @fleetownerId = -1))

END
GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteStop]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetFleetOwnerRouteStop]
AS
BEGIN
		
SELECT [FleetOwnerId]
      ,[RouteStopId]
      ,[Id]
  FROM [POSDashboard].[dbo].[FleetOwnerRouteStop]

end
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteFare]    Script Date: 07/18/2016 15:23:33 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteFare]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFleetOwnerRouteFare]
AS
BEGIN
	
SELECT [Id]
      ,[FORouteStopId]
      ,[VehicleTypeId]
      ,[Distance]
      ,[PerUnitPrice]
      ,[Amount]
      ,[FareTypeId]
      ,[Active]
      ,[FromDate]
      ,[ToDate]
      ,[VehicleId]
  FROM [POSDashboard].[dbo].[FleetOwnerRouteFare]


end
GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteDetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetFleetOwnerRouteDetails]
(@fleetOwnerId int, @routeid int)
as
begin

SELECT r.[Id]
      ,r.routename as routename
	  ,r.code as routecode      
      ,src.name source
      , dest.name dest
  FROM [POSDashboard].[dbo].[Routes] r
inner join stops src on src.id = r.sourceid
inner join stops dest on dest.id = r.destinationid
where r.Id = @routeid 

SELECT distinct rd.[Id]
      ,r.routename as routename
	  ,r.code as routecode
      ,rd.[RouteId]      
      ,rd.stopid
      ,src.name StopName
      ,src.code StopCode
	  ,[PreviousStopId]
      ,[NextStopId]
      ,prevstops.name prevstop
      ,nextstops.name nextstop
      ,[DistanceFromSource]
      ,[DistanceFromDestination]
      ,[DistanceFromPreviousStop]
      ,[DistanceFromNextStop]   
	  ,[StopNo]
      ,case 
when fos.stopid is null then 0
 else 1 end assigned
  FROM [POSDashboard].[dbo].[RouteDetails] rd
  inner join stops src on src.id = rd.stopid
inner join routes r on r.id = rd.routeid
inner join stops prevstops on prevstops.id =previousstopid
inner join stops nextstops on nextstops.id = nextstopid
left outer join fleetownerstops fos 
on fos.stopid = rd.stopid and (fos.fleetownerid = @fleetownerid and fos.routeid = @routeid)
  where  (rd.routeid = @routeid )
  order by stopno

end
GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteAssigned]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetFleetOwnerRouteAssigned]
(@fleetownerId int)
AS
BEGIN
	
SELECT 
      fr.[Id],
      fr.[FleetOwnerId],
      fr.[CompanyId],
      r.routename,
      r.code,
      r.[Id] RouteId,
      [FromDate],
      [ToDate],
      fr.[Active]
      ,case when u.id is null then 0 else 1 end assigned
      ,src.name as srcStop
      ,src.id as srcId
      ,dest.name as destStop
      ,dest.Id as destId
      ,r.distance
  FROM routes r
inner join [POSDashboard].[dbo].[FleetOwnerRoute] fr on r.id = fr.routeid
inner join stops src on src.id = r.SourceId
inner join stops dest on dest.id = r.DestinationId
 inner join fleetowner f on f.id = fr.fleetownerid 
  inner join users u on f.userid = u.id 
  where f.Id = @fleetownerId

end
GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRoute]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetFleetOwnerRoute]
(@cmpId int = -1, @fleetownerId int = -1)
AS
BEGIN
	
SELECT distinct
      fr.[Id],
      fr.[FleetOwnerId],
      fr.[CompanyId],
      r.routename,
      r.code,
      r.[Id] RouteId,
      [FromDate],
      [ToDate],
      fr.[Active]
      ,case when fr.FleetOwnerId is null then 0 else 1 end assigned
      --,0 assigned
  FROM [routes] r
left outer join [POSDashboard].[dbo].[FleetOwnerRoute] fr 
on r.id = fr.routeid and  (fr.fleetownerid = @fleetownerId or @fleetownerId = -1)
order by RouteName


end
GO
/****** Object:  StoredProcedure [dbo].[getFleetOwner]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getFleetOwner]
as
begin

SELECT U.[Id]
      ,U.[FirstName]
      ,U.[LastName]      
      ,U.[EmpNo]
      ,U.[EmailId]
      ,U.[Address]
      ,U.[ContactNo1]    
      ,U.[Active]
      ,U.[MiddleName]
      ,mgr.Firstname + ' ' +mgr.LastName as mgrName
      ,mgr.Id
      ,ul.logininfo as UserName
      ,ul.passkey as [Password]            
      ,c.name as [Company]
	  ,u.FirstName+' '+u.LastName as Name
	  ,FO.FleetOwnerCode
      ,FO.CompanyId     
  FROM [POSDashboard].[dbo].[Users] U
  inner join FleetOwner FO on U.Id = FO.UserId
  inner join company c on (U.companyid = c.id)
  left outer join Users mgr on mgr.id = U.managerid
  left outer join dbo.userlogins ul on ul.userid = U.id      

end
GO
/****** Object:  StoredProcedure [dbo].[GetFleetDetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[GetFleetDetails] 
	-- Add the parameters for the stored procedure here
	(@cmpId int = -1, @fleetOwnerId int = -1, @vehicleId int=-1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT v.[Id]
      ,[VehicleRegNo]
      ,vt.[Name] as VehicleType
      ,vt.Id AS VehicleTypeId
      ,lt.Name AS vehiclelayout
      ,lt.Id as vehiclelayoutId
      ,st.Name as ServiceType
      ,st.Id as ServiceTypeId
      , u.FirstName +' '+u.LastName as FleetOwnerName 
      ,c.[Name] as CompanyName
      ,v.[Active]
      ,[LayoutTypeId]
      ,[EngineNo]
      ,[FuelUsed]
      ,[MonthAndYrOfMfr]
      ,[ChasisNo]
      ,[SeatingCapacity]
      ,[DateOfRegistration]
     FROM [POSDashboard].[dbo].[FleetDetails]v
    inner join Types vt on vt.Id=v.VehicleTypeId
    inner join Types st on st.Id=v.ServiceTypeId
   inner join Types lt on lt.Id = v.layouttypeid
    inner join company c on c.Id=v.CompanyId
    inner join FleetOwner f on f.id=v.FleetOwnerId
   inner join Users u on u.Id = f.UserId
 --   inner join BTPOSDetails bd on bd.FleetOwnerId=f.Id
 --   inner join VehicleDetails vd on vd.fleetOwnerId=f.Id
    
	 where  ((v.Id= @vehicleId or @vehicleId = -1)
	 and (v.FleetOwnerId = @fleetOwnerId or @fleetOwnerId = -1)
	 and (v.CompanyId = @cmpId or @cmpId = -1))
   
    -- Insert statements for procedure here
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[GetFleetBtpos]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetFleetBtpos] 
	-- Add the parameters for the stored procedure here
	(@cmpId int=-1, @fleetOwnerId int = -1)
AS
BEGIN
SELECT fb.[Id]
      ,[VehicleId]
      ,[FromDate]
      ,[ToDate]
      ,[BTPOSId]
      ,bt.POSID
      ,fd.VehicleRegNo
  FROM [POSDashboard].[dbo].[FleetBtpos] fb
  inner join fleetdetails fd on fd.id = fb.vehicleid
  inner join BTPOSDetails bt on bt.id = fb.btposid
 where ((fd.companyid = @cmpId or @cmpId = -1)
  and (fd.fleetownerid = @fleetOwnerId or @fleetOwnerId = -1))

	
END
GO
/****** Object:  StoredProcedure [dbo].[GetFleetAvailability]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetFleetAvailability]
(@cmpId int=-1, @fleetOwnerId int = -1)
as
begin
SELECT fa.[Id]
      ,fd.VehicleRegNo
      ,[VehicleId]
      ,[FromDate]
      ,[ToDate]
      ,u.firstname + ' ' + u.lastname as FleetOwner
  FROM [POSDashboard].[dbo].[FleetAvailability] FA
  inner join fleetdetails fd on fd.id = FA.vehicleid
  inner join FleetOwner  fo on fo.Id = fd.FleetOwnerId
  inner join users u on u.id = fo.UserId
 where ((fd.companyid = @cmpId or @cmpId = -1)
  and (fd.fleetownerid = @fleetOwnerId or @fleetOwnerId = -1))

end
GO
/****** Object:  StoredProcedure [dbo].[Getfiledetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Getfiledetails] 
as
begin
select * from dbo.Attachments
end
GO
/****** Object:  StoredProcedure [dbo].[GetFileContentStops]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFileContentStops]

AS
BEGIN

SELECT--R.[Id]
      --R.[RouteName]
     -- ,R.[Code]      
      S.[Name]
      --,S.[Code]
      -- ,R1.[Amount]
  FROM [POSDashboard].[dbo].[Stops] S
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end
GO
/****** Object:  StoredProcedure [dbo].[GetFileContentRoutes]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFileContentRoutes]

AS
BEGIN

SELECT--R.[Id]
      R.[RouteName]
     -- ,R.[Code]      
      --,S.[Name]
      --,S.[Code]
      -- ,R1.[Amount]
  FROM [POSDashboard].[dbo].[Routes] R
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end


/****** Object:  StoredProcedure [dbo].[GetFileContentStops]    Script Date: 07/09/2016 17:25:25 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetFileContentRouteFare]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFileContentRouteFare]

AS
BEGIN

SELECT--R.[Id]
      --R.[RouteName]
     -- ,R.[Code]      
     -- S.[Name]
      --,S.[Code]
      R1.[Amount]
  FROM [POSDashboard].[dbo].[RouteFare] R1
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end

/****** Object:  StoredProcedure [dbo].[GetFileContentRoutes]    Script Date: 07/09/2016 17:25:12 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetFileContentIndex]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFileContentIndex]

AS
BEGIN

SELECT--R.[Id]
      --R.[RouteName]
     -- ,R.[Code]      
     -- S.[Name]
      --,S.[Code]
      I1.IndexFileData
    
  FROM [POSDashboard].[dbo].[Index] I1
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end
/****** Object:  StoredProcedure [dbo].[GetFileContentRouteFare]    Script Date: 07/09/2016 17:24:55 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetFileContentBTPOSDetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFileContentBTPOSDetails]

AS
BEGIN

SELECT--R.[Id]
      --R.[RouteName]
     -- ,R.[Code]      
     -- S.[Name]
      --,S.[Code]
      B1.[POSID]
  FROM [POSDashboard].[dbo].[BTPOSDetails] B1
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end
/****** Object:  StoredProcedure [dbo].[GetFileContentIndex]    Script Date: 07/09/2016 17:24:41 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetFileContentAuthentication]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFileContentAuthentication]

AS
BEGIN

SELECT--R.[Id]
      --R.[RouteName]
     -- ,R.[Code]      
     -- S.[Name]
      --,S.[Code]
      A1.UserName,
      A1.Password
  FROM [POSDashboard].[dbo].[Authentication] A1
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end
/****** Object:  StoredProcedure [dbo].[GetFileContentBTPOSDetails]    Script Date: 07/09/2016 17:24:26 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetFileContent]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetFileContent]
	(@filename varchar(20) = null, @btposid varchar(15) = null)
AS
BEGIN
declare @fileNameUpper varchar(20)
set @fileNameUpper = UPPER(@filename)

declare @btposDBid int

if @btposid is not null 
begin
select @btposDBid = ID from BTPOSDetails where POSID = @btposid

end
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	if @fileNameUpper = 'INDEXFILE' 
    begin
		-- Insert statements for procedure here
		SELECT 'ROUTESFILE'
		union
		SELECT 'STOPSFILE'
		union
		SELECT 'ROUTEFARE'
		union
		SELECT 'AUTHFILE'
    end
    else
    if @fileNameUpper = 'MENUFILE'
    begin
					--SELECT 'Ticketing' menuitem,1 id,0 parentid,1 active
					--union
     --               SELECT 'Validate ticket',2,0,1
     --               union
     --               SELECT 'Set Route',3,0,1
     --               union
     --               SELECT 'Server comm',4,0,1
     --               union
     --               SELECT 'Print trans',5,0,1
     --               union
     --               SELECT 'POS Config',6,0,1
     --               union
     --               SELECT 'Misc Expense',7,1,1
     --               union
     --               SELECT 'Payment Options',8,1,1
     --               union
     --               SELECT 'Cash',9,8,1
     --               union
     --               SELECT 'Card',10,8,1
     --               union
     --               SELECT 'Mobile Money',11,8,1
     --               union
     --               SELECT 'Ping Server',12,4,1
     --               union
     --               SELECT 'Download files',13,4,1
     --               union
     --               SELECT 'Reset Password',14,6,1
     --               union
     --               SELECT 'Show Co-ords',15,6,1
     --               union
     --               SELECT 'Renewal Frequency',16,6,1
     
     SELECT 'Epayments Sales' menuitem,1 id,0 parentid,1 active  Union all
SELECT 'Validate Epayments',2,0,1  Union all
SELECT 'Epayments Mode',3,0,1  Union all
SELECT 'Reprint Invoice',4,0,1  Union all
SELECT 'Reports',5,0,1  Union all
SELECT 'POS Config',6,0,1  Union all
SELECT 'Eticketing RouteNo',7,2,1  Union all
SELECT 'Events Ticket No',8,2,1  Union all
SELECT 'Etokens No',9,2,1  Union all
SELECT 'Ebiller Code',10,2,1  Union all
SELECT 'Emoney Trxn Code',11,2,1  Union all
SELECT 'Ecurrency Used',12,2,1  Union all
SELECT 'Eticketing Route',13,3,1  Union all
SELECT 'Quick sale Option',14,3,1  Union all
SELECT 'Events Tickets',15,3,1  Union all
SELECT 'Electronic Tokens',16,3,1  Union all
SELECT 'Electronic Billers',17,3,1  Union all
SELECT 'Ecurrency',18,3,1  Union all
SELECT 'ManchesterVsIndia 007',19,15,1  Union all
SELECT 'MichealJacksonConcert',20,15,1  Union all
SELECT 'Tour Great Zimbabwe',21,15,1  Union all
SELECT 'VisitTheGreatDugeon 018',22,15,1  Union all
SELECT 'Airtime Juice Cards',23,16,1  Union all
SELECT 'Electricity Prepaid Card',24,16,1  Union all
SELECT 'water Tokens',25,16,1  Union all
SELECT 'Gas Tokens',26,16,1  Union all
SELECT 'Fuel Tokens',27,16,1  Union all
SELECT 'Econet Wireless',28,23,1  Union all
SELECT 'Telecel',29,23,1  Union all
SELECT 'Netone',30,23,1  Union all
SELECT 'Police',31,17,1  Union all
SELECT 'Road Fees',32,17,1  Union all
SELECT 'Vehicle Expenses',33,17,1  Union all
SELECT 'Rank Fees',34,17,1  Union all
SELECT 'Food And Accomodation',35,17,1  Union all
SELECT 'Other Expenses',36,17,1  Union all
SELECT 'Set Base Currency',37,18,1  Union all
SELECT 'Enable Currency Converter',38,18,1  Union all
SELECT 'Send Or Recieve Money',39,18,1  Union all
SELECT 'Send Emoney',40,39,1  Union all
SELECT 'Recieve Emoney',41,39,1  Union all
SELECT 'Refund Emoney',42,39,1  Union all
SELECT 'Ping Server',43,6,1  Union all
SELECT 'Download Files',44,6,1  Union all
SELECT 'Factory Reset',45,6,1
                    order by id
                    
                    
                    
    end
    else 
    if @fileNameUpper = 'ROUTESFILE'
    begin
		select Code,r.Id,r.active from routes r
		inner join FleetRoutes fr on fr.routeid = r.Id
		inner join FleetBtpos fp on fp.vehicleid = fr.vehicleid
		inner join BTPOSDetails b on b.id = fp.btposid
		where b.id = @btposDBid
		
	end
    else
    if @fileNameUpper = 'STOPSFILE'
    begin
    
    --Stage 01<id,routeid,active>
		select distinct s.Name,s.id stopid,rd.routeId,1  		
		from FleetBtpos fb 
		inner join FleetRoutes fr on fr.VehicleId = fb.VehicleId
		inner join RouteStops rs on rs.RouteId = fr.RouteId
		inner join FleetOwnerRouteStop frs on frs.RouteStopId = rs.Id		
		inner join RouteDetails rd on rd.RouteId = fr.RouteId
		inner join Stops s on s.Id = rd.stopid
		where BTPOSId =  @btposDBid
		ORDER BY ROUTEID
		
	end
    else
    if @fileNameUpper = 'ROUTEFARE'
    begin
    
    --Route|Src|tgt<fare>
    
		SELECT r.id,s.id srcid,d.id destid,fof.amount,r.routename,r.Code,s.name,d.name,fof.perunitprice,fof.distance
		  FROM [POSDashboard].[dbo].[FleetOwnerRouteFare] fof
		  inner join FleetOwnerRouteStop frs on frs.id = fof.foroutestopid
		  inner join RouteStops rs on rs.id = frs.routestopid
		  inner join FleetRoutes fr on fr.routeid = rs.routeId
		inner join FleetBtpos fp on fp.vehicleid = fr.vehicleid
		inner join Routes r on r.Id = fr.routeid
		inner join BTPOSDetails b on b.id = fp.btposid
		inner join stops s on s.id = rs.[FromStopid]
		inner join stops d on d.id = rs.[ToStopid]
		where b.id = @btposDBid
	end
    else
    if @fileNameUpper = 'AUTHFILE'
    begin
		--userid<password,userid,active>
		SELECT '1111' username,'1111' pwd,4 userid,1 active
		union
		SELECT '2222','2222',5,1
		union
		SELECT '3333','3333',6,1
		union
		SELECT '4444','4444',7,1
    end
    
END
GO
/****** Object:  StoredProcedure [dbo].[GetFare]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetFare]
(@srcId int,@destId int, @btposid varchar(15),@routeid int)
as
begin

select distinct amount 
from fleetbtpos fp 
inner join btposdetails pos on (pos.id = fp.btposid and pos.POSID = @btposid)
inner join FleetOwnerRouteFare vf on vf.vehicleid = fp.vehicleid
inner join RouteStops rs on rs.id = vf.FORouteStopId
where rs.FromStopId = @srcId and rs.ToStopId = @destId
and rs.routeid = @routeid

 
end
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardDetails]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetDashboardDetails]
(@userid int = -1, @roleid int = -1)
as
begin
--
--get btpos details
SELECT distinct top 6  b.[Id]
     -- ,[GroupId]
      ,c.Name as company
      ,[POSID]
      ,[StatusId]
      ,t.Name as [status]
      ,[IMEI]
      ,[ipconfig]
      ,b.[active]
      ,u.FirstName + ' '+ u.LastName as fleetowner
      ,u.Id as fleetownerid
  FROM [POSDashboard].[dbo].[BTPOSDetails] b
 left outer join Types t on t.Id = b.StatusId
 left outer  join Company c on b.CompanyId = c.Id  
    left outer join fleetowner f on f.id = FleetOwnerId 
  left outer join Users u on u.Id = f.userId 
where (u.Id = @userid or @userid = -1)

--get license details
--get alerts
select top 6 t1.Id,
t1.Date,
t1.Message,
t1.MessageTypeId,
t1.StatusId,
t1.UserId,
t1.Name,
t2.FirstName,
t2.LastName
 from Alerts t1
 inner join Users t2 on t2.Id=t1.UserId
 
--get notifications

select top 6 t1.Id,
t1.Date,
t1.Message,
t1.MessageTypeId,
t1.StatusId,
t1.UserId,
t1.Name,
t2.FirstName,
t2.LastName
 from Notifications t1
 inner join Users t2 on t2.Id=t1.UserId

end
GO
/****** Object:  StoredProcedure [dbo].[getcurrency]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getcurrency]
as
begin
select* from currency
end
GO
/****** Object:  StoredProcedure [dbo].[GetCOUNTRY]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCOUNTRY]
AS
BEGIN
	
select * from COUNTRY
end
GO
/****** Object:  StoredProcedure [dbo].[GetCountries]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetCountries]
@active int = -1
as begin 
SELECT Id, Name, Latitude, Longitude,ISOCode, HasOperations from Country
where HasOperations = @active or @active = -1
end
GO
/****** Object:  StoredProcedure [dbo].[getCompanyRoles]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getCompanyRoles]
(@cmpId int)
as
begin

if @cmpId = 1

select 
r.id
,cr.[Id] cId
,cr.[CompanyId] 
,r.name as rolename
,r.description
,case when c.Id IS null then 0 else 1 end assigned
from Roles R
left outer join [CompanyRoles] cr on R.Id=cr.RoleId and cr.CompanyId = @cmpId 
left outer join Company c on c.Id=cr.CompanyId and c.Id = @cmpId 
where r.IsPublic = 0

else
select 
r.id
,cr.[Id] cId
,cr.[CompanyId] 
,r.name as rolename
,r.description
,case when c.Id IS null then 0 else 1 end assigned
from Roles R
left outer join [CompanyRoles] cr on R.Id=cr.RoleId and cr.CompanyId = @cmpId 
left outer join Company c on c.Id=cr.CompanyId and c.Id = @cmpId 
where r.IsPublic = 1


end
GO
/****** Object:  StoredProcedure [dbo].[GetCompanyDetails]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCompanyDetails]
	-- Add the parameters for the stored procedure here
	@cmpId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT 
      [Id]
      ,[Name]
      ,[Code]
      ,[Desc]
      ,[Active]
      ,[Logo]
      ,[Address]
      ,[ContactNo1]
      ,[ContactNo2]
      ,[Fax]
      ,[EmailId]
      ,[Title]
      ,[Caption]
      ,[Country]
      ,[ZipCode]
      ,[State]
      ,[FleetSize]
      ,[StaffSize]
      ,[AlternateAddress]
      ,[ShippingAddress]
      ,[AddressId]
  FROM [POSDashboard].[dbo].[Company]
  WHERE [Id] = @cmpId


END
GO
/****** Object:  StoredProcedure [dbo].[getCompanies]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getCompanies]
(@userid int =-1)
as
begin
SELECT distinct c.[active]
       ,[code]
      ,[desc]
      ,c.[ContactNo1]
      ,c.[ContactNo2]
      ,c.[EmailId]
      ,c.[Address]
      ,[Fax]
      ,[Title]
      ,[Caption]
      ,[Country]
      ,c.[ZipCode]
      ,[State] 
	   ,[FleetSize]
      ,[StaffSize]
      ,[AlternateAddress]
      ,[ShippingAddress]     
      ,c.[Id]
      ,[Name]
  FROM [POSDashboard].[dbo].[Company] c
 -- inner join Users u on  (u.companyId = c.id or  @userid = -1)  
  order by [Name]
end
GO
/****** Object:  StoredProcedure [dbo].[getClosingReport]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[getClosingReport]
as
begin
select *from ClosingReport
end
GO
/****** Object:  StoredProcedure [dbo].[getcheckout]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getcheckout]
as
begin
select c.[Id]
      ,[ckdetails]
            ,fd.Firstname
      ,fd.LastName
      ,fd.PhoneNo
      ,fd.EmailAddress
      ,cy.Country
      ,cy.ZipCode
    ,cy.State
  FROM [POSDashboard].[dbo].[checkout]c
   inner join FleetOwnerRequestDetails fd on fd.id=c.id
   inner join Company cy on cy.Id=fd.Id
end
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetCategories]
@typegrpid int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT t.Id, t.Name, t.[Description],t.Active,  TypeGroupId, listkey, listvalue
	 from [Types] t 
	  where t.TypeGroupId = 2
	  
	 -- SELECT t.Id, t.Name, t.[Description],t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 --from [Types] t
	 --inner join TypeGroups tg on tg.Id = t.TypeGroupId	 
	 -- where tg.Id=30
	 -- select I.InventoryId,I.Name,I.Code,I.
	 -- [Description],I.AvailableQty,tg.Name as Category,t.TypeGroupId as SubCategoryId,I.PerUnitPrice,I.ReorderPont,I.Active from Inventory I inner join TypeGroups tg on tg.Id=I.InventoryId
  --   inner join Types t on t.Id=I.InventoryId
END
GO
/****** Object:  StoredProcedure [dbo].[GetCartPaymentDetails]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCartPaymentDetails]
   (@LicenseType varchar(50)
           ,@Frequency int
           ,@NoOfMonths varchar(50)
           ,@TotalAmount int
           ,@CreateDate date
           ,@TransId varchar(50)
           ,@UnitPrice int
           ,@FleetOwner varchar(50))
AS
BEGIN

    INSERT INTO [POSDashboard].[dbo].[CartPaymentDetails]
           ([LicenseType]
           ,[Frequency]
           ,[NoOfMonths]
           ,[TotalAmount]
           ,[CreateDate]
           ,[TransId]
           ,[UnitPrice]
           ,[FleetOwner])
     VALUES
           (@LicenseType
           ,@Frequency
           ,@NoOfMonths
           ,@TotalAmount
           ,@CreateDate
           ,@TransId
           ,@UnitPrice
           ,@FleetOwner)   
       
     
 update LicensePayments set 
   [licenseFor]=@FleetOwner
  
end

/****** Object:  StoredProcedure [dbo].[InsupdCartPaymentDetails]    Script Date: 07/15/2016 20:06:04 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetCarouselImages]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCarouselImages]
as
begin
SELECT [Id]
      ,[ImageName]
      ,[Image]
      ,[ImageCaption]
      ,[ImageDesc]
      ,[CreatedOn]
      ,[CreatedBy]
      ,[ModifiedOn]
      ,[ModifiedBy]
      ,[ImgPath]
  FROM [POSDashboard].[dbo].[Carousel]
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSTransactions]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBTPOSTransactions]
	(@fleetOwnerId int, @POSId int = '-1')
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [BTPOSTransactions].[Id]
      ,[POSId]
      ,[BTPOSId]
      ,[Date]
      ,[TotalAmount]
      ,[AmountPaid]
      ,[ChangeRendered]
      ,[ChangeGiven]
      ,[TransId]
      ,[GatewayTransId]
      ,[TransCode]
      ,[PaymentCategoryId]
      ,[PaymentTypeId]
      ,[PaymentModeId]
      ,[TransStatusId]
      ,[TransDetails]
      ,[noofSeats]
      ,[unitPrice]
      ,[luggageTypeId]
      ,[luggageAmt]
      ,[taxes]
      ,[disc]
      ,[TicketNo]
      ,[SrcId]
      ,[DestId]
      ,[RouteId]
      ,[OperatorId]
      ,[TransApproved]
      ,[Reason]
      ,[ApprovedById]
      ,[FleetOwnerId]
      ,t.Name paymentmode
      ,t1.Name paymentstatus
  FROM [POSDashboard].[dbo].[BTPOSTransactions]  
  left outer join Types t on t.Id = PaymentTypeId
  left outer join Types t1 on t1.Id = TransStatusId
  where ([POSId] = @POSId or @POSId = -1)
  and FleetOwnerId = @fleetOwnerId


END
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSSheduleUploads]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBTPOSSheduleUploads]
AS
BEGIN
	
select * from [BTPOSSheduleUploads]
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSSecheduledUpdates]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSSecheduledUpdates]
AS
BEGIN
	
select * from BTPOSSecheduledUpdates
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTposRoutes]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBTposRoutes] 
	-- Add the parameters for the stored procedure here
	(@cmpId int = -1, @fleetOwnerId int = -1)
AS
BEGIN

select b.id,b.VehicleId,VehicleRegNo,RouteName,routeid,r.Code,bt.POSID,bt.id btposid,s.Name src,d.Name dest,s.id srcId, d.id destId
 from fleetbtpos b
 inner join btposdetails bt on bt.id = b.btposid
inner join FleetRoutes fr on  fr.vehicleid = b.vehicleid
inner join routes r on r.id = fr.routeid
inner join fleetdetails v on v.id = fr.vehicleid
inner join stops s on s.id = r.sourceid
inner join stops d on d.id = r.destinationid
where v.companyid = @cmpId or @cmpId = -1
and v.fleetownerid = @fleetOwnerId or @fleetOwnerId = -1


END
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSRegistration]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSRegistration]
AS
BEGIN
	
select * from BTPOSRegistration
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSRecords]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBTPOSRecords]

(@cmpId int = -1, @fleetOwnerId int = -1, @POSId int=-1)
AS
BEGIN
	
select br.[Id],
       br.[FileName],
       br.[Description],
       br.[LastDownloadtime]
       from  BTPOSRecords br
    inner join FleetDetails fd on fd.Id=br.Id
     inner join Company c on c.Id=br.Id
     
     
  

where  
	  (fd.FleetOwnerId = @fleetOwnerId or @fleetOwnerId = -1)
	 and (c.Id = @cmpId or @cmpId = -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSPortSettings]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSPortSettings]
AS
BEGIN
	
select * from BTPOSPortSettings
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSMonitoring]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSMonitoring]

AS
BEGIN
	
SELECT  
      
          [BTPOSId],
         [Xcoordinate],
         [Ycoordinate],
         [LocationName],
         [SNo],
         [POSID],
         [DateTime]
from  BTPOSMonitoring B 
inner join BTPOSDetails Bd on Bd.ID = B.BTPOSId
end



/****** Object:  StoredProcedure [dbo].[InsUpdDelInventory]    Script Date: 06/30/2016 18:00:08 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[getBTPOSInventorySales]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getBTPOSInventorySales]
as
begin
select * from BTPOSInventorySales
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSId]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBTPOSId]
(@imei varchar(20), @fleetownerCode varchar(15))
AS
BEGIN


	declare @fleetownerid int = -1, @posid int = -1, @btposId varchar(15),@statusId int,@poid int, @cnt int = null
	
	select @fleetownerid = id from FleetOwner where UPPER(FleetOwnerCode) = UPPER(@fleetownercode)
	if(@fleetownerid is null or @fleetownerid  = -1)
	begin
		RAISERROR ('Invalid fleet owner code',16,1);
		return
	end
	
	--check if fleet owner has any pos left for registration
	select top 1 @poid = id from BTPOSDetails where FleetOwnerId = @fleetownerid and StatusId = 1
	
	if @poid is null  
	begin
		RAISERROR ('POS Units exhausted for fleet owner',16,1);
		return
	end
	
	
	--check if fleet owner already registred a pos with given imei
	select @cnt = 1, @statusId= statusid from BTPOSDetails where upper(IMEI) = upper(@imei)
	
	if(@cnt = 1)
	begin
		RAISERROR ('POS with IMEI is already registered',16,1);
		return
	end
	
	if @statusId = 2
	begin
		RAISERROR ('POS with IMEI is already registered',16,1);
		return
	end
	else
	begin
	    
	    
		select @btposId = 'POS'+ UPPER(@fleetownercode)+ cast(@poid as varchar(3))
		
		UPDATE BTPOSDetails
			SET POSID = @btposId,statusid = 2,IMEI=LTRIM(rtrim(@imei))
		FROM BTPOSDetails
		where Id = @poid
		
	SELECT b.[CompanyId]
		  ,[POSID]
		  ,[StatusId]
		  ,[IMEI]
		  ,[ipconfig]     
		  ,b.[FleetOwnerId]
	  FROM [POSDashboard].[dbo].[BTPOSDetails] b
	  inner join fleetowner fo on fo.id  = b.fleetownerid
	where (upper(IMEI) = upper(@imei) and (FleetOwnerCode) = UPPER(@fleetownercode))
	end
	
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSFaultsCatageries]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSFaultsCatageries]
AS
BEGIN
	
select * from BTPOSFaultsCatageries
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSDetails1]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSDetails1]
(@cmpId int = -1, @fleetownerId int =-1,@pageNum int = 5,@pageSize int = 10)
AS
BEGIN
--declare Row_Number int 

	
--SELECT b.[Id]
--      ,c.[Id] as CompanyId
--      ,c.Name as companyname
--      ,[POSID]
--      ,[StatusId]
--      ,t.Name as [status]
--      ,[IMEI]
--      ,[ipconfig]
--      ,b.[active]
--      ,u.FirstName + ' '+ u.LastName as fleetowner
--      ,f.Id as fleetownerid
--  FROM [POSDashboard].[dbo].[BTPOSDetails] b
--  left outer join Types t on t.Id = statusid
--  left outer join Company c on c.Id = CompanyId
--  left outer join fleetowner f on f.id = FleetOwnerId 
--  left outer join Users u on u.Id = f.userId 
--where (c.Id = @cmpId or @cmpId = -1)
--and(f.Id = @fleetownerId or @fleetownerId = -1)

select COUNT(*) Row_count  from BTPOSDetails

DECLARE @PageNumber AS INT, @RowspPage AS INT
--SET @PageNumber = 2
--SET @Pagesize = 10
SELECT *  FROM (
             SELECT ROW_NUMBER() OVER(ORDER BY b.Id) AS ROWNUMBER,
      c.Name as companyname
      ,[POSID]
    
      ,[StatusId]
      ,t.Name as [status]
      ,[IMEI]
      ,[ipconfig]
      ,b.[active]
      ,u.FirstName + ' '+ u.LastName as fleetowner
      ,f.Id as fleetownerid FROM BTPOSDetails b
      left outer join Types t on t.Id = statusid
  left outer join Company c on c.Id = CompanyId
  left outer join fleetowner f on f.id = FleetOwnerId 
  left outer join Users u on u.Id = f.userId 
               ) AS TBL
WHERE ROWNUMBER > ((@pageNum - 1) * @pageSize ) AND 
ROWNUMBER <= (@pageNum * @Pagesize)
end

--exec [dbo].[GetBTPOSDetails] @pageNum = 6,@pageSize = 3

/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSDetails]    Script Date: 07/18/2016 12:22:26 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSDetails]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBTPOSDetails]
(@cmpId int = -1, @fleetownerId int =-1,@pageNum int = 1,@pageSize int = 10)
AS
BEGIN

select COUNT(*) as Row_count from BTPOSDetails

DECLARE @PageNumber AS INT, @RowspPage AS INT
--SET @PageNumber = 2
--SET @Pagesize = 10
SELECT *  FROM (
            SELECT ROW_NUMBER() OVER(ORDER BY b.Id) AS ROWNUMBER,
             b.[Id]
      ,c.Name as companyname
      ,[POSID]
    ,c.[Id] as CompanyId
      ,[StatusId]
      ,t.Name as [status]
      ,[IMEI]
      ,[ipconfig]
      ,b.[active]
      ,u.FirstName + ' '+ u.LastName as fleetowner
      ,i.ItemName
      ,b.PerUnitPrice
      ,b.ActivatedOn
       ,b.PONum
       ,I.ItemName POSType
       ,I.Id POSTypeId
      ,f.Id as fleetownerid FROM BTPOSDetails b
      inner join [InventoryItem] i on i.Id = b.postypeid
      left outer join Types t on t.Id = statusid
  left outer join Company c on c.Id = CompanyId
  left outer join fleetowner f on f.id = FleetOwnerId 
  left outer join Users u on u.Id = f.userId 
               ) AS TBL
WHERE ROWNUMBER > ((@pageNum - 1) * @pageSize ) AND 
ROWNUMBER <= (@pageNum * @Pagesize)
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSAuditDetails]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSAuditDetails]
AS
BEGIN
	
select * from BTPOSAuditDetails
end
GO
/****** Object:  StoredProcedure [dbo].[GetBookingDetails]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBookingDetails]
	@ticketNo varchar(20) = null, @emailid varchar(50) = null, @mobile varchar(15) = null
AS
BEGIN

declare @bookingId int

select @bookingId = ID from [BookingDetails] where upper([TicketNo]) = upper(ltrim(rtrim(@ticketNo)))
or upper([EmailId]) = upper(ltrim(rtrim(@emailid))) or upper([MobileNo]) = upper(ltrim(rtrim(@mobile)))

if @@ROWCOUNT = 0 
begin
   RAISERROR ('Invalid entry. No booking details found',16,1); 
end
else
begin	
	SELECT [Id]
      ,[TicketNo]
      ,[TransId]
      ,[EmailId]
      ,[MobileNo]
      ,[AltMobileNo]
      ,[TravelDate]
      ,[TravelTime]
      ,[Src]
      ,[Dest]
      ,[SrcId]
      ,[DestId]
      ,[RouteId]
      ,[VehicleId]
      ,[NoOfSeats]
      ,[Seats]
      ,[Status]
      ,[StatusId]
      ,[BookedBy]
      ,[BookedById]
      ,[Amount]
      ,[BookingType]
      ,[BookingTypeId]
      ,[JourneyType]
      ,[JourneyTypeId]
      ,[UserId]
      ,[Address]
      ,[BookedOn]
      ,[BookedOnTime]
      ,[ArrivalTime]
      ,[DepartureTime]
  FROM [POSDashboard].[dbo].[BookingDetails]
  where Id = @bookingId

	SELECT [Id]
      ,[BookingId]
      ,[TicketNo]
      ,[SeatNo]
      ,[SeatId]
      ,[VehicleId]
      ,[Row]
      ,[Col]
      ,[JourneyDate]
      ,[JourneyTime]
      ,[Status]
      ,[StatusId]
      ,[FName]
      ,[LName]
      ,[Age]
      ,[Gender]
      ,[PassengerType]
      ,[IdProof]
      ,[PrimaryPassenger]
  FROM [POSDashboard].[dbo].[BookedSeats]
  where BookingId = @bookingId
end
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetBookedTicketDetails]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBookedTicketDetails]
	-- Add the parameters for the stored procedure here
	@bookingId int
AS
BEGIN
	
	SELECT [Id]
      ,[BookingId]
      ,[TicketContent]
      ,[createdOn]
      ,[TicketNo]
      ,[TransId]
      ,[EmailId]
      ,[MobileNo]
  FROM [POSDashboard].[dbo].[BookedTicket]
  where BookingId = @bookingId


	
END
GO
/****** Object:  StoredProcedure [dbo].[GetBookedHistory]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBookedHistory]
	@emailAddress varchar(50), @fromDate date = null, @todate date = null
AS
BEGIN
	
	SELECT [Id]
      ,[TicketNo]
      ,[TransId]
      ,[EmailId]
      ,[MobileNo]
      ,[AltMobileNo]
      ,[TravelDate]
      ,[TravelTime]
      ,[Src]
      ,[Dest]
      ,[SrcId]
      ,[DestId]
      ,[RouteId]
      ,[VehicleId]
      ,[NoOfSeats]
      ,[Seats]
      ,[Status]
      ,[StatusId]
      ,[BookedBy]
      ,[BookedById]
      ,[Amount]
      ,[BookingType]
      ,[BookingTypeId]
      ,[JourneyType]
      ,[JourneyTypeId]
      ,[UserId]
      ,[Address]
      ,[BookedOn]
      ,[BookedOnTime]
      ,[ArrivalTime]
      ,[DepartureTime]
      ,[ArrivalDate]
      ,[DepartueDate]
  FROM [dbo].[BookingDetails]
  where(
  (upper([EmailId]) = upper(@emailAddress) or @emailAddress is null)
  --and
  --([UserId] = @userId or @userId = -1)
  and
  ([BookedOn] >= @fromDate or @fromDate is null  
  and [BookedOn] <= @todate or @todate is null 
  )
)
order by BookedOn desc


	
END
GO
/****** Object:  StoredProcedure [dbo].[GetBlockListNew]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetBlockListNew]
(@selectedId int)
AS
BEGIN

if @selectedId =1
begin                                                            
SELECT 
cmp.Name as ItemName
      ,[ItemId]
      ,[ItemTypeId]
      ,[Formdate]
      ,[Todate]   
      ,[Reason]
      ,[Blockedby]
      ,[UnBlockedby]
      ,[Blockedon]
      ,[UnBlockedon]
  FROM company cmp
  left outer join 
  [POSDashboard].[dbo].[Blocklist] bl
  on cmp.id = bl.ItemId
  and ItemTypeId = 1
end
else

if @selectedId =2
begin
SELECT 
u.FirstName+' '+ u.lastname as ItemName
      ,[ItemId]
      ,[ItemTypeId]
      ,[Formdate]
      ,[Todate]   
      ,[Reason]
      ,[Blockedby]
      ,[UnBlockedby]
      ,[Blockedon]
      ,[UnBlockedon]
  FROM users u
  left outer join 
  [POSDashboard].[dbo].[Blocklist] bl
  on u.id = bl.ItemId
  and ItemTypeId = 1
 
END

if @selectedId =3
begin
SELECT 
u.FirstName+' '+ u.lastname as ItemName
      ,[ItemId]
      ,[ItemTypeId]
      ,[Formdate]
      ,[Todate]   
      ,[Reason]
      ,[Blockedby]
      ,[UnBlockedby]
      ,[Blockedon]
      ,[UnBlockedon]
  FROM FleetOwner f
  inner join users u on u.Id = f.UserId
  left outer join 
  [POSDashboard].[dbo].[Blocklist] bl
  on u.id = bl.ItemId
  and ItemTypeId = 3
 
END

if @selectedId =4
begin
SELECT 
b.POSID as ItemName
      ,[ItemId]
      ,[ItemTypeId]
      ,[Formdate]
      ,[Todate]   
      ,[Reason]
      ,[Blockedby]
      ,[UnBlockedby]
      ,[Blockedon]
      ,[UnBlockedon]
  FROM BTPOSDetails b
  left outer join 
  [POSDashboard].[dbo].[Blocklist] bl
  on b.id = bl.ItemId
  and ItemTypeId = 4
 
END

if @selectedId =5
begin
SELECT 
r.RouteName as ItemName
      ,[ItemId]
      ,[ItemTypeId]
      ,[Formdate]
      ,[Todate]   
      ,[Reason]
      ,[Blockedby]
      ,[UnBlockedby]
      ,[Blockedon]
      ,[UnBlockedon]
  FROM Routes r
  left outer join 
  [POSDashboard].[dbo].[Blocklist] bl
  on r.id = bl.ItemId
  and ItemTypeId = 5
 
END

if @selectedId =6
begin
SELECT 
s.Name as ItemName
      ,[ItemId]
      ,[ItemTypeId]
      ,[Formdate]
      ,[Todate]   
      ,[Reason]
      ,[Blockedby]
      ,[UnBlockedby]
      ,[Blockedon]
      ,[UnBlockedon]
  FROM stops s
  left outer join 
  [POSDashboard].[dbo].[Blocklist] bl
  on s.id = bl.ItemId
  and ItemTypeId = 6
 
END

if @selectedId =7
begin
SELECT 
u.LoginInfo as ItemName
      ,[ItemId]
      ,[ItemTypeId]
      ,[Formdate]
      ,[Todate]   
      ,[Reason]
      ,[Blockedby]
      ,[UnBlockedby]
      ,[Blockedon]
      ,[UnBlockedon]
  FROM UserLogins u
  left outer join 
  [POSDashboard].[dbo].[Blocklist] bl
  on u.id = bl.ItemId
  and ItemTypeId = 7
 
END
 
END
GO
/****** Object:  StoredProcedure [dbo].[GetBlockList]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBlockList]
AS
BEGIN
	
select * from Blocklist
end
GO
/****** Object:  StoredProcedure [dbo].[GetAvailablevehicles]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAvailablevehicles]
as
begin
select Type from VechileMaster
end
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableServicesWithOptions]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAvailableServicesWithOptions]
	-- Add the parameters for the stored procedure here
	@srcId int = -1, 
	@destId int = -1,
	@startdate date = null,
	@starttime time = null,	
	@vehicleType int = -1, 
	@companyId int = -1	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

/*
1) check if there are any routes configured with the given source and destination (routestops)
2) if they exists then from the combination get all the fleet owners (fleetownerstops)
3) using the above get the vehicles and fare for the fleeet owner (foroutefare)
4) and also get the schedule of the vehicles (foroutefleetschedule)
*/
select distinct rs.Id, rs.RouteId,fofare.VehicleTypeId,fofare.VehicleId
, t.Name VehicleType, fofare.Amount,rs.FromStopId,rs.ToStopId, frs1.ArrivalTime,frs2.DepartureTime ,frs1.Duration
,src.Name srcName,dest.name destName,c.Name cmpName
from RouteStops rs
inner join FleetOwnerRouteStop fors on fors.RouteStopId = rs.Id
inner join [FleetOwnerRouteFare] fofare on fofare.FORouteStopId = fors.Id
inner join Types t on t.Id = fofare.VehicleTypeId
inner  join FORouteFleetSchedule frs1 on frs1.StopId = rs.FromStopId and frs1.FleetOwnerId = fors.FleetOwnerId and frs1.RouteId = rs.RouteId and frs1.VehicleId = fofare.VehicleId
inner join FORouteFleetSchedule frs2 on frs2.StopId = rs.ToStopId and frs2.FleetOwnerId = fors.FleetOwnerId and frs2.RouteId = rs.RouteId and frs2.VehicleId = fofare.VehicleId
inner join Stops src on src.Id = rs.FromStopId
inner join Stops dest on dest.Id = rs.ToStopId
inner join FleetDetails fd on fd.id = fofare.VehicleId
inner join Company c on c.Id = fd.CompanyId
where FromStopId = @srcId and ToStopId = @destId

    -- Insert statements for procedure here
--	select rs.Id, rs.RouteId,src.name,dest.name,c.Name,fd.VehicleTypeId,t.Name,frs1.ArrivalTime,frs2.DepartureTime from RouteStops rs
--inner join stops src on src.id = rs.fromstopid
--inner join stops dest on dest.id = rs.tostopid
--inner join FleetOwnerRoute fr on fr.RouteId = rs.RouteId
--inner join Company c on c.Id = fr.CompanyId
--inner join FleetRoutes r on r.RouteId = rs.RouteId
--inner join FleetDetails fd on fd.Id = r.VehicleId
--inner join Types t on t.Id = fd.VehicleTypeId
--inner join FORouteFleetSchedule frs1 on frs1.StopId = src.Id and frs1.FleetOwnerId = fr.FleetOwnerId and frs1.RouteId = fr.RouteId
--inner join FORouteFleetSchedule frs2 on frs2.StopId = dest.Id and frs2.FleetOwnerId = fr.FleetOwnerId and frs2.RouteId = fr.RouteId
-- where FromStopId = 1 and ToStopId = 4
	
	--fleetownerroutes -- to get company name and fleet owner name
	--
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableServices]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAvailableServices]
	-- Add the parameters for the stored procedure here
	@srcId int, 
	@destId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

/*
1) check if there are any routes configured with the given source and destination (routestops)
2) if they exists then from the combination get all the fleet owners (fleetownerstops)
3) using the above get the vehicles and fare for the fleeet owner (foroutefare)
4) and also get the schedule of the vehicles (foroutefleetschedule)
*/
select distinct rs.Id, rs.RouteId,fofare.VehicleTypeId,fofare.VehicleId
, t.Name VehicleType, fofare.Amount,rs.FromStopId,rs.ToStopId, frs1.ArrivalTime,frs2.DepartureTime ,frs1.Duration
,src.Name srcName,dest.name destName,c.Name cmpName
from RouteStops rs
inner join FleetOwnerRouteStop fors on fors.RouteStopId = rs.Id
inner join [FleetOwnerRouteFare] fofare on fofare.FORouteStopId = rs.Id
inner join Types t on t.Id = fofare.VehicleTypeId
inner  join FORouteFleetSchedule frs1 on frs1.StopId = rs.FromStopId and frs1.FleetOwnerId = fors.FleetOwnerId and frs1.RouteId = rs.RouteId and frs1.VehicleId = fofare.VehicleId
inner join FORouteFleetSchedule frs2 on frs2.StopId = rs.ToStopId and frs2.FleetOwnerId = fors.FleetOwnerId and frs2.RouteId = rs.RouteId and frs2.VehicleId = fofare.VehicleId
inner join Stops src on src.Id = rs.FromStopId
inner join Stops dest on dest.Id = rs.ToStopId
inner join FleetDetails fd on fd.id = fofare.VehicleId
inner join Company c on c.Id = fd.CompanyId
where FromStopId = @srcId and ToStopId = @destId

    -- Insert statements for procedure here
--	select rs.Id, rs.RouteId,src.name,dest.name,c.Name,fd.VehicleTypeId,t.Name,frs1.ArrivalTime,frs2.DepartureTime from RouteStops rs
--inner join stops src on src.id = rs.fromstopid
--inner join stops dest on dest.id = rs.tostopid
--inner join FleetOwnerRoute fr on fr.RouteId = rs.RouteId
--inner join Company c on c.Id = fr.CompanyId
--inner join FleetRoutes r on r.RouteId = rs.RouteId
--inner join FleetDetails fd on fd.Id = r.VehicleId
--inner join Types t on t.Id = fd.VehicleTypeId
--inner join FORouteFleetSchedule frs1 on frs1.StopId = src.Id and frs1.FleetOwnerId = fr.FleetOwnerId and frs1.RouteId = fr.RouteId
--inner join FORouteFleetSchedule frs2 on frs2.StopId = dest.Id and frs2.FleetOwnerId = fr.FleetOwnerId and frs2.RouteId = fr.RouteId
-- where FromStopId = 1 and ToStopId = 4
	
	--fleetownerroutes -- to get company name and fleet owner name
	--
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[ChangePwd]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ChangePwd]
@Password varchar(50),@Email varchar(50), @Mobilenumber varchar(15),@NewPassword varchar(50)
as
begin

declare @pwd int

select @pwd = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Email = @Email 

if @pwd = 0
begin
  
				RAISERROR ('Mobile number or email address is not Registered',16,1);
				return;
end

  if @pwd > @Password
  begin
    
					RAISERROR ('Invalid Password',16,1);
					return;
										
  end
  else 

begin  
      update Appusers set Password = @NewPassword where Mobilenumber = @Mobilenumber and Email = @Email  
     select [Username] ,[Email] ,[Mobilenumber]  from Appusers where Mobilenumber = @Mobilenumber and Email = @Email
  end

end
GO
/****** Object:  StoredProcedure [dbo].[EOTPverification]    Script Date: 08/04/2017 19:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EOTPverification]
@Email varchar(50),@Emailotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Email = @Email

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Email address',16,1);
				return;
   end

else

begin

  select @cnt = COUNT(*) from Appusers where Email = @Email and [Emailotp] = @Emailotp 
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid Email OTP',16,1);
					return;
	end
 
  else
 
   begin
     update Appusers set Emailotp  = null where Email  = @Email  and [Emailotp]  = @Emailotp
   
     select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts]  from Appusers where Email  = @Email
   end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[Passwordverification]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Passwordverification]
@Password varchar(50),@Passwordotp varchar(10),@Email varchar(50), @mobileno varchar(15)
as
begin

declare @otp varchar(10) = null

select @otp = @Passwordotp from Appusers where Mobilenumber = @mobileno and Email = @Email 

if @otp is null
begin
  
				RAISERROR ('Invalid mobile number or email address',16,1);
				return;
end
else
begin

  if @otp <> @Passwordotp
  begin
    
					RAISERROR ('Invalid Password OTP',16,1);
					return;
  end
   else
   begin
      update Appusers set Passwordotp  = null,Password = @Password where Mobilenumber = @mobileno and Email = @Email  
     select [Username] ,[Email] ,[Mobilenumber]  from Appusers where Mobilenumber = @mobileno and Email = @Email
  end
 
end
end
GO
/****** Object:  StoredProcedure [dbo].[Passwordreset]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Passwordreset]
@Password varchar(50),@Passwordotp varchar(10),@Email varchar(50), @Mobilenumber varchar(15)
as
begin

declare @otp int

select @otp = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Email = @Email 

if @otp = 0
begin
  
				RAISERROR ('Mobile number or email address is not Registered',16,1);
				return;
end
else
begin

  if @otp > @Passwordotp
  begin
    
					RAISERROR ('Invalid Password OTP',16,1);
					return;
  end
   else
   begin
      update Appusers set Passwordotp  = null ,Password = @Password where Mobilenumber = @Mobilenumber and Email = @Email  
     select [Username] ,[Email] ,[Mobilenumber]  from Appusers where Mobilenumber = @Mobilenumber and Email = @Email
  end
 
end
end
GO
/****** Object:  StoredProcedure [dbo].[MOTPverification]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MOTPverification]
@Mobilenumber varchar(20),@Mobileotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update Appusers set Mobileotp = null where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
     select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts]  from Appusers where Mobilenumber = @Mobilenumber
  end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelZipCode]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelZipCode](@Id NUMERIC(20),
           @Code varchar(30),
           @Active varchar(30))
           
AS
BEGIN
	

INSERT INTO 
[ZipCode] VALUES
           (@Id
           ,@Code,
           @Active)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelVehicleLayout]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsUpdDelVehicleLayout](	
	@VehicleLayoutTypeId int,
	@RowNo int,
	@ColNo varchar(50),
	@VehicleTypeId int,
	@label varchar(10),
	@insupdflag varchar   
)
AS
BEGIN
if @insupdflag = 'I'
begin
INSERT INTO [dbo].[VehicleLayout]
           ([VehicleLayoutTypeId]
           ,[RowNo]
           ,[ColNo]
           ,[VehicleTypeId]
           ,[label]
           )
     VALUES
           (@VehicleLayoutTypeId
           ,@RowNo
           ,@ColNo
           ,@VehicleTypeId
           ,@label)
           
   end

End

/****** Object:  Table [dbo].[WebsiteUserLogin]    Script Date: 06/08/2016 16:10:38 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelVehicleDetails]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsUpdDelVehicleDetails](
	@busId money,
	@busTypeId int,
	@conductorId int,
	@conductorName varchar(50),
	@driverId int,
	@driverName varchar(50),
	@fleetOwnerId int,
	@CompanyName varchar(50),
	@Id int,
	@POSID int,
	@RegNo varchar(50),
	@route varchar(50),
	@Status varchar(50),
	@statusid int,
	@Active int = 1,
	 @insupdflag varchar(10)
)
AS
BEGIN
if @insupdflag = 'I'
begin
INSERT INTO [POSDashboard].[dbo].[VehicleDetails]
           ([busId]
           ,[busTypeId]
           ,[conductorId]
           ,[conductorName]
           ,[driverId]
           ,[driverName]
           ,[fleetOwnerId]
           ,[CompanyName]
           ,[POSID]
           ,[RegNo]
           ,[route]
           ,[Status]
           ,[statusid]
           ,[Active])
     VALUES
           (@busId
           ,@busTypeId
           ,@conductorId
           ,@conductorName
           ,@driverId
           ,@driverName
           ,@fleetOwnerId
           ,@CompanyName
           ,@POSID
           ,@RegNo
           ,@route
           ,@Status
           ,@statusid
           ,@Active
  )         
  end        
else
 if @insupdflag = 'U' 
 begin
 UPDATE [POSDashboard].[dbo].[VehicleDetails]
   SET [busId] = @busId
      ,[busTypeId] = @busTypeId
      ,[conductorId] = @conductorId
      ,[conductorName] = @conductorName
      ,[driverId] = @driverId
      ,[driverName] = @driverName
      ,[fleetOwnerId] = @fleetOwnerId
      ,[CompanyName] = @CompanyName
      ,[POSID] = @POSID
      ,[RegNo] = @RegNo
      ,[route] = @route
      ,[Status] = Status
      ,[statusid] = @statusid
      ,[Active] = @Active
      WHERE Id = @Id
      end
  
else
   delete from BTPOSDetails where Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserRoles]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[InsUpdDelUserRoles](
@Id int,
@roleid int,
@UserId int,
@CompanyId int = null,
@insupdflag varchar
)
as
begin

declare @cnt int

select @cnt = count(*) from UserRoles where [UserId] = @UserId and [roleid] = @roleid

if @insupdflag = 'I'
begin
if @cnt = 0
INSERT INTO [POSDashboard].[dbo].[UserRoles]
           ([UserId]
           ,[RoleId]
           ,[CompanyId])
     VALUES
           (@UserId
           ,@RoleId
           ,@CompanyId)
    end
 else
   if @insupdflag = 'U'
 begin
UPDATE [POSDashboard].[dbo].[UserRoles]
  SET [UserId] = @UserId
     ,[RoleId] = @RoleId
     ,[CompanyId] = @CompanyId
  WHERE Id = @Id
 end
 else

if @insupdflag = 'D'
 begin
delete from [UserRoles] where [UserId] = @UserId and RoleId = @roleid and CompanyId  = @CompanyId

end

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicensePymtTransactions]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelUserLicensePymtTransactions](
@Id int = -1,
@TransId varchar(50),
@GatewayTransId varchar(50),
@Amount decimal(18,0),
@TransDate datetime=null,
@ULPymtId int,
@StatusId int,
@Desc varchar(250),
@PymtTypeId int,
@Tax decimal(18,0) = 0,
@Discount decimal(18,0) = 0,
@insupddelflag char
)
as
begin
declare @LicensePymtTransId int

if @insupddelflag = 'I'
begin
INSERT INTO [POSDashboard].[dbo].[UserLicensePymtTransactions]
           ([TransId]
           ,[GatewayTransId]
           ,[Amount]
           ,[TransDate]
           ,[ULPymtId]           
           ,[StatusId]
           ,[PymtTypeId]
           ,[Tax]
           ,[Discount]
           ,[Desc]
           )
     VALUES
           (@TransId
           ,@GatewayTransId 
           ,@Amount
           ,@TransDate
           ,@ULPymtId        
           ,@StatusId
           ,@PymtTypeId
           ,@Tax
           ,@Discount
           ,@Desc
            ) 
            SELECT @LicensePymtTransId = SCOPE_IDENTITY()  
            
            update [POSDashboard].[dbo].[UserLicensePayments]
            set [LicensePymtTransId]  = @LicensePymtTransId 
            where [Id] = @ULPymtId 

end
else
if @insupddelflag = 'U'
begin

UPDATE [POSDashboard].[dbo].[UserLicensePymtTransactions]
   SET [TransId] = @TransId
      ,[GatewayTransId] = @GatewayTransId 
      ,[Amount] = @Amount
      ,[TransDate] = @TransDate
      ,[ULPymtId] = @ULPymtId
      ,[StatusId] =@StatusId
      ,[Desc] = @Desc
      ,[PymtTypeId]= @PymtTypeId
      ,[Tax] = @Tax
      ,[Discount] = @Discount
    
     
 WHERE [Id] = @Id 
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [POSDashboard].[dbo].[UserLicensePymtTransactions]
      WHERE [Id] = @Id 
end

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicensePayments]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelUserLicensePayments](
@Id int = -1,
@ULId int,
@TransId varchar(20),
@CreatedOn datetime=null,
@Amount decimal,
@UnitPrice decimal,
@Units decimal,
@StatusId int,
@LicensePymtTransId int,
@IsRenewal int,
@insupddelflag char
)
as
begin

declare @cnt int = 0

--select @cnt = COUNT(*) from [POSDashboard].[dbo].[UserLicensePayments] where [ULId] = @ULId


	
if @insupddelflag = 'I'
begin


select @CreatedOn = GETDATE()

INSERT INTO [POSDashboard].[dbo].[UserLicensePayments]
           ([ULId]
           ,[CreatedOn]
           ,[Amount]
           ,[UnitPrice]
           ,[Units]           
           ,[StatusId]
           ,[LicensePymtTransId]           
           ,[IsRenewal]
           ,[TransId]
           )
     VALUES
           (@ULId
           ,@CreatedOn
           ,@Amount
           ,@UnitPrice 
           ,@Units          
           ,@StatusId
           ,@LicensePymtTransId
           ,@IsRenewal
           ,@TransId
            )

end

else
if @insupddelflag = 'U'
begin

UPDATE [POSDashboard].[dbo].[UserLicensePayments]
   SET [CreatedOn] = @CreatedOn
      ,[Amount] = @Amount
      ,[UnitPrice] = @UnitPrice
      ,[Units] = @Units
      ,[StatusId] =@StatusId
      ,[LicensePymtTransId] = @LicensePymtTransId
      ,[IsRenewal] = @IsRenewal     
 WHERE [ULId] = @ULId and transid = @TransId
 
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [POSDashboard].[dbo].[UserLicensePayments]
      WHERE [ULId] = @ULId and transid = @TransId
end


--return the fleet owner details
if @insupddelflag = 'I' or @insupddelflag = 'U'
begin

select * from Users u
inner join UserLicense ul on u.Id = ul.UserId
inner join UserLicensePayments ulp on ulp.ULId = ul.Id
where ulp.ULId = @ULId and transid = @TransId

SELECT [Id]
      ,[ULId]
      ,[CreatedOn]
      ,[Amount]
      ,[UnitPrice]
      ,[Units]
      ,[StatusId]
      ,[LicensePymtTransId]
      ,[IsRenewal]
      ,[TransId]
  FROM [POSDashboard].[dbo].[UserLicensePayments]
  where [ULId] = @ULId and [TransId] = @TransId

end

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicenseDetails]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsUpdDelUserLicenseDetails]
(@FOCode varchar(15), @licenseTypeId int, @amount decimal,@unitprice decimal,@units int,@renewFreqTypeId int,@insupddelFlag varchar(1))
	
AS
BEGIN
declare @userid int, @foId int, @currDate datetime, @ULId int = 0,@ulCnt int = -1, @ulPcnt int = -1
select @currDate = GETDATE()
--set foId = -1

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


if @insupddelFlag = 'I' 
begin

select @ulCnt = COUNT(*) from [POSDashboard].[dbo].[UserLicense] where UserId = @userid and LicenseTypeId = @licenseTypeId
    -- Insert statements for procedure here
    --1) master user license record will be maintained for all user licenses
    --FOid, licenseTypeId, active, startdate, expiryon, graceperiod,lastupdatedon
    if @ulCnt = 0 
    begin
    INSERT INTO [POSDashboard].[dbo].[UserLicense]
           ([UserId]
           ,[FOId]
           ,[LicenseTypeId]
           ,[StartDate]
           ,[ExpiryOn]
           ,[GracePeriod]
           ,[ActualExpiry]
           ,[LastUpdatedOn]
           ,[Active]
           ,[StatusId]
           ,[RenewFreqTypeId])
     VALUES
           (@userid,@foId,@licenseTypeId,@currDate,null,7,null,@currDate,0,1,@renewFreqTypeId)
    
    SELECT @ULId = SCOPE_IDENTITY()
    end
      
      select @ulPcnt = COUNT(*) from  [POSDashboard].[dbo].[UserLicensePayments] where ULId = @ULId
		if @ulPcnt = 0 
		begin
		INSERT INTO [POSDashboard].[dbo].[UserLicensePayments]
           ([ULId]
           ,[CreatedOn]
           ,[Amount]
           ,[UnitPrice]
           ,[Units]
           ,[StatusId]
           ,[LicensePymtTransId]
           ,[IsRenewal])
		VALUES
           (@ULId,@currDate,@amount,@unitprice,@units,1,null,0)
        end              

    --the payment made by the user for the license purchase will be stored next
    --2) enter details into user license payments
    --ULId, data, amount, unitprice, duration, status,transid,isrenewal
    
    --the transaction details need to be stored next
    --3) for the payment a transaction will be done the details will be stored into licensepaymenttrans
    --ULPId, transid,gatewaytransid, status, amount, datetime, comment, 
    
    --further details of the transaction - how the payment is made is stored
    --3) payment details are stored into lcPymtdetails table
    --lpymttransId, paymentTypeId, status, discount, tax, amt
        
    --all the benefits that the user gets as part of license will be stored 
    --4)features and their values will be stored into ULFeatures Table    
    --ULPid, featureid, value,desc
    
    --5)insert an alert to notify admin
    --6)update the owner ship for bt pos if needed
    --7)generate a SO and shipping order for the BT POS
    --8)insert SO and shipping order notification for admin
    --9)update edit history
    --10) insert a notfication for user also
    --11)create dashboard login credentails also
    --12) update the inventory status also
    end
else
begin
		if @insupddelFlag = 'U'
		 begin
	     select 1
		 end
		else		
		  begin
		  if @insupddelFlag = 'D'
	       begin
	       select 1
	       end
          end
end
    
	select * from Users u inner join FleetOwner f on f.UserId = u.Id and UPPER(f.fleetownercode) = UPPER(@FOCode)

END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicenseConfirmDetails]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsUpdDelUserLicenseConfirmDetails]
(@foId int,
@userId int,
@TransId varchar(50),
@GatewayTransId varchar(20),
@ULId int,
@ULPymtId int,
@units int,
@POSUnits int,
@isRenewal int,
@itemId int,
@address varchar(250) = null,
@amount decimal,
@insupddelFlag varchar(1))
	
AS
BEGIN
declare @expDt datetime,  @currDate datetime,@userloginid varchar(10) =  null 
,@shipOrder varchar(10),@licenseCode varchar(20) = 'LC0001',@posid int
,@soId int

select @currDate = GETDATE()


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    /*
    1) update userlicense with start and expiry dates
    2) update userlicensepaymenttransactions table with gatewayTransId 
     --5)insert an alert to notify admin
    --6)update the owner ship for bt pos if needed
    
    --7)generate a SO and shipping order for the BT POS
    --8)insert SO and shipping order notification for admin
    --9)update edit history
    --10) insert a notfication for user also
    --11)create dashboard login credentails also
    --12) update the inventory status also
    */

--all the benefits that the user gets as part of license will be stored 
    --4)features and their values will be stored into ULFeatures Table    
    --ULPid, featureid, value,desc
if @isRenewal = 0 
begin
   
   select @expDt = DATEADD(month,@units,GETDATE())
   
    UPDATE [POSDashboard].[dbo].[UserLicense]
   SET 
      [StartDate] = @currDate
      ,[ExpiryOn] =  @expDt    
      ,[ActualExpiry] = DATEADD(day,7,@expDt)--(@expDt + (select [graceperiod] from UserLicense WHERE [Id] = @ULId)) 
      ,[LastUpdatedOn] = @currDate
      ,[Active] = 1
      ,[StatusId] = 3      
 WHERE [Id] = @ULId

UPDATE [POSDashboard].[dbo].[UserLicensePymtTransactions]
   SET [GatewayTransId] = @GatewayTransId       
      ,[StatusId] =3
      where [TransId] = @TransId
      
     select  @userloginid =logininfo from UserLogins where UserId = @userId
     
     if @userloginid is null 
     begin
     select @userloginid = 'FO'+(select replace(convert(char(10), getdate(), 108), ':', ''))        
     
     INSERT INTO [POSDashboard].[dbo].[UserLogins]
           ([LoginInfo]
           ,[PassKey]
           ,[UserId]
           ,[salt]
           ,[Active])
     VALUES
           (@userloginid,@userloginid,@userId,null,1)
          
     end
end

----if there are POS units to be sent then update the details and generate SO and shipping orders
if @POSUnits > 0 
begin

--check if it is renewal
if @isRenewal = 0 
begin
    --UPDATE BTPOSDetails
    --    SET FleetOwnerId = @foId
    --  --  ,CompanyId = (select [CompanyId] from FleetOwner where Id = @foId)
    --FROM BTPOSDetails
    --INNER JOIN (
    --    SELECT TOP(@POSUnits) ID FROM BTPOSDetails WHERE FleetOwnerId is null
    --     ORDER BY ID
    --) AS InnerMyTable ON BTPOSDetails.ID = InnerMyTable.ID
    
DECLARE db_cursor CURSOR FOR  
SELECT TOP(@POSUnits) id from [POSDashboard].[dbo].[BTPOSDetails] where FleetOwnerId is null or fleetownerid  = 0 ORDER BY ID


OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @posid

WHILE @@FETCH_STATUS = 0  
BEGIN  

declare @cid int

select @cid = companyid from FleetOwner where Id = @foId


update [POSDashboard].[dbo].[BTPOSDetails]
set FleetOwnerId = @foId, CompanyId = @cid
where Id = @posid
 
FETCH NEXT FROM db_cursor INTO @posid  
END  

CLOSE db_cursor  
DEALLOCATE db_cursor 

declare @sonum varchar(20),@shipOrderNum varchar(20)

 select @sonum = 'SO'+(select replace(convert(char(10), getdate(), 108), ':', ''))
 select @shipOrderNum = 'SH'+(select replace(convert(char(10), getdate(), 108), ':', ''))

      INSERT INTO [POSDashboard].[dbo].[SalesOrder]
           ([SalesOrderNum]
           ,[TransactionId]
           ,[Date]
           ,[amount]
           ,[ItemId]
           ,[Quantity]
           ,[Status])
     VALUES
           (@sonum
           ,@ULPymtId
           ,@currDate,@amount,@itemId,@POSUnits,1)
           
           SELECT @soId = SCOPE_IDENTITY() 
           
           INSERT INTO [POSDashboard].[dbo].[Notifications]
           ([Date]
           ,[Message]
           ,[MessageTypeId]
           ,[StatusId]
           ,[UserId]
           ,[Name]
           ,[Source])
     VALUES
           (@currDate,'A sales order '+@sonum+' is generated for BT POS',1,1,1,'Admin Admin','License Payments')
          

           INSERT INTO [POSDashboard].[dbo].[ShippingOrder]
           ([ShippingOrderNum]
           ,[TransactionId]
           ,[Date]
           ,[amount]
           ,[Status]
           ,[SalesOrderId])
     VALUES
           (@shipOrderNum,@ULPymtId,@currDate,@amount,1,@soId)

INSERT INTO [POSDashboard].[dbo].[Notifications]
           ([Date]
           ,[Message]
           ,[MessageTypeId]
           ,[StatusId]
           ,[UserId]
           ,[Name]
           ,[Source])
     VALUES
           (@currDate,'A shipping order '+@shipOrderNum+' is generated for BT POS',1,1,1,'Admin Admin','License Payments')
           
		--update the inventory status
		--check the availability and if not possible, generate error
		--if avilable qty falls below reorder point then generate an alert also
		UPDATE [POSDashboard].[dbo].[Inventory]
		   SET [availableQty] = ([availableQty] - @POSUnits)		 
		 WHERE [InventoryItemId] = @itemId
        
end
else
begin
select 1
 --if it is renewal, then verify if any pos units need to be increased.
 --and also extend the date. no need of sending login info
end



--return back below
--1) login userid 
--2) shipping order confirmation
--3) license code
--4) payment transaction id
--5) expiry date
end

select 
@userloginid username
,@shipOrderNum shipOrder
,@licenseCode licenseCode
,@TransId transId
,@expDt expiryon
, @currDate startdate
,@POSUnits noofunits
,(select emailid from users where id = (select userid from fleetowner where id = @foid)) emailid
,@TransId TransId

END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicense]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelUserLicense](
@Id int = -1,
@UserId int,
@FOId int,
@LicenseTypeId int,
@StartDate datetime = null,
@ExpiryOn datetime = null,
@GracePeriod int,
@ActualExpiry datetime = null,
@LastUpdatedOn datetime = null,
@StatusId int,
@RenewFreqTypeId int,
@Active int,
@insupddelflag char
)
as
begin

declare @cnt int = 0,@currDate datetime
select @currDate = GETDATE()

if @insupddelflag = 'I'
begin

select @cnt = COUNT(*) from [POSDashboard].[dbo].[UserLicense] where [UserId] = @UserId and [LicenseTypeId] = @LicenseTypeId

	if @cnt = 0 
	begin

	INSERT INTO [POSDashboard].[dbo].[UserLicense]
			   ([UserId]
			   ,[FOId]
			   ,[LicenseTypeId]
			   ,[StartDate]
			   ,[ExpiryOn]           
			   ,[GracePeriod]
			   ,[ActualExpiry]
			   ,[LastUpdatedOn]
			   ,[Active]
			   ,[StatusId]
			   ,[RenewFreqTypeId]
			   )
		 VALUES
			   (@UserId
			   ,@FOId
			   ,@LicenseTypeId
			   ,@StartDate
			   ,@ExpiryOn           
			   ,@GracePeriod          
			   ,@ActualExpiry
			   ,@currDate
			   ,@Active
			   ,@StatusId
			   ,@RenewFreqTypeId
			  )
	end

end
else
if @insupddelflag = 'U'
begin

UPDATE [POSDashboard].[dbo].[UserLicense]
   SET [UserId] = @UserId
      ,[FOId] = @FOId
      ,[LicenseTypeId] = @LicenseTypeId
      ,[StartDate] = @StartDate
      ,[ExpiryOn] = @ExpiryOn
      ,[GracePeriod] = @GracePeriod
      ,[ActualExpiry] = @ActualExpiry
      ,[LastUpdatedOn] = @LastUpdatedOn
      ,[StatusId] = @StatusId
      ,[Active] = @Active      
      ,[RenewFreqTypeId] = @RenewFreqTypeId           
 WHERE [UserId] = @UserId
end
else
if @insupddelflag = 'D'
begin
	DELETE FROM [POSDashboard].[dbo].[UserLicense] WHERE [UserId] = @UserId
end
end


if @insupddelflag = 'I' or @insupddelflag = 'U'
begin

SELECT [Id]
      ,[UserId]
      ,[FOId]
      ,[LicenseTypeId]
      ,[StartDate]
      ,[ExpiryOn]
      ,[GracePeriod]
      ,[ActualExpiry]
      ,[LastUpdatedOn]
      ,[Active]
      ,[StatusId]
      ,[RenewFreqTypeId]
  FROM [POSDashboard].[dbo].[UserLicense]
   WHERE [UserId] = @UserId

 
end
GO
/****** Object:  StoredProcedure [dbo].[InsupdInventoryPurchases]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsupdInventoryPurchases]  (@Id int,@ItemName varchar(50)
           ,@Quantity int
           ,@PerUnitPrice int 
           ,@PurchaseDate datetime
           ,@PurchaseOrderNumber varchar(20))
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [POSDashboard].[dbo].[InventoryPurchases]
           ([ItemName]
           ,[Quantity]
           ,[PerUnitPrice]
           ,[PurchaseDate]
           ,[PurchaseOrderNumber])
     VALUES
           (@ItemName
           ,@Quantity
           ,@PerUnitPrice
           ,@PurchaseDate
           ,@PurchaseOrderNumber)

END
/****** Object:  StoredProcedure [dbo].[GetAlerts]    Script Date: 04/28/2016 11:12:57 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRouteDetails]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRouteDetails]    Script Date: 04/13/2016 11:13:24 ******/

create procedure [dbo].[InsUpdDelRouteDetails]
(           @RouteId int
           ,@StopId int
           ,@DistanceFromSource decimal(18,0)
           ,@DistanceFromDestination decimal(18,0)
           ,@DistanceFromPreviousStop decimal(18,0)
           ,@DistanceFromNextStop decimal(18,0)
           ,@PreviousStopId int
           ,@NextStopId int
           ,@StopNo int
           ,@insupddelflag varchar
)
as
begin

declare @cnt int
set @cnt = -1

if @insupddelflag = 'I'
begin

INSERT INTO [POSDashboard].[dbo].[RouteDetails]
           ([RouteId]
           ,[StopId]
           ,[DistanceFromSource]
           ,[DistanceFromDestination]
           ,[DistanceFromPreviousStop]
           ,[DistanceFromNextStop]
           ,[PreviousStopId]
           ,[NextStopId]
           ,[StopNo])
     VALUES
           (@RouteId
           ,@StopId
           ,@DistanceFromSource
           ,@DistanceFromDestination
           ,@DistanceFromPreviousStop
           ,@DistanceFromNextStop
           ,@PreviousStopId
           ,@NextStopId
           ,@StopNo)
           end

else
  if @insupddelflag = 'U'
  begin
UPDATE [POSDashboard].[dbo].[RouteDetails]
   SET [DistanceFromSource] = @DistanceFromSource
      ,[DistanceFromDestination] = @DistanceFromDestination
      ,[DistanceFromPreviousStop] = @DistanceFromPreviousStop
      ,[DistanceFromNextStop] = @DistanceFromNextStop
      ,[PreviousStopId] = @PreviousStopId
      ,[NextStopId] = @NextStopId
      ,[StopNo] = @StopNo
 WHERE [RouteId] = @RouteId and [StopId] = @StopId
end
else
  if @insupddelflag = 'D'
  begin
  delete from [POSDashboard].[dbo].[RouteDetails] where routeid = @RouteId and StopId = @StopId  
  end

declare @sid int
declare @Var2 int
declare @sstopno int
declare @Vstopno2 int
declare @distance decimal

DECLARE db_cursor CURSOR FOR  
SELECT distinct stopid,stopno from [POSDashboard].[dbo].[RouteDetails] where routeid = @RouteId order by stopno


OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @sid,@sstopno  

WHILE @@FETCH_STATUS = 0  
BEGIN  

 declare Cursor2 CURSOR for 
    SELECT distinct stopid,stopno from [POSDashboard].[dbo].[RouteDetails] where routeid = @RouteId order by stopno

	OPEN Cursor2 
     Fetch Next From Cursor2 into @Var2,@Vstopno2;

     While @@Fetch_Status=0

				Begin
					if @Vstopno2 > @sstopno 
                    begin
--					begin
--					Fetch Next From Cursor2 into @Var2;
--					continue;
--					end

                    begin
						begin try
							select @distance = distancefromnextstop from routedetails where stopid = @sid and nextstopid = @Var2
						end try
						begin catch
							set @distance = 0;
						end catch
                    end
					select @cnt = count(1) from [POSDashboard].[dbo].[RouteStops] where fromstopid = @sid and tostopid = @Var2 and RouteId = @RouteId           

					if @cnt = 0 
					INSERT INTO [POSDashboard].[dbo].[RouteStops]
						   ([RouteId]
						   ,[FromStopId]
						   ,[ToStopId]
						   ,distance)
					 VALUES
						   (@RouteId
						   ,@sid
						   ,@Var2
						   ,@distance)
					end
						   Fetch Next From Cursor2 into @Var2,@Vstopno2;
					
				End

			Close Cursor2;

		DeAllocate Cursor2;
       

       FETCH NEXT FROM db_cursor INTO @sid,@sstopno  
END  

CLOSE db_cursor  
DEALLOCATE db_cursor 


end

/****** Object:  StoredProcedure [dbo].[InsUpdDelRoles]    Script Date: 07/01/2016 16:13:42 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InSupdFleetOwnerRequest]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InSupdFleetOwnerRequest](
		  
          @CurrentSystemInUse varchar(50),
          @SentNewProductsEmails bit,
      
          @howdidyouhearaboutus varchar(50),
          @Agreetotermsandconditions bit,
           @insupdflag varchar(20)
           )
 
AS
BEGIN	
if @insupdflag = 'I' 
begin
INSERT INTO [dbo].[FleetOwnerRequest]
          
            ([CurrentSystemInUse]
            ,[SentNewProductsEmails] 
             
           ,[howdidyouhearaboutus] 
          ,[Agreetotermsandconditions]
               )
     VALUES
          (
           @CurrentSystemInUse
       , @SentNewProductsEmails 
        
         ,@howdidyouhearaboutus
         ,@Agreetotermsandconditions
          )
          
   end       
  
          else
  if @insupdflag = 'U' 
  begin
UPDATE [POSDashboard].[dbo].[FleetOwnerRequest]
   SET
      
     [CurrentSystemInUse] = @CurrentSystemInUse
     ,[SentNewProductsEmails]=@SentNewProductsEmails 
      
     ,[howdidyouhearaboutus]=@howdidyouhearaboutus
     ,[Agreetotermsandconditions]=@Agreetotermsandconditions
      

END
end
/****** Object:  StoredProcedure [dbo].[InSupdFleetOwnerRequestDetails]    Script Date: 07/18/2016 17:24:30 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdFaqs]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdFaqs]
@flag varchar,@Id int,@Question varchar(500),@Answer varchar(500),@Catid int,@CreatedOn date,@Createdby int
as
begin
declare @cnt int,
 @dt datetime
set @dt = GETDATE()
if @flag = 'I'
begin
insert into [dbo].[Appfaqs]
([Question],[Answer],[Catid],[CreatedOn],[Createdby])
values
(@Question,@Answer,@Catid,@dt,@Createdby)
end
if @flag = 'U'
begin
update [dbo].[Appfaqs]
set 
 [Question]=@Question,
 [Answer]=@Answer,
 [Catid]=@Catid,
 [CreatedOn]=@dt,
 [Createdby]=@Createdby
 where Id=@Id
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[InsUpDelTroubleTicketingCategories]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpDelTroubleTicketingCategories](@active int,@desc varchar(50),@Id int,@TTCategory varchar(50),@typegrpid int)
as
begin
insert into TroubleTicketingCategories values(@active,@desc,@Id,@TTCategory,@typegrpid)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRegistrationBTPOS]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelRegistrationBTPOS](@code varchar(50),@uniqueId varchar(50),@ipconfig varchar(50),
                                                    @Active int)
as
begin
insert into RegistrationBTPOS values (@code,@uniqueId,@ipconfig,@Active)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelregisterform]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelregisterform](@UserName varchar(max),
@Password varchar(max),@ConfirmPassword varchar(max),@Emailaddress varchar(max),
@FirstName varchar(max),@LastName varchar(max))
as
begin

INSERT INTO 
[register] VALUES
           (@UserName,
              
          
           @Password,
		     @ConfirmPassword,
			    @Emailaddress,
           @FirstName,
           @LastName
         
         )
   

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelReceivingsMaster]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelReceivingsMaster](@Id Numeric(20),
           @Date smalldatetime,
           @ReceivedFor varchar(20),
           @Desc varchar(20))
AS
BEGIN
	

INSERT INTO 
[ReceivingsMaster] VALUES
           (@Id, 
           @Date, 
           @ReceivedFor,
           @Desc)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelReceivings]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelReceivings](@Id Numeric(10),
           @Amount VARCHAR(20),
           @MasterId numeric(10),
           @ReceivedBy Varchar(20))
AS
BEGIN
	

INSERT INTO 
[Receivings] VALUES

       (@Id,
       @Amount,
         @MasterId,
           @ReceivedBy)  
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelplace]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelplace]
@flag varchar,@id int=-1,@name varchar(50),@countryid varchar(50),@code varchar(50)

as
begin
if @flag ='I'
begin
Insert into Paysmart.dbo.place
([name],[countryid],[code])
values
(@name,@countryid,@code)
end
if @flag ='U'
begin
Update  Paysmart.dbo.place
set [name]=@name,
[countryid]=@countryid,
[code]=@code
where id=@id
end
if @flag ='D'
begin
delete from  Paysmart.dbo.place
where id=@id
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayments]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelPayments]
(--@Card varchar(50)=null
--@MobilePayment varchar(50)=null
--@Cash varchar(50)=null
@TransactionId int
,@Transaction_Num varchar(50)
,@amount decimal
,@PaymentMode int
,@Date datetime
,@Transactionstatus int
,@Gateway_transId varchar(50))
as
begin
insert into Payments (TransactionId
,Transaction_Num
,amount
,PaymentMode
,Date
,Transactionstatus
,Gateway_transId)values(
--@Card
--,@MobilePayment
--,@Cash
@TransactionId
,@Transaction_Num
,@amount
,@PaymentMode
,@Date
,@Transactionstatus
,@Gateway_transId)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentReceivings]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelPaymentReceivings](@amount int,@code varchar(50),@date varchar(50),@desc int,@Id int,@inventoryId int,@quantity int,@receivedOn varchar(50),@transactionId int,@transactiontype varchar(50))
as
begin
insert into PaymentReceivings values(@amount,@code,@date,@desc,@Id,@inventoryId,@quantity,@receivedOn,@transactionId,@transactiontype)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentGatewayType]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelPaymentGatewayType](@Active NUMERIC(10),
              
           @Desc Varchar(30),
           
           @Id numeric(10),
           @PaymentGatewayType varchar(30),
           @TypeGripId numeric(20))
AS
BEGIN
	

INSERT INTO 
[PaymentGatewayType] VALUES
           (@Active,
              
          
           @Desc,
           @Id,
           @PaymentGatewayType,
           @TypeGripId )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentGatewaySettings]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelPaymentGatewaySettings]
(
@enddate datetime,
@hashkey datetime,
@PaymentGatewayTypeId int,
@providername varchar(50),
@pwd varchar(50),
@saltkey datetime,
@startdate datetime,
@username varchar(50),
@ClientId int,
@SecretId int,
@insupdflag varchar(10))
AS
BEGIN	
if @insupdflag = 'I' 
begin
INSERT INTO [dbo].[PaymentGatewaySettings]
           ([enddate]
           ,[hashkey]
           ,[PaymentGatewayTypeId]
           ,[providername]
           ,[pwd]
           ,[saltkey]
           ,[startdate]
           ,[username]
             ,[ClientId]      
              ,[SecretId]        
             )  values
(@enddate,
@hashkey,
@PaymentGatewayTypeId,
@providername,
@pwd,
@saltkey,
@startdate,
@username,
@clientId,
@SecretId)
end

          else
  if @insupdflag = 'U' 
  begin
UPDATE [POSDashboard].[dbo].[PaymentGatewaySettings]
   SET   [hashkey] = @hashkey 
         ,[providername] = @providername
         ,[pwd] = @pwd
       ,[saltkey] = @saltkey
      ,[startdate] = @startdate
      ,[username] = @username
      ,[ClientId] = @ClientId
     ,[SecretId] = @SecretId
      ,[enddate] = @enddate      
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentCatergory]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelPaymentCatergory](@Active NUMERIC(10),
              
           @Desc Varchar(30),
           
           @Id numeric(10),
           @PaymentCatergory varchar(30),
           @TypeGripId varchar(50))
AS
BEGIN
	

INSERT INTO 
[PaymentGatewayType] VALUES
           (@Active,
              
          
           @Desc,
           @Id,
           @PaymentCatergory,
           @TypeGripId )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayment]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelPayment](@Card varchar(50),@MobilePayment varchar(50),@Cash varchar(50))
as
begin
insert into Payment values(@Card,@MobilePayment,@Cash)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayablesMaster]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelPayablesMaster](@Id numeric,
           @Date smalldatetime,
           @PaidFor VARCHAR,
           @Desc VARCHAR)
AS
BEGIN
	

INSERT INTO 
[PayablesMaster] VALUES
           (@Id
           ,@Date
           ,@PaidFor
           ,@Desc)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPasswordverification]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelPasswordverification]
@Mobilenumber varchar(20) = null,
@Email varchar(50) =null
as
begin

declare @cnt int,@p varchar(4)
declare @dt datetime
 
set @dt = GETDATE()
select @p = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))


	select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Email = @Email
	if @cnt = 0
	begin
	            RAISERROR ('Invalid mobile number or email address',16,1);
				return;	
	end
	else
	begin
	    update dbo.Appusers set [Passwordotp] = @p  where Mobilenumber = @Mobilenumber and Email = @Email
		select @p
	end

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelObjects]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelObjects](@Id int,
@Name varchar(50),
@Description varchar(100) = '',

@ParentId varchar(10),
@RootObjectId varchar(20),
@Active int = 1,
@insupdflag varchar(1))
as
begin
declare @cnt int

if @insupdflag = 'I'
begin

select @cnt = COUNT(*) from Objects where UPPER(name) = UPPER(@Name)

if @cnt =0


INSERT INTO [POSDashboard].[dbo].[Objects]
           ([Name]
           ,[Description]
          
           ,[Active]
           ,[ParentId]
           ,[RootObjectId])
     VALUES
           (@Name
           ,@Description
           
           ,@Active
           ,@ParentId
           ,@RootObjectId)
           
           end
else
if @insupdflag = 'U'
begin

select @cnt = COUNT(*) from Objects where UPPER(name) = UPPER(@Name) 
and Id <> @Id

if @cnt > 0


update Objects 
set 
[Name]=@Name
,[Active] = @Active
,[Description] = @Description

where Name = @Name




end
if @insupdflag = 'D'
begin
DELETE FROM [POSDashboard].[dbo].[Objects]
      WHERE Id = @Id
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentCatergory]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetPaymentCatergory]
AS
BEGIN
	
select * from PaymentCatergory
end
GO
/****** Object:  StoredProcedure [dbo].[GetPayablesMaster]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPayablesMaster]
AS
BEGIN
	
select * from PayablesMaster
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSProviderConfig]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelSMSProviderConfig](@Id numeric(20),
           @ProviderName varchar(20),
           @BTPOSGRPID varchar(20),
           @Active varchar(20),
           @UserId numeric(20),
           @Passkey varchar(20))
AS
BEGIN
	

INSERT INTO 
[SMSProviderConfig] VALUES
           (@Id,
           @ProviderName,
           @BTPOSGRPID,
           @Active,
           @UserId,
           @Passkey)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSGatewayConfiguration]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelSMSGatewayConfiguration]
(@enddate datetime,
@hashkey datetime,
@providername varchar(50),
@pwd varchar(50),
@saltkey datetime,
@startdate datetime,
@username varchar(50),
@ClientId int,
@SecretId int,
@insupdflag varchar(10))
as
begin
if @insupdflag = 'I' 
begin
INSERT INTO [dbo].[SmsGatewayeConfiguration]
           ([enddate]
           ,[hashkey]          
           ,[providername]
           ,[pwd]
           ,[saltkey]
           ,[startdate]
           ,[username]
            ,[ClientId]      
              ,[SecretId]        
             )   
values
(@enddate,
@hashkey,
@providername,
@pwd,
@saltkey,
@startdate,
@username,
@ClientId,
@SecretId)
end
      
      else
  if @insupdflag = 'U' 
  begin
UPDATE [POSDashboard].[dbo].[SmsGatewayeConfiguration]
   SET   [hashkey] = @hashkey 
         ,[providername] = @providername
         ,[pwd] = @pwd
       ,[saltkey] = @saltkey
      ,[startdate] = @startdate
      ,[username] = @username
      ,[ClientId] = @ClientId
     ,[SecretId] = @SecretId
      ,[enddate] = @enddate      
end

end




/****** Object:  Table [dbo].[Index]    Script Date: 07/09/2016 17:22:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSEmailSubscribers]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelSMSEmailSubscribers](@AlertId int,@emailid varchar(50),@enddate datetime,@frequency int,@Id int,@phNo varchar(50),@startdate datetime,@userid int)
as
begin
insert into SMSEmailSubscribers values(@AlertId,@emailid,@enddate,@frequency,@Id,@phNo,@startdate,@userid)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSEmailConfiguration]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelSMSEmailConfiguration]
(@enddate datetime,
@hashkey datetime,
@providername varchar(50),
@pwd varchar(50),
@saltkey datetime,
@startdate datetime,
@username varchar(50),
@Port int,
@ClientId int,
@SecretId int,
@insupdflag varchar(10))
AS
BEGIN	
if @insupdflag = 'I' 
begin
INSERT INTO [dbo].[SMSEmailConfiguration]
           ([enddate]
           ,[hashkey]           
           ,[providername]
           ,[pwd]
           ,[saltkey]
           ,[startdate]
           ,[username]
           ,[Port]
             ,[ClientId]      
              ,[SecretId] )         
values
(@enddate,
@hashkey,
@providername,
@pwd,
@saltkey,
@startdate,
@username,
@Port,
@ClientId,
@SecretId)
end
          
          else
  if @insupdflag = 'U' 
  begin
UPDATE [POSDashboard].[dbo].[SMSEmailConfiguration]
   SET   [hashkey] = @hashkey 
         ,[providername] = @providername
         ,[pwd] = @pwd
       ,[saltkey] = @saltkey
      ,[startdate] = @startdate
      ,[username] = @username
      ,[Port]= @Port
      ,[ClientId] = @ClientId
     ,[SecretId] = @SecretId
      ,[enddate] = @enddate 
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSalesordernw]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsUpdDelSalesordernw]

@ItemId int,
@ItemName varchar,
@UnitPrice money

as
begin

INSERT INTO [POSDashboard].[dbo].[Salesordernw]
           ([ItemId]
           ,[ItemName]
           ,[UnitPrice]
           )
     VALUES
           (@ItemId
           ,@ItemName
           ,@UnitPrice
           )
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSalesOrder]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[InsUpdDelSalesOrder]
(
@Id int
,@SalesOrderNum nvarchar(15)
 ,@TransactionId int
      ,@Date datetime
      ,@amount decimal
      ,@ItemId int
      ,@Quantity decimal
      ,@Status int)
as
begin
insert into SalesOrder(Id
 ,SalesOrderNum
,TransactionId
,Date
,amount
,ItemId
,Quantity
,Status)values(
@Id
 ,@SalesOrderNum
,@TransactionId
,@Date
,@amount
,@ItemId

,@Quantity
,@Status)

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoutesConfiguration]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelRoutesConfiguration](@distanceFromDest int,@distanceFromLastStop int,@distanceFromPrevStop int,@distanceFromSource int,@Id int,@routeId int,@stops varchar(50))
as
begin
insert into RoutesConfiguration values(@distanceFromDest,@distanceFromLastStop,@distanceFromPrevStop,@distanceFromSource,@Id,@routeId,@stops)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelULPymtTransDetails]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelULPymtTransDetails](
@Id int = -1,
@ULPPymtTransId int,
@PaymentTypeId int,
@StatusId int,
@Discount decimal(18,0),
@Tax decimal(18,0),
@Amount decimal(18,0),
@TransDate datetime=null,

@insupddelflag char
)
as
begin

if @insupddelflag = 'I'
begin
INSERT INTO [POSDashboard].[dbo].[ULPymtTransDetails]
           ([ULPPymtTransId]
           ,[PaymentTypeId]
           ,[StatusId]
           ,[Discount]
           ,[Tax]           
           ,[Amount]
           ,[TransDate]
           
          
           )
     VALUES
           (@ULPPymtTransId
           ,@PaymentTypeId 
           ,@StatusId
           ,@Discount
           ,@Tax        
           ,@Amount
           ,@TransDate
        
            )
          end
else
if @insupddelflag = 'U'
begin

UPDATE [POSDashboard].[dbo].[ULPymtTransDetails]
   SET [ULPPymtTransId] = @ULPPymtTransId
      ,[PaymentTypeId] = @PaymentTypeId
      ,[StatusId] = @StatusId
      ,[Discount] = @Discount
      ,[Tax] = @Tax
      ,[Amount] =@Amount
      ,[TransDate] = @TransDate
    
     
 WHERE [Id] = @Id 
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [POSDashboard].[dbo].[ULPymtTransDetails]
      WHERE [Id] = @Id 
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelULFeatures]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelULFeatures](
@Id int = -1,
@ULPymtId int,
@FeatureId int,
@FeatureValue varchar(50),
@FeatureDesc varchar(50),

@insupddelflag char
)
as
begin

if @insupddelflag = 'I'
begin
INSERT INTO [POSDashboard].[dbo].[ULFeatures]
           ([ULPymtId]
           ,[FeatureId]
           ,[FeatureValue]
           ,[FeatureDesc]
           
           )
     VALUES
           (@ULPymtId
           ,@FeatureId
           ,@FeatureValue
           ,@FeatureDesc
           
            )
          end
else
if @insupddelflag = 'U'
begin

UPDATE [POSDashboard].[dbo].[ULFeatures]
   SET [ULPymtId] = @ULPymtId
      ,[FeatureId] = @FeatureId
      ,[FeatureValue] = @FeatureValue
      ,[FeatureDesc] = @FeatureDesc
     
     
 WHERE [Id] = @Id 
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [POSDashboard].[dbo].[ULFeatures]
      WHERE [Id] = @Id 
end
end

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDeltypes]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDeltypes]
@flag varchar,@id int=-1,@name varchar(50),@description varchar(50),@active int
,@typegroupid varchar(50),@listkey varchar(50),@listvalue varchar(50)
as
begin
if @flag ='I'
begin
Insert into Paysmart.dbo.types
([name],[description],[active],[typegroupid],[listkey],[listvalue])
values
(@name,@description,@active,@typegroupid,@listkey,@listvalue)
end
if @flag ='U'
begin
Update  Paysmart.dbo.types
set [name]=@name,
[description]=@description,
[active]=@active,
[typegroupid]=@typegroupid,
[listkey]=@listkey,
[listvalue]=@listvalue
where id=@id
end
if @flag ='D'
begin
delete from Paysmart.dbo.types
where id=@id
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingSlaType]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelTroubleTicketingSlaType](@Active NUMERIC(10),
              
           @Desc Varchar(30),
           
           @Id numeric(10),
           @TTSLAType varchar(30),
           @TypeGripId numeric(20))
AS
BEGIN
	

INSERT INTO 
[TroubleTicketingSlaType] VALUES
           (@Active,
              
          
           @Desc,
           @Id,
           @TTSLAType,
           @TypeGripId)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingHandlers]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTroubleTicketingHandlers](@handledOn int,@Id int,@status int,@TTId int,@userid int)
as
begin
insert into TroubleTicketingHandlers values(@handledOn,@Id,@status,@TTId,@userid)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingDevice]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTroubleTicketingDevice](@deviceid int,@Id int,@ticketTypeId int,@TTId int)
as
begin
insert into TroubleTicketingDevice values(@deviceid,@Id,@ticketTypeId,@TTId)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingDetails]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelTroubleTicketingDetails]
(@RefId Int,
@Type int,
@createdBy Varchar(50),
--@Id int,
@raised int,
@status int,
@TicketTitle int, 
@IssueDetails Varchar(50),
@AddInfo Varchar(50),
@Asign int)
as
begin
insert into TroubleTicketingDetails
(
Type,
createdBy,
--Id ,
raised,
status ,
TicketTitle,
IssueDetails,
AddInfo ,
RefId,
Asign ) 
values
( --@Id,
@Type ,
@createdBy,
@raised ,
@status ,
@TicketTitle ,
@IssueDetails ,
@AddInfo ,
@RefId,
@Asign)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionTypes]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTransactionTypes](@active int,@desc varchar(50),@Id int,@TransactionTypes varchar(50),@typegrpid int)
as
begin
insert into TransactionTypes values(@active,@desc,@Id,@TransactionTypes,@typegrpid)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactions]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTransactions]
(@Id int
,@barcode varchar(50)=''
,@BTPOSid varchar(50)
,@busNumber varchar(50)
,@busId int=''
,@change varchar(50)=''
,@company varchar(50)
,@companyId varchar(50)=''
,@ConductorId varchar(50)=''
,@ConductorName varchar(50)=''
,@Date datetime=''
,@destination varchar(50)=''
,@fare varchar(50)=''
,@greetingMessage varchar(50)
,@luggageType varchar(50)
,@passengerType varchar(50)
,@passengerId varchar(50)
,@paymentId varchar(50)=''
,@printdataId varchar(50)
,@route varchar(50)=''
,@routecode varchar(50)=''
,@routeId varchar(50)
,@source varchar(50)=''
,@time datetime
,@ticketHolderId varchar(50)=''
,@ticketHolderName  varchar(50)
,@TicketNumber  varchar(50)
,@ticketValidityPeriod  varchar(50)=''
,@totalamount int
,@amountpaid int
,@TransactionCode varchar(50)
,@TransactionId varchar(50)=''
,@transactionType varchar(50)
,@userid int
,@ChangeRendered varchar(50)='fgg')

as
begin	
insert into Transactions (barcode,BTPOSid,busNumber,
busId,change,company,companyId,ConductorId,ConductorName,
Date,destination,fare,greetingMessage,luggageType,
passengerType,passengerId,paymentId,printdataId,route,
routecode,routeId,source,time,ticketHolderId,
ticketHolderName,TicketNumber,ticketValidityPeriod,totalamount,amountpaid,
TransactionCode,TransactionId,transactionType,userid,ChangeRendered) values(@barcode,@BTPOSid,@busNumber,
@busId,@change,@company,@companyId,@ConductorId,@ConductorName,
@Date,@destination,@fare,@greetingMessage,@luggageType,
@passengerType,@passengerId,@paymentId,@printdataId,@route,
@routecode,@routeId,@source,@time,@ticketHolderId,
@ticketHolderName,@TicketNumber,@ticketValidityPeriod,@totalamount,@amountpaid,
@TransactionCode,@TransactionId,@transactionType,@userid,@ChangeRendered)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionMaster]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTransactionMaster](@Id int,@TransCode varchar(50),@Date DateTime,@TransType varchar(50))
as
begin
insert into TransactionMaster values(@Id,@TransCode,@Date,@TransType)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionDetails]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTransactionDetails](@Id int,@TransId varchar(50),@TotalAmt int,@PaymentId varchar(50),@BTPOSid varchar(50))
as
begin
insert into TransactionDetails values(@Id,@TransId,@TotalAmt,@PaymentId,@BTPOSid)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTicketGeneration]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTicketGeneration](@Source varchar(50),@Target varchar(50),@NoOfTickets int)
as
begin
insert into TicketGeneration values (@Source,@Target,@NoOfTickets)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdWebsiteUserInfo]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdWebsiteUserInfo](
@Id int = -1
,@FirstName varchar(50)
,@LastName varchar(50)
,@MiddleName varchar(50)
,@UserName varchar(50)  
,@Password varchar(50)  
,@EmailAddress varchar(50)
,@Mobile varchar(15)
,@CountryId int
,@Gender int
,@UserTypeId int 
,@UserId int = null
,@Active int = 1
,@IsEmailVerified int  = 0
,@insUpdDelFlag varchar
,@EVerificationCode varchar(20) output
)           
 AS
BEGIN
declare @cnt int, @currDate date 
set @currDate = getdate()

if @insUpdDelFlag = 'I' 
begin

	select @cnt = COUNT(*) from WebsiteUserInfo where upper(UserName) = upper(@UserName) or Mobile = @Mobile
	or EmailAddress = @EmailAddress

	if @cnt = 0 
	begin
	    INSERT INTO [dbo].[WebsiteUserInfo]
           ([FirstName]
           ,[LastName]
           ,[MiddleName]           
           ,[UserName]
           ,[EmailAddress]           
           ,[Mobile]
           ,[CountryId] 
           ,[Password]          
           ,[Gender]
           ,[UserTypeId]
           ,[UserId]
           ,[Active]
           ,IsEmailVerified
           ,createdon)
     VALUES
          (@FirstName
           ,@LastName
           ,@MiddleName          
           ,@UserName
           ,@EmailAddress
           ,@Mobile 
           ,@CountryId 
           ,@Password        
           ,@Gender
           ,@UserTypeId
           ,@UserId
           ,@Active
           ,0
           ,@currDate)
           
           SELECT @Id = SCOPE_IDENTITY()
           
            SELECT [WebsiteUserInfo].[Id]
			  ,[FirstName]
			  ,[LastName]
			  ,[MiddleName]			 
			  ,[UserName]
			  ,[EmailAddress]			  
			  ,[Mobile]
			  ,[CountryId] 
			  --,c.Name
			  ,[Password]			 
			  ,[Gender]
			  ,[UserTypeId]
			  ,[UserId]
			  ,[Active]
			  ,[IsEmailVerified]
			  ,[CreatedOn]
			  ,[EVerificationCode]
			  ,[EVerifiedOn]
			  ,[ENoOfAttempts]
			  ,[MVerificationCode]
			  ,[MVerifiedOn]
			  ,[MNoOfAttempts]
			  ,[AltMobileNo]
			  ,[IsMobileVerified]
		  FROM [dbo].[WebsiteUserInfo]
		    inner join Country c on c.Id = CountryId
			where [dbo].[WebsiteUserInfo].Id = @Id
           
           select @EVerificationCode = 'E'+replace(CONVERT(VARCHAR(20), GETDATE(), 114),':','') 
	end
	else
	  	RAISERROR ('User already exists',16,1); 

end
else
	if @insUpdDelFlag = 'U' 
	begin
	select @cnt = COUNT(*) from WebsiteUserInfo where (upper(UserName) = upper(@UserName) or Mobile = @Mobile
	or EmailAddress = @EmailAddress) and Id <> @Id
	
			if @cnt = 0 
			begin
			   UPDATE [dbo].[WebsiteUserInfo]
			   SET 
			       [UserName] = @UserName
			       ,[FirstName] = @FirstName
				  ,[LastName] = @LastName
				  ,[MiddleName]	= @MiddleName			  
				  ,[EmailAddress] = @EmailAddress
				  --,[Password] = @Password
				  ,[Mobile] = @Mobile
				  ,[CountryId] = @CountryId				  
				  ,[Gender] = @Gender
				  ,[UserTypeId] = @UserTypeId
				  ,[UserId] = @UserId
				  ,[Active] = @Active
				  ,IsEmailVerified = @IsEmailVerified
			 WHERE Id = @Id
                 
           SELECT [WebsiteUserInfo].[Id]
			  ,[FirstName]
			  ,[LastName]
			  ,[MiddleName]			 
			  ,[UserName]
			  ,[EmailAddress]			  
			  ,[Mobile]
			  ,[CountryId] 
			  --,c.Name
			  ,[Password]  			 
			  ,[Gender]
			  ,[UserTypeId]
			  ,[UserId]
			  ,[Active]
			  ,[IsEmailVerified]
			  ,[CreatedOn]
			  ,[EVerificationCode]
			  ,[EVerifiedOn]
			  ,[ENoOfAttempts]
			  ,[MVerificationCode]
			  ,[MVerifiedOn]
			  ,[MNoOfAttempts]
			  ,[AltMobileNo]
			  ,[IsMobileVerified]
		  FROM [dbo].[WebsiteUserInfo]
		  inner join Country c on c.Id = CountryId
			where [WebsiteUserInfo].Id = @Id
           
			end
			else
	  			RAISERROR ('Duplicate user not allowed',16,1); 

			
	end
	else
		if @insUpdDelFlag = 'D' 
		begin
		   UPDATE [dbo].[WebsiteUserInfo]
			   SET [Active] = 0
			 WHERE Id = @Id
		end
 
  SELECT [WebsiteUserInfo].[Id]
      ,[FirstName]
      ,[LastName] 
      ,[MiddleName]    
      ,[UserName]
      ,[EmailAddress]
      ,[Password]
      ,[Mobile]
      ,[CountryId]
      --,c.Name     
      ,[Gender]
      ,[UserTypeId]
      ,[UserId]
      ,[Active]
      ,IsEmailVerified
  FROM [dbo].[WebsiteUserInfo]
   inner join Country c on c.Id = CountryId
  where [WebsiteUserInfo].Id = @Id

 select @Id

END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdwebsiteresetpassword]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsUpdwebsiteresetpassword]
	-- Add the parameters for the stored procedure here

	@UserName varchar(50)
,@OldPassword varchar(50)
,@NewPassword varchar(50)  
,@ReenterNewPassword varchar(50)  

AS
BEGIN
	UPDATE WebsiteUserInfo
SET Password=@NewPassword where UserName = @UserName
and Password = @OldPassword
UPDATE WebsiteUserlogin
SET Passkey=@NewPassword where Logininfo = @UserName
and Passkey = @OldPassword


END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdCountry]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE[dbo].[InsUpdCountry](@Id NUMERIC(10),@HasOperations int)
AS
BEGIN
	
update Country 
set HasOperations = @HasOperations
where Id = @Id
   
END
GO
/****** Object:  StoredProcedure [dbo].[InsupdCartPaymentDetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsupdCartPaymentDetails]  (@LicenseType varchar(50)
           ,@Frequency int
           ,@NoOfMonths varchar(50)
           ,@TotalAmount int
           ,@CreateDate date
           ,@TransId varchar(50)
           ,@UnitPrice int
           ,@FleetOwner varchar(50))
	
AS
BEGIN
	
	INSERT INTO [POSDashboard].[dbo].[CartPaymentDetails]
           ([LicenseType]
           ,[Frequency]
           ,[NoOfMonths]
           ,[TotalAmount]
           ,[CreateDate]
           ,[TransId]
           ,[UnitPrice]
           ,[FleetOwner])
     VALUES
           (@LicenseType
            ,@Frequency
           ,@NoOfMonths
           ,@TotalAmount
           ,@CreateDate
           ,@TransId
           ,@UnitPrice
           ,@FleetOwner)

END

/****** Object:  StoredProcedure [dbo].[GetFileContent]    Script Date: 07/17/2016 08:17:05 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdBookedTicket]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsUpdBookedTicket]
@Id int = -1
,@BookingId int
,@TicketContent varchar(max)
,@TicketNo varchar(15)
,@TransId varchar(25)
,@EmailId varchar(50)
,@MobileNo varchar(15)
,@insUpdDelFlag varchar
AS
BEGIN
declare @cnt int, @dt date
select @dt = GETDATE()
if @insUpdDelFlag = 'I' 
begin
    select @cnt = Id from [dbo].[BookedTicket] where BookingId = @BookingId
    
	if @cnt is null 
	begin
	   INSERT INTO [dbo].[BookedTicket]
           ([BookingId]
           ,[TicketContent]
           ,[createdOn]
           ,[TicketNo]
           ,[TransId]
           ,[EmailId]
           ,[MobileNo])
     VALUES
           (@BookingId
           ,@TicketContent
           ,@dt
           ,@TicketNo
           ,@TransId
           ,@EmailId
           ,@MobileNo)
           
           select SCOPE_IDENTITY()
	end	
	else
	  select @cnt

end
else
	if @insUpdDelFlag = 'U' 
	begin
			if @cnt = 0 
			begin
			  UPDATE [POSDashboard].[dbo].[BookedTicket]
			   SET [BookingId] = @BookingId
				  ,[TicketContent] = @TicketContent				 
				  ,[TicketNo] = @TicketNo
				  ,[TransId] = @TransId
				  ,[EmailId] = @EmailId
				  ,[MobileNo] = @MobileNo
				WHERE Id = @Id

			end
			

			
	end
	
END
GO
/****** Object:  StoredProcedure [dbo].[InsupdBiopw]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsupdBiopw]
@flag varchar,@id int, @accid int,@biometricdata varchar(50),@datatype varchar(50),@active int,@datecreatedon date,@updatedon date,@Emailotp varchar(5),@Pwdotp varchar(5),@Password varchar(20),@statusId int,@AccountNo varchar(50),@AuthTypeId int,@AltPhonenumber varchar(20),@Altemail varchar(50)
as
begin
if @flag ='I'
begin
Insert into UserBiometricPwd
([accid],[biometricdata],[datatype],[active],[datecreatedon],[updatedon])
values
(@accid,@biometricdata,@datatype,@active,@datecreatedon,@updatedon)
end
if @flag ='U'
begin
update UserBiometricPwd
set[accid]=@accid,
   [biometricdata]=@biometricdata,
   [datatype]=@datatype,
   [active]=@active,
   [datecreatedon]=@datecreatedon,
   [updatedon]=@updatedon  
   where Id=@id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdAppusers]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[InsUpdAppusers]
@flag varchar,@Id int=-1,@Username varchar(50) = null,@Email varchar(50) = null
,@Mobilenumber varchar(20),@Password varchar(50) = null,@Mobileotp varchar(10) = null
,@Emailotp varchar(10) = null,@Passwordotp varchar(10) = null,@StatusId int = null
,@CreatedOn datetime = null,
@Mobileotpsenton datetime = null,
@emailotpsenton datetime = null,
@noofattempts int = null,
@Firstname varchar(20),@lastname varchar(20),
@AuthTypeId int,@AltPhonenumber varchar(20),
@Altemail varchar(50),@AccountNo varchar(50)
AS
BEGIN

declare @cnt int, @m varchar(4), @p varchar(4),@e varchar(4)
declare @dt datetime
set @dt = GETDATE()

select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
select @e = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5

	if @flag = 'I'
	begin
	
	select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Email = @Email

	if @cnt > 0
		begin
				RAISERROR ('Already user registered with given mobile number',16,1);
				return;	
		end
		
	else
    begin
    
	
	insert into PaySmart.dbo.Appusers 
	([Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts],[Firstname],[lastname],[AuthTypeId],[AltPhonenumber],[Altemail],[AccountNo] )
	values
	(@Username ,@Email ,@Mobilenumber ,@Password ,@m ,@e ,null ,@StatusId ,@dt ,@dt ,@dt ,0,@Firstname,@lastname,@AuthTypeId,@AltPhonenumber,@Altemail,@AccountNo)
	end
	
	end
	
	
	
	if @flag ='U'
	begin
	select @cnt = COUNT(*) from Appusers where (upper(UserName) = upper(@UserName) or Mobilenumber = @Mobilenumber
	or Email = @Email) and Id <> @Id

	if @cnt = 0
		begin
				RAISERROR ('No user registered with given mobile number',16,1);
				return;
		end
	else
    begin
	
	
	Update PaySmart.dbo.Appusers 
	set [Username]= @Username ,	
	[Email]= @Email,	
	[Password]= @Password,
	[Mobileotp]=@Mobileotp ,
	[Emailotp]= @Emailotp,
	[Passwordotp]= @Passwordotp,
	[StatusId]=@StatusId,
	[CreatedOn]= @CreatedOn,
	[Mobileotpsenton]= @Mobileotpsenton,
	[emailotpsenton]= @emailotpsenton,
	[noofattempts]= @noofattempts,
	[Firstname] =@Firstname,
	[lastname] =@lastname,
	[AuthTypeId] =@AuthTypeId,
	[AltPhonenumber] =@AltPhonenumber,
	[Altemail] =@Altemail,
	[AccountNo] =@AccountNo
	where Mobilenumber = @Mobilenumber 
	
	 end
	
	end
	
	
	select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts],[Firstname],[lastname],[AuthTypeId],[AltPhonenumber],[Altemail],[AccountNo]  from Appusers where Mobilenumber = @Mobilenumber
	

END
GO
/****** Object:  StoredProcedure [dbo].[InsupdAdd]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsupdAdd]
@flag varchar,@id int, @userid int,@email varchar(50),@Address varchar(250),@Accountid int,@preferenceTypeId int,@preferenceId int,@Emailotp varchar(5),@Pwdotp varchar(5),@Password varchar(20),@statusId int,@AccountNo varchar(50),@AuthTypeId int,@AltPhonenumber varchar(20),@Altemail varchar(50)
as
begin
if @flag ='I'
begin
Insert into Userpreferences
([userid],[email],[Address],[Accountid],[preferenceTypeId],[preferenceId])
values
(@userid,@email,@Address,@Accountid,@preferenceTypeId,@preferenceId)
end
if @flag ='U'
begin
update Userpreferences
set[userid]=@userid,
   [email]=@email,
   [Address]=@Address,
   [Accountid]=@Accountid,
   [preferenceTypeId]=@preferenceTypeId,
   [preferenceId]=@preferenceId  
   where Id=@id
   end
   
   end
GO
/****** Object:  StoredProcedure [dbo].[InsEditHistoryDetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsEditHistoryDetails]
(@EditHistoryId  int
         ,@FromValue varchar(50) = null
           ,@ToValue varchar(50)= null
           ,@ChangeType varchar(50)
           ,@Field1 varchar(50) = null
           ,@Field2 varchar(50) = null)
AS
BEGIN
	INSERT INTO [POSDashboard].[dbo].[EditHistoryDetails]
           ([EditHistoryId]
           ,[FromValue]
           ,[ToValue]
           ,[ChangeType]
           ,[Field1]
           ,[Field2])
     VALUES
           (@EditHistoryId
           ,@FromValue
           ,@ToValue
           ,@ChangeType
           ,@Field1
           ,@Field2)

END
GO
/****** Object:  StoredProcedure [dbo].[InsEditHistory]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsEditHistory]
(@Task varchar(50) =null,@Field varchar(50) =null
           ,@SubItem varchar(50) =null
           ,@Comment varchar(50) =null
           ,@Date datetime
           ,@ChangedBy varchar(50) =null
           ,@ChangedType varchar(50) =null           
           ,@edithistoryid int = -1 OUTPUT)
as
begin


INSERT INTO [POSDashboard].[dbo].[EditHistory]
           ([Field]
           ,[SubItem]
           ,[Comment]
           ,[Date]
           ,[ChangedBy]
           ,[ChangedType]
           ,[Task])
     VALUES
           (@Field
           ,@SubItem
           ,@Comment
           ,@Date
           ,@ChangedBy
           ,@ChangedType
           ,@Task)

 select @edithistoryid = SCOPE_IDENTITY()

end
GO
/****** Object:  StoredProcedure [dbo].[GetZipCode]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetZipCode]
AS
BEGIN
	
select * from ZipCode
end
GO
/****** Object:  StoredProcedure [dbo].[GetWebsiteUserInfo]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetWebsiteUserInfo]
@logininfo varchar(20)
AS
BEGIN
declare @logininfo1 varchar(20) 
set @logininfo1 = ltrim(rtrim(@logininfo))

SELECT [Id]
      ,[FirstName]
      ,[LastName]
      ,[UserName]
      ,[EmailAddress]
      ,[Password]
      ,[Mobile]
      ,[Gender]
      ,[UserTypeId]
      ,[UserId]
      ,[Active]
      ,[IsEmailVerified]
      ,[CreatedOn]
      ,[EVerificationCode]
      ,[EVerifiedOn]
      ,[ENoOfAttempts]
      ,[MVerificationCode]
      ,[MVerifiedOn]
      ,[MNoOfAttempts]
      ,[isMobileVerified]
  FROM [POSDashboard].[dbo].[WebsiteUserInfo]  
  where ((UserName = @logininfo1 or EmailAddress = upper(@logininfo1)
   or Mobile = @logininfo1))
   
end

/****** Object:  StoredProcedure [dbo].[GetinterbusUserLogin]    Script Date: 06/08/2016 16:08:17 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[getVehicleDetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getVehicleDetails]
as
begin
select * from VehicleDetails
end
GO
/****** Object:  StoredProcedure [dbo].[Getusertickets]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Getusertickets]
as
begin
select Userid from dbo.TroubleTicket
end
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsers]
(@cmpId int = -1)
AS
BEGIN

SELECT U.[Id]
      ,U.[FirstName]
      ,U.[LastName]      
      ,U.[EmpNo]
      ,U.[EmailId]
      ,U.[Address]
      ,U.[ContactNo1]    
      ,U.[Active]
      ,U.[MiddleName]
      ,mgr.Firstname + ' ' +mgr.LastName as mgrName
      ,mgr.Id as ManagerId
      ,ul.logininfo as DUserName
      ,ul.passkey as [DPassword]            
      ,c.name as [Company]
      ,U.[RoleId]
      ,U.[CompanyId]      
      ,U.[GenderId]     
      ,U.[CountryId]
      ,U.[StateId]
      ,U.[ZipCode]      
      ,U.[ContactNo2]      
      ,U.[AltAddress]
      ,U.[photo]
      ,R.Name RoleName
  FROM [POSDashboard].[dbo].[Users] U
  inner join company c on (U.companyid = c.id)
  left outer join Users mgr on mgr.id = U.managerid
  left outer join dbo.userlogins ul on ul.userid = U.id  
  left outer join Roles r on r.Id = U.RoleId     
  where (c.id = @cmpId or   @cmpId = -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetUserRoles]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserRoles]	
(@companyId int = -1)
AS
BEGIN
	
SELECT distinct users.[Id]
      ,[FirstName]+ ' '+[LastName] username
      ,ur.[RoleId]
      ,r.Name as rolename
      ,c.name as [companyname]
     ,c.Id as companyId
  FROM [POSDashboard].[dbo].[Users]  
  inner join userroles ur on ur.userid = users.id 
  inner join Roles r on r.Id = Ur.RoleId 
  inner join company c on c.id = ur.companyid
  where (c.id = @companyId or   @companyId = -1)    

END
GO
/****** Object:  StoredProcedure [dbo].[GetUserpreferences]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserpreferences]
as
begin
select * from dbo.Userpreferences
end
GO
/****** Object:  StoredProcedure [dbo].[GetUserLicensePymtTransactions]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserLicensePymtTransactions]
as 
begin
SELECT  [Id]
      ,[TransId]
      ,[GatewayTransId]
      ,[Amount]
      ,[TransDate]
      ,[ULPymtId]
      ,[StatusId]
      ,[Desc]
  FROM [POSDashboard].[dbo].[UserLicensePymtTransactions]
  
 
  
end
GO
/****** Object:  StoredProcedure [dbo].[GetUserLicensePayments]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserLicensePayments]
as 
begin
SELECT [Id]
      ,[ULId]
      ,[CreatedOn]
      ,[Amount]
      ,[UnitPrice]
      ,[Units]
      ,[StatusId]
      ,[LicensePymtTransId]
      ,[IsRenewal]
  FROM [POSDashboard].[dbo].[UserLicensePayments]
  
end
GO
/****** Object:  StoredProcedure [dbo].[GetUserLicense]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetUserLicense]
--(@foCode varchar(10))
as 
begin
SELECT u.[Id]
      ,u.[UserId]
     
      ,us.FirstName + '' + us.LastName as UName
      ,[FOId]      
      ,[LicenseTypeId]
      ,lt.LicenseType
      ,[StartDate]
      ,[ExpiryOn]
      ,[GracePeriod]
      ,[ActualExpiry]
      ,[LastUpdatedOn]
      ,[RenewFreqTypeId]
      ,r.Name
      ,u.[Active]
      ,u.[StatusId]
     ,f.FleetOwnerCode
     ,uld.Tax
     ,uld.Discount
     ,ulp.UnitPrice
  FROM [POSDashboard].[dbo].[UserLicense]u
  inner join Users us on us.Id=u.UserId
  inner join FleetOwner f on f.Id=u.FOId
  inner join Types r on r.Id = RenewFreqTypeId
  inner join LicenseTypes lt on lt.Id = LicenseTypeId
  inner join UserLicensePayments ulp on ulp.Id = u.Id
  inner join ULPymtTransDetails uld on uld.Id = u.id
  
end


--upper(f.FleetOwnerCode) = upper(@focode)
GO
/****** Object:  StoredProcedure [dbo].[GetTrackVehicle]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTrackVehicle]
@Latitude numeric(10,6),
@Longitude numeric(10,6)
as
begin
declare
@lat numeric(10,6),
@long numeric(10,6)

select top 1 @lat = Latitude,@long = longitude from StartBooking
SELECT *,((ACOS(SIN(@lat * PI() / 180) * SIN('lat' * PI() / 180) + COS(@lat * PI() / 180) * COS('lat' * PI() / 180) * COS((@long - 'lon') * PI() / 180)) * 180 / PI()) * 60 * 1.1515) AS 'distance' 
FROM [dbo].[StartBooking]
end
GO
/****** Object:  StoredProcedure [dbo].[GetTicketsForCancellation]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTicketsForCancellation]
	-- Add the parameters for the stored procedure here
	@ticketNo varchar(25) = null ,@emailidmobileno varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [Id]
      ,[TicketNo]
      ,[TransId]
      ,[EmailId]
      ,[MobileNo]
      ,[AltMobileNo]
      ,[TravelDate]
      ,[TravelTime]
      ,[Src]
      ,[Dest]
      ,[SrcId]
      ,[DestId]
      ,[RouteId]
      ,[VehicleId]
      ,[NoOfSeats]
      ,[Seats]
      ,[Status]
      ,[StatusId]
      ,[BookedBy]
      ,[BookedById]
      ,[Amount]
      ,[BookingType]
      ,[BookingTypeId]
      ,[JourneyType]
      ,[JourneyTypeId]
      ,[UserId]
      ,[Address]
      ,[BookedOn]
      ,[BookedOnTime]
      ,[ArrivalTime]
      ,[DepartureTime]
      ,[ArrivalDate]
      ,[DepartueDate]
  FROM [dbo].[BookingDetails]
  where [TravelDate] > getdate() and  
  ([TicketNo] = @ticketNo or @ticketNo is null)
  and(  @emailidmobileno is null or ([EmailId] = @emailidmobileno or [MobileNo]  = @emailidmobileno))
  
  
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetTicketHistory]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetTicketHistory]
as
begin
select * from dbo.Resolutionhistory
end
GO
/****** Object:  StoredProcedure [dbo].[getTicketGeneration]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getTicketGeneration]
as
begin
select * from TicketGeneration
end
GO
/****** Object:  StoredProcedure [dbo].[GetTicketDetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTicketDetails]
as
begin
select * from dbo.TroubleTicket
end
GO
/****** Object:  StoredProcedure [dbo].[Gettable2]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Gettable2]
AS
BEGIN
	
select * from table2
end
GO
/****** Object:  StoredProcedure [dbo].[GetSubCategories]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSubCategories] 
(@catid int =-1)	
AS
BEGIN
	
	SELECT S.[Id]
      ,S.[Name]
      ,S.[Description]
      ,[CategoryId]
      ,t.NAME CATEGORY
      ,S.[Active]
  FROM [POSDashboard].[dbo].[SubCategory] S
  INNER JOIN Types T ON T.ID = S.CATEGORYID
  INNER JOIN TypeGroups TG ON TG.Id = T.TypeGroupId 
  where (S.CATEGORYID = @catid or @catid = -1)
   	
END
GO
/****** Object:  StoredProcedure [dbo].[GetStops]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetStops]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Code]
      ,[Active]
  FROM [POSDashboard].[dbo].[Stops]




END
GO
/****** Object:  StoredProcedure [dbo].[Getusercards]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Getusercards]
as
begin
select * from dbo.Usercards
end
GO
/****** Object:  StoredProcedure [dbo].[GetULPymtTransDetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetULPymtTransDetails]
as 
begin
SELECT TOP 1000 [Id]
      ,[ULPPymtTransId]
      ,[PaymentTypeId]
      ,[StatusId]
      ,[Discount]
      ,[Tax]
      ,[Amount]
      ,[TransDate]
  FROM [POSDashboard].[dbo].[ULPymtTransDetails]
end
GO
/****** Object:  StoredProcedure [dbo].[GetULFeatures]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetULFeatures]
as 
begin
SELECT [Id]
      ,[ULPymtId]
      ,[FeatureId]
      ,[FeatureValue]
      ,[FeatureDesc]
  FROM [POSDashboard].[dbo].[ULFeatures]
 
end
GO
/****** Object:  StoredProcedure [dbo].[GetTypesByGroupId]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTypesByGroupId]
@typegrpid int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT t.Id, t.Name, t.[Description],t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 from [Types] t
	 inner join TypeGroups tg on tg.Id = t.TypeGroupId	 
	  where (TypeGroupId = @typegrpid or @typegrpid = -1)
END
GO
/****** Object:  StoredProcedure [dbo].[getTypes]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTypes]

as
begin
SELECT t.Id, t.Name, t.[Description],t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 from [Types] t
	 inner join TypeGroups tg on tg.Id = t.TypeGroupId	

END
GO
/****** Object:  StoredProcedure [dbo].[getTypeGroups]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTypeGroups]
as
begin
select * from TypeGroups
end
GO
/****** Object:  StoredProcedure [dbo].[GetTroubleTicketingStatus]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetTroubleTicketingStatus]
AS
BEGIN
	
select * from TroubleTicketingStatus
end
GO
/****** Object:  StoredProcedure [dbo].[GetTroubleTicketingSlaType]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetTroubleTicketingSlaType]
AS
BEGIN
	
select * from TroubleTicketingSlaType
end
GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingHandlers]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTroubleTicketingHandlers]
as
begin
select * from TroubleTicketingHandlers
end
GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingDevice]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTroubleTicketingDevice]
as
begin
select * from TroubleTicketingDevice
end
GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingDetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[getTroubleTicketingDetails]
as
begin
select * from TroubleTicketingDetails
end
GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingCategories]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTroubleTicketingCategories]
as
begin
select * from TroubleTicketingCategories
end
GO
/****** Object:  StoredProcedure [dbo].[getTransactionTypes]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTransactionTypes]
as
begin
select * from TransactionTypes
end
GO
/****** Object:  StoredProcedure [dbo].[getTransactions]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTransactions]
as
begin
select * from Transactions
end
GO
/****** Object:  StoredProcedure [dbo].[getTransactionMaster]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTransactionMaster]
as
begin
select * from TransactionMaster
end
GO
/****** Object:  StoredProcedure [dbo].[getTransactionDetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTransactionDetails]
as
begin
select * from TransactionDetails
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelExpenses]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelExpenses](@amount int,@Date varchar(50),@desc varchar(50),@Id int,@MasterId int,@paidBy varchar(50),@paidFor varchar (50),@transactionId int)
as
begin
insert into Expenses values(@amount,@Date,@desc,@Id,@MasterId,@paidBy,@paidFor,@transactionId)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelEOTPverification]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelEOTPverification]
@flag varchar,@Id int=-1,@Email varchar(50),@Emailotp varchar(10),@Mobilenumber varchar(20) = null
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Email = @Email

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Email',16,1);
				return;
   end

else

begin

  select @cnt = COUNT(*) from Appusers where Email = @Email and [Emailotp] = @Emailotp 
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid Email OTP',16,1);
					return;
	end
 
  else
 
   begin
     update Appusers set Emailotp  = null where Email  = @Email  and [Emailotp]  = @Emailotp
     select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts]  from Appusers where Email  = @Email
   end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCOUNTRY]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelCOUNTRY](@Id NUMERIC(10),
           @Name VARCHAR(50),   
           @Code VARCHAR(50),
           @Latitude varchar(15) = null,
           @Longitude varchar(15) = null,
           @HasOperations int = 0)
AS
BEGIN

           INSERT INTO [POSDashboard].[dbo].[Country]
           ([Name]
           ,[Latitude]
           ,[Longitude]
           ,[ISOCode]
           ,[HasOperations])
     VALUES
           (@Name
           ,@Latitude
           ,@Longitude
           ,@Code
           ,@HasOperations
           )   
END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteFare]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelFleetOwnerRouteFare](
           @routeId int
		   ,@FromStopId int
		   ,@ToStopId int
           ,@VehicleTypeId int
           ,@Distance decimal
           ,@PerUnitPrice decimal
           ,@Amount decimal
           ,@FareTypeId int
           ,@Active int
            ,@FromDate datetime = null
           ,@ToDate datetime = null
           ,@VehicleId int
           --,@InsUpdDelFlag varchar(1)
)                        
as
begin
declare @fsId int
set @fsId = 0

select @fsId = Id from RouteStops 
where fromstopid = @FromStopId 
and tostopid = @ToStopid
and routeId = @routeId

UPDATE [POSDashboard].[dbo].[FleetOwnerRouteFare]
   SET [VehicleTypeId] = @VehicleTypeId
      ,[Distance] = @Distance
      ,[PerUnitPrice] = @PerUnitPrice
      ,[Amount] = @Amount
      ,[FareTypeId] = @FareTypeId
      ,[Active] = @Active
      ,[FromDate] = @FromDate
      ,[ToDate] = @ToDate
 WHERE [FORouteStopId] = @fsId
 and [VehicleId] = @VehicleId
 
 if @@rowcount  = 0 
 begin
 INSERT INTO [POSDashboard].[dbo].[FleetOwnerRouteFare]
           ([FORouteStopId]
           ,[VehicleTypeId]
           ,[Distance]
           ,[PerUnitPrice]
           ,[Amount]
           ,[FareTypeId]
           ,[Active]
           ,[FromDate]
           ,[ToDate]
           ,[VehicleId])
     VALUES
           (@fsId
           ,@VehicleTypeId
           ,@Distance
           ,@PerUnitPrice
           ,@Amount
           ,@FareTypeId
           ,@Active
           ,@FromDate
           ,@ToDate
           ,@VehicleId)
           
        end   
         end  
           
           
/*
if @InsUpdDelFlag = 'I' 
begin
if @fsId = 0 
INSERT INTO [POSDashboard].[dbo].[FleetOwnerRouteFare]
           ([FORouteStopId]
           ,[VehicleTypeId]
           ,[Distance]
           ,[PerUnitPrice]
           ,[Amount]
           ,[FareTypeId]
           ,[Active]
           ,[FromDate]
           ,[ToDate]
           ,[VehicleId])
     VALUES
           (@fsId
           ,@VehicleTypeId
           ,@Distance
           ,@PerUnitPrice
           ,@Amount
           ,@FareTypeId
           ,@Active
           ,@FromDate
           ,@ToDate
           ,@VehicleId)

end
else
if @InsUpdDelFlag = 'U' 
UPDATE [POSDashboard].[dbo].[FleetOwnerRouteFare]
   SET [VehicleTypeId] = @VehicleTypeId
      ,[Distance] = @Distance
      ,[PerUnitPrice] = @PerUnitPrice
      ,[Amount] = @Amount
      ,[FareTypeId] = @FareTypeId
      ,[Active] = @Active
      ,[FromDate] = @FromDate
      ,[ToDate] = @ToDate
      ,[VehicleId] = @VehicleId
 WHERE [FORouteStopId] = @fsId

else
if @InsUpdDelFlag = 'D' 
DELETE FROM [POSDashboard].[dbo].[FleetOwnerRouteFare]
      WHERE [FORouteStopId] = @fsId
*/
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetScheduleList]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsUpdDelFleetScheduleList]
(@Id int =-1, @fleetId int, @RouteId int, @schedulename varchar(50)
, @starttime datetime = null, @endtime datetime = null,
@userid int = -1, @flag varchar)
as
begin

declare @dt datetime 

select @dt = GETDATE() 

if @flag = 'I' 
begin
INSERT INTO [POSDashboard].[dbo].[FleetScheduleList]
           ([ScheduleName]
           ,[FleetId]
           ,[RouteId]
           ,[StartTime]
           ,[EndTime]
           ,[CreatedOn]
           ,[UpdatedOn]
           ,[CreatedBy]
           ,[UpdatedBy])
     VALUES
           (@ScheduleName
           ,@FleetId
           ,@RouteId
           ,@StartTime
           ,@EndTime
           ,@dt
           ,@dt
           ,@userid
           ,@userid)
end
else
if @flag = 'U'
begin

UPDATE [POSDashboard].[dbo].[FleetScheduleList]
   SET [ScheduleName] = @ScheduleName
      ,[FleetId] = @FleetId
      ,[RouteId] = @RouteId
      ,[StartTime] = @StartTime
      ,[EndTime] = @EndTime
      ,[UpdatedOn] = @dt
      ,[UpdatedBy] = @userid
 WHERE Id = @Id
 
end
if @flag = 'D'
begin

DELETE FROM [POSDashboard].[dbo].[FleetScheduleList]
      WHERE Id = @Id
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelInventory]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelInventory](@Active int,@availableQty int,@category varchar(50)
,@code varchar(50),@desc varchar(50),@InventoryId int,@name varchar(50),@PerUnitPrice int,@reorderpoint int,@subcat varchar(50))
as
begin
insert into Inventory values(@Active,@availableQty,@category,@code,@desc,@InventoryId,@name,@PerUnitPrice,@reorderpoint,@subcat)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenceStatus]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelLicenceStatus](@Active NUMERIC(10),
              
           @Desc Varchar(30),
           
           @Id numeric(10),
           @LicenseStatusType varchar(30),
           @TypeGripId varchar(50))
AS
BEGIN
	

INSERT INTO 
[LicenceStatus] VALUES
           (@Active,
           @Desc,
           @Id,
           @LicenseStatusType,
           @TypeGripId )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenceCatergories]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelLicenceCatergories](@Active NUMERIC(10),
              
           @Desc Varchar(30),
           
           @Id numeric(10),
           @LicenseCategory varchar(30),
           @TypeGripId varchar(50))
AS
BEGIN
	

INSERT INTO 
[LicenceCatergories] VALUES
           (@Active,
              
          
           @Desc,
           @Id,
           @LicenseCategory,
           @TypeGripId )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsupddelInventorySales]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsupddelInventorySales] (@Id int,@ItemName varchar(50),@Quantity int,@PerUnitPrice int,@PurchaseDate varchar(50),@InVoiceNumber int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [POSDashboard].[dbo].[InventorySales]
           ([ItemName]
           ,[Quantity]
           ,[PerUnitPrice]
           ,[PurchaseDate]
           ,[InVoiceNumber])
     VALUES
    (@ItemName,@Quantity,@PerUnitPrice,@PurchaseDate,@InVoiceNumber)




END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelInventoryReceivings]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelInventoryReceivings](@amount int,@code varchar(50),@date varchar(50),@Id int,@inventoryId int,@quantity int,@reason varchar(50),@refundamt int,@returnedOn varchar(50),@transactionId int,@transactiontype varchar(50))
as
begin
insert into InventoryReceivings values(@amount,@code,@date,@Id,@inventoryId,@quantity,@reason,@refundamt,@returnedOn,@transactionId,@transactiontype)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelmulitiplicationsave]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelmulitiplicationsave](@rows int,@columns int, @layoutId int)
AS
BEGIN
	

INSERT INTO 
[mulitiplicationsave] VALUES
           (@rows,
             @columns,
             @layoutId)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelMOTPverification]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelMOTPverification]
@flag varchar,@Id int=-1,@Mobilenumber varchar(20),@Mobileotp varchar(10),@Email varchar(50) =null
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update Appusers set Mobileotp = null where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
     select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts]  from Appusers where Mobilenumber = @Mobilenumber
  end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelMenu]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelMenu](@Ticketgeneration varchar(50),@Settings varchar(50),@Reports varchar(50))
as
begin
insert into menu values (@Ticketgeneration,@Settings,@Reports)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicensePricing]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelLicensePricing](
@Id int = -1,
@LicenseId int,
@RenewalFreqTypeId int,
@RenewalFreq int,
@UnitPrice decimal(18,0),
@fromdate datetime = null,
@todate datetime = null,
@insupddelflag char
)
as
begin

if @insupddelflag = 'I'
begin
INSERT INTO [POSDashboard].[dbo].[LicensePricing]
           ([LicenseId]
           ,[RenewalFreqTypeId]
           ,[RenewalFreq]
           ,[UnitPrice]
           ,[fromdate]
           ,[todate])
     VALUES
           (@LicenseId
           ,@RenewalFreqTypeId
           ,@RenewalFreq
           ,@UnitPrice
           ,@fromdate
           ,@todate
          )
          end
else
if @insupddelflag = 'U'
begin

UPDATE [POSDashboard].[dbo].[LicensePricing]
   SET [RenewalFreqTypeId] = @RenewalFreqTypeId
      ,[RenewalFreq] = @RenewalFreq
      ,[UnitPrice] = @UnitPrice
      ,[fromdate] = @fromdate
      ,[todate] = @todate
      --,[Active] = @Active
 WHERE licenseId = @LicenseId
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [POSDashboard].[dbo].[LicensePricing]
      WHERE licenseId = @LicenseId

end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicensePayments]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelLicensePayments](@expiryOn datetime,@Id int,@licenseFor varchar(50),@licenseId int,@licenseType varchar(50),@paidon datetime,@renewedon datetime,@transId varchar (50))
as
begin
insert into LicensePayments (expiryOn,licenseFor,licenseId,licenseType,paidon,renewedon,transId) values(@expiryOn,@licenseFor,@licenseId,@licenseType,@paidon,@renewedon,@transId)
end
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdVehicles]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVInsUpdVehicles]
@flag varchar,@Id int=-1,@CompanyId int,@VID int,@RegistrationNo nvarchar(50),@Type nvarchar(50)=null
,@OwnerName nvarchar(50)=null
,@ChasisNo nvarchar(50)=null,@Engineno nvarchar(50)=null
,@RoadTaxDate date=null,
@InsuranceNo nvarchar(50)=null,@InsDate date=null,
@PolutionNo nvarchar(50)=null,
@PolExpDate date=null,@RCBookNo nvarchar(50)=null
,@RCExpDate date=null,@CompanyVechile int=null,
@OwnerPhoneNo nvarchar(50)=null,@HomeLandmark nvarchar(255)=null,
@ModelYear nvarchar(255)=null,@DayOnly nvarchar(255)=null,
@VechMobileNo nvarchar(50)=null,@EntryDate date=null,
@NewEntry nvarchar(50)=null,
@VehicleModelId int=null,@ServiceTypeId int=null,@VehicleGroupId int=null
as
begin
declare @cnt int, @m varchar(5) 
select @VID = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
if @flag='I'
begin
select @cnt = COUNT(*) from PSVechileMaster where RegistrationNo = @RegistrationNo 

	if @cnt > 0
		begin
				RAISERROR ('Already user registered with given RegistrationNo',16,1);
				return;	
		end

insert into PSVechileMaster
	([CompanyId],[VID] ,[RegistrationNo] ,[Type],[OwnerName] ,
	[ChasisNo] ,[Engineno]
	,[RoadTaxDate],[InsuranceNo],[InsDate],[PolutionNo],
	[PolExpDate],
	[RCBookNo],[RCExpDate],[CompanyVechile],[OwnerPhoneNo],
	[HomeLandmark]
	,[ModelYear],[DayOnly]	
	,[VechMobileNo],[EntryDate],[NewEntry],
	[VehicleModelId],[ServiceTypeId],[VehicleGroupId])	
	values
	(@CompanyId,@VID,@RegistrationNo ,@Type ,@OwnerName,
	@ChasisNo ,@Engineno,
	@RoadTaxDate,@InsuranceNo,@InsDate,@PolutionNo,
	@PolExpDate,@RCBookNo,@RCExpDate,@CompanyVechile,@OwnerPhoneNo,
	@HomeLandmark,@ModelYear,@DayOnly,
	@VechMobileNo,@EntryDate,@NewEntry,
	@VehicleModelId,@ServiceTypeId,@VehicleGroupId)
	
	
end

if @flag='U'
		begin	
		select @cnt = COUNT(*) from PSVechileMaster where RegistrationNo = @RegistrationNo 

	if @cnt = 0
		begin
				RAISERROR ('No user registered with given RegistrationNo',16,1);
				return;	
		end
		Update  PSVechileMaster
	set [CompanyId]=@CompanyId,		
	[RegistrationNo]= @RegistrationNo,	
	[Type]= @Type,
	[OwnerName]=@OwnerName ,
	[ChasisNo]= @ChasisNo,
	[Engineno]= @Engineno,	
	[RoadTaxDate]= @RoadTaxDate,
	[InsuranceNo]= @InsuranceNo,
	[InsDate]= @InsDate,
	[PolutionNo]= @PolutionNo,
	[PolExpDate]= @PolExpDate,
	[RCBookNo]= @RCBookNo,
	[RCExpDate]= @RCExpDate,
	[CompanyVechile]= @CompanyVechile,
	[OwnerPhoneNo]=@OwnerPhoneNo,
	[HomeLandmark]=@HomeLandmark,
	[ModelYear]=@ModelYear,
	[DayOnly]=@DayOnly,		
	[VechMobileNo]=@VechMobileNo,
	[EntryDate]=@EntryDate,
	[NewEntry]=@NewEntry,	
	[VehicleModelId]=@VehicleModelId,
	[ServiceTypeId]=@ServiceTypeId,
	[VehicleGroupId]=@VehicleGroupId
	where Id = @Id
	end
	
	select [CompanyId],[RegistrationNo] ,[Type] ,[OwnerName],[OwnerPhoneNo] ,[VechMobileNo],[EntryDate],[VehicleModelId],[ServiceTypeId],[VehicleGroupId]  from PSVechileMaster where VID = @VID
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdUserlocations]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVInsUpdUserlocations]
@latitude numeric(10,6),
@longitude numeric(10,6),
@PhoneNo varchar(50)
as
begin
insert into dbo.StartBooking

([latitude],[longitude],[PhoneNo])
values(@latitude,@longitude,@PhoneNo)


update StartBooking
set [latitude] =@latitude,
[longitude] =@longitude,
[PhoneNo]  = @PhoneNo

select [VID],[RegistrationNo],[Type]  from VechileMaster  

end
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdtravelling]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[HVInsUpdtravelling]
@flag varchar,@SlNo int,@EntryDate date=null,@VechID int,@RegistrationNo nvarchar(255) = null
,@DriverName nvarchar(255),@PartyName varchar(255),@PickupPlace nvarchar(255),
@DropPlace nvarchar(255),@StartMeter int,@PickupTime datetime=null,
@ExecutiveName nvarchar(255) ,@BookingNo decimal(18,1),@EntryTime datetime=null,@CloseStatus nvarchar(255)
AS
BEGIN


 declare @dt datetime   
set @dt = GETDATE()
 if @flag='i'
 begin
	
	insert into StartReport
	([EntryDate] ,[VechID] ,[RegistrationNo],[DriverName],[PartyName] ,
	[PickupPlace] ,[DropPlace] ,[StartMeter],[PickupTime],[ExecutiveName],
	[BookingNo],[EntryTime] ,[CloseStatus])	values
	(@dt,@VechID ,@RegistrationNo ,@DriverName,@PartyName 
	,@PickupPlace ,@DropPlace ,@StartMeter,@dt,@ExecutiveName,
	@BookingNo,@dt,@CloseStatus)
	
end
		
	if @flag='u'
	begin
	Update  StartReport
	set [EntryDate]= @EntryDate,	
	[VechID]= @VechID,	
	[RegistrationNo]= @RegistrationNo,
	[DriverName]=@DriverName ,
	[PartyName]= @PartyName,
	[PickupPlace]= @PickupPlace,
	[DropPlace]=@DropPlace,
	[StartMeter]= @StartMeter,
	[PickupTime]=@PickupTime,
	[ExecutiveName]=@ExecutiveName,
	[BookingNo]=@BookingNo,
	[EntryTime]=@EntryTime,
	[CloseStatus]=@CloseStatus
	end
	
select [RegistrationNo],[DriverName],[PickupPlace],[DropPlace] from StartReport where BookingNo =@BookingNo
END
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdMOTPverification]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVInsUpdMOTPverification]
@PhoneNo varchar(50),@Mobileotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from StartBooking where PhoneNo = @PhoneNo

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from StartBooking where PhoneNo = @PhoneNo and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update StartBooking set Mobileotp = null where PhoneNo = @PhoneNo and [Mobileotp] = @Mobileotp
     select [PhoneNo],[BNo],[EntryDate] from StartBooking where PhoneNo = @PhoneNo
  end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdlandmark]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVInsUpdlandmark]
@flag varchar,@Zno int=-1,@Landmark nvarchar(255)
as
begin
declare @cnt int
if @flag='I'
begin
	
  select COUNT(*) from Landmark where Landmark = @Landmark
	
	if @cnt > 0
		begin
				RAISERROR ('Already landmark Is Saved',16,1);
				return;	
		end
Insert into dbo.Landmark
([Zno],[Landmark])
values
(@Zno,@Landmark)
end
if @flag='U'
begin
 select COUNT(*) from Landmark where Landmark = @Landmark
	
	if @cnt = 0
		begin
				RAISERROR ('There Is No landmark to update',16,1);
				return;	
		end
update dbo.Landmark
set 
[Landmark] =@Landmark
end
end
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpddrivers]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVInsUpddrivers]
@flag varchar,@DId int=-1,@CompanyId int=null,@NAme nvarchar(50)=null,@Address nvarchar(50)=null,@City nvarchar(50)=null,@Pin nvarchar(50)=null,
@PAddress nvarchar(50)=null,
@PCity nvarchar(50)=null,@PPin nvarchar(50)=null,@OffMobileNo float=null,@PMobNo nvarchar(50)=null,@DOB date=null,@DOJ date=null,@BloodGroup nvarchar(50)=null,
@LicenceNo nvarchar(50)=null,@LiCExpDate date=null,@BadgeNo nvarchar(50)=null,@BadgeExpDate date=null,@Remarks nvarchar(50)=null
as
begin
declare @cnt int

if @flag='I'
begin
insert into PSDriverMaster
	([CompanyId],[NAme] ,[Address] ,[City],[Pin] ,
	[PAddress] ,[PCity] ,[PPin],[OffMobileNo],
	[PMobNo],[DOB],[DOJ],[BloodGroup],[LicenceNo],[LiCExpDate],
	[BadgeNo],[BadgeExpDate],[Remarks])	
	values
	(@CompanyId, @NAme,@Address ,@City ,@Pin,
	@PAddress ,@PCity ,@PPin ,@OffMobileNo,
	@PMobNo,@DOB,@DOJ,@BloodGroup,@LicenceNo,
	@LiCExpDate,@BadgeNo,@BadgeExpDate,@Remarks)
	end

if @flag='U'
		begin
		
		Update  PSDriverMaster
	set [CompanyId]=@CompanyId,
	[NAme]= @NAme ,	
	[Address]= @Address,	
	[City]= @City,
	[Pin]=@Pin ,
	[PAddress]= @PAddress,
	[PCity]= @PCity,
	[PPin]=@PPin,
	[OffMobileNo]= @OffMobileNo,
	[PMobNo]= @PMobNo,
	[DOB]= @DOB,
	[DOJ]= @DOJ,
	[BloodGroup]= @BloodGroup,
	[LicenceNo]= @LicenceNo,
	[LiCExpDate]= @LiCExpDate,
	[BadgeNo]= @BadgeNo,
	[BadgeExpDate]= @BadgeExpDate,
	[Remarks]= @Remarks
	
	where DId = @DId
	end 
	
	
	select [CompanyId],[NAme] ,[Address] ,[City],[PAddress] ,[PCity]  from PSDriverMaster where  CompanyId = @CompanyId

END
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdDelTariff]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVInsUpdDelTariff]
@SrNo int,@Duration	int,@KiloMtr int,@IndicaRate int
,@IndigoRate int
,@InnovaRate int,@Tag nvarchar(255)

as
begin

insert into Hourly_Tariff
	(SrNo,Duration,KiloMtr,IndicaRate,IndigoRate,InnovaRate,Tag)	
	values
	(@SrNo,@Duration,@KiloMtr,@IndicaRate,@IndigoRate,@InnovaRate,@Tag)


		Update  Hourly_Tariff
	set [SrNo] =@SrNo,
	[Duration] =@Duration,
	[KiloMtr] =@KiloMtr,
	[IndicaRate] =@IndicaRate,
	[IndigoRate] =@IndigoRate,
	[InnovaRate] =@InnovaRate,
	[Tag] =@Tag

END
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdDelreport]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVInsUpdDelreport]
@flag varchar,@SlNo int,@EntryDate date,@VechID int,@RegistrationNo nvarchar(255),@DriverName nvarchar(255)
,@PartyName nvarchar(255) ,@PickupPlace nvarchar(255) ,@DropPlace  nvarchar(255),@StartMeter int
,@PickupTime datetime,@ExecutiveName nvarchar(255),@BookingNo decimal(18,1),@EntryTime datetime
 ,@CloseStatus nvarchar(255)
 as
 begin
 if @flag='I'
 begin
 insert into StartReport

 ([EntryDate],[VechID],[RegistrationNo],[DriverName],[PartyName],[PickupPlace],[DropPlace],[StartMeter],[PickupTime],[ExecutiveName],[BookingNo],[EntryTime],[CloseStatus])

 values  
 
 (@EntryDate,@VechID,@RegistrationNo,@DriverName,@PartyName,@PickupPlace,@DropPlace,@StartMeter,@PickupTime,@ExecutiveName,@BookingNo,@EntryTime,@CloseStatus)
      end
      
 if @flag='U'
 begin     
      Update StartReport
      
      set      
      [EntryDate]=@EntryDate
      ,[VechID]=@VechID
      ,[RegistrationNo]=@RegistrationNo
      ,[DriverName]=@DriverName
      ,[PartyName]=@PartyName
      ,[PickupPlace]=@PickupPlace
      ,[DropPlace]=@DropPlace
      ,[StartMeter]=@StartMeter
      ,[PickupTime]=@PickupTime
      ,[ExecutiveName]=@ExecutiveName
      ,[BookingNo]=@BookingNo
      ,[EntryTime]=@EntryTime
      ,[CloseStatus]=@CloseStatus
      
     
      end
      end
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdDelClosingReport]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVInsUpdDelClosingReport]
@flag varchar,
@SlNo int,
	@EntryDate datetime ,
	@VechID int,
	@RegistrationNo nvarchar (255),
	@DriverName nvarchar (255),
	@PartyName nvarchar (255),
	@PickupPlace nvarchar (255),
	@DropPlace nvarchar (255),
	@StartMeter int ,
	@EndMeter int ,
	@OtherExp int ,
	@GeneratedAmount int ,
	@ActualAmount int ,
	@ExecutiveName nvarchar(255) ,
	@BNo decimal(18, 1),
	@DropTime time(7) ,
	@PickupTime time(7) ,
	@EntryTime time(7) 
as
begin
if @flag ='I'
begin
	Insert into [dbo].ClosingReport
	([SlNo],[EntryDate],[VechID],[RegistrationNo],[DriverName],[PartyName],[PickupPlace],[DropPlace],[StartMeter],[EndMeter],[OtherExp],[GeneratedAmount],[ActualAmount],[ExecutiveName],[BNo],[DropTime],[PickupTime],[EntryTime])
values
	(@SlNo,@EntryDate,@VechID,@RegistrationNo,@DriverName,@PartyName,@PickupPlace,@DropPlace,@StartMeter,@EndMeter,@OtherExp,@GeneratedAmount,@ActualAmount,@ExecutiveName,@BNo,@DropTime,@PickupTime,@EntryTime)
end
	If @flag='U'
begin
	update [dbo].ClosingReport
	set
	[EntryDate]=@EntryDate,
	[VechID]=@VechID,
	[RegistrationNo]=@RegistrationNo, 
	[DriverName]=@DriverName, 
	[PartyName]=@PartyName,
	[PickupPlace]=@PickupPlace, 
	[DropPlace]=@DropPlace, 
	[StartMeter]=@StartMeter, 
	[EndMeter]=@EndMeter,
	[OtherExp]=@OtherExp, 
	[GeneratedAmount]=@GeneratedAmount, 
	[ActualAmount]=@ActualAmount,
	[ExecutiveName]=@ExecutiveName, 
	[BNo]=@BNo, 
	[DropTime]=@DropTime, 
	[PickupTime]=@PickupTime, 
	[EntryTime]=@EntryTime 
   
   
   end
	if @flag='D'
begin
	delete from ClosingReport where SlNo=@SlNo

end
end
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdcancelbooking]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVInsUpdcancelbooking]
@BNo int,@BookingStatus nvarchar(255),@CancelReason nvarchar(255),
@CancelBy nvarchar(255)
as
begin
declare @cnt int 

select @cnt = COUNT(*) from StartBooking where BNo = @BNo
if @cnt = 0
		begin
				RAISERROR ('Already Booking has been Cancelled',16,1);
				return;	
		end
if @cnt > 0 
update StartBooking
set [BookingStatus]=@BookingStatus,
[CancelReason]=@CancelReason,
[CancelBy] = @CancelBy
where BNo = @BNo

select [BNo],[BookingStatus],[CancelBy]  from StartBooking where BNo = @BNo
end
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdbooking]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[HVInsUpdbooking]
@flag varchar,@Id int=-1,@CompanyId int=null,@EntryDate datetime=null,@BNo int=null,
@BookingType nvarchar(255)=null,@ReqDate datetime=null,
@ReqTime time(7)=null,@CallTime time(7)=null,
@ReqVehicle nvarchar(255)=null,@Customername nvarchar(255)=null,
@CusID nvarchar=null,
@PhoneNo nvarchar(50) = null,@AltPhoneNo nvarchar(255)=null,
@CAddress nvarchar(max)=null,@PickupAddress nvarchar(max),
@LandMark nvarchar(255)=null,@Package nvarchar(255)=null,
@PickupPalce nvarchar(255)=null,@DropPalce nvarchar(255)=null,
@ReqType nvarchar(255)=null,@ExtraCharge int=null,
@NoofVehicle int=null,
@ExecutiveName nvarchar(255)=null,@VID int=null,
@BookingStatus nvarchar(255)=null,@CustomerSMS nvarchar(255)=null,
@CancelReason nvarchar(255)=null,@CBNo decimal(18,1)=null,
@ModifiedBy nvarchar(255)=null,@CancelBy nvarchar(255)=null,
@ReconfirmedBy nvarchar(255)=null,
@AssignedBy nvarchar(255)=null,@ActionDate datetime=null,
@ActionTime time(7)=null,@latitude float=null,
@longitude float=null,@Mobileotp varchar(5)=null


AS
BEGIN

declare @cnt int, @m varchar(5) , @bno1 varchar(5)
 declare @dt datetime
set @dt = GETDATE()


select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))

select @bno1 = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))

if @flag = 'I'
	begin
		 
	insert into dbo.PSStartBooking
	(CompanyId,
	[EntryDate]
      ,[BNo]
      ,[BookingType]
      ,[ReqDate]
      ,[ReqTime]
      ,[CallTime]
      ,[ReqVehicle]
      ,[Customername]
      ,[CusID]
      ,[PhoneNo]
      ,[AltPhoneNo]
      ,[CAddress]
      ,[PickupAddress]
      ,[LandMark]
      ,[Package]
      ,[PickupPalce]
      ,[DropPalce]
      ,[ReqType]
      ,[ExtraCharge]
      ,[NoofVehicle]
      ,[ExecutiveName]
      ,[VID]
      ,[BookingStatus]
      ,[CustomerSMS]
      ,[CancelReason]
      ,[CBNo]
      ,[ModifiedBy]
      ,[CancelBy]
      ,[ReconfirmedBy]
      ,[AssignedBy]
      ,[ActionDate]
      ,[ActionTime],[latitude],[longitude],[Mobileotp])
      	values
	(@CompanyId,@dt,@bno1,@BookingType,@dt,@dt,@dt,@ReqVehicle,@Customername,@CusID,@PhoneNo,@AltPhoneNo,@CAddress,@PickupAddress,@LandMark,@Package,@PickupPalce,@DropPalce,@ReqType,@ExtraCharge,@NoofVehicle,@ExecutiveName,@VID,@BookingStatus,@CustomerSMS,@CancelReason,@CBNo,@ModifiedBy,@CancelBy,@ReconfirmedBy,@AssignedBy,@dt,@dt,@latitude ,@longitude ,@m)
	
	
	end
	
	
	
	if @flag ='U'
	begin
	select @cnt = COUNT(*) from PSStartBooking where PhoneNo = @PhoneNo
	

	if @cnt = 0
		begin
				RAISERROR ('No user registered with given mobile number',16,1);
				return;
		end
	else
    begin
	
	
	Update  dbo.PSStartBooking
	set [CompanyId]=@CompanyId,
	[EntryDate] = @dt
      ,[BNo]=@BNo
      ,[BookingType]=@BookingType
      ,[ReqDate]=@dt
      ,[ReqTime]=@dt
      ,[CallTime]=@dt
      ,[ReqVehicle]=@ReqVehicle
      ,[Customername]=@Customername
      ,[CusID]=@CusID
      ,[PhoneNo]=@PhoneNo
      ,[AltPhoneNo]=@AltPhoneNo
      ,[CAddress]=@CAddress
      ,[PickupAddress]=@PickupAddress
      ,[LandMark]=@LandMark
      ,[Package]=@Package
      ,[PickupPalce]=@PickupPalce
      ,[DropPalce]=@DropPalce
      ,[ReqType]=@ReqType
      ,[ExtraCharge]=@ExtraCharge
      ,[NoofVehicle]=@NoofVehicle
      ,[ExecutiveName]=@ExecutiveName
      ,[VID]=@VID
      ,[BookingStatus]=@BookingStatus
      ,[CustomerSMS]=@CustomerSMS
      ,[CancelReason]=@CancelReason
      ,[CBNo]=@CBNo
      ,[ModifiedBy]=@ModifiedBy
      ,[CancelBy]=@CancelBy
      ,[ReconfirmedBy]=@ReconfirmedBy
      ,[AssignedBy]=@AssignedBy
      ,[ActionDate]=@dt
      ,[ActionTime]=@dt
      ,[latitude]=@latitude
      ,[longitude]=@longitude
      ,[Mobileotp]=@Mobileotp
      
	from PSStartBooking
	
	where PhoneNo = @PhoneNo 
	
	 end
	
	end
	
	
	select [CompanyId],[BNo] ,[Bookingtype],[ReqVehicle],[Customername],[PhoneNo],[latitude],[longitude]   from PSStartBooking where PhoneNo = @PhoneNo
	

END
GO
/****** Object:  StoredProcedure [dbo].[HVgetvehilcetypes]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVgetvehilcetypes]
@VID int 
as
begin
select * from VechileMaster where VID = @VID
end
GO
/****** Object:  StoredProcedure [dbo].[HVGetTariff]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVGetTariff]
as
begin
select * from Hourly_Tariff
end
GO
/****** Object:  StoredProcedure [dbo].[HVGetreport]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVGetreport]

as
begin
select * from StartReport
end
GO
/****** Object:  StoredProcedure [dbo].[HVgetprice]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVgetprice]
@VechID int
as
begin
select  PickupPlace,DropPlace,GeneratedAmount,ActualAmount,EntryDate,EntryTime,DropTime,PickupTime from ClosingReport where  VechID = @VechID
select distance from distance_cal
select Type from VechileMaster

end
GO
/****** Object:  StoredProcedure [dbo].[HVGetprebookingdetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVGetprebookingdetails]
@PartyName varchar(255)
as
begin
select  PickupPlace,DropPlace,EntryDate,EntryTime from ClosingReport where PartyName = @PartyName
select status from Customer_SMS_booking
select vechType from AvilableVehicle

end
GO
/****** Object:  StoredProcedure [dbo].[HVgetnearestvehicles]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVgetnearestvehicles]
@Mobilenumber nvarchar(50),@lat float, @lng float
as
begin
   SELECT   
   Lng = (Latitude-@lat),Lng1 = (Longitude-@lng)
    FROM PSTrackVehicle  WHERE Mobilenumber = @Mobilenumber 
    select Type from PSVechileMaster      
  
end
GO
/****** Object:  StoredProcedure [dbo].[HVGetHistory]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVGetHistory]
@PhoneNo nvarchar(50)
as
begin
select [EntryDate]
,[BNo],[BookingType],[ReqDate],[ReqTime],[CallTime],[ReqVehicle],
[Customername],[CusID],[PhoneNo],[CAddress],[PickupAddress],[LandMark]
,[Package],[PickupPalce],[DropPalce],[ReqType],[ExtraCharge],[NoofVehicle],[ExecutiveName],
[VID],[BookingStatus],[CustomerSMS],[CancelReason],[CBNo],
[ModifiedBy],[CancelBy],[ReconfirmedBy],[AssignedBy],[ActionDate],[ActionTime]
,[latitude],[longitude]
from StartBooking where PhoneNo = @PhoneNo
end
GO
/****** Object:  StoredProcedure [dbo].[HVgetdrivermaster]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVgetdrivermaster]
@DId int
as
begin
select * from PSDriverMaster --where DId = @DId
end
GO
/****** Object:  StoredProcedure [dbo].[HVgetdriver]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVgetdriver]
@DId int
as
begin
select * from DriverMaster where DId = @DId
end
GO
/****** Object:  StoredProcedure [dbo].[HVgetClosingReport]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[HVgetClosingReport]
as
begin
select *from ClosingReport
end
GO
/****** Object:  StoredProcedure [dbo].[HVGetBookingHistory]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVGetBookingHistory]
@PhoneNo nvarchar(50)=null,@EmailId varchar(20)=null
as
begin
select [EntryDate]
,[BNo],[BookingType],[ReqDate],[ReqTime],[CallTime],[ReqVehicle],
[Customername],[CusID],[PhoneNo],[CAddress],[PickupAddress],[LandMark]
,[Package],[PickupPalce],[DropPalce],[ReqType],[ExtraCharge],[NoofVehicle],[ExecutiveName],
[VID],[BookingStatus],[CustomerSMS],[CancelReason],[CBNo],
[ModifiedBy],[CancelBy],[ReconfirmedBy],[AssignedBy],[ActionDate],[ActionTime]
,[latitude],[longitude],[EmailId]
from PSStartBooking where PhoneNo = @PhoneNo 
end
GO
/****** Object:  StoredProcedure [dbo].[HVGetallocatedriver]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[HVGetallocatedriver]
@VID int
as
begin
select [VechID],va.RegistrationNo,PhoneNo,AltPhoneNo,EffectiveDate,EffectiveTill,DriverName,VehicleType
from PSVehicleAssign va
 inner join Types vm on vm.Id = va.VehicleType
 where TypeGroupId = 4
end
GO
/****** Object:  StoredProcedure [dbo].[getpalce]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getpalce]
as
begin
select* from place
end
GO
/****** Object:  StoredProcedure [dbo].[getObjects]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getObjects](@objid int = -1)
as
begin
declare @oid int
set @oid = @objid

select  o.Id, o.Name, o.Description, Path,active,o.ParentId,o.RootObjectId 
from Objects o
where o.Id = @objid or @objid = -1

select t.name,t.ID from Types t
inner join ObjectAccesses oa on oa.AccessId = t.Id
inner join Objects o on o.Id = oa.ObjectId
where  o.Id = @objid or @objid = -1
end
GO
/****** Object:  StoredProcedure [dbo].[GetObjectHierarchy]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetObjectHierarchy] 	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    with cte as
(SELECT O.[ID]
      ,Name
      ,null ParentId                
      ,  CAST(O.ID AS VARCHAR(100)) AS RowID
  FROM [dbo].Objects o
  where ParentID is null  
  union all  
SELECT co.[Id]
	  ,co.[Name]
      ,co.ParentID       
      ,CAST(RowID + '.' + CAST(10000+co.[Id] AS VARCHAR(100)) AS VARCHAR(100))    
  FROM [dbo].Objects co
  JOIN cte  ON co.parentid = cte.ID
  )
  select * from cte order by Rowid
  
END
GO
/****** Object:  StoredProcedure [dbo].[GetObjectAccesses]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetObjectAccesses] 	
AS
BEGIN
	select t.name,t.ID accessid, o.Name as objname from Types t
inner join ObjectAccesses oa on oa.AccessId = t.Id
inner join Objects o on o.Id = oa.ObjectId
END
GO
/****** Object:  StoredProcedure [dbo].[GetNotifications]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetNotifications]

as begin 
select t1.Id,
t1.Date,
t1.Message,
t1.MessageTypeId,
t1.StatusId,
t1.UserId,
t1.Name,
t2.FirstName+' '+t2.LastName as Name
 from Notifications t1
 inner join Users t2 on t2.Id=t1.UserId
end
GO
/****** Object:  StoredProcedure [dbo].[getNotficationConfiguration]    Script Date: 08/04/2017 19:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[getNotficationConfiguration]
(@roleId int = -1)
as
begin

select a.Id atypeid,r.Name,r.Id as roleid,NotificationId
,t.Name AlertType
,case when a.NotificationId IS null then 0 else 1 end as assigned
 from Types t
left outer join [NotificationConfiguration] a on a.NotificationId = t.Id 
left outer join Roles r on a.RoleId = r.id
where ((r.Id = @roleId or @roleId = -1)
and t.TypeGroupId = 9)


END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSAuditDetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelBTPOSAuditDetails](@BTPOSId NUMERIC(15),
              
           @EditHistoryId numeric(10))
AS
BEGIN
	

INSERT INTO 
[BTPOSAuditDetails] VALUES
           (@BTPOSId,
              
           @EditHistoryId)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBookingDetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsUpdDelBookingDetails] 
@Id int = -1
,@TicketNo varchar(20)
,@TransId  int = null 
,@EmailId varchar(50) = null
,@MobileNo varchar(15) = null
,@AltMobileNo varchar(15) = null
,@TravelDate date
,@TravelTime time(7)
,@Src varchar(50) = null
,@Dest varchar(50) = null
,@SrcId int = null
,@DestId int = null
,@RouteId int = null
,@VehicleId int = null
,@NoOfSeats int = null
,@Seats varchar(250) = null
,@Status varchar(50)= null
,@StatusId int = null
,@BookedBy varchar(150) = null
,@BookedById int = null
,@Amount decimal(18,0) = null
,@BookingType varchar(10) = null
,@BookingTypeId int = null
,@JourneyType varchar(10) = null
,@JourneyTypeId int = null
,@UserId int = null
,@Address varchar(500) = null
,@insupddelflag varchar	
AS
BEGIN
declare @bookingid int , @dt date
select @dt = GETDATE()

	if @insupddelflag = 'I'
	begin
		INSERT INTO [POSDashboard].[dbo].[BookingDetails]
           ([TicketNo]
           ,[TransId]
           ,[EmailId]
           ,[MobileNo]
           ,[AltMobileNo]
           ,[TravelDate]
           ,[TravelTime]
           ,[Src]
           ,[Dest]
           ,[SrcId]
           ,[DestId]
           ,[RouteId]
           ,[VehicleId]
           ,[NoOfSeats]
           ,[Seats]
           ,[Status]
           ,[StatusId]
           ,[BookedBy]
           ,[BookedById]
           ,[Amount]
           ,[BookingType]
           ,[BookingTypeId]
           ,[JourneyType]
           ,[JourneyTypeId]
           ,[UserId]
           ,[Address]
           ,[BookedOn])
     VALUES
           (@TicketNo
			,@TransId 
			,@EmailId 
			,@MobileNo 
			,@AltMobileNo 
			,@TravelDate 
			,@TravelTime 
			,@Src 
			,@Dest 
			,@SrcId 
			,@DestId 
			,@RouteId 
			,@VehicleId 
			,@NoOfSeats 
			,@Seats 
			,@Status 
			,@StatusId 
			,@BookedBy 
			,@BookedById 
			,@Amount 
			,@BookingType 
			,@BookingTypeId 
			,@JourneyType 
			,@JourneyTypeId 
			,@UserId 
			,@Address,@dt )
			
			select SCOPE_IDENTITY()
    end
    else
    if @insupddelflag = 'U'
    begin
       UPDATE [POSDashboard].[dbo].[BookingDetails]
		   SET [TicketNo] = @TicketNo
			  ,[TransId] = @TransId
			  ,[EmailId] = @EmailId
			  ,[MobileNo] = @MobileNo
			  ,[AltMobileNo] = @AltMobileNo
			  ,[TravelDate] = @TravelDate
			  ,[TravelTime] = @TravelTime
			  ,[Src] = @Src
			  ,[Dest] = @Dest
			  ,[SrcId] = @SrcId
			  ,[DestId] = @DestId
			  ,[RouteId] = @RouteId
			  ,[VehicleId] = @VehicleId
			  ,[NoOfSeats] = @NoOfSeats
			  ,[Seats] = @Seats
			  ,[Status] = @Status
			  ,[StatusId] = @StatusId
			  ,[BookedBy] = @BookedBy
			  ,[BookedById] = @BookedById
			  ,[Amount] = @Amount
			  ,[BookingType] = @BookingType
			  ,[BookingTypeId] = @BookingTypeId
			  ,[JourneyType] = @JourneyType
			  ,[JourneyTypeId] = @JourneyTypeId
			  ,[UserId] = @UserId
			  ,[Address] = @Address
		 WHERE Id = @Id
		 
		 select @Id
    end




END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBookedSeats]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsUpdDelBookedSeats] 
(@Id int = -1,
@BookingId int
,@TicketNo varchar(20)
,@SeatNo varchar(5)
,@SeatId int
,@VehicleId int
,@Row int
,@Col int
,@JourneyDate date
,@JourneyTime time(7)
,@Status varchar(10)
,@StatusId int
,@FName varchar(50)
,@LName varchar(50)
,@Age int
,@Gender int
,@PassengerType varchar(15)
,@IdProof varchar(50)
,@PrimaryPassenger int
,@insupddelflag varchar)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	if @insupddelflag = 'I'
	begin
	INSERT INTO [POSDashboard].[dbo].[BookedSeats]
           ([BookingId]
           ,[TicketNo]
           ,[SeatNo]
           ,[SeatId]
           ,[VehicleId]
           ,[Row]
           ,[Col]
           ,[JourneyDate]
           ,[JourneyTime]
           ,[Status]
           ,[StatusId]
           ,[FName]
           ,[LName]
           ,[Age]
           ,[Gender]
           ,[PassengerType]
           ,[IdProof]
           ,[PrimaryPassenger])
     VALUES
           (@BookingId
           ,@TicketNo 
			,@SeatNo
			,@SeatId
			,@VehicleId 
			,@Row 
			,@Col 
			,@JourneyDate 
			,@JourneyTime 
			,@Status 
			,@StatusId 
			,@FName 
			,@LName 
			,@Age 
			,@Gender 
			,@PassengerType 
			,@IdProof 
			,@PrimaryPassenger 			 
			)
 end

if @insupddelflag = 'U'
	begin
UPDATE [POSDashboard].[dbo].[BookedSeats]
   SET [BookingId] = @BookingId
      ,[TicketNo] = @TicketNo
      ,[SeatNo] = @SeatNo
      ,[SeatId] = @SeatId
      ,[VehicleId] = @VehicleId
      ,[Row] = @Row
      ,[Col] = @Col
      ,[JourneyDate] = @JourneyDate
      ,[JourneyTime] = @JourneyTime
      ,[Status] = @Status
      ,[StatusId] = @StatusId
      ,[FName] = @FName
      ,[LName] = @LName
      ,[Age] = @Age
      ,[Gender] = @Gender
      ,[PassengerType] = @PassengerType
      ,[IdProof] = @IdProof
      ,[PrimaryPassenger] = @PrimaryPassenger
 WHERE  Id = @Id
end
if @insupddelflag = 'D'
	begin
DELETE FROM [POSDashboard].[dbo].[BookedSeats]
      WHERE Id = @Id
end



END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBlocklist]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelBlocklist](@Id numeric(20)
,
           @ItemId NUMERIC(20),
           @ItemTypeId numeric(30),
           @Formdate varchar(50),
           @Todate varchar(50),
           @Active numeric(30),
           @Desc varchar(50),
           @Reason varchar(50),
           @Blockedby varchar(50),
           @UnBlockedby varchar(50),
           @Blockedon varchar(50),
           @UnBlockedon varchar(50))
AS
BEGIN
	

INSERT INTO 
[Blocklist] VALUES
           (@Id, 
          @ItemId,
           @ItemTypeId,
           @Formdate,
           @Todate,
           @Active,
           @Desc,
           @Reason,
           @Blockedby,
           @UnBlockedby,
           @Blockedon ,
           @UnBlockedon )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCarouselImages]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsUpdDelCarouselImages]
(   @Id int,
	@ImageName [varchar](50),
	@Img [varchar](max),
	@ImageCaption [varchar](250) = NULL,
	@ImageDesc [varchar](250) = NULL,
	@userId int = null,	
	@ImgPath [varchar](250) = NULL,
	@flag varchar
)
as
begin
declare @dt datetime
select @dt = GETDATE()

if @flag = 'I' 
begin
INSERT INTO [POSDashboard].[dbo].[Carousel]
           ([ImageName]
           ,[Image]
           ,[ImageCaption]
           ,[ImageDesc]
           ,[CreatedOn]
           ,[CreatedBy]
           ,[ModifiedOn]
           ,[ModifiedBy]
           ,[ImgPath])
     VALUES
           (
           @ImageName
           ,@Img
           ,@ImageCaption
           ,@ImageDesc
           ,@dt
           ,@userId
           ,@dt
           ,@userId
           ,@ImgPath)

end
else
if @flag = 'U' 
begin
UPDATE [POSDashboard].[dbo].[Carousel]
   SET [ImageName] = @ImageName
      ,[Image] = @Img
      ,[ImageCaption] = @ImageCaption
      ,[ImageDesc] = @ImageDesc
      ,[CreatedOn] = @dt
      ,[CreatedBy] = @userId
      ,[ModifiedOn] = @dt
      ,[ModifiedBy] = @userId
      ,[ImgPath] = @ImgPath
 WHERE Id = @Id
end
if @flag = 'D' 
begin
DELETE FROM [POSDashboard].[dbo].[Carousel]
      WHERE Id = @Id
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSTrans]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procedure [dbo].[InsUpdDelBTPOSTrans](@Id int = -1
           ,@BTPOSId varchar(50)
           ,@Date datetime = null
           ,@TotalAmount decimal(18,0) = 0
           ,@AmountPaid decimal(18,0) = 0
           ,@ChangeRendered decimal(18,0) = 0
           ,@ChangeGiven decimal(18,0) = 0
           ,@TransId int = 0
           ,@GatewayTransId varchar(50) = 0
           ,@TransCode varchar(50) = null
           ,@PaymentCategoryId int = 0
           ,@PaymentTypeId int = 0
           ,@PaymentModeId int = 0
           ,@TransStatusId int = 0
           ,@TransDetails varchar(500) = null
           ,@noofSeats int = 0
           ,@unitPrice decimal(18,0) = 0
           ,@luggageTypeId int = 0
           ,@luggageAmt decimal(18,0) = 0
           ,@taxes decimal(18,0) = 0
           ,@disc decimal(18,0) = 0
           ,@TicketNo varchar(50) = null
           ,@SrcId int = 0
           ,@DestId int = 0
           ,@RouteId int = 0
           ,@OperatorId int = 0
           ,@TransApproved int = 0
           ,@Reason varchar(250) = null
           ,@ApprovedById int = 0
           ,@FleetOwnerId int = 0
           ,@insupdflag varchar
           ,@posTransId int output)
as
begin

set @posTransId  = -1

declare @posId int = 0, @fid int
select @posId = id,@fid = FleetOwnerId from btposdetails where upper(ltrim(rtrim(POSID))) = @BTPOSId

if @posId = 0
begin
 RAISERROR ('Invalid BT POS Id',16,1);
end

if @insupdflag = 'I'
begin



INSERT INTO [POSDashboard].[dbo].[BTPOSTransactions]
           ([POSId]
           ,[BTPOSId]
           ,[Date]
           ,[TotalAmount]
           ,[AmountPaid]
           ,[ChangeRendered]
           ,[ChangeGiven]
           ,[TransId]
           ,[GatewayTransId]
           ,[TransCode]
           ,[PaymentCategoryId]
           ,[PaymentTypeId]
           ,[PaymentModeId]
           ,[TransStatusId]
           ,[TransDetails]
           ,[noofSeats]
           ,[unitPrice]
           ,[luggageTypeId]
           ,[luggageAmt]
           ,[taxes]
           ,[disc]
           ,[TicketNo]
           ,[SrcId]
           ,[DestId]
           ,[RouteId]
           ,[OperatorId]
           ,[TransApproved]
           ,[Reason]
           ,[ApprovedById]
           ,[FleetOwnerId])
     VALUES
           (@posId
           ,@BTPOSId
           ,@Date
           ,@AmountPaid--@TotalAmount
           ,@AmountPaid
           ,@ChangeRendered
           ,@ChangeGiven
           , @TransId
           ,@GatewayTransId
           ,(select 'POSTR'+replace(CONVERT(VARCHAR(20), GETDATE(), 114),':','')) 
           ,@PaymentCategoryId
           ,@PaymentTypeId
           ,@PaymentModeId
           ,@TransStatusId
           ,@TransDetails
           ,@noofSeats
           ,@unitPrice
           ,@luggageTypeId
           ,@luggageAmt
           ,@taxes
           ,@disc
           ,@TicketNo
           ,@SrcId
           ,@DestId
           ,@RouteId
           ,@OperatorId
           ,@TransApproved
           ,@Reason
           ,@ApprovedById
           ,@fid)   
           
           SELECT @posTransId = SCOPE_IDENTITY()
           
          
end
else
if @insupdflag = 'U'
begin

UPDATE [POSDashboard].[dbo].[BTPOSTransactions]
   SET [Date] = @Date
      ,[TotalAmount] = @AmountPaid
      ,[AmountPaid] = @AmountPaid
      ,[ChangeRendered] = @ChangeRendered
      ,[ChangeGiven] = @ChangeGiven
      ,[TransId] = @TransId
      ,[GatewayTransId] = @GatewayTransId
      --,[TransCode] = @TransCode
      ,[PaymentCategoryId] = @PaymentCategoryId
      ,[PaymentTypeId] = @PaymentTypeId
      ,[PaymentModeId] = @PaymentModeId
      ,[TransStatusId] = @TransStatusId
      ,[TransDetails] = @TransDetails
      ,[noofSeats] = @noofSeats
      ,[unitPrice] = @unitPrice
      ,[luggageTypeId] = @luggageTypeId
      ,[luggageAmt] = @luggageAmt
      ,[taxes] = @taxes
      ,[disc] = @disc
      ,[TicketNo] = @TicketNo
      ,[SrcId] = @SrcId
      ,[DestId] = @DestId
      ,[RouteId] = @RouteId
      ,[OperatorId] = @OperatorId
      ,[TransApproved] = @TransApproved
      ,[Reason] = @Reason
      ,[ApprovedById] = @ApprovedById
      ,[FleetOwnerId] = @fid
 WHERE  Id = @Id 
 
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSSheduleUploads]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelBTPOSSheduleUploads](@Id NUMERIC(10),
              
           @POSID numeric(10),
           @UploadOn varchar(50),
           @UploadedOn varchar(50),
           @Status varchar(50),
           @UploadData varchar(50),
           @Ipconfig varchar(50))
AS
BEGIN
	

INSERT INTO 
[BTPOSSheduleUploads] VALUES
           (@Id,
              
           @POSID,
           @UploadOn,
           @UploadedOn,
           @Status,
           @UploadData,
           @Ipconfig )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSSecheduledUpdates]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelBTPOSSecheduledUpdates](@Id NUMERIC(10),
              
           @POSID numeric(10),
           @UploadOn varchar(50),
           @UploadedOn varchar(50),
           @Status varchar(50),
           @UploadData varchar(50),
           @Ipconfig varchar(50))
AS
BEGIN
	

INSERT INTO 
[BTPOSSecheduledUpdates] VALUES
           (@Id,
              
           @POSID,
           @UploadOn,
           @UploadedOn,
           @Status,
           @UploadData,
           @Ipconfig )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSRegistration]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelBTPOSRegistration](@Id NUMERIC(10),
              
           @POSID numeric(10),
           @Status VARCHAR(50),
           @FleetOwenerId numeric(10),
           @RegisteredOn Varchar(50),
           @IpConfig varchar(50),
           @RegStatus varchar(50),
           @LincenseNo varchar(50),
           @ActivedOn varchar(50),
           @ExpiryDate varchar(50))
AS
BEGIN
	

INSERT INTO 
[BTPOSRegistration] VALUES
           (@Id,
              
           @POSID,
           @Status,
           @FleetOwenerId,
           @RegisteredOn,
           @IpConfig,
           @RegStatus,
           @LincenseNo,
           @ActivedOn,
           @ExpiryDate )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSRecords]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsUpdDelBTPOSRecords]
@Id int = -1,
@POSID int,
@RecordData binary,
@FileName varchar,
@Description varchar,
@CreatedDate datetime = null,
@Downloaded datetime = null,
@LastDownloadtime datetime = null,
@IsDirty int,
@insupddelflag varchar
as
begin

declare @cnt  int
set @cnt = -1

if @insupddelflag = 'I'
begin

select @cnt = count(1) from [POSDashboard].[dbo].[BTPOSRecords] 
where POSID = @POSID

end
if @cnt = 0 
begin
INSERT INTO [POSDashboard].[dbo].[BTPOSRecords]
           (
POSID,
RecordData ,
[FileName] ,
Description ,
CreatedDate ,
Downloaded ,
LastDownloadtime ,
IsDirty )

     VALUES
           (@POSID
           ,@RecordData
           ,@FileName
           ,@Description
           ,@CreatedDate
           ,@Downloaded
           ,@LastDownloadtime
           ,@IsDirty)
end
else
  if @insupddelflag = 'U'
begin
UPDATE [POSDashboard].[dbo].[BTPOSRecords]
   SET [POSID] = @POSID
      ,[RecordData] = @RecordData
      ,[FileName] = @FileName
      ,[Description] = @Description
      ,[CreatedDate] = @CreatedDate
      ,[Downloaded] = @Downloaded 
      ,[LastDownloadtime] = @LastDownloadtime
      ,[IsDirty] = @IsDirty
 WHERE Id = @Id
end
else
 if @insupddelflag = 'D'
 begin
  delete from [POSDashboard].[dbo].[BTPOSRecords]
where POSID = @POSID
End

End




/****** Object:  Table [dbo].[AlertsConfiguration]    Script Date: 06/20/2016 11:53:06 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSPortSettings]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelBTPOSPortSettings](@Id NUMERIC(10),
              
           @BTPOSId numeric(10),
           @Ipconfig varchar(50))
AS
BEGIN
	

INSERT INTO 
[BTPOSPortSettings] VALUES
           (@Id,
              
           @BTPOSId,
           @Ipconfig)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSMoitoringPage]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsUpdDelBTPOSMoitoringPage]
(@BTPOSId int,
@Xcoordinate float,
@Ycoordinate float,
@LocationName varchar(500),
@SNo int,
@DateTime datetime)
as
begin
insert into  BTPOSMonitoring 
values(@BTPOSId,
@Xcoordinate,
@Ycoordinate,
@LocationName,
@SNo,
@DateTime
)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSInventorySales]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelBTPOSInventorySales](@amount int,@code varchar (50),@Id int,@inventoryId int,@perunit int,@quantity int,@soldon varchar (50),@transactionId int,@transactiontype varchar (50))
as
begin
insert into BTPOSInventorySales values(@amount,@code,@Id,@inventoryId,@perunit,@quantity,@soldon,@transactionId,@transactiontype)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSFaultsCatageries]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelBTPOSFaultsCatageries](@Active NUMERIC(10),
              
           @BTPOSFaultCategory Varchar(30),
           @Desc varchar(50),
           @Id numeric(10),
           @TypeGripId varchar(50))
AS
BEGIN
	

INSERT INTO 
[BTPOSFaultsCatageries] VALUES
           (@Active,
              
          @BTPOSFaultCategory,
           @Desc,
           @Id,
           @TypeGripId )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSDetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelBTPOSDetails](
		  @Id int,
           @CompanyId int,   
           @POSID varchar(20),
           @StatusId int,
           @IMEI varchar(20),
           @ipconfig varchar(20),
           @active int = 1,
           @fleetownerid int = null,
           @POSTypeId int = null,
		   @PerUnitPrice decimal = null,
           @ActivatedOn datetime = null,
		   @PONum varchar(15) = null,
           @insupdflag varchar(10)
           )
 
AS
BEGIN	

declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int,@cnt int
declare @oldPOSID varchar(20)
declare @oldIMEI varchar(20)
declare @oldipconfig varchar(20)



if @insupdflag = 'I' 
Begin

select @cnt = COUNT(*) from [POSDashboard].[dbo].[BTPOSDetails] where upper([IMEI]) = upper(@IMEI) and [IMEI] is not null

if @cnt > 0 
begin
RAISERROR ('IMEI already exists',16,1);
return
end

INSERT INTO [POSDashboard].[dbo].[BTPOSDetails]
           ([CompanyId]
           ,[POSID]
           ,[StatusId]
           ,[IMEI]
           ,[ipconfig]
           ,[active]
           ,[FleetOwnerId]
           ,[PerUnitPrice]
           ,[POSTypeId]
           ,[ActivatedOn]
           ,[PONum])
     VALUES
           (1,
           @POSID
           ,1
           ,@IMEI
           ,@ipconfig
           ,1
           ,null
           ,@PerUnitPrice
           ,@POSTypeId
           ,null
           ,@PONum)

           
        exec InsEditHistory 'BTPOSDetails','Name', @POSID,'BTPOSDetails Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
	    exec InsEditHistoryDetails @edithistoryid,null,@POSID,'Insertion','POSID',null			
		exec InsEditHistoryDetails @edithistoryid,null,@IMEI,'Insertion','IMEI',null
		exec InsEditHistoryDetails @edithistoryid,null,@ipconfig,'Insertion','ipconfig',null

     
 end         
           
  if @insupdflag = 'U' 
  Begin
  
  select @cnt = COUNT(*) from [POSDashboard].[dbo].[BTPOSDetails] where upper([IMEI]) = upper(@IMEI) and Id <> @Id

if @cnt > 0 
begin
RAISERROR ('IMEI already exists',16,1);
return
end
  
  select @oldPOSID = POSID, @oldIMEI= IMEI, @oldipconfig= ipconfig from BTPOSDetails where Id = @Id
end
UPDATE [POSDashboard].[dbo].[BTPOSDetails]
   SET
      [POSID] = @POSID
      ,[CompanyId] = @CompanyId
      ,[StatusId] = @StatusId
      ,[IMEI] = @IMEI
      ,[ipconfig] = @ipconfig
      ,[active] = @active
      ,[FleetOwnerId] = @fleetownerid
      ,[PerUnitPrice] = @PerUnitPrice
      ,[POSTypeId] = @POSTypeId
      ,[ActivatedOn] = @ActivatedOn
      ,[PONum] = @PONum
 WHERE Id = @Id
 
 exec InsEditHistory 'BTPOSDetails','Name', @POSID,'BTPOSDetails updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldPOSID <> @POSID
Begin
exec InsEditHistoryDetails @edithistoryid,@oldPOSID,@POSID,'Modication','POSID',null		
end
if @oldIMEI <> @IMEI
Begin
exec InsEditHistoryDetails @edithistoryid,@oldIMEI,@IMEI,'Modication','IMEI',null		
end
if @oldipconfig<> @ipconfig
begin
exec InsEditHistoryDetails @edithistoryid,@oldipconfig,@ipconfig,'Modication','ipconfig',null		

 end
 
 
 else
 if @insupdflag = 'D' 
 begin
   delete from BTPOSDetails where Id = @Id
End
END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenseDetails]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelLicenseDetails](
@Id int = -1,
@LicenseTypeId int,
@FeatureTypeId int,
@FeatureLabel varchar(30),
@FeatureValue varchar(250),
@LabelClass varchar(50) = null,
@fromdate datetime = null,
@todate datetime = null,
@insupddelflag char
)
as
begin
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldFeatureTypeId int
declare @oldFeatureLabel varchar(30)
declare @oldFeatureValue varchar(10)
declare @oldLabelClass varchar(50)
declare @oldfromDate datetime
declare @oldtoDate datetime
if @insupddelflag = 'I'
begin
INSERT INTO [POSDashboard].[dbo].[LicenseDetails]
           ([LicenseTypeId]
           ,[FeatureTypeId]
           ,[FeatureLabel]
           ,[FeatureValue]
           ,[LabelClass]           
           ,[fromDate]
           ,[toDate])
     VALUES
           (@LicenseTypeId
           ,@FeatureTypeId
           ,@FeatureLabel
           ,@FeatureValue
           ,@LabelClass           
           ,@fromDate
           ,@toDate
          )
           exec InsEditHistory 'LicenseDetails','Name', @LicenseTypeId,'LicenseDetails Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@LicenseTypeId,'Insertion','LicenseTypeId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@FeatureTypeId,'Insertion','FeatureTypeId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@FeatureLabel,'Insertion','FeatureLabel',null
  
            exec InsEditHistoryDetails @edithistoryid,null,@FeatureValue,'Insertion','FeatureValue',null			
			exec InsEditHistoryDetails @edithistoryid,null,@LabelClass,'Insertion','LabelClass',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@fromDate,'Insertion','fromDate',null
            exec InsEditHistoryDetails @edithistoryid,null,@toDate,'Insertion','toDate',null
          
          
          end
else
if @insupddelflag = 'U'
begin

UPDATE [POSDashboard].[dbo].[LicenseDetails]
   SET [FeatureLabel] = @FeatureLabel
      ,[FeatureValue] = @FeatureValue
      ,[LabelClass] = @LabelClass
      ,[fromDate] = @fromDate
      ,[toDate] = @toDate
 WHERE [LicenseTypeId] = @LicenseTypeId and [FeatureTypeId] = @FeatureTypeId
 
 
   exec InsEditHistory 'LicenseDetails','Name', @FeatureTypeId,'LicenseDetails updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

      if @FeatureTypeId <> @FeatureTypeId
    exec InsEditHistoryDetails @edithistoryid,@oldFeatureTypeId,@FeatureTypeId,'Modication','FeatureTypeId',null		

      if @FeatureLabel <> @FeatureLabel
    exec InsEditHistoryDetails @edithistoryid,@oldFeatureLabel,@FeatureLabel,'Modication','@FeatureLabel',null		

      if @FeatureValue <> @FeatureValue
    exec InsEditHistoryDetails @edithistoryid,@oldFeatureValue,@FeatureValue,'Modication','@FeatureValue',null	
 
       if @LabelClass <> @LabelClass
    exec InsEditHistoryDetails @edithistoryid,@oldLabelClass,@LabelClass,'Modication','@LabelClass',null		

      if @fromDate <> @fromDate
    exec InsEditHistoryDetails @edithistoryid,@oldfromDate,@fromDate,'Modication','@fromDate',null		

      if @oldtoDate <> @oldtoDate
    exec InsEditHistoryDetails @edithistoryid,@oldtoDate,@oldtoDate,'Modication','@oldtoDate',null		
 
 
 
 	
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [POSDashboard].[dbo].[LicenseDetails]
      WHERE [LicenseTypeId] = @LicenseTypeId and [FeatureTypeId] = @FeatureTypeId
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsupdDelInventoryItem]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsupdDelInventoryItem]
(@Id int,
@ItemName varchar(50),
@Code varchar(50),
@Description varchar(50) = null,
@CategoryId int,
@SubCategoryId int,
@ReOrderPoint int)
as 
begin
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldItemName varchar(50)
declare @oldCode varchar(50)
declare @oldDescription varchar(50)
declare @oldSubCategoryId int
declare @oldReOrderPoint int

UPDATE [POSDashboard].[dbo].[InventoryItem]
   SET [ItemName] = @ItemName
      ,[Code] = @Code
      ,[Description] = @Description
      ,[CategoryId] = @CategoryId
      ,[SubCategoryId] = @SubCategoryId
      ,[ReOrderPoint] = @ReOrderPoint
 WHERE Id = @Id
     exec InsEditHistory 'InventoryItem','Name', @ItemName,'InventoryItem updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

       if @ItemName <> @ItemName
     exec InsEditHistoryDetails @edithistoryid,@oldItemName,@ItemName,'Modication','ItemName',null		

       if @Code <> @Code
     exec InsEditHistoryDetails @edithistoryid,@oldCode,@Code,'Modication','Code',null		

       if @Description <> @Description
     exec InsEditHistoryDetails @edithistoryid,@oldDescription,@Description,'Modication','Description',null		
        
        if @SubCategoryId <> @SubCategoryId
     exec InsEditHistoryDetails @edithistoryid,@oldSubCategoryId,@SubCategoryId,'Modication','SubCategoryId',null		

       if @ReOrderPoint <> @ReOrderPoint
     exec InsEditHistoryDetails @edithistoryid,@oldReOrderPoint,@ReOrderPoint,'Modication','ReOrderPoint',null		

       
if @@rowcount = 0 
begin
insert into InventoryItem
(ItemName,Code,
 [Description],
  CategoryId,
  SubCategoryId,
  ReOrderPoint)
  values
 (@ItemName,
  @Code,
  @Description,
  @CategoryId,
  @SubCategoryId,
  @ReOrderPoint)

            exec InsEditHistory 'InventoryItem','Name', @ItemName,'InventoryItem Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@ItemName,'Insertion','ItemName',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Code,'Insertion','Code',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
            exec InsEditHistoryDetails @edithistoryid,null,@CategoryId,'Insertion','CategoryId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@SubCategoryId,'Insertion','SubCategoryId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@ReOrderPoint,'Insertion','ReOrderPoint',null







end

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFORouteFleetSchedule]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelFORouteFleetSchedule](
@Id int = -1,
@VehicleId int,
@RouteId int,
@FleetOwnerId int,
@StopId int,
@ArrivalHr int,
@DepartureHr int,
@Duration decimal = null,
@ArrivalMin int,
@DepartureMin int,
@ArrivalAMPM varchar(10),
@DepartureAMPM varchar(10),
@arrivaltime datetime = null,
@departuretime datetime = null,
@insupddelflag varchar(1) 
)
as
begin
declare @cnt int
set @cnt = 0
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldVehicleId int
declare @oldRouteId int
declare @oldFleetOwnerId int
declare @oldStopId int
declare @oldArrivalHr int
declare @oldDepartureHr int
declare @oldDuration decimal
declare @oldArrivalMin int
declare @oldDepartureMin int
declare @oldArrivalAMPM varchar(10)
declare @oldDepartureAMPM varchar(10)
declare @oldarrivaltime datetime
declare @olddeparturetime datetime




if @insupddelflag = 'I'
		begin
			--check if already company exists
			select @cnt = count(1) from FORouteFleetSchedule where VehicleId = @VehicleId

			if @cnt = 0 
			begin

			INSERT INTO [POSDashboard].[dbo].[FORouteFleetSchedule]
           ([VehicleId]
           ,[RouteId]
           ,[FleetOwnerId]
           ,[StopId]
           ,[ArrivalHr]
           ,[DepartureHr]
           ,[Duration]
           ,[ArrivalMin]
           ,[DepartureMin]
           ,[ArrivalAMPM]
           ,[DepartureAMPM]
           ,[arrivaltime]
           ,[departuretime])
			VALUES
           (@VehicleId,@RouteId,
@FleetOwnerId,
@StopId,
@ArrivalHr,
@DepartureHr,
@Duration,
@ArrivalMin,
@DepartureMin,
@ArrivalAMPM,
@DepartureAMPM,
@arrivaltime,
@departuretime)	

            exec InsEditHistory 'FORouteFleetSchedule','Name', @VehicleId,'FORouteFleetSchedule Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@VehicleId,'Insertion','VehicleId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@RouteId,'Insertion','RouteId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@FleetOwnerId,'Insertion','FleetOwnerId',null
            exec InsEditHistoryDetails @edithistoryid,null,@StopId,'Insertion','StopId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@ArrivalHr,'Insertion','ArrivalHr',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@DepartureHr,'Insertion','DepartureHr',null
            exec InsEditHistoryDetails @edithistoryid,null,@Duration,'Insertion','Duration',null
            exec InsEditHistoryDetails @edithistoryid,null,@ArrivalMin,'Insertion','ArrivalMin',null			
			exec InsEditHistoryDetails @edithistoryid,null,@DepartureMin,'Insertion','DepartureMin',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@ArrivalAMPM,'Insertion','ArrivalAMPM',null

            exec InsEditHistoryDetails @edithistoryid,null,@DepartureAMPM,'Insertion','DepartureAMPM',null			
			exec InsEditHistoryDetails @edithistoryid,null,@arrivaltime,'Insertion','arrivaltime',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@departuretime,'Insertion','departuretime',null







		
		   
			end
	 end
else

   if @insupddelflag = 'U'
		begin
				UPDATE [POSDashboard].[dbo].[FORouteFleetSchedule]
				SET --[VehicleId] = @VehicleId
          -- ,[RouteId]=@RouteId
          -- ,[FleetOwnerId]=@FleetOwnerId
          -- ,[StopId]=@StopId
           [ArrivalHr]=@ArrivalHr 
           ,[DepartureHr]=@DepartureHr
           ,[Duration]=@Duration
           ,[ArrivalMin]=@ArrivalMin
           ,[DepartureMin]=@DepartureMin
           ,[ArrivalAMPM]=@ArrivalAMPM
           ,[DepartureAMPM]=@DepartureAMPM
           ,[arrivaltime]=@arrivaltime
           ,[departuretime]=@departuretime
				 WHERE VehicleId = @VehicleId
				 and [RouteId]=@RouteId
				 and [FleetOwnerId]=@FleetOwnerId
				 and [StopId]=@StopId
				 
				 if @@ROWCOUNT = 0
				 INSERT INTO [POSDashboard].[dbo].[FORouteFleetSchedule]
           ([VehicleId]
           ,[RouteId]
           ,[FleetOwnerId]
           ,[StopId]
           ,[ArrivalHr]
           ,[DepartureHr]
           ,[Duration]
           ,[ArrivalMin]
           ,[DepartureMin]
           ,[ArrivalAMPM]
           ,[DepartureAMPM]
           ,[arrivaltime]
           ,[departuretime])
			VALUES
           (@VehicleId,@RouteId,
@FleetOwnerId,
@StopId,
@ArrivalHr,
@DepartureHr,
@Duration,
@ArrivalMin,
@DepartureMin,
@ArrivalAMPM,
@DepartureAMPM,
@arrivaltime,
@departuretime)	

exec InsEditHistory 'FORouteFleetSchedule','Name', @FleetOwnerId,'FORouteFleetSchedule updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @FleetOwnerId <> @FleetOwnerId
exec InsEditHistoryDetails @edithistoryid,@oldFleetOwnerId,@FleetOwnerId,'Modication','FleetOwnerId',null		

if @StopId <> @StopId
exec InsEditHistoryDetails @edithistoryid,@oldStopId,@StopId,'Modication','StopId',null		

if @ArrivalHr <> @ArrivalHr
exec InsEditHistoryDetails @edithistoryid,@oldArrivalHr,@ArrivalHr,'Modication','@ArrivalHr',null	

if @DepartureHr <> @DepartureHr
exec InsEditHistoryDetails @edithistoryid,@oldDepartureHr,@DepartureHr,'Modication','@DepartureHr',null		

if @ArrivalMin <> @ArrivalMin
exec InsEditHistoryDetails @edithistoryid,@ArrivalMin,@ArrivalMin,'Modication','@ArrivalMin',null		

if @DepartureMin <> @DepartureMin
exec InsEditHistoryDetails @edithistoryid,@DepartureMin,@DepartureMin,'Modication','@DepartureMin',null
if @DepartureHr <> @DepartureHr
exec InsEditHistoryDetails @edithistoryid,@oldDepartureHr,@DepartureHr,'Modication','@DepartureHr',null		

if @ArrivalAMPM <> @ArrivalAMPM
exec InsEditHistoryDetails @edithistoryid,@oldArrivalAMPM,@ArrivalAMPM,'Modication','@ArrivalAMPM',null		

if @DepartureAMPM <> @DepartureAMPM
exec InsEditHistoryDetails @edithistoryid,@oldDepartureAMPM,@DepartureAMPM,'Modication','@DepartureAMPM',null

if @arrivaltime <> @arrivaltime
exec InsEditHistoryDetails @edithistoryid,@oldarrivaltime,@arrivaltime,'Modication','@arrivaltime',null

if @departuretime <> @departuretime
exec InsEditHistoryDetails @edithistoryid,@olddeparturetime,@departuretime,'Modication','@departuretime',null


	
		end
   else
	if @insupddelflag = 'D'
	begin
     delete from [POSDashboard].[dbo].[FORouteFleetSchedule]
	 where VehicleId = @VehicleId
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFORouteFare]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsUpdDelFORouteFare](           
            @VehicleId int         
           ,@RouteId int
           ,@Amount decimal
           ,@PricingTypeId int
           ,@FromDate datetime = null
           ,@ToDate datetime = null
           ,@UnitPrice decimal
           ,@SourceId int
           ,@DestinationId int
)                        
as
begin
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldAmount decimal
declare @oldPricingTypeId int
declare @old@FromDate datetime
declare @oldToDate datetime
declare @oldUnitPrice decimal
declare @oldSourceId int
declare @oldDestinationId int


UPDATE [POSDashboard].[dbo].[FORouteFare]
   SET [Amount] = @Amount
      ,[PricingTypeId] = @PricingTypeId
      ,[FromDate] = @FromDate
      ,[ToDate] = @ToDate
      ,[UnitPrice] = @UnitPrice
      , [SourceId] = @SourceId
      , [DestinationId] = @DestinationId
      WHERE [VehicleId] = @VehicleId
      and [RouteId] = @RouteId  
          
	if @@rowcount  = 0 
          begin
			INSERT INTO [POSDashboard].[dbo].[FORouteFare]
           ([VehicleId]         
           ,[RouteId]
           ,[Amount]
           ,[PricingTypeId]
           ,[FromDate]
           ,[ToDate]
           ,[UnitPrice]
           ,[SourceId]
           ,[DestinationId])
			VALUES
           (@VehicleId           
           ,@RouteId 
           ,@Amount
           ,@PricingTypeId
           ,@FromDate
           ,@ToDate
           ,@UnitPrice
           ,@SourceId
           ,@DestinationId)
             exec InsEditHistory 'FORouteFare','Name', @VehicleId,'FORouteFare Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@VehicleId,'Insertion','VehicleId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@RouteId,'Insertion','RouteId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@Amount,'Insertion','Amount',null
            exec InsEditHistoryDetails @edithistoryid,null,@PricingTypeId,'Insertion','PricingTypeId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@FromDate,'Insertion','FromDate',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@ToDate,'Insertion','ToDate',null
            exec InsEditHistoryDetails @edithistoryid,null,@UnitPrice,'Insertion','UnitPrice',null			
			exec InsEditHistoryDetails @edithistoryid,null,@SourceId,'Insertion','SourceId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@DestinationId,'Insertion','DestinationId',null
            
            end
    else
    begin
          exec InsEditHistory 'FORouteFare','Name', @Amount,'FORouteFare updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

            if @Amount <> @Amount
          exec InsEditHistoryDetails @edithistoryid,@oldAmount,@Amount,'Modication','Amount',null		

             if @PricingTypeId <> @PricingTypeId
          exec InsEditHistoryDetails @edithistoryid,@oldPricingTypeId,@PricingTypeId,'Modication','PricingTypeId',null		

             if @FromDate <> @FromDate
           exec InsEditHistoryDetails @edithistoryid,@old@FromDate,@FromDate,'Modication','@FromDate',null
           
           
             if @ToDate <> @ToDate
          exec InsEditHistoryDetails @edithistoryid,@oldToDate,@ToDate,'Modication','ToDate',null		

             if @UnitPrice <> @UnitPrice
          exec InsEditHistoryDetails @edithistoryid,@oldUnitPrice,@UnitPrice,'Modication','@UnitPrice',null		

             if @SourceId <> @SourceId
           exec InsEditHistoryDetails @edithistoryid,@oldSourceId,@SourceId,'Modication','@SourceId',null
           
           if @DestinationId <> @DestinationId
           exec InsEditHistoryDetails @edithistoryid,@oldDestinationId,@DestinationId,'Modication','@DestinationId',null
           
    end  
           
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetStaff]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsUpdDelFleetStaff]
@Id int = -1,
@RoleId int,
@UserId int,
@VehicleId int,
@cmpId int,
@FromDate datetime = null,
@ToDate datetime = null,
@insupddelflag varchar
as
begin

declare @cnt  int
set @cnt = -1
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldVehicleId int
declare @oldUserId int
declare @oldCompanyId int
declare @oldRoleId int


if @insupddelflag = 'I'
begin
select @cnt = count(1) from [POSDashboard].[dbo].[FleetStaff] 
where vehicleid = @vehicleid 
and userid = @userid and roleid = @roleid

if @cnt = 0 
select @oldVehicleId = VehicleId, @oldUserId = UserId, @oldRoleId=RoleId from FleetStaff where Id = @Id
begin
INSERT INTO [POSDashboard].[dbo].[FleetStaff]
           ([RoleId]
           ,[UserId]
           ,[FromDate]
           ,[ToDate]
           ,[VehicleId]
           ,[CompanyId])
     VALUES
           (@RoleId
           ,@UserId
           ,@FromDate
           ,@ToDate
           ,@VehicleId
           ,@cmpId)
         exec InsEditHistory 'FleetStaff','Name', @VehicleId,'FleetStaff Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@VehicleId,'Insertion','VehicleId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@UserId,'Insertion','UserId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@RoleId,'Insertion','RoleId',null
  
           
           
           
           
end
end

  if @insupddelflag = 'U'
begin
UPDATE [POSDashboard].[dbo].[FleetStaff]
   SET [RoleId] = @RoleId
      ,[UserId] = @UserId
      ,[FromDate] = @FromDate
      ,[ToDate] = @ToDate
      ,[VehicleId] = @VehicleId
      ,[CompanyId] = @cmpId
 WHERE Id = @Id


exec InsEditHistory 'FleetStaff','Name', @VehicleId,'FleetStaff updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @VehicleId <> @VehicleId
exec InsEditHistoryDetails @edithistoryid,@oldVehicleId,@VehicleId,'Modication','VehicleId',null		

if @UserId <> @UserId
exec InsEditHistoryDetails @edithistoryid,@oldUserId,@UserId,'Modication','UserId',null		

if @RoleId <> @RoleId
exec InsEditHistoryDetails @edithistoryid,@oldRoleId,@RoleId,'Modication','RoleId',null		
		
end

else
 if @insupddelflag = 'D'
 begin
  delete from [POSDashboard].[dbo].[FleetStaff]
where vehicleid = @VehicleId 
and userid = @UserId 
and companyid = @cmpid
and roleid = @roleid
end

End
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetRoutes]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsUpdDelFleetRoutes]
@Id int = -1,
@VehicleId int,
@routeid int,
@FromDate datetime = null,
@ToDate datetime = null,
@insupddelflag varchar
as
begin

declare @cnt  int
set @cnt = -1
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldVehicleId int
declare @oldrouteid int
--declare @oldFromDate datetime
--declare @oldToDate datetime

if @insupddelflag = 'I'
begin

select @cnt = count(1) from [POSDashboard].[dbo].[FleetRoutes] 
where vehicleid = @VehicleId 
and routeid = @routeid

if @cnt = 0 
begin
INSERT INTO [POSDashboard].[dbo].[FleetRoutes]
           ([VehicleId]
           ,[RouteId]
           ,[EffectiveFrom]
           ,[EffectiveTill])
     VALUES
           (@VehicleId
           ,@routeid
           ,@FromDate
           ,@ToDate)
            exec InsEditHistory 'FleetRoutes','Name', @VehicleId,'FleetRoutes Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@VehicleId,'Insertion','VehicleId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@routeid,'Insertion','routeid',null
			--exec InsEditHistoryDetails @edithistoryid,null,@FromDate,'Insertion','FromDate',null
   --         exec InsEditHistoryDetails @edithistoryid,null,@ToDate,'Insertion','ToDate',null


           
end
end
else
  if @insupddelflag = 'U'
  begin
select @oldVehicleId = VehicleId, @oldrouteid = routeid from FleetRoutes where Id = @Id


UPDATE [POSDashboard].[dbo].[FleetRoutes]
   SET [RouteId] = @routeid      
      ,[EffectiveFrom] = @FromDate
      ,[EffectiveTill] = @ToDate      
 WHERE vehicleid = @VehicleId
 
 
 exec InsEditHistory 'FleetRoutes','Name', @VehicleId,'FleetRoutes updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           
end
if @oldVehicleId <> @VehicleId
begin
exec InsEditHistoryDetails @edithistoryid,@oldVehicleId,@VehicleId,'Modication','VehicleId',null		
end
if @oldrouteid <> @routeid
begin
exec InsEditHistoryDetails @edithistoryid,@oldrouteid ,@routeid ,'Modication','routeid',null		
end
--if @oldFromDate <> @FromDate
--exec InsEditHistoryDetails @edithistoryid,@oldFromDate,@FromDate,'Modication','FromDate',null		

--if  @oldToDate <>  @ToDate
--exec InsEditHistoryDetails @edithistoryid,@oldToDate ,@ToDate ,'Modication','ToDate ',null		

else
if @insupddelflag = 'D'
begin
  delete from [POSDashboard].[dbo].[FleetRoutes]
where vehicleid = @VehicleId and routeid = @routeid

End
End
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerVehicleLayout]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[InsUpdDelFleetOwnerVehicleLayout](	
	@VehicleLayoutTypeId int,
	@RowNo int,
	@ColNo varchar(50),
	@VehicleTypeId int,
	@label varchar(10),
	@FleetOwnerId int,
	@insupdflag varchar (10)   
)
AS
BEGIN
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
if @insupdflag = 'I'
INSERT INTO [dbo].[FleetOwnerVehicleLayout]
           ([VehicleLayoutTypeId]
           ,[RowNo]
           ,[ColNo]
           ,[VehicleTypeId]
           ,[label]
           ,[FleetOwnerId]
           )
     VALUES
           (@VehicleLayoutTypeId
           ,@RowNo
           ,@ColNo
           ,@VehicleTypeId
           ,@label
           ,@FleetOwnerId)
           
--insert into edit history
	exec InsEditHistory 'FleetOwnerVehicleLayout', 'Name',@VehicleLayoutTypeId,'FleetOwnerVehicleLayout creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
           
    exec InsEditHistoryDetails @edithistoryid,null,@VehicleLayoutTypeId,'Insertion','VehicleLayoutTypeId',null
    exec InsEditHistoryDetails @edithistoryid,null,@RowNo,'Insertion','RowNo',null
    
    exec InsEditHistoryDetails @edithistoryid,null,@ColNo ,'Insertion','ColNo',null
    exec InsEditHistoryDetails @edithistoryid,null,@VehicleTypeId,'Insertion','VehicleTypeId',null
    
    exec InsEditHistoryDetails @edithistoryid,null,@label ,'Insertion','label',null
    exec InsEditHistoryDetails @edithistoryid,null,@FleetOwnerId ,'Insertion','FleetOwnerId',null
End
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteStops]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[InsUpdDelFleetOwnerRouteStops]
	-- Add the parameters for the stored procedure here
	@FleetOwnerId int,
	@RouteId int,
	@StopId int,
    @insupddelflag varchar(1)
AS
BEGIN
declare @cnt int
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @insupddelflag = 'I'
	begin

	  select @cnt = count(*) 
	  FROM  [POSDashboard].[dbo].[FleetOwnerStops]
	  WHERE FleetOwnerId = @FleetOwnerId 
		  and RouteId = @RouteId 
		  and StopId = @StopId

			if @cnt = 0 
			begin
				INSERT INTO [POSDashboard].[dbo].[FleetOwnerStops]
					   ([FleetOwnerId]
					   ,[RouteId]
					   ,[StopId])
				 VALUES
					   (@FleetOwnerId
					   ,@RouteId
					   ,@StopId)
                  --insert into edit history
	exec InsEditHistory 'FleetOwnerStops', 'Name',@FleetOwnerId,'FleetOwnerStops creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
           
    exec InsEditHistoryDetails @edithistoryid,null,@FleetOwnerId,'Insertion','FleetOwnerId',null
    exec InsEditHistoryDetails @edithistoryid,null,@RouteId,'Insertion','RouteId',null
    
    exec InsEditHistoryDetails @edithistoryid,null,@StopId ,'Insertion','StopId',null
						--insert the fleet owner stops id also
						--for this get all the records with stopid as src for given route and insert the same
						--get all the records with stopid as dest and insert
						declare @sid int
						declare @scnt int

						DECLARE db_cursor CURSOR FOR
						select Id from routestops 
						where  routeid = @RouteId
						and ((fromstopid = @StopId and tostopid in (select stopid from fleetownerstops where routeid = @RouteId))
						or (tostopid = @StopId and FromStopId in (select stopid from fleetownerstops where routeid = @RouteId)))						

						OPEN db_cursor  
						FETCH NEXT FROM db_cursor INTO @sid 

						WHILE @@FETCH_STATUS = 0  
						BEGIN  
						 
								select @scnt = count(1) from [POSDashboard].[dbo].[FleetOwnerRouteStop]
								where RouteStopId = @sid      

								if @scnt = 0 
								INSERT INTO [POSDashboard].[dbo].[FleetOwnerRouteStop]
									  ([FleetOwnerId]
										,[RouteStopId])
								 VALUES
									   (@FleetOwnerId
									   ,@sid)
								

							   FETCH NEXT FROM db_cursor INTO @sid
						END  

						CLOSE db_cursor  
						DEALLOCATE db_cursor 

			end

	end
else
	if @insupddelflag = 'D'
	begin
		DELETE FROM [POSDashboard].[dbo].[FleetOwnerStops]
			  WHERE FleetOwnerId = @FleetOwnerId 
			  and RouteId = @RouteId 
			  and StopId = @StopId

		delete from [POSDashboard].[dbo].[FleetOwnerRouteStop]
		where FleetOwnerId = @FleetOwnerId 
		and RouteStopId in (select Id from routestops 
		where  routeid = @RouteId
		and (fromstopid = @StopId or tostopid = @StopId))
	end

END

/****** Object:  Table [dbo].[Ex_Availableseats]    Script Date: 06/14/2016 11:15:49 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRoutes]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsUpdDelFleetOwnerRoutes]
@Id int = -1,
@RouteId int,
@cmpId int,
@fleetOwnerId int,
@FromDate datetime = null,
@ToDate datetime = null,
@insupddelflag varchar
as
begin

declare @cnt  int
set @cnt = -1

declare @rsId int
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldFleetOwnerId int
declare @oldRouteId int


if @insupddelflag = 'I'
begin
select @cnt = count(1) from [POSDashboard].[dbo].[FleetOwnerRoute] 
where [FleetOwnerId] = @fleetOwnerId
and  [RouteId] = @RouteId
end
if @cnt = 0 
begin
INSERT INTO [POSDashboard].[dbo].[FleetOwnerRoute]
           ([FleetOwnerId]
           ,[CompanyId]
           ,[RouteId]
           ,[FromDate]
           ,[ToDate])
     VALUES
           (@fleetOwnerId
           ,@cmpId
           ,@RouteId
           ,@FromDate
           ,@ToDate)
 exec InsEditHistory 'FleetOwnerRoute','Name', @FleetOwnerId,'Type Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@FleetOwnerId,'Insertion','Name',null			
			exec InsEditHistoryDetails @edithistoryid,null,@RouteId,'Insertion','RouteId',null
			
--insert record into FleetOwnerRouteStop
 SELECT @rsId = rs.[Id]
  FROM [POSDashboard].[dbo].[RouteStops] rs
  inner join routes r on (rs.routeid = r.id
  and rs.fromstopid = r.[SourceId]
      and rs.tostopid = [DestinationId])
  where r.[Id] = @routeid
end
if @rsId is not null 
 begin
   INSERT INTO [POSDashboard].[dbo].[FleetOwnerRouteStop]
           ([FleetOwnerId]
           ,[RouteStopId])
     VALUES
           (@fleetOwnerId,@rsId) 
end

declare @stopscnt int
declare @srcstopid int
declare @deststopid int

  select @srcstopid = sourceid from routes where id = @routeid
select @deststopid = destinationid from routes where id = @routeid

select @stopscnt = count(*) from fleetownerstops where fleetownerid = @fleetOwnerId
and routeid = @routeid and stopid = @srcstopid

if @stopscnt = 0 
begin
INSERT INTO [POSDashboard].[dbo].[FleetOwnerStops]
           ([FleetOwnerId]
           ,[RouteId]
           ,[StopId])
     VALUES
           (@fleetOwnerId
           ,@RouteId
           ,@srcstopid)

end

select @stopscnt = count(*) from fleetownerstops where fleetownerid = @fleetOwnerId
and routeid = @routeid and stopid = @deststopid

if @stopscnt = 0 
begin
INSERT INTO [POSDashboard].[dbo].[FleetOwnerStops]
           ([FleetOwnerId]
           ,[RouteId]
           ,[StopId])
     VALUES
           (@fleetOwnerId
           ,@RouteId
           ,@deststopid)
 

end
else
  if @insupddelflag = 'U'
  begin
  select @oldfleetOwnerId = fleetOwnerId, @oldRouteId = RouteId  from FleetOwnerRoute where Id = @Id


UPDATE [POSDashboard].[dbo].[FleetOwnerRoute]
   SET [FromDate] = @FromDate
      ,[ToDate] = @ToDate
 WHERE [FleetOwnerId] = @fleetOwnerId
and  [RouteId] = @RouteId
     
     
exec InsEditHistory 'FleetOwnerRoute','Name', @fleetOwnerId,'FleetOwnerRoute updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           
end
if @fleetOwnerId <> @fleetOwnerId
begin
exec InsEditHistoryDetails @edithistoryid,@fleetOwnerId,@fleetOwnerId,'Modication','fleetOwnerId',null		
end
else
if @RouteId <> @RouteId
begin
exec InsEditHistoryDetails @edithistoryid,@oldRouteId,@RouteId,'Modication','RouteId',null		
 end
else
if @insupddelflag = 'D'
begin
  delete from [POSDashboard].[dbo].[FleetOwnerRoute]
where [FleetOwnerId] = @fleetOwnerId
and  [RouteId] = @RouteId

--remove all the FleetOwnerRouteStop references for the route

delete from [POSDashboard].[dbo].[FleetOwnerRouteStop] 
where id in (
select fs.id from [POSDashboard].[dbo].[FleetOwnerRouteStop] fs
inner join [RouteStops] rs on rs.id = fs.RouteStopId
where [FleetOwnerId] = @fleetOwnerId
and rs.RouteId = @RouteId
)


delete from fleetownerstops where routeid = @routeid and fleetownerid = @fleetOwnerId

delete from FORouteFleetSchedule where routeid = @routeid  and fleetownerid = @fleetOwnerId

end


End
GO
/****** Object:  StoredProcedure [dbo].[InsupddelFleetDetails]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsupddelFleetDetails]
 (@Id int,
 @VehicleRegNo varchar(15)
           ,@VehicleTypeId int
           ,@FleetOwnerId int
           ,@CompanyId int
           ,@ServiceTypeId int
           ,@VehicleLayoutId int
           ,@Active int
           ,@EngineNo varchar(50) = null
           ,@FuelUsed varchar(50) = null
           ,@MonthAndYrOfMfr datetime = null
           ,@ChasisNo varchar(50) = null
           ,@SeatingCapacity int = 0
           ,@DateOfRegistration datetime = null
           ,@insupdflag varchar(1)
           )
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldVehicleRegNo varchar(15)
declare @oldVehicleTypeId int

declare @oldServiceTypeId int

if @insupdflag = 'I'
begin

	INSERT INTO [POSDashboard].[dbo].[FleetDetails]
           ([VehicleRegNo]
           ,[VehicleTypeId]
           ,[FleetOwnerId]
           ,[CompanyId]
           ,[ServiceTypeId]
           ,[LayoutTypeId]
           ,[Active]
           ,[EngineNo]
           ,[FuelUsed]
           ,[MonthAndYrOfMfr]
           ,[ChasisNo]
           ,[SeatingCapacity]
           ,[DateOfRegistration])
           
     VALUES
           (@VehicleRegNo 
           ,@VehicleTypeId 
           ,@FleetOwnerId 
           ,@CompanyId 
           ,@ServiceTypeId 
           ,@VehicleLayoutId
           ,@Active 
           ,@EngineNo 
           ,@FuelUsed
           ,@MonthAndYrOfMfr
           ,@ChasisNo
           ,@SeatingCapacity 
           ,@DateOfRegistration)

--insert into edit history
	exec InsEditHistory 'FleetDetails', 'Name',@VehicleRegNo,'User creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
           
    exec InsEditHistoryDetails @edithistoryid,null,@VehicleRegNo,'Insertion','VehicleRegNo',null
    exec InsEditHistoryDetails @edithistoryid,null,@VehicleTypeId,'Insertion','VehicleTypeId',null
    
    exec InsEditHistoryDetails @edithistoryid,null,@ServiceTypeId ,'Insertion','ServiceTypeId',null

end
else
if @insupdflag = 'U'
begin
select @oldVehicleRegNo = VehicleRegNo, @oldVehicleTypeId = VehicleTypeId, @oldServiceTypeId=ServiceTypeId from FleetDetails where Id = @Id
update [POSDashboard].[dbo].[FleetDetails]
set
[VehicleRegNo] = @VehicleRegNo 
,[VehicleTypeId] = @VehicleTypeId 
,[FleetOwnerId] = @FleetOwnerId 
,[CompanyId] = @CompanyId 
,[ServiceTypeId] = @ServiceTypeId
,[LayoutTypeId] = @VehicleLayoutId
,[Active] = @Active
,[EngineNo] = @EngineNo 
,[FuelUsed] = @FuelUsed
,[MonthAndYrOfMfr] = @MonthAndYrOfMfr
,[ChasisNo] = @ChasisNo
,[SeatingCapacity] = @SeatingCapacity 
,[DateOfRegistration] = @DateOfRegistration
where Id = @Id

exec InsEditHistory 'FleetDetails', 'Name',@VehicleRegNo,'User creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output

if @oldVehicleRegNo <> @VehicleRegNo
exec InsEditHistoryDetails @edithistoryid,@oldVehicleRegNo,@VehicleRegNo,'Modication','VehicleRegNo',null		

if @oldVehicleTypeId <> @VehicleTypeId
exec InsEditHistoryDetails @edithistoryid,@oldVehicleTypeId,@VehicleTypeId,'Modication','VehicleTypeId',null		

           

if @oldServiceTypeId <> @ServiceTypeId
exec InsEditHistoryDetails @edithistoryid,@oldServiceTypeId,@ServiceTypeId,'Modication','ServiceTypeId',null		



end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetBTPOS]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[InsUpdDelFleetBTPOS]
@Id int = -1,
@VehicleId int,
@btposId int,
@FromDate datetime = null,
@ToDate datetime = null,
@insupddelflag varchar
as
begin
declare @dt datetime
set @dt = GETDATE()
declare @cnt  int
set @cnt = -1
declare @edithistoryid int
declare @oldVehicleId int
declare @oldBTPOSId int
declare @oldToDate int
declare @oldFromDate int

if @insupddelflag = 'I'
begin
select @cnt = count(1) from [POSDashboard].[dbo].[FleetBTPOS] 
where vehicleid = @VehicleId 
and  BTPOSId = @btposId
end
if @cnt = 0 
begin
INSERT INTO [POSDashboard].[dbo].[FleetBtpos]
           ([VehicleId]
           ,[FromDate]
           ,[ToDate]
           ,[BTPOSId])
     VALUES
           (@VehicleId
           ,@FromDate
           ,@ToDate
           ,@btposId)
             exec InsEditHistory 'FleetBtpos','Name', @VehicleId,'FleetBtpos Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@VehicleId,'Insertion','VehicleId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@BTPOSId,'Insertion','BTPOSId',null
			 exec InsEditHistoryDetails @edithistoryid,null,@FromDate,'Insertion','FromDate',null
            exec InsEditHistoryDetails @edithistoryid,null,@ToDate,'Insertion','ToDate',null
  
           
end
else
  if @insupddelflag = 'U'
begin
UPDATE [POSDashboard].[dbo].[FleetBtpos]
   SET [BTPOSId] = @btposId      
      ,[FromDate] = @FromDate
      ,[ToDate] = @ToDate
     WHERE [VehicleId] = @VehicleId
     
     exec InsEditHistory 'FleetBtpos','Name', @VehicleId,'FleetBtpos updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @VehicleId <> @VehicleId
exec InsEditHistoryDetails @edithistoryid,@oldVehicleId,@VehicleId,'Modication','VehicleId',null		

if @btposId  <> @btposId 
exec InsEditHistoryDetails @edithistoryid,@oldbtposId ,@btposId ,'Modication','btposId ',null		

if @FromDate <> @FromDate
exec InsEditHistoryDetails @edithistoryid,@oldFromDate,@FromDate,'Modication','FromDate',null

if @ToDate  <> @ToDate
exec InsEditHistoryDetails @edithistoryid,@oldToDate ,@ToDate ,'Modication','ToDate ',null		
		
    end  
else
  if @insupddelflag = 'D'
  begin
  delete from [POSDashboard].[dbo].[FleetBtpos]
where vehicleid = @VehicleId 
and [BTPOSId] = @btposId

End
End
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetAvailability]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelFleetAvailability](
@Id int,
@VehicleId int,
@FromDate datetime = null,
@ToDate datetime = null,
@insupddelflag varchar(1)
)
as
begin
declare @cnt int
set @cnt = 0
declare @dt datetime
set @dt = GETDATE()


declare @edithistoryid int
declare @oldVehicleId int
declare @oldFromDate datetime
declare @oldToDate int

if @insupddelflag = 'I'
		begin
			--check if already company exists
			select @cnt = count(1) from FleetAvailability where VehicleId = @VehicleId

			if @cnt = 0 
			begin

			INSERT INTO [POSDashboard].[dbo].[FleetAvailability]
           ([VehicleId]
           ,[FromDate]
           ,[ToDate])
			VALUES
           (@VehicleId,@FromDate,@ToDate)			
		   --insert into edit history
					exec InsEditHistory 'Company', 'Name',@VehicleId,'FleetAvailability',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output
				           
					exec InsEditHistoryDetails @edithistoryid,null,@VehicleId,'Insertion','VehicleId',null
					exec InsEditHistoryDetails @edithistoryid,null,@FromDate,'Insertion','FromDate',null
					exec InsEditHistoryDetails @edithistoryid,null,@ToDate,'Insertion','ToDate',null
					
			end
	 end
else

   if @insupddelflag = 'U'
		begin
				UPDATE [POSDashboard].[dbo].[FleetAvailability]
				SET [FromDate] = @FromDate
					,[ToDate] = @ToDate
				 WHERE VehicleId = @VehicleId
				 	--insert into edit history
			--insert into edit history
					exec InsEditHistory 'Company', 'Name',@VehicleId,'FleetAvailability',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output
				           
					exec InsEditHistoryDetails @edithistoryid,null,@oldVehicleId,'Insertion','VehicleId',null
					exec InsEditHistoryDetails @edithistoryid,null,@oldFromDate,'Insertion','FromDate',null
					exec InsEditHistoryDetails @edithistoryid,null,@oldToDate,'Insertion','ToDate',null

		end
   else
	if @insupddelflag = 'D'
	begin
     delete from [POSDashboard].[dbo].[FleetAvailability]
	 where VehicleId = @VehicleId
end
end


/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteStops]    Script Date: 08/08/2016 17:42:37 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCompanyRoles]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCompany]    Script Date: 05/04/2016 17:22:18 ******/

create procedure [dbo].[InsUpdDelCompanyRoles](
@active int,
@Id int,
@roleid int,
@CompanyId int,
@insupdflag int = 0
)
as
begin
declare @edithistoryid int
declare @cnt int
declare @dt datetime
set @dt = GETDATE()


select @cnt = count(*) from companyroles where [CompanyId] = @CompanyId and [RoleId] = @roleid

if @insupdflag = 1
begin
if @cnt = 0
INSERT INTO [CompanyRoles]
           ([CompanyId]
           ,[RoleId]
           ,[Active])
     VALUES
           (@CompanyId,@roleid,@active)
           
           --insert into edit history
			exec InsEditHistory 'companyroles', 'Name',@CompanyId,'companyroles creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		           
			exec InsEditHistoryDetails @edithistoryid,null,@CompanyId,'Insertion','CompanyId',null
			exec InsEditHistoryDetails @edithistoryid,null,@RoleId,'Insertion','RoleId',null
			
           
end

else

if @insupdflag = 0
begin
 delete from [CompanyRoles] where [CompanyId] = @CompanyId and RoleId = @roleid
 
  --insert into edit history
			exec InsEditHistory 'companyroles', 'Name',@CompanyId,'companyroles creation',@dt,'Admin','Deletion',@edithistoryid = @edithistoryid output
		           
			exec InsEditHistoryDetails @edithistoryid,null,@CompanyId,'Deletion','CompanyId',null
			exec InsEditHistoryDetails @edithistoryid,null,@RoleId,'Deletion','RoleId',null
			
end

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdUsers]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdUsers](
@FirstName varchar(40)
,@LastName varchar(40)
,@MiddleName varchar(40) = null
,@EmpNo varchar(15) = null
,@Email varchar(40) = null
,@Address varchar(250) = null
,@AltAddress varchar(250) = null
,@ContactNo1 varchar(15) = null
,@ContactNo2 varchar(15) = null
,@RoleId int
,@cmpId int
,@Active int
,@DUserName varchar(30)  = null
,@DPassword varchar(30)  = null
,@insupdflag varchar(10)
,@ManagerId int = null
,@userid int = -1
,@ZipCode varchar(10) = null
,@StateId int = 0
,@CountryId int = 0
,@GenderId int = 0
,@RFromDate Datetime = null
,@RToDate Datetime = null
,@photo varchar(max) = null
)
 as begin
 
 declare @currid int, @cnt int, @logincnt int, @ulogincnt int, @edithistoryid int, @dt datetime, @fc varchar(15),@flogincnt int, @UId varchar(10)
	set @dt = GETDATE()
	set @UId = replace(CONVERT(VARCHAR(20), GETDATE(), 114),':','') 
 
 if @insupdflag = 'I'
 begin
 
	 if @EmpNo is null 
	 begin
	 SELECT @EmpNo = 'EMP'+@UId
	 end 
 
	select @cnt = COUNT(*)  from Users where UPPER(EmailId) = @Email
 
	select @logincnt = COUNT(*) from userlogins where upper(logininfo) = UPPER(@DUserName) 
 
	 if @cnt > 0
	 begin
	 RAISERROR ('User email address already exists',16,1);
	 return;
	 end
         
		if @logincnt > 0
		begin
				RAISERROR ('Already user login exists',16,1);
				return;
		end
  
		 if @cnt = 0 
		 begin
			insert into Users(FirstName,LastName,MiddleName, EmpNo,EmailId,[RoleId],[CompanyId],[Active],[GenderId],[ManagerId],[CountryId]
						,[StateId],[ZipCode],[ContactNo1],[ContactNo2],[Address],[AltAddress],[photo])
			values(@FirstName,@LastName,@MiddleName, @EmpNo,@Email ,@RoleId,@cmpId,@Active,@GenderId,@ManagerId,@CountryId
					,@StateId,@ZipCode,@ContactNo1,@ContactNo2,@Address,@AltAddress,@photo) 

		  --insert into edit history
			exec InsEditHistory 'Users', 'Name',@FirstName,'User creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		           
			exec InsEditHistoryDetails @edithistoryid,null,@FirstName,'Insertion','First Name',null
			exec InsEditHistoryDetails @edithistoryid,null,@LastName,'Insertion','Last Name',null
			exec InsEditHistoryDetails @edithistoryid,null,@EmpNo,'Insertion','EmpNo',null
			exec InsEditHistoryDetails @edithistoryid,null,@Email,'Insertion','Email',null

		 
		   SELECT @currid = SCOPE_IDENTITY()
  
		  
		-- insert user role		
		if @RoleId is not null
		exec InsUpdDelUserRoles -1,@RoleId, @currid, @cmpId,'I'
		end
		
		   if @logincnt = 0 
		   begin

					   --check if it is normal user or fleet owner. for fleet owner we have different logic
					   if @RoleId = 6 
					   begin
					     
									 set @fc = case when (select COUNT(*) from fleetowner) = 0
															   then '1' 
															   else (select ltrim(rtrim(STR((max(Id)+1)))) from fleetowner ) 
															   end  

									

									----the login will be assigned once the user buys the license. this is for testing
									--select @flogincnt = COUNT(*) from userlogins where upper(logininfo) = 'FL00'+@fc

									 --if @flogincnt = 0
									 --  begin
										--insert into userlogins(logininfo,PassKey,active,userid)values('FL00'+@fc,'FL00'+@fc,1,@currid)
									 --  end
					   end
					   else
						if  @DUserName is not null
						insert into userlogins(logininfo,PassKey,active,userid)values(@DUserName,@DPassword,1,@currid)
					   
			  end
    


end
 else
 
 begin
 
 SELECT @currid = @userid
 
 UPDATE [POSDashboard].[dbo].[Users]
   SET [FirstName] = @FirstName
      ,[LastName] = @LastName
      ,[MiddleName] = @MiddleName
      ,[EmpNo] = @EmpNo
      ,[EmailId] = @Email
      ,[RoleId] = @RoleId
      ,[CompanyId] = @cmpId
      ,[Active] = @Active
      ,[GenderId] = @GenderId
      ,[ManagerId] = @ManagerId
      ,[CountryId] = @CountryId
      ,[StateId] = @StateId
      ,[ZipCode] = @ZipCode
      ,[ContactNo1] = @ContactNo1
      ,[ContactNo2] = @ContactNo2
      ,[Address] = @Address
      ,[AltAddress] = @AltAddress
      ,[photo] = @photo
  where id = @userid
 
-- insert user role
        if @RoleId is not null
		exec InsUpdDelUserRoles -1,@RoleId, @currid, @cmpId,'I'
		else
		exec InsUpdDelUserRoles -1,@RoleId, @currid, @cmpId,'D'
 
 select @logincnt = COUNT(*) from userlogins where  userid = @userid
 
 
 if @logincnt = 0 
   begin

			   --check if it is normal user or fleet owner. for fleet owner we have different logic
			   if @RoleId = 6 
			   begin
			      
					
							 set @fc = 'FL'+replace(CONVERT(VARCHAR(20), GETDATE(), 114),':','')  

							

							----the login will be assigned once the user buys the license. this is for testing
							--select @flogincnt = COUNT(*) from userlogins where upper(logininfo) = @fc

							-- if @flogincnt = 0
							--   begin
							--	insert into userlogins(logininfo,PassKey,active,userid)values(@fc,@fc,1,@currid)
							--   end
			   end
			   else
			    if @DUserName is not null
				insert into userlogins(logininfo,PassKey,active,userid)values(@DUserName,@DPassword,1,@currid)
			   
      end
 
 else
 begin
     if @DUserName is not null
		 begin
		 --check if updation causes duplicates
		 select @ulogincnt = COUNT(*) from userlogins where upper(logininfo) = UPPER(@DUserName) and userid <> @userid
		 
		 if @ulogincnt = 0
 			update userlogins
			set logininfo = @DUserName
			,PassKey = @DPassword
			,active = @active
			where userid = @currid
		else
		 RAISERROR ('User login already exists',16,1);
		end
 end

 
 end --end of 'i' check
 
 --if role is fleet owner then insert the code into fleet owner table
 
 declare @fcnt int
 
 if @RoleId = 6
 begin
 
 select @fcnt = COUNT(*) from FleetOwner where UserId = @currid
  set @fc = 'FL'+replace(CONVERT(VARCHAR(20), GETDATE(), 108),':','')  
			 if @fcnt = 0 
			 begin
				INSERT INTO [POSDashboard].[dbo].[FleetOwner]
					   ([UserId]
					   ,[CompanyId]
					   ,[Active]
					   ,[FleetOwnerCode])
				 VALUES
					   (@currid
						,@cmpId
					   ,1
					   ,@fc)
		      end						
				else
					UPDATE [POSDashboard].[dbo].[FleetOwner]
						SET 
						[CompanyId] = @cmpId
						,[Active] = 1
						,[FleetOwnerCode] = @fc
					 WHERE [UserId] = @currid
 
 end
 
 end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSubCategory]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelSubCategory]
(@Id int,@Name varchar(50),@Description varchar(50) = null,@CategoryId int,@Active int)
as
begin

declare @dt datetime
set @dt = GETDATE()

declare @cnt int
declare @edithistoryid int
declare @oldname varchar(50)
declare @olddesc varchar(250)
declare @oldactive int
select @oldname = name, @olddesc = description, @oldactive = active from types where Id = @Id



if @@rowcount = 0 
begin
insert into subcategory(Name,[Description],CategoryId,Active) values(@Name,@Description,@CategoryId,@Active)

 exec InsEditHistory 'subcategory','Name', @Name,'subcategory Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
			exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null
end

else
begin
update subcategory 
set name=@Name
,Active = @Active
,Description = @Description
,CategoryId = @CategoryId
where Id = @Id

exec InsEditHistory 'subcategory','Name', @Name,'subcategory updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldname <> @Name
exec InsEditHistoryDetails @edithistoryid,@oldname,@Name,'Modication','Name',null		

if @olddesc <> @Description
exec InsEditHistoryDetails @edithistoryid,@olddesc,@Description,'Modication','Description',null		

if @oldactive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldactive,@Active,'Modication','Active',null		

end

end



/****** Object:  StoredProcedure [dbo].[InsupdCreateFleetOwner]    Script Date: 07/18/2016 12:13:31 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoutes]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelRoutes](
@Id int
,@RouteName varchar(50)
,@Description varchar(50) = null
,@Active int
,@Code varchar(10)
,@SourceId int
,@DestinationId int
,@Distance decimal
)
as
begin

declare @routeid int
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldRouteName varchar(50)
declare @oldCode varchar(250)
declare @oldDescription varchar(50)
declare @oldActive int
declare @oldSourceId int
declare @oldDestinationId int,@rtCount int

select @rtCount= COUNT(*) from [POSDashboard].[dbo].[Routes] where UPPER(ltrim(rtrim(Code))) = UPPER(ltrim(rtrim(@Code)))
--select @oldRouteName = RouteName, @oldCode = Code, @oldActive = Active from Routes where Id = @Id

--UPDATE [POSDashboard].[dbo].[Routes]
--   SET [RouteName] = @RouteName
--      ,[Code] = @Code
--      ,[Description] = @Description
--      ,[Active] = @Active
--      ,[SourceId] = @SourceId
--      ,[DestinationId] = @DestinationId
--      ,[Distance] = @Distance
-- WHERE Id = @Id
-- exec InsEditHistory 'Routes','Name', @RouteName,'Type updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

--if @oldRouteName <> @RouteName
--exec InsEditHistoryDetails @edithistoryid,@oldRouteName,@RouteName,'Modication','RouteName',null		

--if @oldCode <> @Code
--exec InsEditHistoryDetails @edithistoryid,@oldCode,@Code,'Modication','Code',null		

--if @oldDescription <> @Description
--exec InsEditHistoryDetails @edithistoryid,@oldDescription,@Description,'Modication','Description',null		

--if @oldActive <> @Active
--exec InsEditHistoryDetails @edithistoryid,@oldActive,@Active,'Modication','Active',null		

--if @oldSourceId <> @SourceId
--exec InsEditHistoryDetails @edithistoryid,@oldSourceId,@SourceId,'Modication','SourceId',null		

--if @oldDestinationId <> @DestinationId
--exec InsEditHistoryDetails @edithistoryid,@oldDestinationId,@DestinationId,'Modication','DestinationId',null		





if @rtCount = 0 
begin

INSERT INTO [POSDashboard].[dbo].[Routes]
           ([RouteName]
           ,[Code]
           ,[Description]
           ,[Active]
           ,[SourceId]
           ,[DestinationId]
           ,[Distance])
     VALUES
           (@RouteName
           ,@Code
           ,@Description
           ,@Active
           ,@SourceId
           ,@DestinationId
           ,@Distance)
           
		   select @routeid = @@IDENTITY

            exec InsEditHistory 'Routes','Name', @RouteName,'Routes Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@RouteName,'Insertion','RouteName',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Code,'Insertion','Code',null
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
            exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null			
			exec InsEditHistoryDetails @edithistoryid,null,@SourceId,'Insertion','SourceId',null
			exec InsEditHistoryDetails @edithistoryid,null,@DestinationId,'Insertion','DestinationId',null
	        exec InsEditHistoryDetails @edithistoryid,null,@Distance,'Insertion','Distance',null

--insert the source stop
INSERT INTO [POSDashboard].[dbo].[RouteDetails]
           ([RouteId]
           ,[StopId]
           ,[DistanceFromSource]
           ,[DistanceFromDestination]
           ,[DistanceFromPreviousStop]
           ,[DistanceFromNextStop]
           ,[PreviousStopId]
           ,[NextStopId]
           ,[StopNo])
     VALUES
           (
			@routeid
           ,@SourceId
           ,@Distance
           ,@Distance
           ,@Distance
           ,@Distance
           ,@SourceId
           ,@DestinationId
           ,1
          )

--insert the destination stop
INSERT INTO [POSDashboard].[dbo].[RouteDetails]
           ([RouteId]
           ,[StopId]
           ,[DistanceFromSource]
           ,[DistanceFromDestination]
           ,[DistanceFromPreviousStop]
           ,[DistanceFromNextStop]
           ,[PreviousStopId]
           ,[NextStopId]
		   ,[StopNo])
     VALUES
           (
			@routeid
           ,@DestinationId
           ,@Distance
           ,@Distance
           ,@Distance
           ,@Distance
           ,@SourceId
           ,@DestinationId
           ,2
          )

          INSERT INTO [POSDashboard].[dbo].[RouteStops]
           ([RouteId]
           ,[FromStopId]
           ,[ToStopId]
           ,distance)
     VALUES
           (@routeid
           ,@SourceId
           ,@DestinationId
           ,@Distance)
     
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdelStops]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsUpdelStops]
	-- Add the parameters for the stored procedure here
(@Id int,
      @Name varchar(30),
      @Description varchar(30) = null,
      @Code varchar(10),
      @Active int,
     @insupdflag varchar(1))
     
     
     
AS
BEGIN
declare @cnt int
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldname varchar(50)
declare @oldDescription varchar(250)
declare @oldCode varchar(250)
declare @oldactive int
	-- SET NOCOUNT ON added to prevent extra result sets from
	if @insupdflag='I'
	begin

select @cnt = COUNT(*) from Stops where UPPER(name) = UPPER(@Name)

if @cnt =0
INSERT INTO Stops
           (Name,
           [Description],
           Code,
           Active)
           values
           (@Name,
           @Description,
           @Code,
           @Active)
    exec InsEditHistory 'Stops','Name', @Name,'Stops Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
			exec InsEditHistoryDetails @edithistoryid,null,@Code,'Insertion','Code',null
			exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null


                   
           
           
           
           
           end
else
if @insupdflag = 'U'
begin

select @cnt = COUNT(*) from Stops where UPPER(name) = UPPER(@Name) 
and Id <> @Id

if @cnt =0
select @oldname = name, @oldDescription = description,@oldCode=Code, @oldactive = active from Stops where Id = @Id


UPDATE Stops
   SET Name = @Name ,
      [Description] = @Description  ,
      Code = @Code ,
      Active = @Active 
 WHERE id=@id

exec InsEditHistory 'Stops','Name', @Name,'Stops updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldname <> @Name
exec InsEditHistoryDetails @edithistoryid,@oldname,@Name,'Modication','Name',null		

if @oldDescription<> @Description
exec InsEditHistoryDetails @edithistoryid,@oldDescription,@Description,'Modication','Description',null		
if @oldCode <> @Code
exec InsEditHistoryDetails @edithistoryid,@oldCode,@Code,'Modication','Code',null		
if @oldactive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldactive,@Active,'Modication','Active',null		
end
 if @insupdflag = 'D'
 begin
  delete from stops where id = @id
end
END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoles]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelRoles](@Id int,@Name varchar(50)
,@Description varchar(50) = null,@Active int = 1
,@IsPublic int = 1)
as
begin
declare @dt datetime
set @dt = GETDATE()

declare @cnt int
declare @edithistoryid int
declare @oldname varchar(50)
declare @oldDescription  varchar(250)
declare @oldActive int
declare @oldIsPublic int

select @oldname = name, @oldDescription = Description, @oldactive = active from types where Id = @Id

update roles 
set Name = @name,
Description = @Description,
Active = @Active,
IsPublic = @IsPublic
where id = @Id
exec InsEditHistory 'roles ','Name', @Name,'roles  updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldname <> @Name
exec InsEditHistoryDetails @edithistoryid,@oldname,@Name,'Modication','Name',null		

if @oldDescription <> @Description
exec InsEditHistoryDetails @edithistoryid,@oldDescription,@Description,'Modication','Description',null	
if @oldIsPublic <> @IsPublic
exec InsEditHistoryDetails @edithistoryid,@oldIsPublic,@IsPublic,'Modication','IsPublic',null			

if @oldactive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldactive,@Active,'Modication','Active',null		





if @@rowcount = 0
begin
insert into Roles (Name,[Description],Active,IsPublic) 
values(@Name,@Description,@Active,@IsPublic)
  
  exec InsEditHistory 'roles','Name', @Name,'roles Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
			exec InsEditHistoryDetails @edithistoryid,null,@IsPublic,'Insertion','IsPublic',null
			exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null


end

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdLicenseTypes]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsUpdLicenseTypes] 
(@Id int = -1
,@LicenseCatId int
,@LicenseType varchar(50)
,@Description varchar(500) = null
,@Active int = 1)	
AS
BEGIN
declare @dt datetime
set @dt = GETDATE()


declare @edithistoryid int
declare @oldLicenseType varchar(50)
declare @oldDescription varchar(500)
declare @oldActive int

declare @lcCode varchar(15)
 
set @lcCode = 'LC'+replace(CONVERT(VARCHAR(20), GETDATE(), 108),':','')

select @oldLicenseType = LicenseType, @oldActive = Active, @oldDescription = Description from LicenseTypes where Id = @Id

if @@rowcount = 0
begin
INSERT INTO [POSDashboard].[dbo].[LicenseTypes]
           ([LicenseCatId]
           ,[LicenseType]
           ,[Description]
           ,[Active]
           ,LicenseCode)
     VALUES
           (@LicenseCatId
           ,@LicenseType
           ,@Description
           ,@Active
           ,@lcCode)
           
           exec InsEditHistory 'LicenseTypes','Name', @LicenseType,'LicenseTypes Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@LicenseType,'Insertion','LicenseType',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
end
else
begin
	UPDATE [POSDashboard].[dbo].[LicenseTypes]
   SET [LicenseCatId] = @LicenseCatId
      ,[LicenseType] = @LicenseType
      ,[Description] = @Description
      ,[Active] = @Active
	WHERE Id = @Id
	end
exec InsEditHistory 'LicenseTypes','Name', @LicenseType,'LicenseTypes updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldLicenseType <> @LicenseType
exec InsEditHistoryDetails @edithistoryid,@oldLicenseType,@LicenseType,'Modication','LicenseType',null		

if @oldDescription<> @Description
exec InsEditHistoryDetails @edithistoryid,@oldDescription,@Description,'Modication','Description',null		

if @oldActive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldActive,@Active,'Modication','Active',null			
	




END


/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetRoutes]    Script Date: 07/18/2016 15:58:19 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdTypes]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdTypes](@Id int,@Name varchar(50),@Description varchar(50) = null,@TypeGroupId varchar(50),@Active varchar(30),@insupdflag varchar(1))
as
begin

declare @dt datetime
set @dt = GETDATE()

declare @cnt int
declare @edithistoryid int
declare @oldname varchar(50)
declare @olddesc varchar(250)
declare @oldactive int

if @insupdflag = 'I'
begin

select @cnt = COUNT(*) from Types where UPPER(name) = UPPER(@Name)

if @cnt =0
INSERT INTO [POSDashboard].[dbo].[Types]
           ([Name]
           ,[Description]
           ,[TypeGroupId] 
           ,[Active])
     VALUES
           (@Name
           ,@Description
           ,@TypeGroupId 
           ,@Active)
           
           
           exec InsEditHistory 'Types','Name', @Name,'Type Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
			exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null


           
           end
else
if @insupdflag = 'U'
begin

select @cnt = COUNT(*) from Types where UPPER(name) = UPPER(@Name) 
and Id <> @Id

if @cnt =0

select @oldname = name, @olddesc = description, @oldactive = active from types where Id = @Id


update types 
set 
[Name]=@Name
,[Active] = @Active
,[Description] = @Description

where Id = @Id

 exec InsEditHistory 'Types','Name', @Name,'Type updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldname <> @Name
exec InsEditHistoryDetails @edithistoryid,@oldname,@Name,'Modication','Name',null		

if @olddesc <> @Description
exec InsEditHistoryDetails @edithistoryid,@olddesc,@Description,'Modication','Description',null		

if @oldactive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldactive,@Active,'Modication','Active',null		

end
if @insupdflag = 'D'
begin
DELETE FROM [POSDashboard].[dbo].[Types]
      WHERE Id = @Id
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdTypeGroups]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdTypeGroups](@Id int,@Name varchar(50)
,@Description varchar(50) = null,@Active int, @insupdflag varchar(1))
as
begin
declare @dt datetime
set @dt = GETDATE()
declare @cnt int
declare @edithistoryid int
declare @oldname varchar(50)
declare @olddesc varchar(250)
declare @oldactive int

if @insupdflag = 'I'
begin

select @cnt = COUNT(*) from TypeGroups where UPPER(name) = UPPER(@Name)

if @cnt =0

INSERT INTO [POSDashboard].[dbo].[TypeGroups]
           ([Name]
           ,[Description]
           ,[Active])
     VALUES
           (@Name
           ,@Description
           ,@Active)

exec InsEditHistory 'TypeGroups','Name', @Name,'TypeGroups Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
			exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null




end
else
if @insupdflag = 'U'
begin

select @cnt = COUNT(*) from TypeGroups where UPPER(name) = UPPER(@Name) 
and Id <> @Id
              
if @cnt =0
           
   select @oldname = name, @olddesc = description, @oldactive = active from TypeGroups where Id = @Id        

UPDATE [POSDashboard].[dbo].[TypeGroups]
   SET [Name] = @Name
      ,[Description] = @Description
      ,[Active] = @Active
 WHERE Id = @Id
	
	exec InsEditHistory 'TypeGroups','Name', @Name,'Type updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldname <> @Name
exec InsEditHistoryDetails @edithistoryid,@oldname,@Name,'Modication','Name',null		

if @olddesc <> @Description
exec InsEditHistoryDetails @edithistoryid,@olddesc,@Description,'Modication','Description',null		

if @oldactive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldactive,@Active,'Modication','Active',null		


              
end
if @insupdflag = 'D'
begin
DELETE FROM [POSDashboard].[dbo].[TypeGroups]
      WHERE Id = @Id
end
end
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelRoutes]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PSInsUpdDelRoutes](
@Id int
,@RouteName varchar(50)
,@Description varchar(50) = null
,@Active int
,@Code varchar(10)
,@SourceId int
,@DestinationId int
,@Distance decimal
)
as
begin

declare @routeid int
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldRouteName varchar(50)
declare @oldCode varchar(250)
declare @oldDescription varchar(50)
declare @oldActive int
declare @oldSourceId int
declare @oldDestinationId int,@rtCount int

select @rtCount= COUNT(*) from [POSDashboard].[dbo].[Routes] where UPPER(ltrim(rtrim(Code))) = UPPER(ltrim(rtrim(@Code)))
--select @oldRouteName = RouteName, @oldCode = Code, @oldActive = Active from Routes where Id = @Id

--UPDATE [POSDashboard].[dbo].[Routes]
--   SET [RouteName] = @RouteName
--      ,[Code] = @Code
--      ,[Description] = @Description
--      ,[Active] = @Active
--      ,[SourceId] = @SourceId
--      ,[DestinationId] = @DestinationId
--      ,[Distance] = @Distance
-- WHERE Id = @Id
-- exec InsEditHistory 'Routes','Name', @RouteName,'Type updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

--if @oldRouteName <> @RouteName
--exec InsEditHistoryDetails @edithistoryid,@oldRouteName,@RouteName,'Modication','RouteName',null		

--if @oldCode <> @Code
--exec InsEditHistoryDetails @edithistoryid,@oldCode,@Code,'Modication','Code',null		

--if @oldDescription <> @Description
--exec InsEditHistoryDetails @edithistoryid,@oldDescription,@Description,'Modication','Description',null		

--if @oldActive <> @Active
--exec InsEditHistoryDetails @edithistoryid,@oldActive,@Active,'Modication','Active',null		

--if @oldSourceId <> @SourceId
--exec InsEditHistoryDetails @edithistoryid,@oldSourceId,@SourceId,'Modication','SourceId',null		

--if @oldDestinationId <> @DestinationId
--exec InsEditHistoryDetails @edithistoryid,@oldDestinationId,@DestinationId,'Modication','DestinationId',null		





if @rtCount = 0 
begin

INSERT INTO [POSDashboard].[dbo].[Routes]
           ([RouteName]
           ,[Code]
           ,[Description]
           ,[Active]
           ,[SourceId]
           ,[DestinationId]
           ,[Distance])
     VALUES
           (@RouteName
           ,@Code
           ,@Description
           ,@Active
           ,@SourceId
           ,@DestinationId
           ,@Distance)
           
		   select @routeid = @@IDENTITY

            exec InsEditHistory 'Routes','Name', @RouteName,'Routes Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@RouteName,'Insertion','RouteName',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Code,'Insertion','Code',null
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
            exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null			
			exec InsEditHistoryDetails @edithistoryid,null,@SourceId,'Insertion','SourceId',null
			exec InsEditHistoryDetails @edithistoryid,null,@DestinationId,'Insertion','DestinationId',null
	        exec InsEditHistoryDetails @edithistoryid,null,@Distance,'Insertion','Distance',null

--insert the source stop
INSERT INTO [POSDashboard].[dbo].[RouteDetails]
           ([RouteId]
           ,[StopId]
           ,[DistanceFromSource]
           ,[DistanceFromDestination]
           ,[DistanceFromPreviousStop]
           ,[DistanceFromNextStop]
           ,[PreviousStopId]
           ,[NextStopId]
           ,[StopNo])
     VALUES
           (
			@routeid
           ,@SourceId
           ,@Distance
           ,@Distance
           ,@Distance
           ,@Distance
           ,@SourceId
           ,@DestinationId
           ,1
          )

--insert the destination stop
INSERT INTO [POSDashboard].[dbo].[RouteDetails]
           ([RouteId]
           ,[StopId]
           ,[DistanceFromSource]
           ,[DistanceFromDestination]
           ,[DistanceFromPreviousStop]
           ,[DistanceFromNextStop]
           ,[PreviousStopId]
           ,[NextStopId]
		   ,[StopNo])
     VALUES
           (
			@routeid
           ,@DestinationId
           ,@Distance
           ,@Distance
           ,@Distance
           ,@Distance
           ,@SourceId
           ,@DestinationId
           ,2
          )

          INSERT INTO [POSDashboard].[dbo].[RouteStops]
           ([RouteId]
           ,[FromStopId]
           ,[ToStopId]
           ,distance)
     VALUES
           (@routeid
           ,@SourceId
           ,@DestinationId
           ,@Distance)
     
end
end
GO
/****** Object:  StoredProcedure [dbo].[PSInSupdFleetOwnerRequestDetails]    Script Date: 08/04/2017 19:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE[dbo].[PSInSupdFleetOwnerRequestDetails](
		  @FirstName varchar(50),   
		  @MiddleName varchar(50) = null,
          @LastName varchar(50),
          @EmailAddress varchar(50),
          @PhoneNo  varchar(20), 
          @Gender int,  
          @Address varchar(250),  
          @userPhoto varchar(max) = null,
          @AltPhoneNo varchar(20) = null,                    
           
           
          @CompanyName varchar(50),
          @Code varchar(50),
          @CmpEmailAddress varchar(50),
          @CmpTitle varchar(50) = null,   
          @CmpCaption varchar(50) = null,   
          @CmpPhoneNo varchar(20),     
          @CmpAltPhoneNo varchar(20) = null,  
                   
          @FleetSize int = 0, 
		  @StaffSize int = 0,
		  @Country int,
		  @state int,	  
		  
		  @CmpFax varchar(50) = null,   
		  @CmpAddress varchar(500),
		  @CmpAltAddress varchar(500) = null,   
		  
	      @ZipCode varchar(20) = null,   
	      @CmpLogo varchar(max) = null,     
       
          @CurrentSystemInUse varchar(50) = null,
          @SentNewProductsEmails bit = 0,      
          @howdidyouhearaboutus varchar(50) = null,
          @Agreetotermsandconditions bit = 0
 ) 
AS
BEGIN	

declare 
@cmpid int,@foCount int = 0,@cmpCount int = 0, @UId varchar(10)

select @UId = replace(CONVERT(VARCHAR(20), GETDATE(), 114),':','') 


select @cmpid = id from company where upper(name) = upper(@CompanyName)

INSERT INTO [POSDashboard].[dbo].[FleetOwnerRequestDetails]
           ([FirstName]
           ,[MiddleName]
           ,[LastName]
           ,[PhoneNo]
           ,[AltPhoneNo]
           ,[EmailAddress]
           ,[Address]
           ,[Gender]
           ,[CompanyName]
           ,[CmpEmailAddress]
           ,[CmpTitle]
           ,[CmpCaption]
           ,[FleetSize]
           ,[StaffSize]
           ,[Country]
           ,[Code]
           ,[CmpFax]
           ,[CmpAddress]
           ,[CmpAltAddress]
           ,[state]
           ,[ZipCode]
           ,[CmpPhoneNo]
           ,[CmpAltPhoneNo]
           ,[CurrentSystemInUse]
           ,[howdidyouhearaboutus]
           ,[SendNewProductsEmails]
           ,[Agreetotermsandconditions]
           ,[CreatedOn]
           ,[IsNewCompany]
           ,[userPhoto]
           ,[CmpLogo])
     VALUES
           (@FirstName
           ,@MiddleName
           ,@LastName
           ,@PhoneNo
           ,@AltPhoneNo
           ,@EmailAddress
           ,@Address
           ,@Gender
           ,@CompanyName
           ,@CmpEmailAddress
           ,@CmpTitle
           ,@CmpCaption
           ,@FleetSize
           ,@StaffSize
           ,@Country
           ,@Code
           ,@CmpFax
           ,@CmpAddress
           ,@CmpAltAddress
           ,@state
           ,@ZipCode
           ,@CmpPhoneNo
           ,@CmpAltPhoneNo
           ,@CurrentSystemInUse
           ,@howdidyouhearaboutus
           ,@SentNewProductsEmails
           ,@Agreetotermsandconditions
           ,GETDATE()
           ,case when @cmpid Is null then 1 else 0 end
           ,@userPhoto
           ,@CmpLogo)


--select @cmpcode = 'CMP00' + ltrim(rtrim(STR((max(Id)+1)))) from company


if @cmpid is null
begin

select @cmpCount = count(*) from company where upper(emailid) = upper(@CmpEmailAddress)

if @cmpCount > 0 
begin
RAISERROR ('Company with emailid already exists',16,1); 
end

--[dbo].[InsUpdDelCompany](@Id int,@Name varchar(50),@active int,@code varchar(50),@desc varchar(50) = null,@Address varchar(500),@EmailId varchar(50),
--@ContactNo1 varchar(50),@ContactNo2 varchar(50)= null,@Fax varchar(50)= null,@Title varchar(50)= null,@Caption varchar(50)= null,@Country varchar(50)= null,
--@ZipCode varchar(10) = null,@State varchar(50) = null,@FleetSize int = null,@StaffSize int = null,@AlternateAddress varchar(500) = null,@logo varchar(max) = null,
--@insupdflag varchar(1),@userid int = -1)
declare @cmpcode varchar(15)
select @cmpcode = 'CMP'+replace(CONVERT(VARCHAR(20), GETDATE(), 108),':','') 

exec InsUpdDelCompany -1,@CompanyName,1, @cmpcode, null,@CmpAddress,@CmpEmailAddress,@CmpPhoneNo,@CmpAltPhoneNo,@CmpFax,@CmpTitle,@CmpCaption,@Country,@ZipCode,@state,@FleetSize,@StaffSize,@CmpAltAddress,@CmpLogo,'I',-1

end

select @cmpid = id from company where upper(name) = upper(@CompanyName)


--exec [InsupdCreateFleetOwner] -1,@FirstName,@LastName,@EmailAddress,@PhoneNo,@CompanyName,@Description,@insupdflag

--[dbo].[InsUpdUsers](@FirstName varchar(40),@LastName varchar(40),@MiddleName varchar(40) = null,@EmpNo varchar(15) = null,@Email varchar(40) = null
--,@Address varchar(250) = null,@AltAddress varchar(250) = null,@ContactNo1 varchar(15) = null,@ContactNo2 varchar(15) = null,@RoleId int,@cmpId int
--,@Active int,@DUserName varchar(30)  = null,@DPassword varchar(30)  = null,@insupdflag varchar(10),@ManagerId int = null,@userid int = -1
--,@ZipCode varchar(10) = null,@StateId int = 0,@CountryId int = 0,@GenderId int = 0,@RFromDate Datetime = null,@RToDate Datetime = null,@photo varchar(max) = null)
select @foCount = COUNT(*) from Users u where upper(u.EmailId) = upper(@EmailAddress)

if @foCount > 0 
begin
RAISERROR ('Fleet owner with emailid already exists',16,1); 
end

--generate a fleet owner code and insert
declare @fc varchar(20)
select @fc =  'FL'+replace(CONVERT(VARCHAR(20), GETDATE(), 108),':','') 

exec [InsUpdUsers] @FirstName,@LastName,@MiddleName,null,@EmailAddress,@Address,null,@PhoneNo,null,6,@cmpid,1,@fc,@fc,'I',null,-1,@ZipCode,@state,@Country,@Gender,null,null,null

select FleetOwnerCode from dbo.FleetOwner f 
inner join Users u on u.Id = f.UserId
where u.FirstName = @FirstName and u.LastName = @LastName and u.EmailId = @EmailAddress


END
GO
/****** Object:  StoredProcedure [dbo].[InSupdFleetOwnerRequestDetails]    Script Date: 08/04/2017 19:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InSupdFleetOwnerRequestDetails](
		  @FirstName varchar(50),   
		  @MiddleName varchar(50) = null,
          @LastName varchar(50),
          @EmailAddress varchar(50),
          @PhoneNo  varchar(20), 
          @Gender int,  
          @Address varchar(250),  
          @userPhoto varchar(max) = null,
          @AltPhoneNo varchar(20) = null,                    
           
           
          @CompanyName varchar(50),
          @Code varchar(50),
          @CmpEmailAddress varchar(50),
          @CmpTitle varchar(50) = null,   
          @CmpCaption varchar(50) = null,   
          @CmpPhoneNo varchar(20),     
          @CmpAltPhoneNo varchar(20) = null,  
                   
          @FleetSize int = 0, 
		  @StaffSize int = 0,
		  @Country int,
		  @state int,	  
		  
		  @CmpFax varchar(50) = null,   
		  @CmpAddress varchar(500),
		  @CmpAltAddress varchar(500) = null,   
		  
	      @ZipCode varchar(20) = null,   
	      @CmpLogo varchar(max) = null,     
       
          @CurrentSystemInUse varchar(50) = null,
          @SentNewProductsEmails bit = 0,      
          @howdidyouhearaboutus varchar(50) = null,
          @Agreetotermsandconditions bit = 0
 ) 
AS
BEGIN	

declare 
@cmpid int,@foCount int = 0,@cmpCount int = 0, @UId varchar(10)

select @UId = replace(CONVERT(VARCHAR(20), GETDATE(), 114),':','') 


select @cmpid = id from company where upper(name) = upper(@CompanyName)

INSERT INTO [POSDashboard].[dbo].[FleetOwnerRequestDetails]
           ([FirstName]
           ,[MiddleName]
           ,[LastName]
           ,[PhoneNo]
           ,[AltPhoneNo]
           ,[EmailAddress]
           ,[Address]
           ,[Gender]
           ,[CompanyName]
           ,[CmpEmailAddress]
           ,[CmpTitle]
           ,[CmpCaption]
           ,[FleetSize]
           ,[StaffSize]
           ,[Country]
           ,[Code]
           ,[CmpFax]
           ,[CmpAddress]
           ,[CmpAltAddress]
           ,[state]
           ,[ZipCode]
           ,[CmpPhoneNo]
           ,[CmpAltPhoneNo]
           ,[CurrentSystemInUse]
           ,[howdidyouhearaboutus]
           ,[SendNewProductsEmails]
           ,[Agreetotermsandconditions]
           ,[CreatedOn]
           ,[IsNewCompany]
           ,[userPhoto]
           ,[CmpLogo])
     VALUES
           (@FirstName
           ,@MiddleName
           ,@LastName
           ,@PhoneNo
           ,@AltPhoneNo
           ,@EmailAddress
           ,@Address
           ,@Gender
           ,@CompanyName
           ,@CmpEmailAddress
           ,@CmpTitle
           ,@CmpCaption
           ,@FleetSize
           ,@StaffSize
           ,@Country
           ,@Code
           ,@CmpFax
           ,@CmpAddress
           ,@CmpAltAddress
           ,@state
           ,@ZipCode
           ,@CmpPhoneNo
           ,@CmpAltPhoneNo
           ,@CurrentSystemInUse
           ,@howdidyouhearaboutus
           ,@SentNewProductsEmails
           ,@Agreetotermsandconditions
           ,GETDATE()
           ,case when @cmpid Is null then 1 else 0 end
           ,@userPhoto
           ,@CmpLogo)


--select @cmpcode = 'CMP00' + ltrim(rtrim(STR((max(Id)+1)))) from company


if @cmpid is null
begin

select @cmpCount = count(*) from company where upper(emailid) = upper(@CmpEmailAddress)

if @cmpCount > 0 
begin
RAISERROR ('Company with emailid already exists',16,1); 
end

--[dbo].[InsUpdDelCompany](@Id int,@Name varchar(50),@active int,@code varchar(50),@desc varchar(50) = null,@Address varchar(500),@EmailId varchar(50),
--@ContactNo1 varchar(50),@ContactNo2 varchar(50)= null,@Fax varchar(50)= null,@Title varchar(50)= null,@Caption varchar(50)= null,@Country varchar(50)= null,
--@ZipCode varchar(10) = null,@State varchar(50) = null,@FleetSize int = null,@StaffSize int = null,@AlternateAddress varchar(500) = null,@logo varchar(max) = null,
--@insupdflag varchar(1),@userid int = -1)
declare @cmpcode varchar(15)
select @cmpcode = 'CMP'+replace(CONVERT(VARCHAR(20), GETDATE(), 108),':','') 

exec InsUpdDelCompany -1,@CompanyName,1, @cmpcode, null,@CmpAddress,@CmpEmailAddress,@CmpPhoneNo,@CmpAltPhoneNo,@CmpFax,@CmpTitle,@CmpCaption,@Country,@ZipCode,@state,@FleetSize,@StaffSize,@CmpAltAddress,@CmpLogo,'I',-1

end

select @cmpid = id from company where upper(name) = upper(@CompanyName)


--exec [InsupdCreateFleetOwner] -1,@FirstName,@LastName,@EmailAddress,@PhoneNo,@CompanyName,@Description,@insupdflag

--[dbo].[InsUpdUsers](@FirstName varchar(40),@LastName varchar(40),@MiddleName varchar(40) = null,@EmpNo varchar(15) = null,@Email varchar(40) = null
--,@Address varchar(250) = null,@AltAddress varchar(250) = null,@ContactNo1 varchar(15) = null,@ContactNo2 varchar(15) = null,@RoleId int,@cmpId int
--,@Active int,@DUserName varchar(30)  = null,@DPassword varchar(30)  = null,@insupdflag varchar(10),@ManagerId int = null,@userid int = -1
--,@ZipCode varchar(10) = null,@StateId int = 0,@CountryId int = 0,@GenderId int = 0,@RFromDate Datetime = null,@RToDate Datetime = null,@photo varchar(max) = null)
select @foCount = COUNT(*) from Users u where upper(u.EmailId) = upper(@EmailAddress)

if @foCount > 0 
begin
RAISERROR ('Fleet owner with emailid already exists',16,1); 
end

--generate a fleet owner code and insert
declare @fc varchar(20)
select @fc =  'FL'+replace(CONVERT(VARCHAR(20), GETDATE(), 108),':','') 

exec [InsUpdUsers] @FirstName,@LastName,@MiddleName,null,@EmailAddress,@Address,null,@PhoneNo,null,6,@cmpid,1,@fc,@fc,'I',null,-1,@ZipCode,@state,@Country,@Gender,null,null,null

select FleetOwnerCode from dbo.FleetOwner f 
inner join Users u on u.Id = f.UserId
where u.FirstName = @FirstName and u.LastName = @LastName and u.EmailId = @EmailAddress


END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCompany]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCompany]    Script Date: 05/04/2016 17:22:18 ******/
CREATE procedure [dbo].[InsUpdDelCompany](
@Id int=null,
@Name varchar(50),
@active int,
@code varchar(50),
@desc varchar(50) = null,
@Address varchar(500),
@EmailId varchar(50),
@ContactNo1 varchar(50),
@ContactNo2 varchar(50)= null,
@Fax varchar(50)= null,
@Title varchar(50)= null,
@Caption varchar(50)= null,
@Country varchar(50)= null,
@ZipCode varchar = null,
@State varchar(50) = null,
@FleetSize int = null,
@StaffSize int = null,
@AlternateAddress varchar(500) = null,
@logo varchar(max) = null,
@insupdflag varchar(1),
@userid int = -1
)
as
begin
declare @cnt int
declare @edithistoryid int
set @cnt = 0

declare @newCmpId int
set @newCmpId = 0;

declare @dt datetime
set @dt = GETDATE()

declare @neweid int



if @insupdflag = 'I'
		begin
			--check if already company exists
			select @cnt = count(1) from company where upper(name) = upper(@name)

			if @cnt = 0 
			begin
			insert into Company (active,code,[desc],Name,Address,ContactNo1,ContactNo2,Fax,EmailId,Title,Caption,Country,ZipCode,State,StaffSize,FleetSize,AlternateAddress,Logo)
			 values(@active,@code,@desc,@Name,@Address,@ContactNo1,@ContactNo2,@Fax,@EmailId,@Title,@Caption,@Country,@ZipCode,@State,@StaffSize,@FleetSize,@AlternateAddress,@logo)
			
			SELECT @newCmpId = SCOPE_IDENTITY()
			
			--insert into edit history
			exec InsEditHistory 'Company', 'Name',@Name,'Company creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		           
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null
			exec InsEditHistoryDetails @edithistoryid,null,@code,'Insertion','Code',null
			exec InsEditHistoryDetails @edithistoryid,null,@desc,'Insertion','Desc',null
			exec InsEditHistoryDetails @edithistoryid,null,@active,'Insertion','Active',null

		  --  --insert Fleet owner role by default
				--insert Fleet owner role by default
				 exec  InsUpdDelCompanyRoles 1,-1,6,@newCmpId,0 
				--insert Supervisor role by default
				 exec  InsUpdDelCompanyRoles 1,-1,7,@newCmpId,0 
				--insert Manager role by default
				 exec  InsUpdDelCompanyRoles 1,-1,8,@newCmpId,0 
				--insert Fleet Conductor role by default
				 exec  InsUpdDelCompanyRoles 1,-1,9,@newCmpId,0 
				--insert Fleet Ticket Salesperson Front Office by default
				 exec  InsUpdDelCompanyRoles 1,-1,10,@newCmpId,0 
				--insert Guest User role by default
				 exec  InsUpdDelCompanyRoles 1,-1,12,@newCmpId,0 
				--insert Fleet driver role by default
				 exec  InsUpdDelCompanyRoles 1,-1,13,@newCmpId,0 
		   
				 --declare @m varchar(500)
			--set @m = 'Company '+@Name+' created successfully.'
			--exec InsUpdDelNotification @dt,@m,-1,-1,1,'Admin','fleet owner creation'
			
	        --set @m = 'fleet owner '+'FL00'+@fc+' created successfully.'
	       -- exec InsUpdDelNotification @dt,@m,-1,-1,1,'Admin','fleet owner creation'
		   
			end
			else
			RAISERROR ('Company already exists',16,1); 
		end
else

   if @insupdflag = 'U'
		begin
				--check if already a company with the new name exists
				select @cnt = count(1) from company where upper(name) = upper(@name) and id <> @id
			    
				if @cnt = 0 
				begin
					update Company
					set Name = @Name, code = @code, [desc] = @desc,Address =@Address,EmailId = @EmailId,ContactNo1 =@ContactNo1,ContactNo2=@ContactNo2,Fax=@Fax,Title=@Title
					,Caption=@Caption,Country=@Country,ZipCode=@ZipCode,State=@State,FleetSize=@FleetSize,StaffSize=@StaffSize
					,AlternateAddress=@AlternateAddress,Logo=@logo,active = @active
					where Id = @Id						
						
						--insert into edit history
					exec InsEditHistory 'Company', 'Name',@Name,'Company creation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output
				           
					exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null
					exec InsEditHistoryDetails @edithistoryid,null,@code,'Insertion','Code',null
					exec InsEditHistoryDetails @edithistoryid,null,@desc,'Insertion','Desc',null					
					exec InsEditHistoryDetails @edithistoryid,null,@active,'Insertion','Active',null
				
				end
				else
					RAISERROR ('Company already exists',16,1);
		end
   else
	if @insupdflag = 'D'
	begin
     delete from Company where Id = @Id
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsupdCreateFleetOwner]    Script Date: 08/04/2017 19:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsupdCreateFleetOwner]
	-- Add the parameters for the stored procedure here
	(@Id int,
           @FirstName varchar(30),
           @LastName varchar(30)
           ,@Email varchar(30)
           ,@MobileNo varchar(30)
           ,@CompanyName varchar(30)
           ,@Description varchar(30) = null,
           @insupdflag varchar(10),@CompanyGroupId int=-1)
           
AS 
BEGIN
declare @currid int
 declare @cnt int 
set @cnt = 0
declare @cmpcnt int
set @cmpcnt = 0
 declare @fleetcnt int
set @fleetcnt = 0
 declare @edithistoryid int

declare @cmpid int
set @cmpid = 0
declare @dt datetime
set @dt = GETDATE()
 
 declare @fc varchar(15) 
 set @fc = case when (select COUNT(*) from fleetowner) = 0
                           then '1' 
                           else (select ltrim(rtrim(STR((max(Id)+1)))) from fleetowner ) 
                           end  
 
 
 select @cnt=COUNT (*) from Users where upper(FirstName)=upper(@FirstName) and upper(lastname) = upper(@LastName)
 select @cmpcnt=COUNT (*) from Company where UPPER (Name)=upper(@CompanyName)
 select @fleetcnt=COUNT (*) from FleetOwner where UPPER (FleetOwnerCode)=@fc

 	
 if @cmpcnt=0
 begin
  insert into Company 
           ([Name]
           ,[Code]
           ,[Desc]
           ,[Active])      
     VALUES
           (@CompanyName,@CompanyName,@Description,1)
           
     --insert into edit history
	exec InsEditHistory 'Company', 'Name',@FirstName,'Company creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
           
    exec InsEditHistoryDetails @edithistoryid,null,@CompanyName,'Insertion','CompanyName',null
    exec InsEditHistoryDetails @edithistoryid,null,@cnt,'Insertion','cnt',null
    exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
          
           
           set @cmpid = SCOPE_IDENTITY()
 end
 else
 begin  
   SELECT @cmpid = Id from Company where UPPER (Name)=@CompanyName
   
 end
   
 
 
 if @insupdflag='I' and @cnt>0
 begin
 begin
 RAISERROR ('Already user exists',16,1);
 end
 
 if @cnt=0
 begin
 
   insert into Users (FirstName,
   LastName,MiddleName, EmpNo,EmailId,[Address],ContactNo1,Active,CompanyId)
   values(@FirstName,@LastName,null,'FL00'+@fc,@Email,null,@MobileNo,1,@cmpid) 
          
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--insert into edit history
	exec InsEditHistory 'Users', 'Name',@FirstName,'User creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
	
    exec InsEditHistoryDetails @edithistoryid,null,@FirstName,'Insertion','First Name',null
    exec InsEditHistoryDetails @edithistoryid,null,@LastName,'Insertion','Last Name',null
    exec InsEditHistoryDetails @edithistoryid,null,@cmpid,'Insertion','cmpid',null
    exec InsEditHistoryDetails @edithistoryid,null,@Email,'Insertion','Email',null
	
	SELECT @currid = SCOPE_IDENTITY()
end

	

   
   --insert company role for company and fleet owner role
  exec  InsUpdDelCompanyRoles 1,-1,6,@cmpid,0 
    end             
 if @insupdflag='I'and @fleetcnt>0
 begin
	RAISERROR ('Already FleetOwner exists',16,1);
 end
 
 if @fleetcnt=0
 begin
	insert into FleetOwner (UserId,CompanyId,FleetOwnerCode,Active) values(@currid,@cmpid,'FL00'+@fc,1)
 end

--assign fleet owner role to user
exec [InsUpdDelUserRoles] -1,6,@currid,@cmpid,'I'

--declare @logincnt int

----the login will be assigned once the user buys the license. this is for testing
--select @logincnt = COUNT(*) from userlogins where upper(logininfo) = 'FL00'+@fc

-- if @logincnt = 0
--   begin
--	insert into userlogins(logininfo,PassKey,active,userid)values('FL00'+@fc,'FL00'+@fc,1,@currid)
--   end
   --insert into edit history

end
GO
/****** Object:  StoredProcedure [dbo].[GetAppUserPaymentModes]    Script Date: 10/16/2017 18:42:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[GetAppUserPaymentModes]
@Accountnumber varchar(50)
As
Begin
SELECT [Id]
      ,[Accountnumber]
      ,[InstitutionName]
      ,[InstituteCode]
      ,[CustomerCode]
      ,[IsPrimary]
      ,[PymentType]
      ,[CustomerId]
  FROM [POSDashboard].[dbo].[AppUserPaymentModes]
  Where Accountnumber = @Accountnumber
End
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelAppUserPaymentModes]    Script Date: 10/16/2017 18:43:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InsUpdDelAppUserPaymentModes]
 @Flag varchar,
 @Id int=-1
      ,@Accountnumber varchar(50)= NULL
      ,@InstitutionName varchar(50)= NULL
      ,@InstituteCode varchar(60) = NULL
      ,@CustomerCode varchar(60) = NULL
      ,@IsPrimary int = NULL
      ,@PymentType int = NULL
      ,@CustomerId int = NULL
      As
      Begin
      If(@Flag='I')
      Begin
      INSERT INTO [POSDashboard].[dbo].[AppUserPaymentModes]
           ([Accountnumber]
           ,[InstitutionName]
           ,[InstituteCode]
           ,[CustomerCode]
           ,[IsPrimary]
           ,[PymentType]
           ,[CustomerId])
     VALUES
           (@Accountnumber
           ,@InstitutionName
           ,@InstituteCode
           ,@CustomerCode
           ,@IsPrimary
           ,@PymentType
           ,@CustomerId)
      End
      If (@Flag='U')
      Begin
      UPDATE [POSDashboard].[dbo].[AppUserPaymentModes]
   SET [Accountnumber] = @Accountnumber
      ,[InstitutionName] = @InstitutionName
      ,[InstituteCode] = @InstituteCode
      ,[CustomerCode] = @CustomerCode
      ,[IsPrimary] = @IsPrimary
      ,[PymentType] = @PymentType
      ,[CustomerId] = @CustomerId
 WHERE Id = @Id
End
If (@Flag='U')
Begin
DELETE FROM [POSDashboard].[dbo].[AppUserPaymentModes]
      WHERE Id = @Id
End
      End
      
GO