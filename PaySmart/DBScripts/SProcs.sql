USE [Paysmart]
GO
/****** Object:  StoredProcedure [dbo].[HVcancelbooking]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVcancelbooking]
GO
/****** Object:  StoredProcedure [dbo].[HVdrivers]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVdrivers]
GO
/****** Object:  StoredProcedure [dbo].[HVgetdriver]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVgetdriver]
GO
/****** Object:  StoredProcedure [dbo].[HVgetdrivermaster]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVgetdrivermaster]
GO
/****** Object:  StoredProcedure [dbo].[HVGetHistory]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVGetHistory]
GO
/****** Object:  StoredProcedure [dbo].[HVgetnearestvehicles]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVgetnearestvehicles]
GO
/****** Object:  StoredProcedure [dbo].[HVgetprice]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVgetprice]
GO
/****** Object:  StoredProcedure [dbo].[HVgetvehilcetypes]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVgetvehilcetypes]
GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdbooking]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVInsUpdbooking]
GO
/****** Object:  StoredProcedure [dbo].[HVMOTPverification]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVMOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[HVprebookingdetails]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVprebookingdetails]
GO
/****** Object:  StoredProcedure [dbo].[PSbookingdetail]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[PSbookingdetail]
GO
/****** Object:  StoredProcedure [dbo].[PSChangePwd]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[PSChangePwd]
GO
/****** Object:  StoredProcedure [dbo].[PSdocuments]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[PSdocuments]
GO
/****** Object:  StoredProcedure [dbo].[PSdrivers]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[PSdrivers]
GO
/****** Object:  StoredProcedure [dbo].[PSEOTPverification]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[PSEOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[PSGetalltickets]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[PSGetalltickets]
GO
/****** Object:  StoredProcedure [dbo].[PSGetAllUserTickets]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[PSGetAllUserTickets]
GO
/****** Object:  StoredProcedure [dbo].[PSGetBookingHistory]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[PSGetBookingHistory]
GO
/****** Object:  StoredProcedure [dbo].[PSgetcountry]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[PSgetcountry]
GO
/****** Object:  StoredProcedure [dbo].[PSgetcurrency]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[PSgetcurrency]
GO
/****** Object:  StoredProcedure [dbo].[PSGetDownloadCount]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetDownloadCount]
GO
/****** Object:  StoredProcedure [dbo].[PSgetdriver]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSgetdriver]
GO
/****** Object:  StoredProcedure [dbo].[PSgetdrivermaster]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSgetdrivermaster]
GO
/****** Object:  StoredProcedure [dbo].[PSGetfaqs]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetfaqs]
GO
/****** Object:  StoredProcedure [dbo].[PSGetFileContent]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetFileContent]
GO
/****** Object:  StoredProcedure [dbo].[PSGetfiledetails]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetfiledetails]
GO
/****** Object:  StoredProcedure [dbo].[PSgethelp]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSgethelp]
GO
/****** Object:  StoredProcedure [dbo].[PSGetHistory]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetHistory]
GO
/****** Object:  StoredProcedure [dbo].[PSgetlogin]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSgetlogin]
GO
/****** Object:  StoredProcedure [dbo].[PSgetnearestvehicles]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSgetnearestvehicles]
GO
/****** Object:  StoredProcedure [dbo].[PSgetpalce]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSgetpalce]
GO
/****** Object:  StoredProcedure [dbo].[PSgetpaysmart]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSgetpaysmart]
GO
/****** Object:  StoredProcedure [dbo].[PSgetprice]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSgetprice]
GO
/****** Object:  StoredProcedure [dbo].[PSGetsp_Availableseats]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetsp_Availableseats]
GO
/****** Object:  StoredProcedure [dbo].[PSGetstops]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetstops]
GO
/****** Object:  StoredProcedure [dbo].[PSGetTicketDetails]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetTicketDetails]
GO
/****** Object:  StoredProcedure [dbo].[PSGetTicketHistory]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetTicketHistory]
GO
/****** Object:  StoredProcedure [dbo].[PSGettickets]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGettickets]
GO
/****** Object:  StoredProcedure [dbo].[PSgettypes]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSgettypes]
GO
/****** Object:  StoredProcedure [dbo].[PSGetusercards]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetusercards]
GO
/****** Object:  StoredProcedure [dbo].[PSSTARTBOOKING_VALUE]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSSTARTBOOKING_VALUE]
GO
/****** Object:  StoredProcedure [dbo].[PStravelling]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PStravelling]
GO
/****** Object:  StoredProcedure [dbo].[PSUserlocations]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSUserlocations]
GO
/****** Object:  StoredProcedure [dbo].[PSValidateCred]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSValidateCred]
GO
/****** Object:  StoredProcedure [dbo].[PSValidateCredentials]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSValidateCredentials]
GO
/****** Object:  StoredProcedure [dbo].[PSVehicles]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSVehicles]
GO
/****** Object:  StoredProcedure [dbo].[PSGetUserpreferences]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetUserpreferences]
GO
/****** Object:  StoredProcedure [dbo].[PSGetusertickets]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetusertickets]
GO
/****** Object:  StoredProcedure [dbo].[PSgetvehiclemaster]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSgetvehiclemaster]
GO
/****** Object:  StoredProcedure [dbo].[PSgetvehilcetypes]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSgetvehilcetypes]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdAdd]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsupdAdd]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdallocatedriver]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsUpdallocatedriver]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdAppusers]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsUpdAppusers]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdBiopw]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsupdBiopw]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdbooking]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsUpdbooking]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelEOTPverification]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsUpdDelEOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelMOTPverification]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsUpdDelMOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelPasswordverification]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsUpdDelPasswordverification]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelplace]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsUpdDelplace]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDeltypes]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsUpdDeltypes]
GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdFaqs]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsUpdFaqs]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdTroubleTicket]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsupdTroubleTicket]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUsercard]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsupdUsercard]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUserdownloads]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsupdUserdownloads]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUserPreferences]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsupdUserPreferences]
GO
/****** Object:  StoredProcedure [dbo].[PSMOTPverification]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSMOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[PSMOTPverifying]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSMOTPverifying]
GO
/****** Object:  StoredProcedure [dbo].[PSPasswordreset]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSPasswordreset]
GO
/****** Object:  StoredProcedure [dbo].[PSPasswordverification]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSPasswordverification]
GO
/****** Object:  StoredProcedure [dbo].[PSprebookingdetails]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSprebookingdetails]
GO
/****** Object:  StoredProcedure [dbo].[PSRetrivePassword]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSRetrivePassword]
GO
/****** Object:  StoredProcedure [dbo].[HVtravelling]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVtravelling]
GO
/****** Object:  StoredProcedure [dbo].[HVUserlocations]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVUserlocations]
GO
/****** Object:  StoredProcedure [dbo].[HVVehicles]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVVehicles]
GO
/****** Object:  StoredProcedure [dbo].[PSsp_InsPaymentDetails]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSsp_InsPaymentDetails]
GO
/****** Object:  StoredProcedure [dbo].[PSsp_addextendedproc]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSsp_addextendedproc]
GO
/****** Object:  StoredProcedure [dbo].[PSsp_dropextendedproc]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSsp_dropextendedproc]
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUserinfo]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSInsupdUserinfo]
GO
/****** Object:  StoredProcedure [dbo].[PSgetdetails]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[PSgetdetails]
GO
/****** Object:  StoredProcedure [dbo].[PSGetUserinfo]    Script Date: 06/10/2017 11:53:42 ******/
DROP PROCEDURE [dbo].[PSGetUserinfo]
GO
/****** Object:  StoredProcedure [dbo].[HVsp_InsCustomerDetails]    Script Date: 06/10/2017 11:53:41 ******/
DROP PROCEDURE [dbo].[HVsp_InsCustomerDetails]
GO
/****** Object:  StoredProcedure [dbo].[HVsp_InsCustomerDetails]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[HVsp_InsCustomerDetails] 
	 
     @Pnr_No varchar(20),@Pnr_Id int,
     @Fname varchar(30),@Lname varchar(30), @Age int, @Sex int,@datetime varchar

(30), @Identityproof 
varchar(30)
AS
BEGIN	
	SET NOCOUNT ON;
INSERT INTO CustomerDetails
          (Fname,Lname,Age,Sex,datetime,Pnr_Id,Pnr_No,Identityproof) 
     VALUES 
          (@Fname,@Lname,@Age,@Sex,@datetime,@Pnr_Id,@Pnr_No,@Identityproof) 
END
GO
/****** Object:  StoredProcedure [dbo].[PSGetUserinfo]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetdetails]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSgetdetails]
as
begin
select*from uer
end
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUserinfo]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSsp_dropextendedproc]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSsp_addextendedproc]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSsp_InsPaymentDetails]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[HVVehicles]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVVehicles]
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
/****** Object:  StoredProcedure [dbo].[HVUserlocations]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVUserlocations]
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
/****** Object:  StoredProcedure [dbo].[HVtravelling]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[HVtravelling]
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
/****** Object:  StoredProcedure [dbo].[PSRetrivePassword]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSprebookingdetails]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSPasswordverification]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSPasswordreset]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSMOTPverifying]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSMOTPverification]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsupdUserPreferences]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsupdUserdownloads]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsupdUsercard]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsupdTroubleTicket]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdFaqs]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdDeltypes]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelplace]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelPasswordverification]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelMOTPverification]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelEOTPverification]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdbooking]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsupdBiopw]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdAppusers]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdallocatedriver]    Script Date: 06/10/2017 11:53:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PSInsUpdallocatedriver]
@flag varchar,@SlNo int,@EntryDate datetime = null,@BookingNo int = null,@ReqDate datetime = null
,@ReqTime datetime = null,@CallTime datetime = null,@CustomerName nvarchar(255)= null,@CusID nvarchar(255) = null
,@PhoneNo nvarchar(255) = null,@AltPhoneNo nvarchar(255) = null,@Address nvarchar(max) = null,@PickupAddress nvarchar(max) = null,@LandMark nvarchar(255) = null,@PickupPlace nvarchar(255) = null,@DropPlace nvarchar(255) = null,@Package nvarchar(255)= null,@VehicleType nvarchar(255)= NULL,@NoofVehicle int = NULL,@VechID int = NULL,@RegistrationNo nvarchar(255)= NULL,@DriverName nvarchar(255)= NULL,@PresentDriverLandMark nvarchar(255) =NULL,@ExecutiveName nvarchar(255)=NULL

AS
BEGIN
declare @dt datetime
set @dt = GETDATE()

    if @flag='i'
	begin
	insert into dbo.VehicleAssign
	([EntryDate] ,[BookingNo],[ReqDate],[ReqTime] ,[CallTime] ,[CustomerName] ,[CusID], [PhoneNo],[AltPhoneNo],[Address],[PickupAddress],[LandMark],[PickupPlace],[DropPlace],[Package],[VehicleType],[NoofVehicle],[RegistrationNo],[DriverName],[PresentDriverLandMark],[ExecutiveName])	values
	( @dt ,@BookingNo ,@dt,@dt ,@dt ,@CustomerName ,@CusID ,@PhoneNo,@AltPhoneNo,@Address,@PickupAddress,@LandMark,@PickupPlace,@DropPlace,@Package,@VehicleType,@NoofVehicle,@RegistrationNo,@DriverName,@PresentDriverLandMark,@ExecutiveName)
	end
	if @flag='u'
	begin   
	
	
	Update  [dbo].[VehicleAssign]
	set  
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
	[VechID] =@VechID,
	[RegistrationNo] =@RegistrationNo,
	[DriverName] =@DriverName,
	[PresentDriverLandMark] =@PresentDriverLandMark,
	[ExecutiveName] =@ExecutiveName	
	from VehicleAssign where BookingNo =@BookingNo
	end
	
	select [EntryDate] ,[ReqDate],[ReqTime] ,[CallTime] ,[CustomerName] ,[CusID], [PhoneNo],[Address],[PickupAddress],[LandMark],[PickupPlace],[DropPlace],[Package],[VehicleType],[NoofVehicle],[RegistrationNo],[DriverName],[PresentDriverLandMark],[ExecutiveName] from VehicleAssign where BookingNo =@BookingNo
END
GO
/****** Object:  StoredProcedure [dbo].[PSInsupdAdd]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetvehilcetypes]    Script Date: 06/10/2017 11:53:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetvehilcetypes]
@VID int 
as
begin
select * from VechileMaster where VID = @VID
end
GO
/****** Object:  StoredProcedure [dbo].[PSgetvehiclemaster]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetusertickets]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetUserpreferences]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSVehicles]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSValidateCredentials]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSValidateCred]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSUserlocations]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PStravelling]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSSTARTBOOKING_VALUE]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetusercards]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgettypes]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGettickets]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetTicketHistory]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetTicketDetails]    Script Date: 06/10/2017 11:53:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetTicketDetails]
@TicketId int
as
begin
 select * from TroubleTicket where id = @ticketid
select * from Resoultionhistory where TicketId = @TicketId
 end
GO
/****** Object:  StoredProcedure [dbo].[PSGetstops]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetsp_Availableseats]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetprice]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetpaysmart]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetpalce]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetnearestvehicles]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetlogin]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetHistory]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgethelp]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetfiledetails]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetFileContent]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetfaqs]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetdrivermaster]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetdriver]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetDownloadCount]    Script Date: 06/10/2017 11:53:42 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetcurrency]    Script Date: 06/10/2017 11:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetcountry]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSgetcountry]
as
begin
select* from country
end
GO
/****** Object:  StoredProcedure [dbo].[PSGetBookingHistory]    Script Date: 06/10/2017 11:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetAllUserTickets]    Script Date: 06/10/2017 11:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetalltickets]    Script Date: 06/10/2017 11:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[PSEOTPverification]    Script Date: 06/10/2017 11:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[PSdrivers]    Script Date: 06/10/2017 11:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[PSdocuments]    Script Date: 06/10/2017 11:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[PSChangePwd]    Script Date: 06/10/2017 11:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[PSbookingdetail]    Script Date: 06/10/2017 11:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[HVprebookingdetails]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVprebookingdetails]
@PartyName varchar(255)
as
begin
select  PickupPlace,DropPlace,EntryDate,EntryTime from ClosingReport where PartyName = @PartyName
select status from Customer_SMS_booking
select vechType from AvilableVehicle

end
GO
/****** Object:  StoredProcedure [dbo].[HVMOTPverification]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVMOTPverification]
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
/****** Object:  StoredProcedure [dbo].[HVInsUpdbooking]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[HVInsUpdbooking]
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
/****** Object:  StoredProcedure [dbo].[HVgetvehilcetypes]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[HVgetvehilcetypes]
@VID int 
as
begin
select * from VechileMaster where VID = @VID
end
GO
/****** Object:  StoredProcedure [dbo].[HVgetprice]    Script Date: 06/10/2017 11:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[HVgetnearestvehicles]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVgetnearestvehicles]
@PhoneNo nvarchar(50)
as
begin
select  latitude,longitude from StartBooking where PhoneNo = @PhoneNo
select Type from VechileMaster
end
GO
/****** Object:  StoredProcedure [dbo].[HVGetHistory]    Script Date: 06/10/2017 11:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[HVgetdrivermaster]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVgetdrivermaster]
@DId int
as
begin
select * from DriverMaster where DId = @DId
end
GO
/****** Object:  StoredProcedure [dbo].[HVgetdriver]    Script Date: 06/10/2017 11:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[HVdrivers]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVdrivers]
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
/****** Object:  StoredProcedure [dbo].[HVcancelbooking]    Script Date: 06/10/2017 11:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVcancelbooking]
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
