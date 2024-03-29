USE [Paysmart]
GO
/****** Object:  StoredProcedure [dbo].[AddNewCardData2]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNewCardData2](
@CardNumber int,
@CardModel int,
@CardType int,
@CardCategory int,
@flag varchar)
as
 begin
 
 if @flag='I'
 begin
 insert into AddNewCardData1([CardNumber],[CardModel],[CardType],[CardCategory]) 
 values(@CardNumber,@CardModel,@CardType,@CardCategory)
 end
 if @flag = 'U'
 begin
 update AddNewCardData1 set
 CardNumber=@CardNumber,
 CardModel=@CardModel,
 CardType=@CardType,
 CardCategory=@CardCategory where CardModel=@CardModel
 end
 
 end


GO
/****** Object:  StoredProcedure [dbo].[CancelStaleRequests]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CancelStaleRequests]
as
 begin 

update
 [dbo].[PSVehicleBookingDetails] 
 set BookingStatus = 'Cancelled'
 ,CancelledBy = 'System'
 ,CancelledOn = GETDATE()
 ,Reasons = 4
where (lower(BookingType)='currentbooking' and DATEDIFF(minute,BookedTime, cast(GETDATE() as time) ) > 5)
 or (  lower(BookingType)='advancebooking' and DepartueDate = GETDATE() and DATEDIFF(minute,BookedTime, cast(GETDATE() as time)) > 5)
 and lower(BookingStatus) = 'To be accepted'

update PSVehicleBookingHistory
set 
Status = 'Cancelled'
where bno in ( select bno from [PSVehicleBookingDetails] where BookingStatus = 'Cancelled')

end


GO
/****** Object:  StoredProcedure [dbo].[ChangePwd]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[CustomerAccountOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CustomerAccountOTPverification]
@otp varchar(10),@Mobilenumber varchar(20) = null
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Mobilenumber= @Mobilenumber

if @cnt = 0
   begin
  
				RAISERROR ('Invalid MobileNumber',16,1);
				return;
   end

else

begin

  select @cnt = COUNT(*) from CustomerAccountDetails where Otp = @otp 
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid Mobile OTP',16,1);
					return;
	end
 
  else
 
   begin
     update CustomerAccountDetails set Otp=null, OtpVerfied=1 where  [otp]  = @otp
     select 1 as status 
   end
 
end

end


GO
/****** Object:  StoredProcedure [dbo].[documents]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[DriverCredentials]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DriverCredentials] 
@DriverNo varchar(20),
@Password varchar(20)
as
	begin

declare @did int = null,@count int,@DriverId int

select @did=DId,@count = [noofattempts] from dbo.PSDriverMaster where PMobNo = @DriverNo and [Password]=@Password
	if @did is null 
		begin
	           --check if the attempts exceeded 3
	           if @count > 2 
	           begin
	             
	             update dbo.PSDriverMaster 
	             set CurrentStateId = 20
	             where PMobNo = @DriverNo
	            
	             RAISERROR ('Account is locked due to more than 3 invalid attempts',16,1);
				return;	

	           end
	           else	             
	           begin
	              update dbo.PSDriverMaster 
	             set [noofattempts] = ([noofattempts] +1)
	             where PMobNo = @DriverNo
	            
	             RAISERROR ('Invalid mobile number or password',16,1);
				 return;	
	           end 
 
		end   
		else
		begin
		      update dbo.PSDriverMaster 
	             set [noofattempts] = 0
	             where PMobNo = @DriverNo and [Password]=@Password
 --select @DriverId = DriverId from PSVehicleAssign where PhoneNo = @DriverNo
 --if @DriverId is null 
 --begin
 -- RAISERROR ('Driver is not assign to any vehicle',16,1);
 --   return;	
	-- end
 
SELECT [Id]
      ,did
      ,[VechID] as VehicleId
      ,[EffectiveDate]  fromdate
      ,[EffectiveTill] todate
      ,d.[IsVerified] 
	  ,d.[IsApproved]
  FROM [dbo].[PSDriverMaster] d 
  left outer join [dbo].[PSVehicleAssign] v
  on d.did = v.DriverId
		  where [DId] = @did

            
 
 end
 
  
		  
 end


GO
/****** Object:  StoredProcedure [dbo].[DriversVehicleAssignGroup]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DriversVehicleAssignGroup]
@flag varchar,
@DId int=-1,
@Address varchar(50)=null,
@Pin varchar(50)=null,
@PAddress varchar(50)=null,
@PPin varchar(50)=null,
@PMobNo varchar(50)=null,
@FirstName varchar(50)=null
,@LastName varchar(50)=null,
@FleetOwner varchar(50)=null,@EmailId varchar(50)=null,@DriverCode varchar(15)=null,
@CurrentStateId int,
------------------------------VehicleTable-------------------------------------------
@Id int=-1,
--@CompanyId int,
@VID int=-1,
@RegistrationNo nvarchar(50),@VehicleType nvarchar(50)=null
,@OwnerName nvarchar(50)=null
,@ChasisNo nvarchar(50)=null,@Engineno nvarchar(50)=null,
@ModelYear nvarchar(255)=null,
@EntryDate date=null,@FleetOwnerId  int = null,
@HasAC int = null,
@VehicleModelId varchar(50)=null,@VehicleGroupId varchar(50)=null
,@StatusId varchar(50) = null,@IsVerified int = null,@VehicleCode varchar(10)= null,@IsDriverOwned int = null,
@DriverId int = null,@CountryId varchar(50) = null,@VehicleMakeId varchar(50) = null
,@LayoutTypeId varchar(50)=null,@CompanyId varchar(50)=null,
-----------------------------AssignTable--------------------------------------------

@EffectiveDate date=null,
@EffectiveTill date=null
--@VehicleModelId int null,
--@ServiceTypeId int=null, 
--@VehicleGroupId int=null

as
begin
declare @cnt int,@cnt1 int,@cnt2 int, @VID1 int,@m varchar(5),@vm int, @vt int, @vgrp int, 
@vtype int,@cid int,@va int,@ctry int,@stat int,@layout int,@cmp int
set @cnt = 0
select @vm= t.Id from Types t where upper(t.Name)=UPPER(@VehicleModelId)	
	select @vgrp= t.Id from Types t where upper(t.Name)=UPPER(@VehicleGroupId)
	select @vtype= t.Id from Types t where upper(t.Name)=UPPER(@VehicleType)
	select @ctry = cc.Id from Country cc where upper(cc.Name)=UPPER(@CountryId)
	select @cmp = c.Id from Company c where upper(c.Name)=UPPER(@CompanyId)
	select @stat = t.Id from Types t where upper(t.Name)=UPPER(@StatusId)
	select @layout = t.Id from Types t where upper(t.Name)=UPPER(@LayoutTypeId)
	
set @cnt = 0
set @cnt1 = 0

declare @newCmpId int
set @newCmpId = 0;

declare @dt datetime
set @dt = GETDATE()

declare @neweid int

if @flag='I'

begin
select @cnt = count(1) from PSDriverMaster where upper(PMobNo) = upper(@PMobNo)


if @cnt = 0 
begin		
	

insert into PSDriverMaster
	(NAme,Firstname,lastname,[Address],Pin,
	PAddress ,PPin,
	PMobNo,DriverCode,Email,CountryId,CurrentStateId)	
	values
	(@FirstName+@LastName,@FirstName,@LastName,@Address,@Pin,
	@PAddress ,@PPin ,
	@PMobNo,'D'+@PMobNo,@EmailId,@ctry,@CurrentStateId)

select @DriverId = IDENT_CURRENT('PSDriverMaster')
	end
	else
	begin
			RAISERROR ('Driver already exists',16,1);
	end
	--SELECT @newCmpId = SCOPE_IDENTITY()

	-------------------vehicle---------------------
select @VID1 = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
--------------------------
select @cnt1 = COUNT(*) from PSVehicleMaster where RegistrationNo = @RegistrationNo 

	if @cnt1 > 0
		begin
				RAISERROR ('Already Vehicle registered with given RegistrationNo',16,1);
				return;
		end
----------------------
--if @cnt1=0
else
begin
	--select @vm= t.Id from Types t where upper(t.Name)=UPPER(@VehicleModelId)
	--select @vt= t.Id from Types t where upper(t.Name)=UPPER(@ServiceTypeId)
	--select @vg= t.Id from Types t where upper(t.Name)=UPPER(@VehicleGroupId)

insert into PSVehicleMaster
	([VID], [RegistrationNo],[ChasisNo],[Engineno]
	,[FleetOwnerId],[VehicleTypeId]	
	,[ModelYear],[EntryDate],[VehicleModelId],[HasAC],
	[VehicleGroupId] ,
	[StatusId] ,[IsVerified],[VehicleCode],[IsDriverOwned],
	[DriverId]
	,[CountryId],[VehicleMakeId],[LayoutTypeId],[CompanyId])	
	values
	(@VID1,@RegistrationNo,@ChasisNo,@Engineno,@FleetOwnerId,@vtype
	,@ModelYear,@EntryDate,
	@vm,@HasAC,@vgrp,@stat,@IsVerified,@VehicleCode,@IsDriverOwned,@DriverId,@ctry,@VehicleMakeId
	,@layout,@cmp)	
		
select @VID = IDENT_CURRENT('PSVehicleMaster')		
end
	--else
	--begin
	--		RAISERROR ('Vehicle already exists',16,1);
	--end
	-------------------vehicleAssign---------------------	
--select @cnt1 = COUNT(*) from PSVechileMaster where RegistrationNo = @RegistrationNo 
--if @cnt2=0	
insert into PSVehicleAssign (CompanyId, EntryDate,VehicleType, 
	 VechID, RegistrationNo,DriverName, 
	 EffectiveDate, EffectiveTill, DriverId, VehicleModelId, 
	 VehicleGroupId,Status)
values(@cmp,@EntryDate,@vtype,
	@VID,@RegistrationNo,@FirstName+@LastName,
	@EffectiveDate,@EffectiveTill,@DriverId,@vm,
	@vgrp,@stat)

END

END


GO
/****** Object:  StoredProcedure [dbo].[EOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[EWGetTransDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EWGetTransDetails]
@MobileNo varchar(20)
as
begin
SELECT 
       [Date]
      ,[Time]
      ,[Mobilenumber]
      ,[StatusId]
      ,[Amount]
      ,[Comments]
      ,[TransactionId]
      ,[TransactionMode]
      ,[GatewayId]
  FROM [dbo].[EwalletTransactions]
  
  where Mobilenumber = @MobileNo
  
	end


GO
/****** Object:  StoredProcedure [dbo].[EWInsUpdTransHistory]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE  [dbo].[EWInsUpdTransHistory]
@flag varchar,@Id int=-1,@Date date=null,@Time time =null
,@Amount decimal(18,0) = null,@GatewayId varchar(50)
,@Comments varchar(50) = null,@TransactionId varchar(50) = null,@MobileNo varchar(20),@TransactionMode int,
@StatusId int=null
AS
BEGIN

declare @cnt int,@dt date,@t time(7)
set @dt=GETDATE()
set @t = GETDATE()
       
	if @flag = 'I'
	begin
	select @cnt = COUNT(*) from Appusers where Mobilenumber = @MobileNo
	if @cnt = 0
		begin
				RAISERROR ('No User Registered with given MobileNo',16,1);
				return;	
		end   
		else
		begin
	
	insert into [dbo].[EwalletTransactions]
	([Date] ,[Time] ,[Mobilenumber] ,[GatewayId] ,[Amount] ,[Comments],[TransactionId] ,[TransactionMode],[StatusId])
	values
	(@dt ,@t ,@MobileNo,@GatewayId,@Amount,@Comments,@TransactionId,@TransactionMode,@StatusId)
	
	end
	end
	
	if @flag ='U'
	begin
	
	Update [dbo].[EwalletTransactions]
	set [Date]=@dt ,	
	[Time]= @t,	
	[Mobilenumber]= @MobileNo,
	[GatewayId]=@GatewayId ,
	[Amount]= @Amount,
	[Comments]= @Comments,
	[TransactionId]= @TransactionId,
	[TransactionMode] = @TransactionMode,
	[StatusId] = @StatusId
	where TransactionId = @TransactionId
	
	 end
	select 1 as status--select [MobileNo] ,[AccountNo] ,[Amount] ,[Status],[UpdatedOn],[CreatedOn] from Transaction where MobileNo = @MobileNo
	 end


GO
/****** Object:  StoredProcedure [dbo].[EWInsUpdWalletBalance]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[EWInsUpdWalletBalance]
@flag varchar,@Id int=-1
,@Mobilenumber varchar(20),@Amount decimal(18,0),@StatusId int
AS
BEGIN


declare @cnt int, @dt datetime,@amt decimal(18,0)
set @dt = GETDATE()


	if @flag ='A'
begin
	select @cnt = COUNT(*) from Appusers where  Mobilenumber = @Mobilenumber
	 

	Update dbo.Appusers 
	set [Amount]=[Amount]+@Amount,
	[StatusId]=@StatusId
	where Mobilenumber = @Mobilenumber 

end
	 
	 if @flag = 'T'
  begin
	 select @cnt = COUNT(*) from Appusers where  Mobilenumber = @Mobilenumber
	 select @amt = Amount from Appusers where  Mobilenumber = @Mobilenumber
	 if @amt < @Amount
	 begin
	 RAISERROR ('You have no sufficient balance',16,1);
	 end
	else
	begin
	Update dbo.Appusers 
	set [Amount]=[Amount]-@Amount,
	[StatusId]=@StatusId
	where Mobilenumber = @Mobilenumber 
	end
	 
	end	
	
	select [Mobilenumber] ,[Amount] ,[StatusId] from Appusers where Mobilenumber = @Mobilenumber
	

END


GO
/****** Object:  StoredProcedure [dbo].[Get LicenceCatergories]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[Get TroubleTicketingSlaType]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAccessTypes]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[GetAccessTypes]
@TypeGroupId int
as
begin
SELECT [ID]
      ,[Name]
      ,[Description]
      ,[TypeGroupId]
      ,[Active]     
  FROM [dbo].[Types] where TypeGroupId = @TypegroupID
end


GO
/****** Object:  StoredProcedure [dbo].[GetActivityLog]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetActivityLog]
as 
begin
select [Title],
[Rating],
[Image],
[CreatedOn],
[CreatedBy]  from ActivityLog
end


GO
/****** Object:  StoredProcedure [dbo].[Getadvertisement]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure  [dbo].[Getadvertisement] 

As Begin
Select * From AdvertisementPortal 

End


GO
/****** Object:  StoredProcedure [dbo].[GetAdvertismentDeals]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAdvertismentDeals]
As 
BEGIN
SELECT [Id]
      ,[Image]
      ,[AdvertisementTitle]
      ,[Description]
      ,[Dealsoffer]
      ,[Rating]
      ,[PublishDate]
      ,[ExpiredDate]
      ,[Area]
  FROM [POSDashboard].[dbo].[AdvertismentDeals]
END



GO
/****** Object:  StoredProcedure [dbo].[GetAlertsConfiguration]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllCardOptions]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCardOptions] 
as
BEGIN

   
   select * from Types where TypeGroupId = 15
   select * from Types where TypeGroupId = 14
   select * from Types where TypeGroupId = 13
  
END


GO
/****** Object:  StoredProcedure [dbo].[Getallocatedriver]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[Getalltickets]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getAppStates]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAppStates]
as
begin
SELECT [Id]
      ,[Response]
      ,[Description]
  FROM AppStates



end


GO
/****** Object:  StoredProcedure [dbo].[GetAppUserPaymentModes]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAuditDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAvailableServices]    Script Date: 28-09-2018 18:49:44 ******/
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
inner join PSVehicleMaster fd on fd.id = fofare.VehicleId
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
/****** Object:  StoredProcedure [dbo].[GetAvailableServicesWithOptions]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAvailableVDList]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAvailableVDList]
(@vgId int = -1)
as
begin

SELECT [Id]
      ,[VID]
      ,[CompanyId]
      ,[RegistrationNo]
      ,[ChasisNo]
      ,[Engineno]
      ,[FleetOwnerId]
      ,[VehicleTypeId]
      ,[ModelYear]
      ,[EntryDate]
      ,[VehicleModelId]
      ,[HasAC]
      ,[VehicleGroupId]
      ,[StatusId]
      ,[IsVerified]
      ,[VehicleCode]
      ,[IsDriverOwned]
      ,[DriverId]
      ,[CountryId]
      ,[VehicleMakeId]
  FROM [dbo].[PSVehicleMaster]
  where (VehicleGroupId = @vgId or @vgId = -1)
  and Id not In(select vechId from PSVehicleAssign)

SELECT [DId]
      ,[NAme]
      ,[Address]
      ,[City]
      ,[Pin]
      ,[PAddress]
      ,[PCity]
      ,[PPin]
      ,[PMobNo]
      ,[CompanyId]
      ,[Photo]      
      ,[Status]   
      ,[Email]      
      ,[Firstname]
      ,[lastname]     
      ,[DriverCode]
  FROM [dbo].[PSDriverMaster]
  where 
  DId not In(select DriverId from PSVehicleAssign)
 -- and
 -- ([VehicleGroupId] = @vgId or @vgId = -1)
   
 end


GO
/****** Object:  StoredProcedure [dbo].[GetBlockList]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBlockListNew]    Script Date: 28-09-2018 18:49:44 ******/
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
  [dbo].[Blocklist] bl
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
  [dbo].[Blocklist] bl
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
  [dbo].[Blocklist] bl
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
  [dbo].[Blocklist] bl
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
  [dbo].[Blocklist] bl
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
  [dbo].[Blocklist] bl
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
  [dbo].[Blocklist] bl
  on u.id = bl.ItemId
  and ItemTypeId = 7
 
END
 
END


GO
/****** Object:  StoredProcedure [dbo].[GetBookedHistory]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBookedTicketDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[BookedTicket]
  where BookingId = @bookingId


	
END


GO
/****** Object:  StoredProcedure [dbo].[GetBookingDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
	   ,[Distance]
  FROM [dbo].[BookingDetails]
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
  FROM [dbo].[BookedSeats]
  where BookingId = @bookingId
end
	
END


GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSAuditDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBTPOSDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBTPOSDetails1]    Script Date: 28-09-2018 18:49:44 ******/
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
--  FROM [dbo].[BTPOSDetails] b
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
/****** Object:  StoredProcedure [dbo].[GetBTPOSFaultsCatageries]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBTPOSId]    Script Date: 28-09-2018 18:49:44 ******/
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
	  FROM [dbo].[BTPOSDetails] b
	  inner join fleetowner fo on fo.id  = b.fleetownerid
	where (upper(IMEI) = upper(@imei) and (FleetOwnerCode) = UPPER(@fleetownercode))
	end
	
end


GO
/****** Object:  StoredProcedure [dbo].[getBTPOSInventorySales]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBTPOSMonitoring]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBTPOSPortSettings]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBTPOSRecords]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBTPOSRegistration]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBTposRoutes]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBTPOSSecheduledUpdates]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBTPOSSheduleUploads]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBTPOSTransactions]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[BTPOSTransactions]  
  left outer join Types t on t.Id = PaymentTypeId
  left outer join Types t1 on t1.Id = TransStatusId
  where ([POSId] = @POSId or @POSId = -1)
  and FleetOwnerId = @fleetOwnerId


END


GO
/****** Object:  StoredProcedure [dbo].[GetBusPackagePricing]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[GetBusPackagePricing]

As
Begin
SELECT [Id]
      ,[PkgId]
      ,[RouteId]
      ,[SrcStopId]
      ,[DeststopId]
      ,[PricingTypeId]
      ,[UnitTypeId]
      ,[UnitPrice]
      ,[Amount]
      ,[Code]
      ,[Description]
      ,[VehicleGroupId]
      ,[VehicleTypeId]
      ,[UnitId]
      ,[FromValue]
      ,[ToValue]
      ,[EffectiveDate]
      ,[ExpiryDate]
  FROM [dbo].[BusPackagePricing]
End


GO
/****** Object:  StoredProcedure [dbo].[GetBusPackages]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[GetBusPackages]

As
Begin

SELECT b.[Id]
      ,b.[Code]
      ,[PackageName]
      ,b.[Description]
      ,[OpId]
      ,[VehicleGroupId]
      ,[VehicleTypeId]
      ,[RouteId]
      ,[FleetOwnerId]
      ,t.Name as OperationName
      ,tt.Name as vehiclegroup
      ,vt.Name as vehicletype
      ,f.FleetOwnerCode as fleetcode
      ,r.RouteName
  FROM [dbo].[BusPackages] b
  inner join Types t on t.Id = b.OpId
  inner join Types tt on tt.Id = b.VehicleGroupId
  inner join Types vt on vt.Id = b.VehicleTypeId
  inner join FleetOwner f on f.Id = b.FleetOwnerId
  inner join Routes r on r.Id = b.RouteId
  
End


GO
/****** Object:  StoredProcedure [dbo].[getCardListData]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getCardListData]
as
begin
select a1.CardNumber, t.Name as CardModel,t1.Name as CardType,
t2.Name as CardCategory
from AddNewCard  a1 join Types t on t.Id=a1.CardModel 
join Types t1 on t1.Id=a1.CardType
join Types t2 on t2.Id=a1.CardCategory

end
/****** Object:  StoredProcedure [dbo].[GetAllCardOptions]    Script Date: 09/02/2017 12:24:26 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetCardListNew]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetCardListNew]
as
begin
Select * from CardList
end


GO
/****** Object:  StoredProcedure [dbo].[getCardNumbers]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getCardNumbers] 
as
begin 
select Id,CardNumber from AddNewCardData1
end


GO
/****** Object:  StoredProcedure [dbo].[getCardStatus]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getCardStatus] 
as
begin 
select Id,StatusId from AddNewCardData1
end


GO
/****** Object:  StoredProcedure [dbo].[GetCardUserInfo]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCardUserInfo](
@FirstName varchar(50),
@LastName varchar(50),
@EmailId varchar(50),
@MobileNumber varchar(50),
@Address varchar(50),
@CardType int,
@CardNumber int,
@MiddleName varchar(50),
@flag varchar)
As
Begin
if @flag='I'
begin
Insert Into CardUser1(FirstName, LastName, EmailId, MobileNumber, Address, CardType, CardNumber,MiddleName) values
(@FirstName,@LastName,@EmailId,@MobileNumber,@Address,@CardType,@CardNumber,@MiddleName)
end
if @flag='U'
begin
Update CardUser1 set 
FirstName=@FirstName,
LastName= @LastName,
EmailId=@EmailId,
MobileNumber=@MobileNumber,
Address = @Address,
CardType= @CardType,
CardNumber=@CardNumber,
MiddleName=@MiddleName
end
--Select 
--cu.LastName,
--cu.Email,
--Address from CardUser cu,CardList cl where 
--cu.UserId=cl.UserId and cl.CardType=@CardType and cl.CardNumber=@CardNumber 
End


GO
/****** Object:  StoredProcedure [dbo].[GetCardUsers]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCardUsers] 

  as
  begin 
  --select id,CardType from CardList;
  
  select  t.Name,t.Id from Types t 
  where t.TypeGroupId=13 
  
    
  select id,CardNumber from AddNewCardData1; 
  end


GO
/****** Object:  StoredProcedure [dbo].[GetCarouselImages]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Carousel]
end


GO
/****** Object:  StoredProcedure [dbo].[GetCartPaymentDetails]    Script Date: 28-09-2018 18:49:44 ******/
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

    INSERT INTO [dbo].[CartPaymentDetails]
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
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCategoryListNew]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetCategoryListNew]
as
begin
Select id,Name from Types where TypeGroupId = 15 
end


GO
/****** Object:  StoredProcedure [dbo].[GetChargesDiscounts]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure  [dbo].[GetChargesDiscounts] 

As Begin
SELECT cd.[Id]
      ,[Code]
      ,[Title]
      ,cd.[Description]
      ,t.Name [Type]
      ,c.Name [Category]
      ,a.Name [ApplyAs] 
      ,[Value]
      ,[FromDate]
      ,[ToDate] 
      ,t.Id TypeId
      ,c.Id CategoryId
      ,a.Id ApplyAsId
      From ChargesDiscounts cd 
      inner join Types t on t.Id = cd.TypeId
      inner join Types c on c.Id = cd.CategoryId
      inner join Types a on a.Id = cd.ApplyAsId     

End


GO
/****** Object:  StoredProcedure [dbo].[getcheckout]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[checkout]c
   inner join FleetOwnerRequestDetails fd on fd.id=c.id
   inner join Company cy on cy.Id=fd.Id
end


GO
/****** Object:  StoredProcedure [dbo].[getClosingReport]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getCompanies]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Company] c
 -- inner join Users u on  (u.companyId = c.id or  @userid = -1)  
  order by [Name]
end


GO
/****** Object:  StoredProcedure [dbo].[GetCompanyDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Company]
  WHERE [Id] = @cmpId


END


GO
/****** Object:  StoredProcedure [dbo].[getCompanyRoles]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetConfiguration]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetConfiguration]
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
    @needvehicleMake int =0,
    @needVehicleGroup int =0,
    @needDocuments int = 0,
    @country int=0,
    @DId int=0
AS
BEGIN
	

	if @needRoutes  = 1
	select routename,ID,Code from routes order by routename

	if @needRoles  = 1 
	select name,ID from Roles order by name
		
	
		
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
	
	--Documents type data
	if @needDocuments  = 1
	select Name, Id from Types where TypeGroupId = 18 order by Name
	
	--country
	if @country = 1
	select Name,Id from Country order by Name
	
	--companys
	if @needCompanyName = 1
	select Name,Id from Company order by Name
	 
	--vehicle layout type
	if @needVehicleLayout = 1
	select Name, Id from Types where TypeGroupId = 6 order by Name
	--driver address
	if @DId = 1
	select Address, DId from PSDriverMaster order by Address

	
	

END


GO
/****** Object:  StoredProcedure [dbo].[GetConfigurationData]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetConfigurationData] 
	@includeStatus int = 0
,@includeCategories int = 0
,@includeLicenseCategories int = 0
,@includeVehicleGroup int = 0
,@includeGender int = 0
,@includeFrequency int = 0
,@includePricingType int = 0
,@includeTransactionType int = 0
,@includeApplicability int = 0
,@includeFeeCategory int = 0
,@includeTransChargeType int = 0
,@includeVehicleType int = 0
,@includeVehicleModel int = 0
,@includeVehicleMake int = 0
,@includeDocumentType int = 0
,@includePaymentType int = 0
,@includeMiscellaneousTypes int = 0
,@includeCardCategories int = 0
,@includeCardTypes int = 0
,@includeVehicleLayoutType int = 0
,@includeLicenseFeatures int = 0
,@includeCardModels int = 0
,@includeCards int = 0
,@includeTransactions int = 0
,@includeCountry int = 0
,@includeActiveCountry int = 0
,@includeFleetOwner int = 0
,@includeUserType int =0
,@includeAuthType int =0
,@includeState int=0
,@includePackageTypeName int =0
,@includePackageNames int=0
--,@needCompanyName int=0
,@includeUnitType int=0
,@includeUnit int=0
,@includeApplicabilityType int=0
,@includeOperationName int = 0
,@includeValueType int=0
,@includeApplyOn int=0
AS
BEGIN
	if @includeStatus  = 1
	  SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  1

 
	if @includeCategories  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  2
  
	if @includeLicenseCategories  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  3
  
	if @includeVehicleGroup  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  4

	if @includeGender  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  5

	if @includeFrequency  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  6



	if @includePricingType  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  7

	if @includeTransactionType  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  8
  
	if @includeApplicability  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  9
  
	if @includeFeeCategory  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  10
  
	if @includeTransChargeType  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  11
  
	if @includeVehicleType  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  12
  
	if @includeVehicleModel  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  13
  
	if @includeVehicleMake  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  14
  
	if @includeDocumentType  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  15
  
	if @includePaymentType  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  16
  
	if @includeMiscellaneousTypes  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  17
  
	if @includeCardCategories  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  18
  
	if @includeCardTypes  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  19
  
	if @includeVehicleLayoutType  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  20
  
	if @includeLicenseFeatures  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  21
  
	if @includeCardModels  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  22
  
	if @includeCards  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  23
  
	if @includeTransactions  = 1
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] =  24
  
	if @includeCountry  = 1
	SELECT [Id]
      ,[Name]
      ,[Latitude]
      ,[Longitude]
      ,[ISOCode]
      ,[HasOperations]
  FROM [dbo].[Country]

	if @includeActiveCountry  = 1
	SELECT [Id]
      ,[Name]
      ,[Latitude]
      ,[Longitude]
      ,[ISOCode]
      ,[HasOperations]
  FROM [dbo].[Country] where HasOperations = 1
  
	if @includeFleetOwner  = 1
	select u.FirstName+' '+u.LastName as Name,
	c.Name as CompanyName
	,FO.FleetOwnerCode
	,FO.CompanyId
	,FO.Id
	,FO.UserId
	 from FleetOwner FO
	inner join Users u on  u.Id =  FO.UserId
	inner join Company c on c.Id =  FO.companyId
    --where (FO.company[TypeGroupId] =  @cmpId or @cmp[TypeGroupId] = -1)
	order by u.FirstName,u.LastName

if @includeUserType = 1
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] = 25	
  
  if @includeAuthType = 1
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] = 27
  
  if @includeState  = 1
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] = 28
  	
	If @includePackageTypeName=1
  	SELECT [Id]
      ,[PackageId]
      ,[Name]      
  FROM [dbo].[PackagesTypes]
  
  if @includePackageNames =1
  SELECT [Id]
      ,[VehicleGroupId]
      ,[Name]      
  FROM [dbo].[Packages]

 -- if @needCompanyName = 1
	--select Name,Id from Company order by Name
	
	if @includeApplicabilityType = 1
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] = 26	
  
  if @includeUnitType = 1
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] = 29	
  
   if @includeUnit = 1
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] = 30	
  
  if @includeOperationName = 1
  SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] = 35	
  
   if @includeValueType = 1
  SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] = 34
  
   if @includeApplyOn = 1
  SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types] where [TypeGroupId] = 31

END

GO
/****** Object:  StoredProcedure [dbo].[GetCountries]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetCountries]
@active int = -1
as begin 
SELECT Id, Name, Latitude, Longitude,ISOCode, HasOperations,flag from Country
where HasOperations = @active or @active = -1
end


GO
/****** Object:  StoredProcedure [dbo].[GetCOUNTRY]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCOUNTRY]
@active int 
as begin 
SELECT Id, Name, Latitude, Longitude,ISOCode, HasOperations from Country
where HasOperations = @active or @active = -1
end


GO
/****** Object:  StoredProcedure [dbo].[getcurrency]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCustomerAccountDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure  [dbo].[GetCustomerAccountDetails] 
@userid int
As 
Begin
SELECT c.[Id]
      ,[UserId]
      ,t.Name as paymenttype
      ,[AccountNumber]
      ,[Type]
      ,[HolderName]
      ,[code]
      ,[ExpMonth]
      ,[ExpYear]
      ,[AccountCode]
      ,[AccountType]
      ,[IsPrimary]
      ,[IsVerified]
      ,[CreatedOn]
      ,[UpdatedOn]
      ,[Otp]
      ,[OtpVerfied]     
      ,cc.Name as[Country]
	  ,UserTypeId
      ,t1.Name
  FROM [dbo].[CustomerAccountDetails] c 
  inner join Types t on t.Id=c.PaymentModeId
  inner join Types t1 on t1.Id=c.UserTypeId
left outer join Country cc on cc.Id=c.CountryId
 
 where UserId = @userid

End


GO
/****** Object:  StoredProcedure [dbo].[getCustomers]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getCustomers]
as 
begin
select id,Customer from AddNewCardData1
end


GO
/****** Object:  StoredProcedure [dbo].[GetDashboardDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetDashboardDetails]
(@userid int = -1, @roleid int = -1, @countryId int = -1)
as
begin

 select Id,name,case when temp.vcount IS null then 0 else vcount end as vcount
   ,case when a IS null then 0 else a end Approved
   from Types t
  left outer join
  (select COUNT(vehiclegroupid) vcount, vehiclegroupid
  ,(select count(*) from PSVehicleMaster where vehiclegroupid = v.VehicleGroupId and IsApproved =1 group by vehiclegroupid)a
  from PSVehicleMaster v
  where (@countryId = -1 or CountryId = @countryId)
  group by VehicleGroupId) temp
  on t.id = temp.VehicleGroupId
   where TypeGroupId = 4 and Id not in (40,41,42)
  
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
  FROM [dbo].[BTPOSDetails] b
 left outer join Types t on t.Id = b.StatusId
 left outer  join Company c on b.CompanyId = c.Id  
    left outer join fleetowner f on f.id = FleetOwnerId 
  left outer join Users u on u.Id = f.userId 
where (u.Id = @userid or @userid = -1)

--get license details
--get alerts
select top 6 t1.Id,
t1.CreatedOn,
t1.Message,
t1.StatusId,
t1.UserId,
t2.FirstName,
t2.LastName
 from Alerts t1
 inner join Users t2 on t2.Id=t1.UserId
 
--get notifications

select top 6 t1.Id,
t1.CreatedOn Date,
t1.Message,
--t1.MessageTypeId,
t1.StatusId,
t1.UserId,
t1.Title Name,
t2.FirstName,
t2.LastName
 from Notifications t1
 inner join Users t2 on t2.Id=t1.UserId

end


GO
/****** Object:  StoredProcedure [dbo].[getdetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetDownloadCount]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetDriverApproval]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetDriverApproval]
@MobileNumber varchar(20)
As
Begin
Select [DId]
,[PMobNo]
,[IsApproved]
From [dbo].[PSDriverMaster]
where PMobNo = @MobileNumber
End


GO
/****** Object:  StoredProcedure [dbo].[getEditHistory]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getEditHistory]
@Task varchar(20)
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
  FROM [dbo].[EditHistory]
  where Task = @Task
end


GO
/****** Object:  StoredProcedure [dbo].[getEditHistoryDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[EditHistoryDetails] ed
  inner join EditHistory e on e.Id = ed.EditHistoryId
  WHERE EditHistoryId = @edithistoryid
  
end


GO
/****** Object:  StoredProcedure [dbo].[GetEditHistoryTasks]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetEditHistoryTasks]

as
begin

select 1 Id, 'Company' Task,1 OrderNo
union
select 2, 'Users' ,2
union 
select 3,'Vehicle',3
union 
select 4,'TypeGroups',4
union
select 5,'Types',5
union
select 6,'Driver',6
union
select 7,'Fleet',7
union
select 8,'LicenceTypes',8
union
select 9,'Proof',9
union
select 10,'CompanyRoles',10
Order by Id desc


end


GO
/****** Object:  StoredProcedure [dbo].[GetEmailBox]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetEmailBox]
As
Begin
SELECT [Id]
      ,[ToMailId]
      ,[FromMailId]
      ,[Subject]
      ,[CarbonCopy]
      ,[BlindCarbonCopy]
      ,[Text]
      ,[Attachments]
  FROM [dbo].[EmailBox]



End


GO
/****** Object:  StoredProcedure [dbo].[getExpenses]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getfaqs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getfaqs]
as
begin
SELECT [Id]
      ,[Question]
      ,[Answer]
      ,[CreatedOn]
      ,[CreatedBy]
      ,[AppType]
      ,[Category]
      ,[SubCategory]
  FROM [dbo].[FAQs]
end


GO
/****** Object:  StoredProcedure [dbo].[GetFare]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetFileContent]    Script Date: 28-09-2018 18:49:44 ******/
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
		  FROM [dbo].[FleetOwnerRouteFare] fof
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
/****** Object:  StoredProcedure [dbo].[GetFileContentAuthentication]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Authentication] A1
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end
/****** Object:  StoredProcedure [dbo].[GetFileContentBTPOSDetails]    Script Date: 07/09/2016 17:24:26 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetFileContentBTPOSDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[BTPOSDetails] B1
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end
/****** Object:  StoredProcedure [dbo].[GetFileContentIndex]    Script Date: 07/09/2016 17:24:41 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetFileContentIndex]    Script Date: 28-09-2018 18:49:44 ******/
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
    
  FROM [dbo].[Index] I1
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end
/****** Object:  StoredProcedure [dbo].[GetFileContentRouteFare]    Script Date: 07/09/2016 17:24:55 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetFileContentRouteFare]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[RouteFare] R1
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end

/****** Object:  StoredProcedure [dbo].[GetFileContentRoutes]    Script Date: 07/09/2016 17:25:12 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetFileContentRoutes]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Routes] R
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end


/****** Object:  StoredProcedure [dbo].[GetFileContentStops]    Script Date: 07/09/2016 17:25:25 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetFileContentStops]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Stops] S
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end


GO
/****** Object:  StoredProcedure [dbo].[Getfiledetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetFleetAvailability]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetFleetAvailability]
(@cmpId int=-1, @fleetOwnerId int = -1)
as
begin
SELECT fa.[Id]
      ,fd.RegistrationNo
      ,[VehicleId]
      ,[FromDate]
      ,[ToDate]
      ,u.firstname + ' ' + u.lastname as FleetOwner
  FROM [dbo].[FleetAvailability] FA
  inner join PSVehicleMaster fd on fd.Id = FA.vehicleid
  inner join FleetOwner  fo on fo.Id = fd.FleetOwnerId
  inner join users u on u.id = fo.UserId
 where ((fd.CompanyId = @cmpId or @cmpId = -1)
  and (fd.FleetOwnerId = @fleetOwnerId or @fleetOwnerId = -1))

end


GO
/****** Object:  StoredProcedure [dbo].[GetFleetBtpos]    Script Date: 28-09-2018 18:49:44 ******/
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
      ,fd.RegistrationNo 
  FROM [dbo].[FleetBtpos] fb
  inner join PSVehicleMaster fd on fd.id = fb.vehicleid
  inner join BTPOSDetails bt on bt.id = fb.btposid
 where ((fd.companyid = @cmpId or @cmpId = -1)
  and (fd.fleetownerid = @fleetOwnerId or @fleetOwnerId = -1))

	
END


GO
/****** Object:  StoredProcedure [dbo].[GetFleetDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create  PROCEDURE [dbo].[GetFleetDetails] 
	-- Add the parameters for the stored procedure here
	(@cmpId int = -1, @fleetOwnerId int = -1, @vehicleId int=-1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT v.[Id]
      ,[RegistrationNo]
      ,vt.[Name] as VehicleType
      ,vt.Id AS VehicleTypeId
      ,lt.Name AS vehiclelayout
      ,lt.Id as vehiclelayoutId
      ,st.Name as vehiclegroup
      ,st.Id as ServiceTypeId
      , u.FirstName +' '+u.LastName as FleetOwnerName 
      ,c.[Name] as CompanyName      
      ,[LayOutTypeId]
      ,[EngineNo] 
      ,[ChasisNo]
      ,VehicleCode
      ,f.FleetOwnerCode
      ,u.FirstName +''+ u.LastName as username 
      ,u.ContactNo1
      ,u.EmailId
      ,v.Photo      
     FROM [dbo].[PSVehicleMaster] v
    inner join Types vt on vt.Id=v.VehicleTypeId
    inner join Types st on st.Id=v.VehicleGroupId
   inner join Types lt on lt.Id = v.LayOutTypeId
    left outer join company c on c.Id=v.CompanyId
    inner join FleetOwner f on f.id=v.FleetOwnerId
   inner join Users u on u.Id = f.UserId
 --   inner join BTPOSDetails bd on bd.FleetOwnerId=f.Id
 --   inner join VehicleDetails vd on vd.fleetOwnerId=f.Id
    
	 where  ((v.CompanyId= @cmpId or @cmpId = -1) and (v.Id= @vehicleId or @vehicleId = -1)
	 and (v.FleetOwnerId = @fleetOwnerId or @fleetOwnerId = -1))
   
    -- Insert statements for procedure here
    
    
END



GO
/****** Object:  StoredProcedure [dbo].[getFleetOwner]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Users] U
  inner join FleetOwner FO on U.Id = FO.UserId
  inner join company c on (U.companyid = c.id)
  left outer join Users mgr on mgr.id = U.managerid
  left outer join dbo.userlogins ul on ul.userid = U.id      

end


GO
/****** Object:  StoredProcedure [dbo].[GetfleetownerLicense]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetfleetownerLicense]
(@fleetcode varchar(10)=-1)
as 
begin
SELECT u.[Id]
      ,u.[UserId]
     
      ,us.FirstName + '' + us.LastName as UName
      ,[FOId]      
      ,u.[LicenseTypeId]
      ,lt.LicenseType
      ,[StartDate]
      ,[ExpiryOn]
      ,[GracePeriod]
      ,[ActualExpiry]
      ,[LastUpdatedOn]
      ,[RenewFreqTypeId]
      --,r.Name
      ,u.[Active]
      ,u.[StatusId]
     ,f.FleetOwnerCode
     --,uld.Tax
     --,uld.Discount
     --,ulp.UnitPrice
     ,l.FeatureType
     ,l.Value
     ,l.Label
     ,ll.RenewalFreq
     ,ll.UnitPrice
  FROM [dbo].[UserLicense]u
  inner join Users us on us.Id=u.UserId
  inner join FleetOwner f on f.Id=u.FOId
  --inner join Types r on r.Id = RenewFreqTypeId
  inner join LicenseTypes lt on lt.Id = LicenseTypeId
  --inner join UserLicensePayments ulp on ulp.Id = u.Id
  --inner join ULPymtTransDetails uld on uld.Id = u.id
 left outer join LicenseFeatures l on l.LicenseId = lt.Id
inner join LicensePricing ll on ll.LicenseId = lt.Id
  where f.FleetOwnerCode = @fleetcode
  
end


GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRoute]    Script Date: 28-09-2018 18:49:44 ******/
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
left outer join [dbo].[FleetOwnerRoute] fr 
on r.id = fr.routeid and  (fr.fleetownerid = @fleetownerId or @fleetownerId = -1)
order by RouteName


end


GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteAssigned]    Script Date: 28-09-2018 18:49:44 ******/
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
inner join [dbo].[FleetOwnerRoute] fr on r.id = fr.routeid
inner join stops src on src.id = r.SourceId
inner join stops dest on dest.id = r.DestinationId
 inner join fleetowner f on f.id = fr.fleetownerid 
  inner join users u on f.userid = u.id 
  where f.Id = @fleetownerId

end


GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Routes] r
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
  FROM [dbo].[RouteDetails] rd
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
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteFare]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[FleetOwnerRouteFare]


end


GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteStop]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[FleetOwnerRouteStop]

end
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteFare]    Script Date: 07/18/2016 15:23:33 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetfleetRoutes]    Script Date: 28-09-2018 18:49:44 ******/
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
      ,fd.RegistrationNo
      ,t.name vehicleType
      ,t.Id as VehicleTypeId
      ,r.RouteName
      ,[EffectiveFrom]
      ,[EffectiveTill]
      ,[RouteName]
	  ,fd.CompanyId
	  ,fd.FleetOwnerId
  FROM [dbo].[FleetRoutes] fr
  inner join PSVehicleMaster fd on fd.Id = fr.VehicleId
  inner join Routes r on r.Id = fr.RouteId
  inner join types t on t.id = fd.VehicleTypeId
  where ((@routeid = -1 or fr.RouteId = @routeid)
and (fd.CompanyId = @cmpid or @cmpId = -1)
and (fd.FleetOwnerId = @fleetownerId or @fleetownerId = -1))

END



GO
/****** Object:  StoredProcedure [dbo].[GetFleetScheduleList]    Script Date: 28-09-2018 18:49:44 ******/
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
      ,fd.RegistrationNo
      ,r.RouteName
      ,[FleetId]
      ,[RouteId]
      ,[StartTime]
      ,[EndTime]
      ,[UpdatedOn]
      ,[CreatedBy]
      ,[UpdatedBy]
  FROM [dbo].[FleetScheduleList] fsl
  inner join PSVehicleMaster fd on fsl.fleetid = fd.Id
  inner join Routes r on r.Id = fsl.routeid
  where (FleetId= @fleetId or @fleetId = -1)
  and (RouteId = @RouteId or @RouteId = -1)
end


GO
/****** Object:  StoredProcedure [dbo].[GetFleetStaff]    Script Date: 28-09-2018 18:49:44 ******/
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
      ,FD.RegistrationNo
      ,u.FirstName + ' ' +u.LastName as UserName
      ,r.Name as rolename
  FROM [dbo].[FleetStaff] FS
      inner join PSVehicleMaster FD on FD.Id = FS.vehicleId
      inner join Users u on fs.UserId=u.id
inner join Roles r on r.Id = FS.Roleid
where ((FD.FleetOwnerId = @fleetowner or @fleetowner = -1)
 and (FD.CompanyId = @cmpId or @cmpId  = -1))

END



GO
/****** Object:  StoredProcedure [dbo].[GetFORouteFare]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFORouteFare]
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
      ,f.[RegistrationNo]
      ,r.RouteName
      ,r.Code
   
      ,[FromDate]
      ,[ToDate]
     
  FROM [dbo].[FORouteFare]fo
  inner join PSVehicleMaster f on f.Id = fo.Id
  inner join Routes r on r.Id = fo.Id


end


GO
/****** Object:  StoredProcedure [dbo].[getFORVehicleSchedule]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[RouteDetails] rd
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
/****** Object:  StoredProcedure [dbo].[GetFOVehicleFareConfig]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[FORouteFare]
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
     
  FROM [dbo].fleetownerroutestop fs    
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
/****** Object:  StoredProcedure [dbo].[GetHailingPackagePricing]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetHailingPackagePricing]

As
Begin

SELECT [Id]
      ,[Code]
      ,[Description]
      ,[VehicleGroupId]
      ,[VehicleTypeId]
      ,[PricingTypeId]
      ,[UnitTypeId]
      ,[UnitId]
      ,[Amount]
      ,[FromValue]
      ,[ToValue]
      ,[EffectiveDate]
      ,[ExpiryDate]
      ,[PackageId]
  FROM [dbo].[HailingPackagePricing]
End


GO
/****** Object:  StoredProcedure [dbo].[GetHailingPackages]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetHailingPackages]
As
Begin

SELECT h.[Id]
      ,[Code]
      ,[PackageName]
      ,h.[Description]
      ,[OpId]
      ,[VehicleGroupId]
      ,[VehicleTypeId]
      ,t.Name as vgroup
      ,tt.Name as vtype
      ,tv.Name as operationname
  FROM [dbo].[HailingPackages] h
  inner join Types t on t.Id = h.VehicleGroupId
  inner join Types tt on tt.Id = h.VehicleTypeId
  inner join Types tv on tv.Id = h.OpId
end


GO
/****** Object:  StoredProcedure [dbo].[gethelp]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetHireVehicle]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure  [dbo].[GetHireVehicle] 
@srcId int ,@destId int

As Begin
SELECT v.[Id]
      ,[VID]
      ,[CompanyId]
      ,[RegistrationNo]
      ,[ChasisNo]
      ,[Engineno]
      ,[FleetOwnerId]
      ,tt.Name as[VehicleTypeId]
      ,[ModelYear]
      ,[EntryDate]
      ,[VehicleModelId]
      ,[HasAC]
      ,t.Name as [VehicleGroup]
      ,t.Id as [VehicleGroupId]
      ,[StatusId]
      ,[IsVerified]
      ,[VehicleCode]
      ,[IsDriverOwned]
      ,[DriverId]
      ,[CountryId]
      ,[VehicleMakeId]
      ,[Photo]
  FROM [dbo].[PSVehicleMaster] v
inner join Types t on t.Id = v.VehicleGroupId and t.Id=43
inner join Types tt on tt.Id = v.VehicleTypeId
--inner join Types vt on vt.Id = v.VehicleModelId
End


GO
/****** Object:  StoredProcedure [dbo].[getInventory]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetInventoryItem]    Script Date: 28-09-2018 18:49:44 ******/
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
      ,[ItemImage] 
      ,[Price]
      ,[ItemModel]
      ,[Features]
      ,[PublishDate]
      ,[ExpiryDate]
  FROM [dbo].[InventoryItem]I
 inner join types t on t.id = i.categoryid
 INNER JOIN SubCategory s  ON s.id = I.SubCategoryid
  where s.Id  = @subCatId or @subCatId = -1
  
end


GO
/****** Object:  StoredProcedure [dbo].[GetInventoryPurchases]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[InventoryPurchases]



END


GO
/****** Object:  StoredProcedure [dbo].[getInventoryReceivings]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetInventorySales]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[InventorySales] sl
  


 


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
END



/****** Object:  StoredProcedure [dbo].[InsupddelInventorySales]    Script Date: 04/27/2016 17:49:02 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetInventorySubCategories]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[SubCategory] S
  INNER JOIN Types T ON T.ID = S.CATEGORYID
  INNER JOIN TypeGroups TG ON TG.Id = T.TypeGroupId AND TG.ID = 1
   



	
END


GO
/****** Object:  StoredProcedure [dbo].[GetInvoices]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Invoices] Io
  inner join Types t on t.Id =Io.Id
  inner join InventoryItem i on i.Id = Io.Id


       
end

SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetLatLongHistory]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetLatLongHistory]
as
BEGIN
select  Latitude,Longitude,city,description from 
PSTrackVehicle WHERE Latitude != 0
end


GO
/****** Object:  StoredProcedure [dbo].[GetLicenceCatergories]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[InventoryItem] I
  where I.SubCategoryId = 1
  
  
end


GO
/****** Object:  StoredProcedure [dbo].[GetLicenceStatus]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetLicenseConfigDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[LicenseTypes]
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
  left outer join [dbo].[LicenseDetails] ld on t.id = ld.featuretypeid
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
  FROM [dbo].[LicensePricing]
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
  FROM [dbo].[InventoryItem] I
  left outer join [dbo].[LicenseBTPOS] b on b.btpostypeid = I.Id
  and licensetypeid = @ltypeId
  where I.SubCategoryId = 1
  
  
end


GO
/****** Object:  StoredProcedure [dbo].[GetLicenseDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[LicenseDetails] ld
  inner join Types t on t.id = ld.featuretypeid
  where ([LicenseTypeId] = @ltypeId or @ltypeId = -1)
end


GO
/****** Object:  StoredProcedure [dbo].[GetLicensefeatures]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetLicensefeatures]
as
begin
SELECT [Id]
      ,[LicenseId]
      ,[FeatureId]
      ,[Value]
      ,[Description]
      ,[IsPublic]
      ,[Label]
      ,[FeatureType]
      ,[Decoration]
      ,[FromDate]
      ,[ToDate]
      ,[StatusId]
  FROM [dbo].[LicenseFeatures]
    
  end


GO
/****** Object:  StoredProcedure [dbo].[GetLicensePageDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[LicenseTypes]
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
  FROM [dbo].[LicenseDetails]ld
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
  FROM [dbo].[LicensePricing] lp
  inner join Types t on t.id = lp.renewalFreqTypeId
  
  end


GO
/****** Object:  StoredProcedure [dbo].[getLicensePayments]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[UserLicense]u
  inner join Users us on us.Id=u.UserId
  inner join FleetOwner f on f.Id=u.FOId
  inner join Types r on r.Id = RenewFreqTypeId
  inner join LicenseTypes lt on lt.Id = LicenseTypeId
  inner join Types lc on lc.Id = lt.LicenseCatId
  --inner join UserLicensePayments ulp on ulp.Id = u.Id
  --inner join ULPymtTransDetails uld on uld.Id = u.id
end


GO
/****** Object:  StoredProcedure [dbo].[GetLicensePricing]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[LicensePricing] lp
inner join types t on t.id = lp.renewalfreqtypeid
 inner join licensetypes lt on lt.id = lp.licenseid
 where (lt.LicenseCatId = @categoryid or @categoryid = -1)


end


/****** Object:  StoredProcedure [dbo].[InsUpdDelLicensePricing]    Script Date: 07/18/2016 16:48:16 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetLicenseTypes]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[LicenseTypes] lt
inner join Types t on t.Id = licensecatid
  where ([LicenseCatId] = @licenseCategoryId or @licenseCategoryId = -1)
END


GO
/****** Object:  StoredProcedure [dbo].[getlogin]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getloginpage]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetMandatoryUserDocs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetMandatoryUserDocs]
(@countryid int = -1, @utId int = -1,@vgId int = -1)
as
begin

select t.Id      
	  ,U.Id Docid      
      ,t.Name as DocType      
      ,t.Description
      ,case when U.Id IS null then 0 else 1 end as selected
      ,CountryId      
      ,U.IsMandatory 
      ,U.UserTypeId 
      ,U.VehicleGroupId   
       from Types t
left outer join
(select DocTypeId,usertypeid,countryid,ID,IsMandatory,VehicleGroupId from [dbo].[MandatoryUserDocuments]  
where ((CountryId = @countryid or @countryid = -1) and (UserTypeId = @utId or @utId = -1)
and (VehicleGroupId = @vgId or @vgId = -1))
)
U on (t.Id = U.DocTypeId) 
where t.TypeGroupId = 15 

end


GO
/****** Object:  StoredProcedure [dbo].[GetMandatoryVehicleDocs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetMandatoryVehicleDocs]
(@countryid int = -1, @vgId int = -1)
as
begin

select t.Id      
	  ,U.Id Docid      
      ,t.Name as DocType      
      ,t.Description
      ,case when U.Id IS null then 0 else 1 end as selected
      ,CountryId      
      ,U.IsMandatory    
      ,U.VehicleGroupId   
       from Types t
left outer join
(select DocTypeId,countryid,ID,IsMandatory,VehicleGroupId from [dbo].[MandatoryVehicleDocs]  
where ((CountryId = @countryid or @countryid = -1) and (VehicleGroupId = @vgId or @vgId = -1))
)
U on (t.Id = U.DocTypeId) 
where t.TypeGroupId = 15 


  
end

/****** Object:  StoredProcedure [dbo].[InsUpdDelMandatoryUserDocs]    Script Date: 09/25/2017 19:43:44 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[getmenu]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetMeteredTaxiPackagePricing]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[GetMeteredTaxiPackagePricing]

As
Begin
SELECT [Id]
      ,[PkgId]
      ,[SrcLat]
      ,[DestLat]
      ,[SrcLon]
      ,[DestLon]
      ,[Src]
      ,[Dest]
      ,[Distance]
      ,[PricingTypeId]
      ,[UnitTypeId]
      ,[UnitPrice]
      ,[Amount]
      ,[Code]
      ,[Description]
      ,[VehicleGroupId]
      ,[VehicleTYpeId]
      ,[UnitId]
      ,[FromValue]
      ,[ToValue]
      ,[EffectiveDate]
      ,[ExpiryDate]
  FROM [dbo].[MeteredTaxiPackagePricing]
End


GO
/****** Object:  StoredProcedure [dbo].[GetMeteredTaxiPackages]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[GetMeteredTaxiPackages]

As
Begin

SELECT m.[Id]
      ,[Code]
      ,[PackageName]
      ,m.[Description]
      ,[OPId]
      ,[VehicleGroupId]
      ,[VehicleTypeId]
      ,t.Name as vgroup
      ,tt.Name as vtype
      ,tm.Name as OperationName
  FROM [dbo].[MeteredTaxiPackages] m
  inner join Types t on t.Id = m.VehicleGroupId
  inner join Types tt on tt.Id = m.VehicleTypeId
  inner join Types tm on tm.Id = m.OPId
End





GO
/****** Object:  StoredProcedure [dbo].[Getmulitiplicationsave]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[Getnearestvechiles]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Getnearestvechiles]
as
begin
declare @logt numeric(10,6),
@lat numeric(10,6)
 --select
 --@lat = Latitude,@logt = longitude from StartBooking where  Id=Id
 --select Id
 --from StartBooking where dbo.PSStartBooking(latitude,longitude,@lat,@logt)<=5000
 --and Id!=Id
 end


GO
/****** Object:  StoredProcedure [dbo].[GetNewChildObj]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetNewChildObj]
@RootObjectId int
as 
begin
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Path]
      ,[ParentID]
      ,[CreatedOn]
      ,[CreatedBy]
      ,[UpdatedOn]
      ,[UpdatedBy]
      ,[RootObjectId]
	  ,[Active]	 
  FROM [dbo].[NewObject] where RootObjectId = @RootObjectId

 select oa.TypeId,t.Name,oa.ObjectID
 from [dbo].[ObjectAccesses] oa
inner join types t on t.id = oa.TypeId
inner join NewObject o on o.Id = oa.ObjectID
where o.RootObjectId = @RootObjectId

end


GO
/****** Object:  StoredProcedure [dbo].[GetNewObject]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetNewObject]

as 
begin
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Path]
      ,[ParentID]
      ,[CreatedOn]
      ,[CreatedBy]
      ,[UpdatedOn]
      ,[UpdatedBy]
	  ,[RootObjectId]
	  ,[Active]
  FROM [dbo].[NewObject] where ParentID is NULL
end


GO
/****** Object:  StoredProcedure [dbo].[GetNewObjectAccesses]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetNewObjectAccesses] 	
AS
BEGIN
	SELECT [Id]
      ,[ObjectId]
      ,[TypeId]
      ,[Name]
  FROM [dbo].[ObjectAccesses]
END


GO
/****** Object:  StoredProcedure [dbo].[GetNOCBTPOSTracking]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getNotficationConfiguration]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetNotifications]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetNotifications]

as begin 
select t1.Id,
t1.CreatedOn  Date,
t1.Message,
--t1.MessageTypeId,
t1.StatusId,
t1.UserId,
t1.Title Name,
t2.FirstName+' '+t2.LastName as Name
 from Notifications t1
 inner join Users t2 on t2.Id=t1.UserId
end


GO
/****** Object:  StoredProcedure [dbo].[GetObjectAccesses]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetObjectHierarchy]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getObjects]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getOldTransactionDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getOldTransactionDetails]
as
begin
select * from TransactionDetails
end


GO
/****** Object:  StoredProcedure [dbo].[getOldTransactionMaster]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getOldTransactionMaster]
as
begin
select * from TransactionMaster
end


GO
/****** Object:  StoredProcedure [dbo].[GetOperationChargesDiscount]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetOperationChargesDiscount]
as
begin
SELECT [Id]
      ,[ChargeDisId]
      ,[OperationId]
      ,[FromDate]
      ,[ToDate]         
  FROM [dbo].[OperationChargesDiscount] 

end


GO
/****** Object:  StoredProcedure [dbo].[GetOperations]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetOperations]
as
begin
SELECT [Id]
      ,[OpName]
      ,[Code]
      ,[Description]
      ,[Active]         
  FROM [dbo].[Operations] 

end


GO
/****** Object:  StoredProcedure [dbo].[GetPackageCharges]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetPackageCharges]
as
begin
SELECT p.[Id]
      ,[PkgId]
      ,[TypeId]
      ,[ApplyOn]
      ,[Value]
      ,p.[Code]
      ,[UnitTypeId]
      ,[UnitId]
      ,[FromValue]
      ,[ToValue]
      ,[EffectiveDate]
      ,[ExpiryDate]
      ,[ChargeTypeId]
      ,[ChargeCode]
      ,[OpCode]
      ,t.Name as UnitType
      ,tt.Name as Unit
      ,tm.Name as Type
      ,tc.Name as ChargeType
      ,tp.Name as Package
  FROM [dbo].[PackageCharges] p
  inner join Types t on t.Id = p.UnitTypeId
  inner join Types tt on tt.Id = p.UnitId
  inner join Types tm on tm.Id = p.TypeId
  inner join Types tc on tc.Id = p.ChargeTypeId
  inner join Packages tp on tp.Id = p.PkgId


end


GO
/****** Object:  StoredProcedure [dbo].[GetPackageDiscounts]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetPackageDiscounts]

as
begin
SELECT p.[Id]
      ,[PkgId]
      ,p.[TypeId]
      ,[ApplyOn]
      ,p.[Value]
      ,p.[Code]
      ,[Effectivedate]
      ,[ExpiryDate]
      ,[UnitId]
      ,[UnitTypeId]
      ,[DiscountTypeId]
      ,[OpCode]
       ,t.Name as UnitType
      ,tt.Name as Unit
       ,tm.Name as Type
       --,tc.Code as DiscountType
       ,tp.Name as package
  FROM [dbo].[PackageDiscounts] p
  inner join Types t on t.Id = p.UnitTypeId
  inner join Types tt on tt.Id = p.UnitId
  inner join Types tm on tm.Id = p.TypeId
  --inner join ChargesDiscounts tc on tc.Id = p.DiscountTypeId
  inner join Packages tp on tp.Id = p.PkgId
end


GO
/****** Object:  StoredProcedure [dbo].[getpalce]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPayables]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPayablesMaster]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPaymentCatergory]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPaymentgateway]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getPaymentGatewaySettings]    Script Date: 28-09-2018 18:49:44 ******/
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
    
  FROM [dbo].[PaymentGatewaySettings] p
  inner join TypeGroups Ty on Ty.Id = p.Id 
    
end


GO
/****** Object:  StoredProcedure [dbo].[GetPaymentGatewayType]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPaymentHistory]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetPaymentHistory]

as begin 
SELECT * from PaymentHistory

       
end


GO
/****** Object:  StoredProcedure [dbo].[getPaymentReceivings]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getPayments]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getpaysmart]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPOSDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[POSTerminal] t
  inner join dbo.Groups g on g.Id = t.GroupId

END

/****** Object:  Table [dbo].[TroubleTicketingDetails]    Script Date: 06/08/2016 17:03:12 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetPricingCredentials]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetPricingCredentials]
as
begin
SELECT [Id]
      ,[PriceCode]
      ,[PriceType]
      ,[UnitPrice]
      ,[VehicleGroup]
      ,[VehicleModel]
      ,[VehicleType]
      ,[PackageType]
      ,[FromDate]
      ,[ToDate]
  FROM [dbo].[PricingCredentials]
end


GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure  [dbo].[GetProducts] 

As Begin
Select * From Products 

End


GO
/****** Object:  StoredProcedure [dbo].[GetPromotionalDiscounts]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetPromotionalDiscounts]
As
begin
SELECT p.[Id]
      ,[OpCode]
      ,[Condition]
      ,[ValueType]
      ,[FromValue]
      ,[ToValue]
      ,[TypeId]
      ,[ApplyOn]
      ,[Value]
      ,[Applicability]
      ,[Code]
       ,t.Name as applicable
      ,tt.Name as dist
      ,tm.Name as Applyonn
      ,tc.Name as OpCodes
      ,tv.Name as vtype      
  FROM [dbo].[PromotionalDiscounts] p 
  inner join Types t on t.Id = p.Applicability
  inner join Types tt on tt.Id = p.TypeId
  inner join Types tm on tm.Id = p.ApplyOn
  inner join Types tc on tc.Id = p.OpCode
  inner join Types tv on tv.Id = p.ValueType
end



GO
/****** Object:  StoredProcedure [dbo].[GetPurchaseOrder]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[PurchaseOrder] po
  inner join Types t on t.Id = po.StatusId
  inner join InventoryItem i on i.Id = po.itemId
       
end



SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetReceivings]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetReceivingsMaster]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[Getregister]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Getregister]
as begin
select * from register
end


GO
/****** Object:  StoredProcedure [dbo].[getRegistrationBTPOS]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getresetpassword]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[getresetpassword]
@Username varchar(50),@NewPassword varchar(50)
as
begin
declare @cnt int

select @cnt = COUNT(*) from UserLogins where LoginInfo = @Username 
	if @cnt = 0
		begin
				RAISERROR ('No User Registered with the Username',16,1);
				return;	
		end
		else
		begin
		
Update dbo.UserLogins
SET 
[PassKey] = @NewPassword

where LoginInfo = @Username

end
end


GO
/****** Object:  StoredProcedure [dbo].[getRoledetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRoledetails]
(@roleId int)
as begin 

  with cte as
(SELECT O.[ID],Name,null ParentId,  CAST(O.ID AS VARCHAR(100)) AS RowID
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
  select cte.ID,cte.Name,ParentId,RowID from cte
  left outer join [dbo].[RoleObjectAccesses] roa on cte.Id = roa.ObjectId and roa.RoleId = @roleId  
  left outer join Types t on t.Id  = roa.AccessId
   order by Rowid
    
end


GO
/****** Object:  StoredProcedure [dbo].[GetRoleObjectAccesses]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getRouteDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
      ,src.Latitude as srclat
      ,src.Longitude as srclng
      ,dest.Latitude as destlat
      ,dest.Longitude as destlng 
  FROM [dbo].[Routes] r
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
	  
  FROM [dbo].[RouteDetails] rd
  inner join stops src on src.id = rd.stopid
inner join routes r on r.id = rd.routeid
inner join stops prevstops on prevstops.id =previousstopid
inner join stops nextstops on nextstops.id = nextstopid
  where (@routeid = -1 or routeid = @routeid)
  order by stopno

end


GO
/****** Object:  StoredProcedure [dbo].[GetRouteFare]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[RouteStops] rs
left outer join [dbo].[RouteFare] rf
on rf.routestopid = rs.id
  where rs.RouteId = @RouteId

select S.Name,S.Id from routedetails rd
inner join stops S on rd.StopId = S.Id 
where rd.RouteId = @RouteId

end


GO
/****** Object:  StoredProcedure [dbo].[getRoutes]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Routes] r
  inner join stops src on src.id = r.sourceid
  inner join stops dest on dest.id = destinationid
  order by RouteName
end


GO
/****** Object:  StoredProcedure [dbo].[getRoutesConfiguration]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetSchedulelist]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetSchedulelist]

as
begin

SELECT [Id]
      ,[ScheduleCode]
      ,[Src]
      ,[Dest]
      ,[VehicleTypeId]
      ,[VehicleGroupId]
      ,[Fromdate]
      ,[Todate]
      ,[StatusId]
  FROM [dbo].[ScheduleList]
end



GO
/****** Object:  StoredProcedure [dbo].[GetSchedules]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Schedules]
         
end


GO
/****** Object:  StoredProcedure [dbo].[GetScheduleTimings]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetScheduleTimings]
@Id int
as
begin
SELECT sd.[Id]
      ,[SDId]
      ,[StopName]
      ,[ArrivalTime]
      ,[DepatureTime]
      ,[CreatedOn]
      ,r.RouteName
      ,r.Code
  FROM [dbo].[ScheduleDetails] sd
  inner join Routes r on r.Id = sd.SDId
  where SDId =@Id
end



GO
/****** Object:  StoredProcedure [dbo].[GetShippingOrder]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[ShippingOrder]

         
end


GO
/****** Object:  StoredProcedure [dbo].[getShoppingCart]    Script Date: 28-09-2018 18:49:44 ******/
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
      
  FROM [dbo].[ShoppingCart]s 
  inner join InventoryItem i on i.Id=s.ItemId
  inner join Types ty on ty.Id=s.Transactionstatus
  
  order by [ItemId]
end


GO
/****** Object:  StoredProcedure [dbo].[getSMSEmailConfiguration]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[SMSEmailConfiguration] 

end


/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSEmailConfiguration]    Script Date: 07/18/2016 17:07:36 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[getSMSEmailSubscribers]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getSmsGatewayeConfiguration]    Script Date: 28-09-2018 18:49:44 ******/
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
     
  FROM [dbo].[SmsGatewayeConfiguration] 
    
  
    
end

/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSGatewayConfiguration]    Script Date: 07/18/2016 17:10:33 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetSMSProviderConfig]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetSOSMessages]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSOSMessages]
@UserTypeId int=-1,@UserId int=-1
as 
begin
SELECT s.[Id]
      ,t.Name as UserType 
      ,t.Id as UserTypeId 
      ,u.FirstName as Username    
      ,[SentTo]
      ,t1.Name as template
      ,[MessageId]
      ,[Message]
      ,[SentOn]
      ,[SentTime]
      ,[StatusId]
      ,st.Name as Status 
      ,[Latitude]
      ,[Longitude]
  FROM [dbo].[SOSMessages] s  
  inner join Types t on t.Id = s.UserTypeId  
  left outer join Users u on u.Id = s.UserId
  left outer join Types t1 on t1.Id=s.MessageId
  left outer join Types st on st.Id=s.StatusId
  
  --where UserTypeId=@UserTypeId  and UserId=@UserId
end


GO
/****** Object:  StoredProcedure [dbo].[GetSOSNumber]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetSOSNumber]
@UserTypeId int=-1,@UserId int=-1
as 
begin
SELECT [Id]
      ,[UserTypeId]
      ,[MobileNumber]
      ,[UserId]
      ,[CreatedOn]
      ,[Active]
      ,[MobiOrder]
      ,[UserName]
  FROM [dbo].[SOSNumber]
  where UserTypeId=@UserTypeId and UserId=@UserId
end


GO
/****** Object:  StoredProcedure [dbo].[GetSostemplates]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSostemplates]
@countryid int,@usertypeid int
as
begin


select t.Id  
      ,t.Name as DocType      
      ,t.Description
      ,case when S.Id IS null then 0 else 1 end as selected
      ,CountryId      
      ,S.IsMandatory 
      ,S.UserTypeId       
       from Types t
left outer join
(select Id,UserTypeId,CountryId,Name,Template,[Description],IsMandatory from [dbo].[SosTemplates]  
where ((CountryId = @countryid or @countryid = -1) and (UserTypeId = @usertypeid or @usertypeid = -1))
) S on (t.Id = S.UserTypeId) 
where t.TypeGroupId = 29 
  
  end


GO
/****** Object:  StoredProcedure [dbo].[Getsp_Availableseats]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Ex_Availableseats] where SourceId=@Src_Id and DestinationId=@Des_Id
END


GO
/****** Object:  StoredProcedure [dbo].[GetSTATE]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetStops]    Script Date: 28-09-2018 18:49:44 ******/
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
	  ,[Latitude]
      ,[Longitude] 
  FROM [dbo].[Stops]




END


GO
/****** Object:  StoredProcedure [dbo].[GetSubCategories]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[SubCategory] S
  INNER JOIN Types T ON T.ID = S.CATEGORYID
  INNER JOIN TypeGroups TG ON TG.Id = T.TypeGroupId 
  where (S.CATEGORYID = @catid or @catid = -1)
   	
END


GO
/****** Object:  StoredProcedure [dbo].[Gettable2]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTaxiprice]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTaxiprice]
@SrcId int,@DestId int
as
begin
select  [Amount] from dbo.VehicleDistancePrice
end


GO
/****** Object:  StoredProcedure [dbo].[GetTaxiStopsList]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetTaxiStopsList]
as 
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Latitude]
      ,[Longitude]
	   ,[PlaceId]
      ,[ShortName]
      ,[LongName]
      ,[CountryId]
  FROM [dbo].[TaxiSrcDest]


GO
/****** Object:  StoredProcedure [dbo].[GetTicketDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getTicketGeneration]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTicketHistory]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTicketsForCancellation]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTrackVehicle]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getTrans]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTransactionCharges]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create  Procedure [dbo].[GetTransactionCharges]
As
Begin
select
tc.[Id],
[TransactionMasterId],
[ChargeId],
tm.TransactionId
,cc.Title as Title,
[Amount],
cc.Code,
[AppliedOnDate] from TransactionCharges tc 
inner join TransactionMaster tm on tm.Id = tc.TransactionMasterId
inner join ChargesDiscounts cc on cc.Id = tc.ChargeId

End


GO
/****** Object:  StoredProcedure [dbo].[GetTransactionDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[GetTransactionDetails]
As
Begin
select
td.[Id],
[TransactionMasterId],
td.[Date],
td.[Time],
td.[UpdatedOn],
td.[PaymentTypeId],
t.Name as PaymentType,
[AccountNumber] ,
[TransactionOTP],
[OTPVerified],
td.[StatusId] ,
tt.Name as Status,
tm.TransactionId
from TransactionDetails td
inner join TransactionMaster tm on tm.Id = td.TransactionMasterId
inner join Types tt on tt.Id = td.StatusId
inner join Types t on t.id = td.PaymentTypeId

End


GO
/****** Object:  StoredProcedure [dbo].[GetTransactionDiscounts]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[GetTransactionDiscounts]
As
begin
SELECT td.[Id]
      ,[TransactionMasterId]
      ,[DicountId]
	  ,cd.Title as Title
	  ,tm.TransactionId
      ,[Amount]
      ,[AppliedOnDate]
  FROM [dbo].[TransactionDiscounts] td 

  inner join TransactionMaster tm on tm.Id =  td.TransactionMasterId
  inner join ChargesDiscounts cd on cd.Id = td.DicountId
End


GO
/****** Object:  StoredProcedure [dbo].[GetTransactionInfo]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[GetTransactionInfo]
As
Begin
SELECT ti.[Id]
      ,[TransactionMasterId]
      ,[EmailSent]
      ,[SmsSent]
      ,[NumberOfRetries]
      ,ti.[StatusId]
      ,[EmailSentOn]
      ,[SmsSentOn]
      ,[SmsPhoneNumber]
      ,[EmailAddress]
      ,[TransactionDocument]
      ,ti.[Date]
      ,ti.[Time]
	  ,tm.TransactionId
  FROM [dbo].[TransactionInfo] ti 
  inner join TransactionMaster tm on tm.Id = ti.TransactionMasterId
end


GO
/****** Object:  StoredProcedure [dbo].[GetTransactionMaster]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetTransactionMaster]
--@Id int
as
begin

SELECT tm.[Id]
      ,[TransactionId]
      ,[GateWayTransactionId]
      ,tt.Name as Status
	  ,tm.PaymentTypeId
      ,[Date]
      ,[Time]
      ,[BaseAmount]
      ,[Discount]
      ,[Charges]
      ,[TotalAmount]
      ,[OpCode]
      ,[CreatedBy]
      ,[UpdatedOn]
      ,t.Name as PaymentType
      ,tm.[Description]
      ,[StatusDescription]
  FROM [dbo].[TransactionMaster] tm
  inner join Types t on t.Id = tm.PaymentTypeId
  inner join Types tt on tt.Id = tm.StatusId
  --where Id = @Id 
end



GO
/****** Object:  StoredProcedure [dbo].[getTransactions]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getTransactionTypes]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTripStatus]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTripStatus]
@Mobilenumber varchar(20)
as
begin

declare @cnt int


select @cnt = Count(*) from PSVehicleBookingDetails where DriverPhoneNo = @Mobilenumber

 if @cnt = 0
   begin
          RAISERROR('Invalid Driver',18,6);
          return;

end
else 
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
      ,[BooKingOTP]
      ,[Amount]
      ,[PaymentStatus]
      ,[Rating]
      ,[RatedBy]
      ,[Comments]
      ,[UpdatedBy]
      ,[UpdatedUserId]
      ,[DriverRating]
      ,[DriverRated]
      ,[DriverComments]
      ,[TripCount]
      ,[SeatsOccupied]
      ,[VehicleGroupId]
      ,[Distance]
  FROM [dbo].[PSVehicleBookingDetails]


where DriverPhoneNo=@Mobilenumber and BookingStatus = 'OnTrip'
end
end


GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingCategories]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingDevice]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingHandlers]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTroubleTicketingSlaType]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTroubleTicketingStatus]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getTypeGroups]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getTypes]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTypesByGroupId]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTypesByPaging]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTypesByPaging] 
(@typegrpid int = -1,
@curpage int=-1,
@maxrows int=-1
)
AS
begin

-- Determine the first record and last record 
DECLARE @FirstRec int, @LastRec int,@totalpages int, @totalrec int

SELECT @FirstRec = (@curpage - 1) * @maxrows
SELECT @LastRec = (@curpage * @maxrows + 1);

WITH TempResult as
(
SELECT ROW_NUMBER()  OVER(ORDER BY t.id asc) as RowNum,t.Id, t.Name, t.[Description],t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 from [Types] t
	 inner join TypeGroups tg on tg.Id = t.TypeGroupId	 
	  where (TypeGroupId = @typegrpid or @typegrpid = -1)
)
SELECT top (@LastRec-1) *
FROM TempResult
WHERE RowNum > @FirstRec 
AND RowNum < @LastRec

select @totalrec =  COUNT(*)
from (SELECT ROW_NUMBER()  OVER(ORDER BY t.id asc) as RowNum,t.Id, t.Name, t.[Description]
,t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 from [Types] t
	 inner join TypeGroups tg on tg.Id = t.TypeGroupId	 
	  where (TypeGroupId = @typegrpid or @typegrpid = -1)) as temp
	if((@totalrec%@maxrows)=0)
	select @totalpages=(@totalrec/@maxrows);
	else 
	select @totalpages=(@totalrec/@maxrows)+1;
	  
select @totalpages as totalpages, @totalrec as recordcount  

end


GO
/****** Object:  StoredProcedure [dbo].[GetULFeatures]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[ULFeatures]
 
end


GO
/****** Object:  StoredProcedure [dbo].[GetULPymtTransDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[ULPymtTransDetails]
end


GO
/****** Object:  StoredProcedure [dbo].[Getusercards]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getUserdetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[getUserid]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getUserid]
as 
begin
select id,UserId from AddNewCardData1
end


GO
/****** Object:  StoredProcedure [dbo].[GetUserinfo]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserLicense]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[UserLicense]u
  inner join Users us on us.Id=u.UserId
  inner join FleetOwner f on f.Id=u.FOId
  inner join Types r on r.Id = RenewFreqTypeId
  inner join LicenseTypes lt on lt.Id = LicenseTypeId
  inner join UserLicensePayments ulp on ulp.Id = u.Id
  inner join ULPymtTransDetails uld on uld.Id = u.id
  
end


--upper(f.FleetOwnerCode) = upper(@focode)


GO
/****** Object:  StoredProcedure [dbo].[GetUserLicensePayments]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[UserLicensePayments]
  
end


GO
/****** Object:  StoredProcedure [dbo].[GetUserLicensePymtTransactions]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[UserLicensePymtTransactions]
  
 
  
end


GO
/****** Object:  StoredProcedure [dbo].[GetUserpreferences]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserRoles]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Users]  
  inner join userroles ur on ur.userid = users.id 
  inner join Roles r on r.Id = Ur.RoleId 
  inner join company c on c.id = ur.companyid
  where (c.id = @companyId or   @companyId = -1)    

END


GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[Users] U
  inner join company c on (U.companyid = c.id)
  left outer join Users mgr on mgr.id = U.managerid
  left outer join dbo.userlogins ul on ul.userid = U.id  
  left outer join Roles r on r.Id = U.RoleId     
  where (c.id = @cmpId or   @cmpId = -1)
end


GO
/****** Object:  StoredProcedure [dbo].[getUsersdetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getUsersdetails]
@UId int

as 
begin
SELECT [Id]
      ,[FirstName]
      ,[LastName]
      ,[MiddleName]
      ,[EmpNo]
      ,[EmailId]
      ,[RoleId]
      ,[CompanyId]
      ,[Active]
      ,[GenderId]
      ,[ManagerId]
      ,[CountryId]
      ,[StateId]
      ,[ZipCode]
      ,[ContactNo1]
      ,[ContactNo2]
      ,[Address]
      ,[AltAddress]
      ,[photo]
  FROM [dbo].[Users]
  where Id=@UId
end


GO
/****** Object:  StoredProcedure [dbo].[Getusertickets]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetVehicleConfiguration]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[GetVehicleConfiguration]
@VId int
As
Begin
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [dbo].[Types]
  where Id=@VId
end


GO
/****** Object:  StoredProcedure [dbo].[getVehicleDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[GetVehicleDistPrices]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetVehicleDistPrices]
as
begin
SELECT vd.[Id]
      ,[SourceLoc]
      ,[DestinationLoc]
      ,t.Name as [VehicleGroup]
      ,tt.Name as [VehicleType]
      ,p.Name as [PricingType]
      ,[Distance]
      ,[Amount]
      ,[SrcId]
      ,[DestId]
  FROM [dbo].[VehicleDistancePrice] vd
  inner join Types t on t.Id = vd.VehicleGroupId
  inner join Types tt on tt.Id = vd.VehicleTypeId
  inner join Types p on p.Id = vd.PricingTypeId
end


GO
/****** Object:  StoredProcedure [dbo].[GetVehicleSchedule]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetVehicleSchedule]
as
begin
SELECT [Id]
      ,[VehicleId]
      ,[SDId]
      ,[CreatedOn]
      ,[StatusId]
  FROM [dbo].[VehicleScheduleDetails]
end


GO
/****** Object:  StoredProcedure [dbo].[GetWebsiteUserInfo]    Script Date: 28-09-2018 18:49:44 ******/
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
  FROM [dbo].[WebsiteUserInfo]  
  where ((UserName = @logininfo1 or EmailAddress = upper(@logininfo1)
   or Mobile = @logininfo1))
   
end

/****** Object:  StoredProcedure [dbo].[GetinterbusUserLogin]    Script Date: 06/08/2016 16:08:17 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetZipCode]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVDriverRating]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVDriverRating]
@Mobilenumber varchar(20),@BNo varchar(20),@DriverRating float,@DriverRated int,@DriverComments varchar(250)
as
begin
update dbo.PSVehicleBookingDetails 
set [DriverRating] = @DriverRating,
 [DriverRated] = @DriverRated, 
[DriverComments]=@DriverComments
where BNo = @BNo

select [BNo],[DriverPhoneNo],[DriverRating],[DriverRated] from PSVehicleBookingDetails  where BNo = @BNo
end


GO
/****** Object:  StoredProcedure [dbo].[HVGetallocatedriver]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVGetallocatedriver]
@VID int =-1
as
begin
 SELECT Vm.[Id] VechId            
      ,va.[RegistrationNo]
      ,[VehicleTypeId]
      ,[ModelYear]      
      ,va.[VehicleModelId]
      ,[HasAC]
      ,vm.[VehicleGroupId]
      ,vm.[StatusId]
      ,vm.[IsVerified] vVerified
      ,dm.[IsVerified] dVerified
      ,[VehicleCode]
      ,[IsDriverOwned]
      ,va.[DriverId]
      ,dm.[CountryId]
      ,vt.Name VehicleType
      ,vmo.Name VehicleModel
      ,vg.Name VehicleGroup
      ,va.[Status]   
      ,dm.NAme
      ,dm.PMobNo
      ,dm.Email
      ,dm.Address
      ,va.EffectiveDate
      ,va.EffectiveTill
      ,vm.VehicleCode
      ,dm.DriverCode
  FROM [dbo].[PSVehicleAssign] va 
  inner join PSVehicleMaster vm on vm.id = va.Vechid
  inner join PSDriverMaster dm on dm.DId = va.DriverId
   left outer join Types vt on vt.Id = vm.[VehicleTypeId]
   left outer join Types vmo on vmo.Id = vm.[VehicleModelId]   
   left outer join Types vg on vg.Id = vm.[VehicleGroupId]

end


GO
/****** Object:  StoredProcedure [dbo].[HVGetbankingdetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVGetbankingdetails]
@DId int 
as
begin
SELECT b.[Id]
      ,[Accountnumber]
      ,[BankName]
      ,[BankCode]
      ,[BranchAddress]
      ,c.Name as [Country]
      ,[CountryId] 
      ,[IsActive]
      ,[QRCode] 
      ,[IsPrimary] 
  FROM [dbo].PSDriverBankingDetails b
  inner join Country c on c.Id = b.CountryId
  
  where DriverId = @DId
end


GO
/****** Object:  StoredProcedure [dbo].[HVGetBookingdetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVGetBookingdetails]
@BNo varchar(20)
as
begin
SELECT v.[Id]
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
      ,v.[DriverId]
      ,[DriverPhoneNo]
      ,[CustomerPhoneNo]
      ,[CustomerId]
      ,[BookingStatus]
      ,[NoofVehicles]
      ,v.[NoofSeats]
      ,[ClosingDate]
      ,[ClosingTime]
      ,[CancelledOn]
      ,[CancelledBy]
      ,[BookingChannel]
      ,[Reasons]
      ,c.Name as [CompanyId]
      ,[BooKingOTP]
      ,[Amount]
      ,[PaymentStatus]
      ,[Rating]
      ,[RatedBy]
      ,[Comments]
      ,[UpdatedBy]
      ,[UpdatedUserId]
      ,[DriverRating]
      ,[DriverRated]
      ,[DriverComments]
	   ,[Distance]
      ,d.[NAme] as DriverName,
      t.Name as PaymentType,
      vv.RegistrationNo as RegNo
      --,t.Name as [VehicleModelId]
  FROM [dbo].[PSVehicleBookingDetails] v
 Left outer join Company c on c.Id= v.CompanyId
 left outer join PSDriverMaster d on d.DId = v.DriverId
 left outer join Types t on t.Id = v.PaymentTypeId 
 left outer join PSVehicleMaster vv on vv.Id = v.VechId 
 --inner join Types t on t.Id = d.VehicleModelId
  where BNo = @BNo
end


GO
/****** Object:  StoredProcedure [dbo].[HVGetBookingHistory]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVGetBookingHistory]
@PhoneNo nvarchar(50)
as
begin

SELECT v.[Id]
      ,v.[BNo]
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
      ,[PaymentStatus]
      ,[Rating]
      ,[RatedBy]
      ,v.[Comments]
      ,[UpdatedBy]
      ,[UpdatedUserId]
      ,t.[Amount]
  FROM [dbo].[PSVehicleBookingDetails] v
  inner join TripPayments t on t.BNo = v.BNo  
  
 where (CustomerPhoneNo = @PhoneNo)
 order by  [BookedDate] desc,[BookedTime] desc
 
 end


GO
/****** Object:  StoredProcedure [dbo].[HVgetClosingReport]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVgetdriver]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVgetdriverdetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVgetdriverdetails]
@DId int
as
begin

declare  @vgrpid int, @cid int

select @vgrpid = VehicleGroupId, @cid = CountryId from PSDriverMaster where DID = @DId

SELECT [DId]
      ,d.FirstName + ' ' + d.LastName as NAme
      ,d.[Address]
      ,[City]
      ,[Pin]
      ,[PAddress]
      ,[PCity]
      ,[PPin]
      ,[OffMobileNo]
      ,[PMobNo]
      ,[DOB]
      ,[DOJ]
      ,[BloodGroup]     
      ,[Remarks]
      ,c.Name as [CompanyId]  
	  ,[Photo]      
	  ,[Firstname] 
	  ,[lastname] 
	  ,[DriverCode]
	  ,CountryId
	  ,[Status]
	  ,VehicleGroupId
	  ,[IsApproved]
	  ,[PaymentTypeId]
  FROM [dbo].[PSDriverMaster] d
    left outer join Company c on c.Id = d.CompanyId
    where DId = @DId
    
   
 
 SELECT adoc.[Id]
      ,[DriverId]
      ,[FileName] docName      
      ,[DocTypeId]  
      ,[ExpiryDate] expiryDate
      ,[CreatedById]
      ,[UpdatedById]
      ,[DueDate]     dueDate      
     ,t.Name docType  
     , DATEDIFF(DAY, GETDATE(),ExpiryDate) daysLeft
           
       ,case when GETDATE() > ExpiryDate  then 1 
      when (DATEDIFF(DAY, GETDATE(),ExpiryDate)  < 90) then 2
       else 0 end as IsExpired
      ,case when  dueDate < GETDATE()  then 1 else 0 end as PastDue 
      ,[DocumentNo]
           ,[DocumentNo2]
           ,[IsVerified]      
           ,[IsApproved]
              ,case when FileContent is null then 0 else 1 end uploaded   
  FROM [dbo].[DriverDocuments] adoc  
  left outer join Types t on t.Id = DocTypeId
  where [DriverId] = @DId 
  
   SELECT 
       [VechID]
      ,[PhoneNo]
      ,[AltPhoneNo]      
      ,[Package]
      ,[VehicleType]    
      ,[RegistrationNo]
      ,[DriverName]
      ,t1.Name as VehicleGroup 
      ,[VehicleGroupId]
      ,tt.Name as VehicleModel
      ,[VehicleModelId] 
      ,[Status]
      ,[IsVerified]
  FROM [dbo].[PSVehicleAssign] va
  left outer join Types t1 on t1.Id = va.VehicleGroupId
  left outer join Types tt on tt.Id = va.VehicleModelId
  where DriverId = @DId
  
SELECT 
	  b.Id,
      [Accountnumber],
      [BankName] ,
      [BankCode] ,
      [BranchAddress],     
	  c.Name as [Country] ,
	[IsActive],
	[DriverId]
	,[DRCode]
	,[QRCode]
  FROM dbo.PSDriverBankingDetails b
   inner join Country c on c.Id = b.CountryId
  where driverid = @DId
  
  select m.DocTypeId Id, t.Name,m.IsMandatory,case when dd.FileContent IS null then 0 else 1 end as uploaded
  from MandatoryUserDocuments m
inner join Types t on t.Id = m.DocTypeId 
left outer join DriverDocuments dd on dd.DocTypeId = t.Id and dd.DriverId = @DID
where  
UserTypeId = 109 and 
VehicleGroupId = @vgrpid and CountryId = @cid

select [BookedDate]
,[Amount]
,[TripCount]
,[NoofSeats] 
 from PSVehicleBookingDetails
 where DriverId = @DId
--and t.Id not in (select DocTypeId from DriverDocuments dd where dd.DriverId = @DID and dd.FileContent is null)
end


GO
/****** Object:  StoredProcedure [dbo].[HVgetdrivermaster]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVgetdrivermaster]
(@ctryId int)
as
begin
SELECT distinct [DId]
      ,d.FirstName + ' ' + d.LastName as NAme
      ,d.[Address]
      ,[City]
      ,[Pin]
      ,[PAddress]
      ,[PCity]
      ,[PPin]
      ,[OffMobileNo]
      ,[PMobNo]
      ,[DOB]
      ,[DOJ]
      ,[BloodGroup]
      ,[Remarks]
      ,d.[CompanyId]              
     -- ,pv.RegistrationNo
     -- ,p.[BookingStatus] 
      ,d.DriverCode
      ,d.photo
      ,t.Name as [Status]
  FROM [dbo].[PSDriverMaster] d
 left outer join Types t on t.Id = d.[Status]
--left outer join PSVehicleAssign pv on pv.PhoneNo = d.PMobNo
--left outer join PSVehicleBookingDetails p on p.DriverPhoneNo = d.PMobNo   
  

where CountryId = @ctryId
end


GO
/****** Object:  StoredProcedure [dbo].[HVgetdrivermasterpaging]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[HVgetdrivermasterpaging]
(@ctryId int,
@curpage int=-1,
@maxrows int=-1)
as
begin

DECLARE @FirstRec int, @LastRec int,@totalpages int, @totalrec int,@totalrows int

SELECT @FirstRec = (@curpage - 1) * @maxrows
SELECT @LastRec = (@curpage * @maxrows + 1);

WITH TempResult as

(SELECT ROW_NUMBER() OVER(ORDER BY DId asc) as RowNum
      ,d.FirstName + ' ' + d.LastName as NAme
      ,d.[Address]
      ,[City]
      ,[Pin]
      ,[PAddress]
      ,[PCity]
      ,[PPin]
      ,[OffMobileNo]
      ,[PMobNo]
      ,[DOB]
      ,[DOJ]
      ,[BloodGroup]
      ,[Remarks]
      ,d.[CompanyId]              
     -- ,pv.RegistrationNo
     -- ,p.[BookingStatus] 
      ,d.DriverCode
      ,d.photo
      ,t.Name as [Status]
  FROM [dbo].[PSDriverMaster] d
 left outer join Types t on t.Id = d.[Status]
 --left outer join PSVehicleAssign pv on pv.PhoneNo = d.PMobNo
--left outer join PSVehicleBookingDetails p on p.DriverPhoneNo = d.PMobNo  
where CountryId = @ctryId)

SELECT top (@LastRec-1) *
FROM TempResult
WHERE RowNum > @FirstRec 
AND RowNum < @LastRec

select @totalrec =  COUNT(*)
from(SELECT ROW_NUMBER() OVER(ORDER BY DId asc) as RowNum
      ,d.FirstName + ' ' + d.LastName as NAme
      ,d.[Address]
      ,[City]
      ,[Pin]
      ,[PAddress]
      ,[PCity]
      ,[PPin]
      ,[OffMobileNo]
      ,[PMobNo]
      ,[DOB]
      ,[DOJ]
      ,[BloodGroup]
      ,[Remarks]
      ,d.[CompanyId]              
     -- ,pv.RegistrationNo
     -- ,p.[BookingStatus] 
      ,d.DriverCode
      ,d.photo
      ,t.Name as [Status]
  FROM [dbo].[PSDriverMaster] d
 left outer join Types t on t.Id = d.[Status]
 --left outer join PSVehicleAssign pv on pv.PhoneNo = d.PMobNo
--left outer join PSVehicleBookingDetails p on p.DriverPhoneNo = d.PMobNo  
where CountryId = @ctryId)

 as temp
	if((@totalrec%@maxrows)=0)
	select @totalpages=(@totalrec/@maxrows);
	else 
	select @totalpages=(@totalrec/@maxrows)+1;
	if((@totalrec)=0)
	select @totalrows=(@totalpages/@maxrows)+1;
	select @totalrows=(@maxrows)+1;
	 
	  
select @totalpages as totalpages, @totalrec as recordcount,@totalrows as totalrows  


end



GO
/****** Object:  StoredProcedure [dbo].[HVGetHistory]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVGetHistory]
@Vid int = -1,@Did int = -1
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
      ,[BooKingOTP]     
      ,[Amount]
      ,[PaymentStatus]
      ,[Rating]
      ,[RatedBy]
      ,[Comments]
      ,[UpdatedBy]
      ,[UpdatedUserId]
  FROM [dbo].[PSVehicleBookingDetails]
 where (VechId = @Vid or @Vid = -1)
  and (DriverId = @DId or @Did = -1)
  
  
end


GO
/****** Object:  StoredProcedure [dbo].[HVgetnearestvehicles]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVgetnearestvehicles]
@VehicleGroupId int,@Mobilenumber varchar(20),@lat numeric(10,6),@lng numeric(10,6)
as
begin
select  top 10  l.Latitude,l.Longitude,VM.VehicleGroupId,l.Status,vm.RegistrationNo
 from PSCurrentLocationStatus l
inner join  PSVehicleMaster VM on l.VId = VM.Id
inner join PSDriverMaster d on d.Did = l.Did
where (VM.VehicleGroupId = @VehicleGroupId or @VehicleGroupId = -1) and l.Status = 19
 order by ((l.Latitude) - @lat),((l.Longitude) - @lng) 

end


GO
/****** Object:  StoredProcedure [dbo].[HVgetnearvehicle]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVgetnearvehicle]
@bno varchar(10)
as
begin
select ps.Latitude,ps.Longitude,BookingStatus,[PaymentTypeId],[Pricing]+'30' as Amount from PSVehicleBookingDetails vb
inner join PSCurrentLocationStatus ps on ps.VId = VechId and ps.DId = vb.DriverId
where BNo = @bno

end


GO
/****** Object:  StoredProcedure [dbo].[HVGetprebookingdetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVgetprice]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVGetPricingDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVGetPricingDetails]
@vdpid int 
as
begin
SELECT [Id]
      ,[SourceLoc]
      ,[DestinationLoc]
      ,[SourceLat]
      ,[SourceLng]
      ,[DestinationLat]
      ,[DestinationLng]
      ,[VehicleGroupId]
      ,[VehicleTypeId]
      ,[PricingTypeId]
      ,[Distance]
      ,[UnitPrice]
      ,[Amount]
      ,[SrcId]
      ,[DestId]
      ,CountryId
  FROM [dbo].[VehicleDistancePrice] vd
  
  where Id = @vdpid
  
  end


GO
/****** Object:  StoredProcedure [dbo].[HVGetQrCode]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVGetQrCode]
@DId int 
as
begin
SELECT [Id]
      ,[QRCode]
      ,[IsPrimary]
  FROM [dbo].PSDriverBankingDetails 
  where DriverId = @DId and IsPrimary=1
end


GO
/****** Object:  StoredProcedure [dbo].[HVGetreport]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVGetRideDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVGetRideDetails]
@BNo varchar(20)
as
begin

SELECT b.[Id]
      ,b.[BNo]
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
      ,b.[DriverId]
      ,[DriverPhoneNo]
      ,[CustomerPhoneNo]
      ,[CustomerId]
      ,[BookingStatus]
      ,[NoofVehicles]
      ,b.[NoofSeats]
      ,[ClosingDate]
      ,[ClosingTime]
      ,[CancelledOn]
      ,[CancelledBy]
      ,[BookingChannel]
      ,[Reasons]
      ,b.[CompanyId]
      ,[BooKingOTP]
      ,t.[Amount] as Amount
      ,[PaymentStatus]
      ,[Rating]
      ,[RatedBy]
      ,b.[Comments]
      ,[UpdatedBy]
      ,[UpdatedUserId]
      ,d.NAme driver
      ,d.Photo as DPhoto
      ,vm.RegistrationNo  
      ,vm.Photo as VPhoto 
      ,t.PaymentModeId as PaymentModeId
      ,t.GatewayTransId as GatewayTransId  
      from PSVehicleBookingDetails b
      inner join PSVehicleMaster vm on vm.Id = b.VechId
      inner join PSDriverMaster d on d.DId = b.DriverId 
      inner join TripPayments t on t.BNo = b.BNo     
       where b.BNo= @BNo
      
end


GO
/****** Object:  StoredProcedure [dbo].[HVGetRidesList]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVGetRidesList]
@Mobilenumber varchar(20)
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
      ,[BooKingOTP]
      ,[Amount]
      ,[PaymentStatus]
      ,[Rating]
      ,[RatedBy]
      ,[Comments]
      ,[UpdatedBy]
      ,[UpdatedUserId]
       from PSVehicleBookingDetails where CustomerPhoneNo = @Mobilenumber 
      order by [BookedDate],[BookedTime]
      
end


GO
/****** Object:  StoredProcedure [dbo].[HVGetTariff]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVGetTripsHistory]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVGetTripsHistory]
@PhoneNo nvarchar(50)
as
begin

SELECT v.[Id]
      ,v.[BNo]
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
      ,t.[Amount] as Amount
      ,[PaymentStatus]
      ,[Rating]
      ,[RatedBy]
      ,v.[Comments]
      ,[UpdatedBy]
      ,[UpdatedUserId]
  FROM [dbo].[PSVehicleBookingDetails] v
  inner join TripPayments t on t.BNo = v.BNo
 where (DriverPhoneNo = @PhoneNo)
 order by [BookedDate] desc,[BookedTime] desc
end


GO
/****** Object:  StoredProcedure [dbo].[HVgetvehilcetypes]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVInsUpdBankdetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVInsUpdBankdetails]
@flag varchar,@Id int=-1,@Accountnumber varchar(50)=null,@BankName nvarchar(50)=null,
@BankCode nvarchar(50)=null,@BranchAddress nvarchar(50)=null,
@CountryId varchar(50)=null,@IsActive int =null,@DriverId int = null,@Code varchar(20)=null
,@QRCode varchar(max) = null
as
begin
declare @cnt int ,@ctry int,@CId varchar(20)
select @ctry = cc.Id from Country cc where upper(cc.Name)=UPPER(@CountryId)
set @CId = replace(CONVERT(VARCHAR(20), GETDATE(), 114),':','')


if @flag='I'
begin

	 set @Code = 'DR'

	
insert into dbo.PSDriverBankingDetails
	([Accountnumber],[BankName] ,[BankCode] ,[BranchAddress],
	[CountryId],[IsActive],[DriverId],[DRCode],[QRCode])	
	values
	(@Accountnumber, @BankName,@BankCode ,@BranchAddress ,
	@ctry,@IsActive,@DriverId,'DR',@QRCode)
	
	set @Id = SCOPE_IDENTITY()
	
	end

else
if @flag='U'
		begin
		
		
		select @cnt = COUNT(*) from dbo.PSDriverBankingDetails where Accountnumber = @Accountnumber 

	if @cnt = 0
		begin
				RAISERROR ('No User Registered with given MobileNumber',16,1);
				return;	
		end 
		
		Update  dbo.PSDriverBankingDetails
	set 
	[Accountnumber] = @Accountnumber,
	[BankName] =@BankName,
	[BankCode] =@BankCode,
	[BranchAddress]=@BranchAddress,	
	[CountryId] =@CountryId,
	[IsActive]=@IsActive,
	[DriverId] = @DriverId,
	[DRCode] = @Code,
	[QRCode] = @QRCode
	where Id = @Id
	end 
	
	
	SELECT 
	  Id,
      [Accountnumber],
      [BankName] ,
      [BankCode] ,
      [BranchAddress],     
	[CountryId] ,
	[IsActive],
	[DriverId]
	,[DRCode] Code
	,[QRCode]
  FROM dbo.PSDriverBankingDetails where  Id = @Id

END


GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdBankingdetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVInsUpdBankingdetails]
@flag varchar,
@Id int=-1,
@Accountnumber varchar(50)=null,
@BankName nvarchar(50)=null,
@BankCode nvarchar(50)=null,
@BranchAddress nvarchar(50)=null,
@CountryId varchar(50)=null,
@IsActive int =null,
@DriverId int = null,
@Code varchar(20)=null,
@QRCode varchar(max) = null,
@IsPrimary int=null
as
begin
declare @cnt int ,@ctry int,@CId varchar(20)
select @ctry = cc.Id from Country cc where upper(cc.Name)=UPPER(@CountryId)
set @CId = replace(CONVERT(VARCHAR(20), GETDATE(), 114),':','')


if @flag='I'
begin

	 set @Code = 'DR'

	
insert into dbo.PSDriverBankingDetails
	([Accountnumber],[BankName] ,[BankCode] ,[BranchAddress],
	[CountryId],[IsActive],[DriverId],[DRCode],[QRCode],[IsPrimary])	
	values
	(@Accountnumber, @BankName,@BankCode ,@BranchAddress ,
	@CountryId,@IsActive,@DriverId,'DR',@QRCode,@IsPrimary)
	
	set @Id = SCOPE_IDENTITY()
	
	end

else
if @flag='U'
		begin
		
		
		select @cnt = COUNT(*) from dbo.PSDriverBankingDetails where Accountnumber = @Accountnumber 

	if @cnt = 0
		begin
				RAISERROR ('No User Registered with given MobileNumber',16,1);
				return;	
		end 
		
		Update  dbo.PSDriverBankingDetails
	set 
	[Accountnumber] = @Accountnumber,
	[BankName] =@BankName,
	[BankCode] =@BankCode,
	[BranchAddress]=@BranchAddress,	
	[CountryId] =@CountryId,
	[IsActive]=@IsActive,
	[DriverId] = @DriverId,
	[DRCode] = @Code,
	[QRCode] = @QRCode,
	[IsPrimary]=@IsPrimary
	where Id = @Id
	end 
	
	
	SELECT 
	  Id,
      [Accountnumber],
      [BankName] ,
      [BankCode] ,
      [BranchAddress],     
	[CountryId] ,
	[IsActive],
	[DriverId]
	,[DRCode] Code
	,[QRCode]
	,[IsPrimary]
	
  FROM dbo.PSDriverBankingDetails where  Id = @Id

END


GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdbooking]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[HVInsUpdbooking]
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
/****** Object:  StoredProcedure [dbo].[HVInsUpdcancelbooking]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVInsUpdcancelbooking]
@BNo varchar(20),@cancellationType int,@CancelReason varchar(250), @CancelledBy varchar(50)
as
begin
declare @cnt int 

select @cnt = COUNT(*) from PSVehicleBookingDetails where BNo = @BNo
if @cnt = 0
		begin
				RAISERROR ('Invalid booking number',16,1);
				return;	
		end
if @cnt > 0 
begin
update PSVehicleBookingDetails
set [BookingStatus]='Cancelled',
[Reasons]=@CancelReason,
[CancelledBy] = @CancelledBy,
[CancelledOn] = GETDATE()
where BNo = @BNo
end
if @@ROWCOUNT > 0
select BNo from PSVehicleBookingDetails where BNo = @BNo
else
select 0

end


GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdDelClosingReport]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVInsUpdDelDriverDocs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[HVInsUpdDelDriverDocs]
(
@Id int = -1,
@DriverId int
,@FileName varchar(100)          
           ,@DocTypeId int
           ,@ExpiryDate date = null          
           ,@UpdatedById int
           ,@DueDate date = null
           ,@FileContent varchar(max) = null
           ,@change varchar
,@loggedinUserId int
	,@DocumentNo varchar(50) = NULL
	,@DocumentNo2 varchar(50)= NULL
	,@IsVerified int= NULL
)
AS
BEGIN
declare @username varchar(150),@olddoctypeId int,@oldexpirydate date,@doctype varchar(50)
declare @dt datetime, @edithistoryid int, @oldname varchar(50), @oldDescription  varchar(250),@cnt int 


set @dt = GETDATE()

	If (@change='I' or @change='i')
	BEGIN
		  select @cnt = COUNT(*) from dbo.DriverDocuments where DocTypeId = @DocTypeId 
		  and DriverId = @DriverId 
		  
		  
		  if @cnt >0
			BEGIN
	INSERT INTO [dbo].[DriverDocuments]
           ([DriverId]
           ,[FileName]           
           ,[DocTypeId]
           ,[ExpiryDate]
           ,[CreatedById]
           ,[UpdatedById]
           ,[DueDate]
           ,[FileContent]
           ,[DocumentNo]
           ,[DocumentNo2]
           ,[IsVerified])
     VALUES
           (@DriverId 
			,@FileName           
           ,@DocTypeId 
           ,@ExpiryDate
           ,@UpdatedById
           ,@UpdatedById
           ,@DueDate
           ,@FileContent 
           ,@DocumentNo
           ,@DocumentNo2
           ,0--@IsVerified          
           )
	
	end
	else 			
		RAISERROR('Document already exists for the Driver',16,1); 
	end
	else
	If (@change='U' or @change='u')
	begin
	
		select @cnt = COUNT(*) from dbo.DriverDocuments where DocTypeId = @DocTypeId 
		  and Id <> @Id and DriverId = @DriverId and [FileContent] is null
		  
		
		  
		if @cnt =0
		begin
			
			UPDATE [dbo].[DriverDocuments]
		   SET [DriverId] = @DriverId
			  ,[FileName] = @FileName
			  ,[DocTypeId] = @DocTypeId
			  ,[ExpiryDate] = @ExpiryDate			  
			  ,[UpdatedById] = @loggedInUserId
			  ,[DueDate] = @DueDate
			  ,[FileContent] = @FileContent
			   ,[DocumentNo] = @DocumentNo
           ,[DocumentNo2] = @DocumentNo2
           ,[IsVerified] = @IsVerified
				WHERE Id = @Id
		end       
		else
			RAISERROR('Duplicate documents are not allowed',16,1);
	
	
 end
	else
	If (@change='D' or @change='d')
	begin
	   DELETE FROM [dbo].[DriverDocuments]
      WHERE Id = @Id

		-- exec InsEditHistory @RootAssetId,'Deletion', 'Document is deleted',@FileName,'Equipment Document',null,@username,@edithistoryid = @edithistoryid output				              
		   

end
	
	SELECT adoc.[Id]
      ,[DriverId]
      ,[FileName] docName      
      ,[DocTypeId] DocTypeId
      ,[ExpiryDate] expiryDate
      ,[CreatedById]
      ,[UpdatedById]
      ,[DueDate]     dueDate      
     ,t.Name docType  
     , DATEDIFF(DAY, GETDATE(),ExpiryDate)
           
       ,case when GETDATE() > ExpiryDate  then 1 
      when (DATEDIFF(DAY, GETDATE(),ExpiryDate)  < 90) then 2
       else 0 end as IsExpired
      ,case when  dueDate < GETDATE()  then 1 else 0 end as PastDue
      ,[DocumentNo]
           ,[DocumentNo2]
           ,[IsVerified]           
  FROM [dbo].[DriverDocuments] adoc  
  left outer join Types t on t.Id = DocTypeId
  where DriverId = @DriverId 
  
  end


GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdDelreport]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVInsUpdDelTariff]    Script Date: 28-09-2018 18:49:44 ******/
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
	(Duration,KiloMtr,IndicaRate,IndigoRate,InnovaRate,Tag)	
	values
	(@Duration,@KiloMtr,@IndicaRate,@IndigoRate,@InnovaRate,@Tag)


		Update  Hourly_Tariff
	set --[SrNo] =@SrNo,
	[Duration] =@Duration,
	[KiloMtr] =@KiloMtr,
	[IndicaRate] =@IndicaRate,
	[IndigoRate] =@IndigoRate,
	[InnovaRate] =@InnovaRate,
	[Tag] =@Tag

END


GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdDelVehicleDocs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HVInsUpdDelVehicleDocs]
(
@Id int = -1,
@VehicleId int
,@FileName varchar(100)          
           ,@DocTypeId int
           ,@ExpiryDate date = null          
           ,@UpdatedById int
           ,@DueDate date = null
           ,@FileContent varchar(max) = null
           ,@change varchar
,@loggedinUserId int
	,@DocumentNo varchar(50) = NULL
	,@DocumentNo2 varchar(50)= NULL
	,@IsVerified int= NULL
)

AS
BEGIN
declare @username varchar(150),@RootAssetId int,@olddoctypeId int,@oldexpirydate date,@doctype varchar(50)
declare @dt datetime, @edithistoryid int, @oldname varchar(50), @oldDescription  varchar(250),@cnt int 


--select @username = FirstName+LastName from users where Id = @loggedInUserId

set @dt = GETDATE()

	If (@change='I' or @change='i')
	BEGIN
		  select @cnt = COUNT(*) from dbo.VehicleDocuments where DocTypeId = @DocTypeId  
		  and VehicleId = @VehicleId 
		  
		  
		  if @cnt >0
			BEGIN
	INSERT INTO [dbo].[VehicleDocuments]
           ([VehicleId]
           ,[FileName]           
           ,[DocTypeId]
           ,[ExpiryDate]
           ,[CreatedById]
           ,[UpdatedById]
           ,[DueDate]
           ,[FileContent]
           ,[DocumentNo]
           ,[DocumentNo2]
           ,[IsVerified])
     VALUES
           (@VehicleId 
			,@FileName           
           ,@DocTypeId 
           ,@ExpiryDate
           ,@UpdatedById
           ,@UpdatedById
           ,@DueDate
           ,@FileContent           
           ,@DocumentNo
           ,@DocumentNo2
           ,0--@IsVerified          
           )
	
     --      exec InsEditHistory 'Insertion', 'Document is uploaded',@FileName,'Equipment Document',null,@username,@edithistoryid = @edithistoryid output				              
		   --exec InsEditHistoryDetails @edithistoryid,null,@FileName,'Insertion','File Name',null
	
	end
	else 			
		RAISERROR('Document already exists for the vehicle',16,1); 
	end
	
	else
	If (@change='U' or @change='u')
	begin
	
		select @cnt = COUNT(*) from dbo.VehicleDocuments where DocTypeId = @DocTypeId 
		  and Id <> @Id and VehicleId = @VehicleId and [FileContent] is null
		  
		
		  
		if @cnt =0
		begin
			
			UPDATE [dbo].[VehicleDocuments]
		   SET [VehicleId] = @VehicleId
			  ,[FileName] = @FileName
			  ,[DocTypeId] = @DocTypeId
			  ,[ExpiryDate] = @ExpiryDate			  
			  ,[UpdatedById] = @loggedInUserId
			  ,[DueDate] = @DueDate
			  ,[FileContent] = @FileContent
			  ,[DocumentNo] = @DocumentNo
           ,[DocumentNo2] = @DocumentNo2
           ,[IsVerified] = @IsVerified
				WHERE Id = @Id
		end       
		else
			RAISERROR('Duplicate documents are not allowed',16,1);
	
	
 end
	else
	If (@change='D' or @change='d')
	begin
	   DELETE FROM [dbo].[VehicleDocuments]
      WHERE Id = @Id

		-- exec InsEditHistory @RootAssetId,'Deletion', 'Document is deleted',@FileName,'Equipment Document',null,@username,@edithistoryid = @edithistoryid output				              
		   

end
	
	SELECT adoc.[Id]
      ,[VehicleId]
      ,[FileName]       
      ,[DocTypeId] 
      ,[ExpiryDate] expiryDate
      ,[CreatedById]
      ,[UpdatedById]
      ,[DueDate]     dueDate      
     ,t.Name docType  
     , DATEDIFF(DAY, GETDATE(),ExpiryDate)
           
       ,case when GETDATE() > ExpiryDate  then 1 
      when (DATEDIFF(DAY, GETDATE(),ExpiryDate)  < 90) then 2
       else 0 end as IsExpired
      ,case when  dueDate < GETDATE()  then 1 else 0 end as PastDue       
      ,[DocumentNo]
           ,[DocumentNo2]
           ,[IsVerified]      
  FROM [dbo].[VehicleDocuments] adoc  
  left outer join Types t on t.Id = DocTypeId
  where [VehicleId] = @VehicleId 
  
	 
END


GO
/****** Object:  StoredProcedure [dbo].[HVInsUpddriver]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVInsUpddriver]
@flag varchar,@DId int=-1
,@CompanyId varchar(50)=null
,@NAme nvarchar(50)=null,
@Address nvarchar(50)=null
,@City nvarchar(50)=null
,@Pin nvarchar(50)=null,
@PAddress nvarchar(50)=null,
@PCity nvarchar(50)=null
,@PPin nvarchar(50)=null,
@PMobNo nvarchar(50)=null
,@Photo varchar(max)=null
,@DriverCode varchar(15) = null,
@FirstName varchar(50)=null
,@LastName varchar(50)=null
,@EmailId varchar(50)=null
,@DOB datetime = null
,@DOJ datetime=null
,@BloodGroup varchar(50)=null
,@Status Varchar(50)=null
,@Country Varchar(50),
@VehicleGroupId varchar(50) 
,@IsApproved int=null
,@IsVerified int=null
,@CurrentStateId int
as
begin
declare @cnt int,@c int,@ctry int,@vg int
select @c = cc.Id from Company cc where upper(cc.Name)=UPPER(@CompanyId)
select @ctry = c.Id from Country c where upper(c.Name)=UPPER(@Country)
select @vg = t.Id from Types t where upper(t.Name)=UPPER(@VehicleGroupId)

if @flag='I'
begin
select @cnt = COUNT(*) from PSDriverMaster where PMobNo = @PMobNo 

	if @cnt > 0
		begin
				RAISERROR ('Already User Registered with given MobileNumber',16,1);
				return;	
		end
		
insert into PSDriverMaster
	([CompanyId],[NAme] ,[Address] ,[City],[Pin] ,
	[PAddress] ,[PCity] ,[PPin],
	[PMobNo],[Photo],[DriverCode],[Firstname],[lastname] ,
	[Email],[DOB],[DOJ],[BloodGroup],[Status],[IsApproved],[IsVerified],[CountryId],[VehicleGroupId],[CurrentStateId])	
	values
	(@c, @FirstName+@LastName,@Address ,@City ,@Pin,
	@PAddress ,@PCity ,@PPin ,
	@PMobNo,@Photo,@DriverCode,@FirstName,@LastName,@EmailId,@DOB,@DOJ,@BloodGroup,@Status,
	@IsApproved,@IsVerified,@ctry,@vg,@CurrentStateId)
	SELECT @DId = SCOPE_IDENTITY()
	exec [dbo].[InsUpdDelNotifications] 'I',-1,1,2,'new driver creation','a new driver is created through app','10/28/2017','10/28/2017',1,1,1,1,1,1 
	end
	
           if @Did is not null
            begin
	--insert into Notifications
	
	
           INSERT INTO [dbo].[DriverDocuments]
           ([DriverId]
           ,[FileName]
           ,[DocTypeId]
           )
			 select @Did,t.name,DocTypeId 
			 from [dbo].[MandatoryUserDocuments]
			 inner join types t on t.id = DocTypeId
           where CountryId = @ctry and UserTypeId = 109 and VehicleGroupId = @vg
end
           
	

if @flag='U'
		begin
		
		
		select @cnt = COUNT(*) from PSDriverMaster where DId = @DId 

	if @cnt = 0
		begin
				RAISERROR ('No User Registered with given MobileNumber',16,1);
				return;	
		end 
		
		Update  PSDriverMaster
	set 
	[NAme]= @NAme ,	
	[Address]= @Address,	
	[City]= @City,
	[Pin]=@Pin ,
	[PAddress]= @PAddress,
	[PCity]= @PCity,
	[PPin]=@PPin,	
	[PMobNo]= @PMobNo,	
	[DriverCode]= @DriverCode,
	[Firstname]= @FirstName,
	[lastname] = @LastName,
	[Email] =@EmailId,
	[Photo]=@Photo,	
	[DOB] = @DOB,
	[DOJ]=@DOJ,
	[BloodGroup] =@BloodGroup,
	[Status] =@Status,
	[IsApproved]=@IsApproved,
	[IsVerified]=@IsVerified,
	[CountryId]=@ctry,
	[VehicleGroupId] =@vg
	where DId = @DId
	end 
	
	
	SELECT [DId]
      ,[NAme]
      ,[Address]
      ,[City]
      ,[Pin]
      ,[PAddress]
      ,[PCity]
      ,[PPin]
      ,[OffMobileNo]
      ,[PMobNo]
      ,[DOB]
      ,[DOJ]
      ,[BloodGroup]     
      ,[Photo]     
      ,[Email]     
      ,[Firstname]
      ,[lastname]
      ,[AuthTypeId]
      ,[AltPhonenumber]
      ,[Altemail]
      ,[AccountNo]  
  FROM [dbo].[PSDriverMaster] where  PMobNo = @PMobNo

END


GO
/****** Object:  StoredProcedure [dbo].[HVInsUpddrivers]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVInsUpddrivers]
@flag varchar,@DId int=-1
,@CompanyId varchar(50)=null
,@NAme nvarchar(50)=null,
@Address nvarchar(50)=null
,@City nvarchar(50)=null
,@Pin nvarchar(50)=null,
@PAddress nvarchar(50)=null,
@PCity nvarchar(50)=null
,@PPin nvarchar(50)=null,
@PMobNo nvarchar(50)=null
,@Photo varchar(max)=null
,@DriverCode varchar(15) = null,
@FirstName varchar(50)=null
,@LastName varchar(50)=null
,@EmailId varchar(50)=null
,@DOB datetime = null
,@DOJ datetime=null
,@BloodGroup varchar(50)=null
,@Status Varchar(50)=null
,@CountryId int=null,
@VehicleGroupId int = null
,@IsApproved int=null
,@IsVerified int=null
,@CurrentStateId int
,@PaymentTypeId int
as
begin
declare @cnt int,@c int
select @c = cc.Id from Company cc where upper(cc.Name)=UPPER(@CompanyId)
if @flag='I'
begin
select @cnt = COUNT(*) from PSDriverMaster where PMobNo = @PMobNo 

	if @cnt > 0
		begin
				RAISERROR ('Already User Registered with given MobileNumber',16,1);
				return;	
		end
insert into PSDriverMaster
	([CompanyId],[NAme] ,[Address] ,[City],[Pin] ,
	[PAddress] ,[PCity] ,[PPin],
	[PMobNo],[Photo],[DriverCode],[Firstname],[lastname] ,
	[Email],[DOB],[DOJ],[BloodGroup],[Status],[IsApproved],[IsVerified],[CountryId],[VehicleGroupId],[CurrentStateId],[PaymentTypeId])	
	values
	(@c, @FirstName+@LastName,@Address ,@City ,@Pin,
	@PAddress ,@PCity ,@PPin ,
	@PMobNo,@Photo,@DriverCode,@FirstName,@LastName,@EmailId,@DOB,@DOJ,@BloodGroup,@Status,
	@IsApproved,@IsVerified,@CountryId,@VehicleGroupId,@CurrentStateId,@PaymentTypeId)
	SELECT @DId = SCOPE_IDENTITY()
	
	if @Did is not null
            begin
	--insert into Notifications
	exec [dbo].[InsUpdDelNotifications] 'I',-1,1,2,'new driver creation','a new driver is created through app','10/28/2017','10/28/2017',1,1,1,1,1,1 
	
	
	
	
	
           INSERT INTO [dbo].[DriverDocuments]
           ([DriverId]
           ,[FileName]
           ,[DocTypeId]
           )
			 select @Did,t.name,DocTypeId 
			 from [dbo].[MandatoryUserDocuments]
			 inner join types t on t.id = DocTypeId
           where CountryId = @CountryId and UserTypeId = 109 and VehicleGroupId = @VehicleGroupId

           end
	end

if @flag='U'
		begin
		
		
		select @cnt = COUNT(*) from PSDriverMaster where DId = @DId 

	if @cnt = 0
		begin
				RAISERROR ('No User Registered with given MobileNumber',16,1);
				return;	
		end 
		
		Update  PSDriverMaster
	set 
	[NAme]= @NAme ,	
	[Address]= @Address,	
	[City]= @City,
	[Pin]=@Pin ,
	[PAddress]= @PAddress,
	[PCity]= @PCity,
	[PPin]=@PPin,	
	[PMobNo]= @PMobNo,	
	[DriverCode]= @DriverCode,
	[Firstname]= @FirstName,
	[lastname] = @LastName,
	[Email] =@EmailId,
	[Photo]=@Photo,	
	[DOB] = @DOB,
	[DOJ]=@DOJ,
	[BloodGroup] =@BloodGroup,
	[Status] =@Status,
	[IsApproved]=@IsApproved,
	[IsVerified]=@IsVerified,
	[CountryId]=@CountryId,
	[VehicleGroupId] =@VehicleGroupId,
	[PaymentTypeId] = @PaymentTypeId
	where DId = @DId
	end 
	
	
	SELECT [DId]
      ,[NAme]
      ,[Address]
      ,[City]
      ,[Pin]
      ,[PAddress]
      ,[PCity]
      ,[PPin]
      ,[OffMobileNo]
      ,[PMobNo]
      ,[DOB]
      ,[DOJ]
      ,[BloodGroup]     
      ,[Photo]     
      ,[Email]     
      ,[Firstname]
      ,[lastname]
      ,[AuthTypeId]
      ,[AltPhonenumber]
      ,[Altemail]
      ,[AccountNo] 
      ,[PaymentTypeId]
  FROM [dbo].[PSDriverMaster] where  PMobNo = @PMobNo

END


GO
/****** Object:  StoredProcedure [dbo].[HVInsUpddrivers2]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVInsUpddrivers2]
@flag varchar,@DId int=-1,
@CompanyId int=null,@NAme varchar(50)=null,
@Address varchar(50)=null,@City varchar(50)=null,
@Pin varchar(50)=null,
@PAddress varchar(50)=null,
@PCity varchar(50)=null,
@PPin varchar(50)=null,
@OffMobileNo varchar(50)=null,@PMobNo varchar(50)=null,
@DOB datetime=null,@DOJ datetime=null,@BloodGroup varchar(50)=null,
@LicenceNo varchar(50)=null,@LiCExpDate datetime=null,@BadgeNo varchar(50)=null,@BadgeExpDate datetime=null,@Remarks varchar(50)=null
as
begin
declare @cnt int
set @cnt = 0

declare @edithistoryid int

set @cnt = 0

declare @newCmpId int
set @newCmpId = 0;

declare @dt datetime
set @dt = GETDATE()

declare @neweid int

if @flag='I'

begin
select @cnt = count(1) from PSDriverMaster2 where upper(NAme) = upper(@NAme)
if @cnt = 0 
begin			
insert into PSDriverMaster2
	([CompanyId],[NAme] ,[Address] ,[City],[Pin] ,
	[PAddress] ,[PCity] ,[PPin],[OffMobileNo],
	[PMobNo],[DOB],[DOJ],[BloodGroup],[LicenceNo],[LiCExpDate],
	[BadgeNo],[BadgeExpDate],[Remarks])	
	values
	(@CompanyId, @NAme,@Address ,@City ,@Pin,
	@PAddress ,@PCity ,@PPin ,@OffMobileNo,
	@PMobNo,@DOB,@DOJ,@BloodGroup,@LicenceNo,
	@LiCExpDate,@BadgeNo,@BadgeExpDate,@Remarks)
	--new
	SELECT @newCmpId = SCOPE_IDENTITY()
			
			--insert into edit history
			exec InsEditHistory 'Company2', 'Name',@Name,'Company creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		           
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null
			exec InsEditHistoryDetails @edithistoryid,null,@CompanyId,'Insertion','Code',null
			exec InsEditHistoryDetails @edithistoryid,null,@Address,'Insertion','Description',null
			exec InsEditHistoryDetails @edithistoryid,null,@BloodGroup,'Insertion','Active',null
			
			
			--insert Fleet owner role by default
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
	--new			
	end
	--else
	--begin
	--		RAISERROR ('Company already exists',16,1);
	--end
end
else
if @flag='U'
		begin
		
		Update  PSDriverMaster2
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
	
	--select [CompanyId],[NAme] ,[Address] ,[City],[PAddress] ,[PCity]  from PSDriverMaster2 where  CompanyId = @CompanyId

END


GO
/****** Object:  StoredProcedure [dbo].[HVInsUpddriversGroup]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVInsUpddriversGroup]
@flag varchar,@DId int=-1,
@CompanyId varchar(50)=null,@NAme varchar(50)=null,
@Address varchar(50)=null,@City varchar(50)=null,
@Pin varchar(50)=null,
@PAddress varchar(50)=null,
@PCity varchar(50)=null,
@PPin varchar(50)=null,
@OffMobileNo varchar(50)=null,@PMobNo varchar(50)=null,
@DOB datetime=null,@DOJ datetime=null,@BloodGroup varchar(50)=null,
@LicenceNo varchar(50)=null,@LiCExpDate datetime=null,@BadgeNo varchar(50)=null,
@BadgeExpDate datetime=null,@Remarks varchar(50)=null,@VehicleModelId varchar(50)=null,@FirstName varchar(50)=null
,@LastName varchar(50)=null,@FleetOwner varchar(50)=null,
@EmailId varchar(50)=null,@DriverCode varchar(15)=null,@CurrentStateId int,@CountryId varchar(50) 
,@VehicleGroupId int=null
as
begin
declare @vm int,@c int,@cnt int,@ct int	
declare @dt datetime
set @dt = GETDATE()


select @vm= t.Id from Types t where upper(t.Name)=UPPER(@VehicleModelId)
select @c= c.Id from Company c where upper(c.Name)=UPPER(@CompanyId)
select @ct= cc.Id from Country cc where upper(cc.Name)=UPPER(@CountryId)
if @flag='I'

begin
select @cnt = COUNT(*) from PSDriverMaster where PMobNo = @PMobNo 

	if @cnt > 0

		begin
				RAISERROR ('Already user: %s registered with given Mobile Number ie.%s',16,1,@FirstName,@PMobNo);
				return;	
		end
else
begin
insert into PSDriverMaster
	(CompanyId,NAme,[Address],City,Pin ,
	PAddress ,PCity ,PPin,OffMobileNo,
	PMobNo,DOB,DOJ,BloodGroup,Remarks,VehicleModelId,Firstname,lastname,Email,DriverCode,CurrentStateId,CountryId,VehicleGroupId)	
	values
	(@c, @FirstName+@LastName,@Address ,@City ,@Pin,
	@PAddress ,@PCity ,@PPin ,@OffMobileNo,
	@PMobNo,@DOB,@DOJ,@BloodGroup,@Remarks,@vm,@FirstName,@LastName,@EmailId,'D'+@PMobNo,@CurrentStateId,@ct,@VehicleGroupId)
	--new
	--SELECT @newCmpId = SCOPE_IDENTITY()
			
	--		--insert into edit history
	--		exec InsEditHistory 'Company2', 'Name',@Name,'Company creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		           
	--		exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null
	--		exec InsEditHistoryDetails @edithistoryid,null,@CompanyId,'Insertion','Code',null
	--		exec InsEditHistoryDetails @edithistoryid,null,@Address,'Insertion','Description',null
	--		exec InsEditHistoryDetails @edithistoryid,null,@BloodGroup,'Insertion','Active',null
			
			
	--		--insert Fleet owner role by default
	--			--insert Fleet owner role by default
	--			 exec  InsUpdDelCompanyRoles 1,-1,6,@newCmpId,0 
	--			--insert Supervisor role by default
	--			 exec  InsUpdDelCompanyRoles 1,-1,7,@newCmpId,0 
	--			--insert Manager role by default
	--			 exec  InsUpdDelCompanyRoles 1,-1,8,@newCmpId,0 
	--			--insert Fleet Conductor role by default
	--			 exec  InsUpdDelCompanyRoles 1,-1,9,@newCmpId,0 
	--			--insert Fleet Ticket Salesperson Front Office by default
	--			 exec  InsUpdDelCompanyRoles 1,-1,10,@newCmpId,0 
	--			--insert Guest User role by default
	--			 exec  InsUpdDelCompanyRoles 1,-1,12,@newCmpId,0 
	--			--insert Fleet driver role by default
	--			 exec  InsUpdDelCompanyRoles 1,-1,13,@newCmpId,0 
	----new	
	end		
	end
	

--else
--if @flag='U'
--		begin
		
--		Update  PSDriverMaster
--	set [CompanyId]=@CompanyId,
--	[NAme]= @NAme ,	
--	[Address]= @Address,	
--	[City]= @City,
--	[Pin]=@Pin ,
--	[PAddress]= @PAddress,
--	[PCity]= @PCity,
--	[PPin]=@PPin,
--	[OffMobileNo]= @OffMobileNo,
--	[PMobNo]= @PMobNo,
--	[DOB]= @DOB,
--	[DOJ]= @DOJ,
--	[BloodGroup]= @BloodGroup,
--	[LicenceNo]= @LicenceNo,
--	[LiCExpDate]= @LiCExpDate,
--	[BadgeNo]= @BadgeNo,
--	[BadgeExpDate]= @BadgeExpDate,
--	[Remarks]= @Remarks
	
--	where DId = @DId
--	end 
	
	--select [CompanyId],[NAme] ,[Address] ,[City],[PAddress] ,[PCity]  from PSDriverMaster where  CompanyId = @CompanyId

END


GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdlandmark]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVInsUpdMOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVInsUpdtravelling]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVInsUpdUserlocations]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[HVInsUpdVehicle]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVInsUpdVehicle]
(@flag varchar
,@Id int=-1
,@CompanyId int = null
,@VID int
,@RegistrationNo varchar(50)
,@ChasisNo varchar(50)
,@Engineno varchar(50)
,@FleetOwnerId int  = null
,@VehicleTypeId int 
,@ModelYear varchar(5) = NULL
,@VehicleModelId int = NULL
,@HasAC int = NULL
,@VehicleGroupId int = NULL
,@StatusId int =null
,@IsVerified int = 0
,@VehicleCode varchar(10) 	
,@IsDriverOwned int 
,@DriverId int = null
,@CountryId int = null
,@Photo varchar(max)=null
,@FrontImage varchar(max)=null
,@BackImage varchar(max)=null
,@RightImage varchar(max)=null,@LeftImage varchar(max)=null
,@LayOutTypeId int=null) 
as
begin
declare @cnt int, @m varchar(5),@vtype int , @dt date,@nid int,@Vcode varchar(20)

select @dt = GETDATE(),@nid = @Id

if @flag='I'
begin

select @VID = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
select @Vcode = 'VC'+replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))

select @cnt = COUNT(*) from [PSVehicleMaster] where RegistrationNo = @RegistrationNo 

	if @cnt > 0
		begin
				RAISERROR ('RegistrationNo Already exists',16,1);
				return;	
		end
		
     else
  begin
	INSERT INTO [dbo].[PSVehicleMaster]
           ([VID]
           ,[CompanyId]
           ,[RegistrationNo]
           ,[ChasisNo]
           ,[Engineno]
           ,[FleetOwnerId]
           ,[VehicleTypeId]
           ,[ModelYear]
           ,[EntryDate]
           ,[VehicleModelId]
           ,[HasAC]
           ,[VehicleGroupId]
           ,[StatusId]
           ,[IsVerified]
           ,[VehicleCode]
           ,[IsDriverOwned]
           ,[DriverId]
           ,[CountryId]
           ,[Photo]
		   ,[LayOutTypeId])
     VALUES
           (@VID
           ,@CompanyId
           ,upper(@RegistrationNo)
           ,@ChasisNo
           ,@Engineno
           ,@FleetOwnerId
           ,@VehicleTypeId
           ,@ModelYear
           ,@dt
           ,@VehicleModelId
           ,@HasAC
           ,@VehicleGroupId
           ,@StatusId
           ,@IsVerified
           ,@Vcode
           ,@IsDriverOwned
           ,@DriverId
           ,@CountryId
           ,@Photo
		   ,@LayOutTypeId)
	exec [InsUpdDelNotifications]  'I',-1,1,1,'new vehicle creation','a new vehicle is created through app','10/28/2017','10/28/2017',1,1,1,1,1,1 
           select @nid = SCOPE_IDENTITY()
end

if @nid is not null 
							begin
	
							   INSERT INTO [dbo].[VehicleDocuments]
							   ([VehicleId]
							   ,[FileName]
							   ,[DocTypeId]
							   )
								 select @nid,t.name,DocTypeId 
								 from [dbo].[MandatoryVehicleDocs]
								 inner join types t on t.id = DocTypeId
							   where CountryId = @CountryId and VehicleGroupId = @VehicleGroupId
							end
end
else
if @flag='U'
		begin	
		select @cnt = COUNT(*) from [PSVehicleMaster] where  ID = @Id

	if @cnt = 0
		begin
				RAISERROR ('Duplicate RegistrationNo is not allowed',16,1);
				return;	
		end
	  else
	  begin
		 UPDATE [dbo].[PSVehicleMaster]
		   SET [RegistrationNo] = @RegistrationNo
			  ,[ChasisNo] = @ChasisNo
			  ,[Engineno] = @Engineno
			  ,[FleetOwnerId] = @FleetOwnerId
			  ,[VehicleTypeId] = @VehicleTypeId
			  ,[ModelYear] = @ModelYear
			  ,[VehicleModelId] = @VehicleModelId
			  ,[HasAC] = @HasAC
			  ,[VehicleGroupId] = @VehicleGroupId
			  ,[StatusId] = @StatusId
			  ,[IsVerified] = @IsVerified
			  ,[VehicleCode] = @VehicleCode
			  ,IsDriverOwned = @IsDriverOwned
			  ,DriverId = @DriverId
			  ,CountryId = @CountryId
			  ,[Photo] = @Photo,
			  [FrontImage]=@FrontImage,
			  [BackImage]=@BackImage,
			  [RightImage]=@RightImage,
			  [LeftImage]=@LeftImage
			
		 where Id = @Id 
		end


	end
	
	SELECT V.[Id]
      ,[VID]
      ,V.[CompanyId]
      ,[RegistrationNo]
      ,[ChasisNo]
      ,[Engineno]
      ,[FleetOwnerId]
     -- ,U.FirstName + ' ' +U.LastName FleetOwner
     -- ,f.FleetOwnerCode
     -- ,f.EmailId 
     -- ,U.ContactNo1
      ,[VehicleTypeId]
      ,vt.Name VehicleType
      ,[ModelYear]
      ,[EntryDate]
      ,[VehicleModelId]
      ,m.Name VehicleModel
      ,[HasAC]
      ,[VehicleGroupId]
      ,g.Name VehicleGroup
      ,[StatusId]
      ,s.Name [Status]
      ,[IsVerified]
      ,[VehicleCode]
      ,[FrontImage]
      ,[BackImage]
      ,[RightImage]
      ,[LeftImage]
	  ,[LayOutTypeId]
  FROM [dbo].[PSVehicleMaster] V
 -- inner join Users U on U.Id = FleetOwnerId
 -- inner join FleetOwner f on f.UserId = U.Id
  inner join Types s on s.Id = StatusId
  inner join Types m on m.Id = [VehicleModelId]
  inner join Types g on g.Id = [VehicleGroupId]
  inner join Types vt on vt.Id = [VehicleTypeId]
  where V.Id = @nid
	
		
END


GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdVehicles]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HVInsUpdVehicles]
(@flag varchar
,@Id int=-1
,@CompanyId int = null
,@VID int
,@RegistrationNo varchar(50)
,@ChasisNo varchar(50)
,@Engineno varchar(50)
,@FleetOwnerId int  = null
,@VehicleType varchar(50) 
,@ModelYear varchar(5) = NULL
,@VehicleModelId varchar(50) = NULL
,@HasAC int = NULL
,@VehicleGroupId varchar(50) = NULL
,@StatusId int 
,@IsVerified int = 0
,@VehicleCode varchar(10) 	
,@IsDriverOwned int 
,@DriverId int = null
,@Country  varchar(50) = null
)	
as
begin
declare @cnt int, @m varchar(5),@vtype int , @dt date,@nid int,@ctry int,@vgrp int,@vm int

select @vm= t.Id from Types t where upper(t.Name)=UPPER(@VehicleModelId)	
	select @vgrp= t.Id from Types t where upper(t.Name)=UPPER(@VehicleGroupId)
	select @vtype= t.Id from Types t where upper(t.Name)=UPPER(@VehicleType)
select @ctry = cc.Id from Country cc where upper(cc.Name)=UPPER(@Country)
select @dt = GETDATE(),@nid = @Id

if @flag='I'
begin

select @VID = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))

select @cnt = COUNT(*) from [PSVehicleMaster] where RegistrationNo = @RegistrationNo 

	if @cnt > 0
		begin
				RAISERROR ('RegistrationNo Already exists',16,1);
				return;	
		end
     else
  begin
	INSERT INTO [dbo].[PSVehicleMaster]
           ([VID]
           ,[CompanyId]
           ,[RegistrationNo]
           ,[ChasisNo]
           ,[Engineno]
           ,[FleetOwnerId]
           ,[VehicleTypeId]
           ,[ModelYear]
           ,[EntryDate]
           ,[VehicleModelId]
           ,[HasAC]
           ,[VehicleGroupId]
           ,[StatusId]
           ,[IsVerified]
           ,[VehicleCode]
           ,[IsDriverOwned]
           ,[DriverId]
           ,[CountryId])
     VALUES
           (@VID
           ,@CompanyId
           ,upper(@RegistrationNo)
           ,@ChasisNo
           ,@Engineno
           ,@FleetOwnerId
           ,@vtype
           ,@ModelYear
           ,@dt
           ,@vm
           ,@HasAC
           ,@vgrp
           ,@StatusId
           ,@IsVerified
           ,@VehicleCode
           ,@IsDriverOwned
           ,@DriverId
           ,@ctry)
	exec [InsUpdDelNotifications]  'I',-1,1,1,'new vehicle creation','a new vehicle is created through app','10/28/2017','10/28/2017',1,1,1,1,1,1 
           select @nid = SCOPE_IDENTITY()
end
if @nid is not null 
							begin
	
							   INSERT INTO [dbo].[VehicleDocuments]
							   ([VehicleId]
							   ,[FileName]
							   ,[DocTypeId]
							   )
								 select @nid,t.name,DocTypeId 
								 from [dbo].[MandatoryVehicleDocs]
								 inner join types t on t.id = DocTypeId
							   where CountryId = @ctry and VehicleGroupId = @vgrp
							end
end
else
if @flag='U'
		begin	
		select @cnt = COUNT(*) from [PSVehicleMaster] where upper(RegistrationNo) = upper(@RegistrationNo) and ID <> @Id

	if @cnt = 0
		begin
				RAISERROR ('Duplicate RegistrationNo is not allowed',16,1);
				return;	
		end
	  else
	  begin
		 UPDATE [dbo].[PSVehicleMaster]
		   SET [CompanyId] = @CompanyId
			  ,[RegistrationNo] = @RegistrationNo
			  ,[ChasisNo] = @ChasisNo
			  ,[Engineno] = @Engineno
			  ,[FleetOwnerId] = @FleetOwnerId
			  ,[VehicleTypeId] = @vtype
			  ,[ModelYear] = @ModelYear
			  ,[VehicleModelId] = @vm
			  ,[HasAC] = @HasAC
			  ,[VehicleGroupId] = @vgrp
			  ,[StatusId] = @StatusId
			  ,[IsVerified] = @IsVerified
			  ,[VehicleCode] = @VehicleCode
			  ,IsDriverOwned = @IsDriverOwned
			  ,DriverId = @DriverId
			  ,CountryId = @ctry
		 where Id = @Id 
		end


	end
	
	SELECT V.[Id]
      ,[VID]
      ,V.[CompanyId]
      ,[RegistrationNo]
      ,[ChasisNo]
      ,[Engineno]
      ,[FleetOwnerId]
     -- ,U.FirstName + ' ' +U.LastName FleetOwner
     -- ,f.FleetOwnerCode
     -- ,f.EmailId 
     -- ,U.ContactNo1
      ,[VehicleTypeId]
      ,vt.Name VehicleType
      ,[ModelYear]
      ,[EntryDate]
      ,[VehicleModelId]
      ,m.Name VehicleModel
      ,[HasAC]
      ,[VehicleGroupId]
      ,g.Name VehicleGroup
      ,[StatusId]
      ,s.Name [Status]
      ,[IsVerified]
      ,[VehicleCode]
  FROM [dbo].[PSVehicleMaster] V
 -- inner join Users U on U.Id = FleetOwnerId
 -- inner join FleetOwner f on f.UserId = U.Id
  inner join Types s on s.Id = StatusId
  inner join Types m on m.Id = [VehicleModelId]
  inner join Types g on g.Id = [VehicleGroupId]
  inner join Types vt on vt.Id = [VehicleTypeId]
  where V.Id = @nid	
		
END


GO
/****** Object:  StoredProcedure [dbo].[HVInsUpdVehiclesGroups]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVInsUpdVehiclesGroups]
@flag varchar,@Id int=-1,@CompanyId varchar(50)= null,@VID int,@RegistrationNo nvarchar(50),@VehicleType nvarchar(50)=null
,@OwnerName nvarchar(50)=null
,@ChasisNo nvarchar(50)=null,@Engineno nvarchar(50)=null
,@RoadTaxDate date=null,
@InsuranceNo nvarchar(50)=null,@InsDate date=null,
@PolutionNo nvarchar(50)=null,
@PolExpDate date=null,@RCBookNo nvarchar(50)=null
,@RCExpDate date=null,@CompanyVechile int=null,
@OwnerPhoneNo nvarchar(50)=null,@HomeLandmark nvarchar(255)=null,
@ModelYear nvarchar(255)=null,@DayOnly nvarchar(255)=null,
@VechMobileNo nvarchar(50)=null,@EntryDate date=null,@FleetOwnerId  int = null,
@NewEntry nvarchar(50)=null,@HasAC int = null,
@VehicleModelId varchar(50)=null,@LayoutTypeId varchar(50)=null,@VehicleGroupId varchar(50)=null
,@StatusId varchar(50) = null,@IsVerified int = null,@VehicleCode varchar(10)= null,@IsDriverOwned int = null,
@DriverId int = null,@CountryId varchar(50) = null,@VehicleMakeId varchar(50) = null,@mssg varchar(100) output
as
begin
declare @cnt int, @m varchar(5),@vm int, @vt int, @vgrp int, @cmpId int, @VID1 int,@vtype int,@ctry int,@cmp int,@stat int
select @vm= t.Id from Types t where upper(t.Name)=UPPER(@VehicleModelId)
	select @vt= t.Id from Types t where upper(t.Name)=UPPER(@LayoutTypeId)
	select @vgrp= t.Id from Types t where upper(t.Name)=UPPER(@VehicleGroupId)
	select @vtype= t.Id from Types t where upper(t.Name)=UPPER(@VehicleType)
	select @stat= t.Id from Types t where upper(t.Name)=UPPER(@StatusId)
select @ctry = cc.Id from Country cc where upper(cc.Name)=UPPER(@CountryId)
select @cmp = c.Id from Company c where upper(c.Name)=UPPER(@CompanyId)
--select @user = f.Id from Users f where upper(f.FirstName+''+f.LastName)=UPPER(@FleetOwnerId)
set @mssg = '';

select @VID1 = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
if @flag='I'

begin
select @cnt = COUNT(*) from PSVehicleMaster where RegistrationNo = @RegistrationNo 

	if @cnt > 0

		begin
				set @mssg = 'Already registered with given RegistrationNo.';
				return;	
		end
else


begin


--select @vm= t.Id from Types t where upper(t.Name)=UPPER(@VehicleModelId)
--	select @vt= t.Id from Types t where upper(t.Name)=UPPER(@ServiceTypeId)
--	select @vg= t.Id from Types t where upper(t.Name)=UPPER(@VehicleGroupId)
	
insert into PSVehicleMaster
	([VID], [CompanyId],[RegistrationNo],[ChasisNo],[Engineno]
	,[FleetOwnerId],[VehicleTypeId],[ModelYear],[EntryDate],[VehicleModelId],[HasAC],
	[VehicleGroupId],[StatusId] ,[IsVerified],[VehicleCode],[IsDriverOwned],
	[DriverId],[CountryId],[VehicleMakeId],[LayoutTypeId])	
	values
	(@VID1,@cmp,@RegistrationNo,@ChasisNo,@Engineno,@FleetOwnerId,@vtype
	,@ModelYear,@EntryDate,
	@vm,@HasAC,@vgrp,@stat,@IsVerified,@VehicleCode,@IsDriverOwned,@DriverId,@ctry,@VehicleMakeId
	,@vt)
	end
	
end

if @flag='U'
		begin	
		select @cnt = COUNT(*) from PSVehicleMaster where RegistrationNo = @RegistrationNo 

	if @cnt = 0
		begin
				RAISERROR ('No user registered with given RegistrationNo',16,1);
				return;	
		end
		Update  PSVehicleMaster
	set [CompanyId]=@cmpId,		
	[RegistrationNo]= @RegistrationNo,	
	[VehicleTypeId]= @VehicleType,
	[FleetOwnerId] =@FleetOwnerId ,
	[ChasisNo]= @ChasisNo,
	[Engineno]= @Engineno,
	[ModelYear]=@ModelYear,		
	[HasAC]=@HasAC,
	[EntryDate]=@EntryDate,
	[VehicleGroupId]=@VehicleGroupId,	
	[VehicleModelId]=@vm,
	[StatusId]=@StatusId,
	[IsVerified]=@IsVerified
	,[VehicleCode]=@VehicleCode
	,[IsDriverOwned]=@IsDriverOwned
	,[DriverId] = @DriverId
	,[CountryId]= @CountryId
	,[VehicleMakeId]= @VehicleMakeId
	where Id = @Id
	end	
	select [CompanyId],[RegistrationNo] ,[VehicleTypeId],[EntryDate],[VehicleModelId],[VehicleGroupId]  from PSVehicleMaster where VID = @VID
END


GO
/****** Object:  StoredProcedure [dbo].[HVRateTheTrip]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVRateTheTrip]
@Mobilenumber varchar(20),@BNo varchar(20),@rating float,@RatedBy int,@Comment varchar(250)--,@DriverPhoneNo varchar(20)
as
begin
update dbo.PSVehicleBookingDetails 
set [Rating] = @Rating,
 [RatedBy] = @RatedBy, 
[Comments]=@Comment
where BNo = @BNo

select [BNo],[CustomerPhoneNo],[Rating],[RatedBy] from PSVehicleBookingDetails  where BNo = @BNo
end


GO
/****** Object:  StoredProcedure [dbo].[HVUpdateBookingStatus]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HVUpdateBookingStatus]
@BNo varchar(20),@BookingStatus varchar(50),@UpdatedBy int,@UpdatedUserId int
as
begin
update PSVehicleBookingDetails
set [BookingStatus] = @BookingStatus,
[UpdatedBy]=@UpdatedBy,
[UpdatedUserId] =@UpdatedUserId

where BNo = @BNo
select [BNo],[BookingStatus],[UpdatedBy],[UpdatedUserId] from PSVehicleBookingDetails where BNo=@BNo
end


GO
/****** Object:  StoredProcedure [dbo].[InsEditHistory]    Script Date: 28-09-2018 18:49:44 ******/
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


INSERT INTO [dbo].[EditHistory]
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
/****** Object:  StoredProcedure [dbo].[InsEditHistoryDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
	INSERT INTO [dbo].[EditHistoryDetails]
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
/****** Object:  StoredProcedure [dbo].[InsupdAdd]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdAppusers]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsupdBiopw]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdBookedTicket]    Script Date: 28-09-2018 18:49:44 ******/
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
			  UPDATE [dbo].[BookedTicket]
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
/****** Object:  StoredProcedure [dbo].[InsUpdCardsGroup]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdCardsGroup]
@CardNumber varchar(50), 
@CardModel varchar(50), 
@CardType varchar(50), 
@CardCategory varchar(50), 
@StatusId varchar(50), 
@UserId int, 
@Customer varchar(50), 
@EffectiveFrom date, 
@EffectiveTo date,
@insupdflag varchar(1)
as
Begin
declare @cnt int
declare @cm int, @ct int,@cc int, @ci int 
set @cnt = 0
select @cnt =  count(1) from AddNewCard where CardNumber=@CardNumber
if @cnt < 1 
select @cm= t.Id from Types t where upper(t.Name)=UPPER(@CardModel)
select @ct= t.Id from Types t where upper(t.Name)=UPPER(@CardType)
select @cc= t.Id from Types t where upper(t.Name)=UPPER(@CardCategory)
select @ci= t.Id from Types t where UPPER(t.name)=UPPER(@StatusId)
begin
	insert into AddNewCard(CardNumber, CardModel, CardType, 
	CardCategory, StatusId,	UserId, Customer, 
	EffectiveFrom, EffectiveTo)
	Values(@CardNumber,@cm,@ct,
	@cc,@ci,@UserId,@Customer,
	@EffectiveFrom,@EffectiveTo)
end
--else
--	begin
--		RAISERROR ('Card already exists',16,1);
--	end	
end


GO
/****** Object:  StoredProcedure [dbo].[InsupdCartPaymentDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
	
	INSERT INTO [dbo].[CartPaymentDetails]
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
/****** Object:  StoredProcedure [dbo].[InsUpdCountry]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsupdCreateFleetOwner]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelActivityLog]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelActivityLog]
@Id int=-1, @Title varchar(100), @Rating varchar(20), @Image varchar(max), @CreatedOn date, @CreatedBy varchar(50), @UpdatedOn date=null, @UpdatedBy varchar(50)=null, @flag varchar
as
begin
 
 if @flag = 'I'
 begin
 insert into ActivityLog (Title, Rating, [Image], CreatedOn, CreatedBy, UpdatedOn, UpdatedBy)
                  values (@Title, @Rating, @Image, @CreatedOn, @CreatedBy, @UpdatedOn, @UpdatedBy)
 end
 
 if @flag = 'U'
 begin 
 update ActivityLog
 set Title = @Title,
     Rating = @Rating,
     [Image] = @Image,
     CreatedOn = @CreatedOn,
     CreatedBy = @CreatedBy,
     UpdatedOn = @UpdatedOn,
     UpdatedBy = @UpdatedBy     
     where Id = @Id 
 end
 
 if @flag = 'D'
 begin
 delete from ActivityLog
        where Id = @Id
 end
 
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDeladvertisement]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  Procedure [dbo].[InsUpdDeladvertisement]
@flag VarChar,
@Id Int=-1,
@Image VarChar(max)=null,
@AdvertisementTitle VarChar(100),
@Description VarChar(250),
@Clarification VarChar(250),
@Conclusion VarChar(250),
@Price Float,
@AdvertisementTypeId Int,
@PublishDate DateTime=null,
@ExpiredDate DateTime=null,
@AdvertisementAmount Float,
@CompanyName VarChar(100),@Area varchar(50)=null
As
Begin
Declare @Count Int,@Dt DateTime 
Set @Dt=GETDATE()

	If(@flag='I')
	
	Select @Count=Count(Id) From AdvertisementPortal 
	Where Id=@Id
	If(@Count<1)
	   Insert Into AdvertisementPortal
	   ([Image],AdvertisementTitle,[Description],Clarification,Conclusion,Price,AdvertisementTypeId,PublishDate,ExpiredDate,AdvertisementAmount,CompanyName,Area) 
	   Values(@Image,@AdvertisementTitle,@Description,@Clarification,@Conclusion,@Price,@AdvertisementTypeId,@Dt,@ExpiredDate,@AdvertisementAmount,@CompanyName,@Area)
	Else
	  RAISERROR ('Already user registered with given mobile number',16,1);
				return;	
	
	End


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelAdvertismentDeals]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsUpdDelAdvertismentDeals]
@flag VarChar,
@Id Int=-1,
@Image varchar(MAX)=null,
@AdvertisementTitle varchar(100),
@Description varchar(200),
@Dealsoffer varchar(100),
@Rating int,
@PublishDate datetime=null,
@ExpiredDate datetime=null,
@Area varchar(100)=null
As
BEGIN
Declare @Count Int,@Dt DateTime 
Set @Dt=GETDATE()

	If(@flag='I')
	
	Select @Count=Count(Id) From AdvertisementPortal 
	Where Id=@Id
	If (@Count<1)
	   Insert Into AdvertismentDeals(
	        Image
	        ,AdvertisementTitle
           ,Description
           ,Dealsoffer
           ,Rating
           ,PublishDate
           ,ExpiredDate
           ,Area)
     VALUES
           (@Image
           ,@AdvertisementTitle
           ,@Description          
           ,@Dealsoffer
           ,@Rating
           ,@Dt
           ,@ExpiredDate
           ,@Area)
           Else
	  RAISERROR ('Already user registered with given mobile number',16,1);
				return;	
END






GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelAlerts]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelAlerts]
(@flag varchar, @Id int=-1,@RoleId int=null
           ,@UserId int=null
           ,@Title varchar(150)=null
           ,@Message varchar(500)=null
           ,@CreatedOn datetime=null
           ,@UpdatedOn datetime=null
           ,@UpdatedBy int=null
           ,@StateId int=null
           ,@StatusId int=null
           ,@CategoryId int=null
           ,@SubCategoryId int=null
           ,@Active int=null)
 as
 begin 
 if(@flag='I')
 begin           
 INSERT INTO [dbo].[Alerts]
           ([RoleId]
           ,[UserId]
           ,[Title]
           ,[Message]
           ,[CreatedOn]
           ,[UpdatedOn]
           ,[UpdatedBy]
           ,[StateId]
           ,[StatusId]
           ,[CategoryId]
           ,[SubCategoryId]
           ,[Active])
     VALUES
           (@RoleId 
           ,@UserId 
           ,@Title 
           ,@Message 
           ,@CreatedOn
           ,@UpdatedOn
           ,@UpdatedBy 
           ,@StateId
           ,@StatusId
           ,@CategoryId
           ,@SubCategoryId
           ,@Active )
     end
   else if(@flag='U')
   begin
   UPDATE [dbo].[Alerts]
   SET [RoleId] = @RoleId
      ,[UserId] = @UserId
      ,[Title] = @Title
      ,[Message] = @Message
      ,[CreatedOn] = @CreatedOn
      ,[UpdatedOn] = @UpdatedOn
      ,[UpdatedBy] = @UpdatedBy
      ,[StateId] = @StateId
      ,[StatusId] = @StatusId
      ,[CategoryId] = @CategoryId
      ,[SubCategoryId] = @SubCategoryId
      ,[Active] = @Active
 WHERE Id=@Id
   end
   else if(@flag='D')
   begin
   delete from Alerts where Id=@Id
   end 
   end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelAppUserPaymentModes]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelAssetDocs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsUpdDelAssetDocs]
(
@Id int = -1,
@AssetId int
,@FileName varchar(100)
           ,@DocCategoryId int
           ,@DocTypeId int
           ,@ExpiryDate date = null          
           ,@UpdatedById int
           ,@DueDate date = null
           ,@FileContent varchar(max) = null
           ,@change varchar
,@loggedinUserId int)
AS
BEGIN
declare @firstname varchar(150),@RootAssetId int,@olddoctypeId int,@oldexpirydate date,@doctype varchar(50)
declare @dt datetime, @edithistoryid int, @oldname varchar(50), @oldDescription  varchar(250),@cnt int 


select @firstname = firstname from users where Id = @loggedInUserId

select @RootAssetId = RootAssetId from assetdetails where ID = @assetid

set @dt = GETDATE()

	If (@change='I' or @change='i')
	BEGIN
		  select @cnt = COUNT(*) from dbo.AssetDocuments where UPPER([FileName]) = UPPER(@FileName) 
		  and AssetId = @AssetId
		  
		  if @cnt =0
			BEGIN
					  INSERT INTO [dbo].[AssetDocuments]
           ([AssetId]
           ,[FileName]
           ,[DocCategoryId]
           ,[DocTypeId]
           ,[ExpiryDate]
           ,[CreatedById]
           ,[UpdatedById]
           ,[DueDate]
           ,[FileContent]
           ,[RootAssetId])
     VALUES
           (@AssetId 
			,@FileName
           ,@DocCategoryId
           ,@DocTypeId 
           ,@ExpiryDate
           ,@UpdatedById
           ,@UpdatedById
           ,@DueDate
           ,@FileContent
           ,@RootAssetId
           )
           
           exec InsAssetEditHistory @RootAssetId,'Insertion', 'Document is uploaded',@FileName,'Equipment Document',null,@firstname,@edithistoryid = @edithistoryid output				              
		   exec InsAssetEditHistoryDetails @edithistoryid,null,@FileName,'Insertion','File Name',null
					
	end
	else 			
		RAISERROR('Document already exists for the asset',16,1); 
 	end
	else
	If (@change='U' or @change='u')
	begin
	
		select @cnt = COUNT(*) from dbo.AssetDocuments where UPPER([FileName]) = UPPER(@FileName) and AssetId = @AssetId and Id <> @Id
		  
		
		  
		if @cnt =0
		begin

			select @olddoctypeId = doctypeid,@oldexpirydate = ExpiryDate from [dbo].[AssetDocuments] where Id = @Id
			
			UPDATE [dbo].[AssetDocuments]
			   SET [DocTypeId] = @DocTypeId
				  ,[ExpiryDate] = @ExpiryDate
				  ,[UpdatedById] = @UpdatedById
				  ,[DueDate] = @DueDate
				--  ,[FileContent] = @FileContent
			 WHERE Id = @Id
			 
			 if(@olddoctypeId <> @DocTypeId or @oldexpirydate <> @ExpiryDate)
			 begin
			  exec InsAssetEditHistory @RootAssetId,'Modification', 'Document is Modified',@FileName,'Equipment Document',null,@firstname,@edithistoryid = @edithistoryid output				              
			  if(@olddoctypeId <> @DocTypeId)
			  begin
				  declare @on varchar(50),@n varchar(50)
				  select @on = name from Types where ID = @olddoctypeId
				  select @n = name from Types where ID = @doctypeId
				  
				  exec InsAssetEditHistoryDetails @edithistoryid,@on,@n,'Modification','Doc Type',null
			  end
			  
			  if(@oldexpirydate <> @ExpiryDate)
			  begin
			     exec InsAssetEditHistoryDetails @edithistoryid,@oldexpirydate,@ExpiryDate,'Modification','Expiry Date',null
			  end
			  
			 end
				
		end       
		else
			RAISERROR('Duplicate documents are not allowed',16,1);
		
		
	end
	else
	If (@change='D' or @change='d')
	begin
	   DELETE FROM [dbo].[AssetDocuments]
      WHERE Id = @Id

		 exec InsAssetEditHistory @RootAssetId,'Deletion', 'Document is deleted',@FileName,'Equipment Document',null,@firstname,@edithistoryid = @edithistoryid output				              
		   

	end
	
	SELECT adoc.[Id]
      ,[AssetId]
      ,[FileName] docName
      ,[DocCategoryId] docCatId
      ,[DocTypeId] DocTypeId
      ,[ExpiryDate] expiryDate
      ,[CreatedById]
      ,[UpdatedById]
      ,[DueDate]     dueDate 
      ,ad.Name docCategory
     ,t.Name docType  
     , DATEDIFF(DAY, GETDATE(),ExpiryDate)
           
       ,case when GETDATE() > ExpiryDate  then 1 
      when (DATEDIFF(DAY, GETDATE(),ExpiryDate)  < 90) then 2
       else 0 end as IsExpired
      ,case when  dueDate < GETDATE()  then 1 else 0 end as PastDue       
  FROM [dbo].[AssetDocuments] adoc
  inner join AssetDetails ad on ad.ID = adoc.AssetId
  left outer join Types t on t.ID = DocTypeId
  where AssetId = @AssetId
  
  
  
  SELECT [Id]
      ,[AssetId]
      ,[Date]
      ,[ChangedType]
      ,[Comment]
      ,[ChangedBy]
      ,[FieldValue]
      ,[category]
      ,[subcategory]
  FROM [dbo].[AssetHistory]
where AssetId = @AssetId
order by Id desc
	 
END


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBlocklist]    Script Date: 28-09-2018 18:49:44 ******/
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
           ( 
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelBookedSeats]    Script Date: 28-09-2018 18:49:44 ******/
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
	INSERT INTO [dbo].[BookedSeats]
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
UPDATE [dbo].[BookedSeats]
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
DELETE FROM [dbo].[BookedSeats]
      WHERE Id = @Id
end



END


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBookingDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
,@distance decimal(18,0)=null
,@insupddelflag varchar	
AS
BEGIN
declare @bookingid int , @dt date
select @dt = GETDATE()

	if @insupddelflag = 'I'
	begin
		INSERT INTO [dbo].[BookingDetails]
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
           ,[Distance] 
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
			,@Address
			,@distance
			,@dt )
			
			select SCOPE_IDENTITY()
    end
    else
    if @insupddelflag = 'U'
    begin
       UPDATE [dbo].[BookingDetails]
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
			  ,[Distance] = @distance
		 WHERE Id = @Id
		 
		 select @Id
    end
END


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSAuditDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSDetails]    Script Date: 28-09-2018 18:49:44 ******/
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

select @cnt = COUNT(*) from [dbo].[BTPOSDetails] where upper([IMEI]) = upper(@IMEI) and [IMEI] is not null

if @cnt > 0 
begin
RAISERROR ('IMEI already exists',16,1);
return
end

INSERT INTO [dbo].[BTPOSDetails]
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
  
  select @cnt = COUNT(*) from [dbo].[BTPOSDetails] where upper([IMEI]) = upper(@IMEI) and Id <> @Id

if @cnt > 0 
begin
RAISERROR ('IMEI already exists',16,1);
return
end
  
  select @oldPOSID = POSID, @oldIMEI= IMEI, @oldipconfig= ipconfig from BTPOSDetails where Id = @Id
end
UPDATE [dbo].[BTPOSDetails]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSFaultsCatageries]    Script Date: 28-09-2018 18:49:44 ******/
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
           @TypeGripId )
   
	END


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSInventorySales]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelBTPOSInventorySales](@amount int,@code varchar (50),@Id int,@inventoryId int,@perunit int,@quantity int,@soldon varchar (50),@transactionId int,@transactiontype varchar (50))
as
begin
insert into BTPOSInventorySales values(@amount,@code,@inventoryId,@perunit,@quantity,@soldon,@transactionId,@transactiontype)
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSMoitoringPage]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSPortSettings]    Script Date: 28-09-2018 18:49:44 ******/
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
           (              
           @BTPOSId,
           @Ipconfig)
   
	END


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSRecords]    Script Date: 28-09-2018 18:49:44 ******/
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

select @cnt = count(1) from [dbo].[BTPOSRecords] 
where POSID = @POSID

end
if @cnt = 0 
begin
INSERT INTO [dbo].[BTPOSRecords]
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
UPDATE [dbo].[BTPOSRecords]
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
  delete from [dbo].[BTPOSRecords]
where POSID = @POSID
End

End




/****** Object:  Table [dbo].[AlertsConfiguration]    Script Date: 06/20/2016 11:53:06 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSRegistration]    Script Date: 28-09-2018 18:49:44 ******/
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
           (             
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSSecheduledUpdates]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSSheduleUploads]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSTrans]    Script Date: 28-09-2018 18:49:44 ******/
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



INSERT INTO [dbo].[BTPOSTransactions]
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

UPDATE [dbo].[BTPOSTransactions]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelBusPackagePricing]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InsUpdDelBusPackagePricing]
@Flag varchar,@PkgId int,@RouteId int,@SrcStopId int,@DeststopId int,@PricingTypeId int,@UnitTypeId int,
@UnitPrice decimal(18,0),@Amount decimal(18,0),@Code varchar(50),@Description varchar(500),@VehicleGroupId int,
@VehicleTypeId int,@UnitId int,@FromValue int,@ToValue int,@EffectiveDate datetime,@ExpiryDate datetime
As
Begin
If @Flag='I'
begin
INSERT INTO [dbo].[BusPackagePricing]
           ([PkgId]
           ,[RouteId]
           ,[SrcStopId]
           ,[DeststopId]
           ,[PricingTypeId]
           ,[UnitTypeId]
           ,[UnitPrice]
           ,[Amount]
           ,[Code]
           ,[Description]
           ,[VehicleGroupId]
           ,[VehicleTypeId]
           ,[UnitId]
           ,[FromValue]
           ,[ToValue]
           ,[EffectiveDate]
           ,[ExpiryDate])
     VALUES
           (@PkgId,@RouteId, @SrcStopId,@DeststopId, @PricingTypeId,@UnitTypeId,@UnitPrice,@Amount,
           @Code, @Description,@VehicleGroupId,@VehicleTypeId,@UnitId,@FromValue, @ToValue, @EffectiveDate,
           @ExpiryDate)
end
If @Flag='U'
begin
UPDATE [dbo].[BusPackagePricing]
   SET [PkgId] = @PkgId,
      [RouteId] = @RouteId,
      [SrcStopId] = @SrcStopId, 
      [DeststopId] = @DeststopId, 
      [PricingTypeId] = @PricingTypeId,
      [UnitTypeId] = @UnitTypeId,
      [UnitPrice] = @UnitPrice,
      [Amount] = @Amount,
      [Code] = @Code,
      [Description] = @Description,
      [VehicleGroupId] = @VehicleGroupId,
      [VehicleTypeId] = @VehicleTypeId,
      [UnitId] = @UnitId, 
      [FromValue] = @FromValue,
      [ToValue] = @ToValue,
      [EffectiveDate] = @EffectiveDate,
      [ExpiryDate] = @ExpiryDate
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBusPackages]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[InsUpdDelBusPackages]
@Flag varchar,@Id int,@Code varchar(50),@PackageName varchar(150),@Description varchar(500),@OpId int,
 @VehicleGroupId int,@VehicleTypeId int,@RouteId int,@FleetOwnerId int

As
Begin
If @Flag='I'
begin

INSERT INTO [dbo].[BusPackages]
           ([Code]
           ,[PackageName]
           ,[Description]
           ,[OpId]
           ,[VehicleGroupId]
           ,[VehicleTypeId]
           ,[RouteId]
           ,[FleetOwnerId])
     VALUES
           (@Code,@PackageName,@Description,@OpId, @VehicleGroupId,@VehicleTypeId,@RouteId,@FleetOwnerId)

end
If @Flag='U'
begin
UPDATE [dbo].[BusPackages]
   SET [Code] = @Code,
      [PackageName] = @PackageName,
      [Description] = @Description,
      [OpId] = @OpId,
      [VehicleGroupId] = @VehicleGroupId,
      [VehicleTypeId] =@VehicleTypeId,
      [RouteId] = @RouteId,
      [FleetOwnerId] = @FleetOwnerId

end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCarouselImages]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsUpdDelCarouselImages]
(   @Id int = -1,
	@ImageName [varchar](50),
	@Img [varchar](max),
	@ImageCaption [varchar](250) = NULL,
	@ImageDesc [varchar](250) = NULL,
	@userId int = null,	
	@ImgPath [varchar](250) = NULL,
	@flag varchar,
	@CreatedOn DateTime =NULL,
	@CreatedBy int,
	@ModifiedOn DateTime = NULL,
	@ModifiedBy int
)
as
begin
declare @dt datetime
select @dt = GETDATE()

if @flag = 'I' 
begin
INSERT INTO [dbo].[Carousel]
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
           ,@CreatedBy
           ,@dt
           ,@ModifiedBy
           ,@ImgPath)

end
else
if @flag = 'U' 
begin
UPDATE [dbo].[Carousel]
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
DELETE FROM [dbo].[Carousel]
      WHERE Id = @Id
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelChargesDiscounts]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelChargesDiscounts]

@Id int,
@Code varchar(15),
@Title varchar(50),
@Description varchar(200) = null,
@TypeId int,
@CategoryId int,
@ApplyAsId int,
@Value decimal,
@FromDate datetime = null,
@ToDate datetime = null,
@Flag varchar

as
begin
if @Flag='I'
begin
INSERT INTO [dbo].[ChargesDiscounts]
           ([Code]
           ,[Title]
           ,[Description]
           ,[TypeId]
           ,[CategoryId]
           ,[ApplyAsId]
           ,[Value]
           ,[FromDate]
           ,[ToDate]) values(@Code,@Title,@Description,@TypeId,@CategoryId,@ApplyAsId,@Value,@FromDate,@ToDate)
end
else
if @Flag='U'
begin
UPDATE [dbo].[ChargesDiscounts]
   SET [Code] = @Code
      ,[Title] = @Title
      ,[Description] = @Description
      ,[TypeId] = @TypeId
      ,[CategoryId] = @CategoryId
      ,[ApplyAsId] = @ApplyAsId
      ,[Value] = @Value
      ,[FromDate] =@FromDate
      ,[ToDate] = @ToDate
 WHERE Id=@Id
 end
 else
 if @Flag='D'
 begin
 DELETE FROM [dbo].[ChargesDiscounts]
      WHERE Id=@Id
 end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCompany]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelcompany2]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelcompany2](
@Id int=null,
@Name varchar(50),
@active int,
@code varchar(50),
@Description varchar(50) = null,
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
			--check if already company2 exists
			select @cnt = count(1) from company2 where upper(name) = upper(@name)

			if @cnt = 0 
			begin
			insert into dbo.Company2 
			([active],[code],[Description],Name,[Address],ContactNo1,
			ContactNo2,Fax,EmailId,Title,Caption,Country,ZipCode,[State],
			StaffSize,FleetSize,AlternateAddress,Logo)
			 values(@active,@code,@Description,@Name,@Address,@ContactNo1,
			 @ContactNo2,@Fax,@EmailId,@Title,@Caption,@Country,@ZipCode,@State,@StaffSize,@FleetSize,@AlternateAddress,@logo)
			
			SELECT @newCmpId = SCOPE_IDENTITY()
			
			--insert into edit history
			exec InsEditHistory 'Company2', 'Name',@Name,'Company creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		           
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null
			exec InsEditHistoryDetails @edithistoryid,null,@code,'Insertion','Code',null
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
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
				select @cnt = count(1) from company2 where upper(name) = upper(@name) and id <> @id
			    
				if @cnt = 0 
				begin
					update Company2
					set Name = @Name, code = @code, Description = @Description,Address =@Address,EmailId = @EmailId,ContactNo1 =@ContactNo1,ContactNo2=@ContactNo2,Fax=@Fax,Title=@Title
					,Caption=@Caption,Country=@Country,ZipCode=@ZipCode,State=@State,FleetSize=@FleetSize,StaffSize=@StaffSize
					,AlternateAddress=@AlternateAddress,Logo=@logo,active = @active
					where Id = @Id						
						
						--insert into edit history
					exec InsEditHistory 'Company', 'Name',@Name,'Company creation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output
				           
					exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null
					exec InsEditHistoryDetails @edithistoryid,null,@code,'Insertion','Code',null
					exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null					
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelCompanyGroups]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelCompanyGroups](
@Id int=null,
@Name varchar(50),
@active int,
@code varchar(50),
@Description varchar(50) = null,
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
			insert into dbo.Company
			(active,code,[Desc],Name,Address,ContactNo1,
			ContactNo2,Fax,EmailId,Title,Caption,Country,ZipCode,[State],
			StaffSize,FleetSize,AlternateAddress,Logo)
			 values(@active,@code,@Description,@Name,@Address,@ContactNo1,
			 @ContactNo2,@Fax,@EmailId,@Title,@Caption,@Country,@ZipCode,@State,@StaffSize,@FleetSize,@AlternateAddress,@logo)
			
			SELECT @newCmpId = SCOPE_IDENTITY()
			
			--insert into edit history
			exec InsEditHistory 'Company', 'Name',@Name,'Company creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		           
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null
			exec InsEditHistoryDetails @edithistoryid,null,@code,'Insertion','Code',null
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
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
			--else
			--RAISERROR ('Company: %s already exists',16,1,@Name); 
		end
else

   if @insupdflag = 'U'
		begin
				--check if already a company with the new name exists
				select @cnt = count(1) from company where upper(name) = upper(@name) and id <> @id
			    
				if @cnt = 0 
				begin
					update Company
					set Name = @Name, code = @code, [Desc] = @Description,Address =@Address,EmailId = @EmailId,ContactNo1 =@ContactNo1,ContactNo2=@ContactNo2,Fax=@Fax,Title=@Title
					,Caption=@Caption,Country=@Country,ZipCode=@ZipCode,State=@State,FleetSize=@FleetSize,StaffSize=@StaffSize
					,AlternateAddress=@AlternateAddress,Logo=@logo,active = @active
					where Id = @Id						
						
						--insert into edit history
					exec InsEditHistory 'Company', 'Name',@Name,'Company creation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output
				           
					exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null
					exec InsEditHistoryDetails @edithistoryid,null,@code,'Insertion','Code',null
					exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null					
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelCompanyRoles]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelCOUNTRY]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelCOUNTRY](
@flg varchar,
			@Id NUMERIC(10),
           @Name VARCHAR(50),   
           @Code VARCHAR(50),
           @Latitude varchar(15) = null,
           @Longitude varchar(15) = null,
           @HasOperations int = 0,
           @Flag varchar(max)=null)
AS
BEGIN
	if(@flg='I')
	Begin
           INSERT INTO [dbo].[Country]
           ([Name]
           ,[Latitude]
           ,[Longitude]
           ,[ISOCode]
           ,[HasOperations],[Flag])
     VALUES
           (@Name
           ,@Latitude
           ,@Longitude
           ,@Code
           ,@HasOperations
           ,@Flag )
           end
           
   else if(@flg='U')
   begin
   UPDATE [POSDashboard].[dbo].[Country]
   SET [Name] = @Name
      ,[Latitude] = @Latitude
      ,[Longitude] = @Longitude
      ,[ISOCode] = @Code
      ,[HasOperations] = @HasOperations
      ,[Flag] = @Flag
 WHERE Id=@Id  
 end
 else if(@flg='D')
 begin
 delete from Country where  Id=@Id        
 end
END


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelEOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelExpenses]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelExpenses](@amount int,@Date varchar(50),@desc varchar(50),@Id int,@MasterId int,@paidBy varchar(50),@paidFor varchar (50),@transactionId int)
as
begin
insert into Expenses values(@amount,@Date,@desc,@MasterId,@paidBy,@paidFor,@transactionId)
end


GO
/****** Object:  StoredProcedure [dbo].[Insupddelfaqs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insupddelfaqs]
@flag varchar,
@Id int=-1,
@Question varchar(250),
@Answer varchar(1000),
@CreatedOn dateTime=null,
@CreatedBy varchar(60),
@AppType int,
@Category int,
@SubCategory int
  as
begin

if @flag='I'

begin
insert into dbo.faqs
([question],[answer],[createdon],[createdby],[AppType],[Category],[SubCategory])
values(@Question,@Answer,GETDATE(),@CreatedBy,@AppType,@Category,@SubCategory)
end
if @flag='U'
begin
update dbo.faqs
set[question]=@Question ,
   [answer]=@Answer ,
   [createdon]= GETDATE(),
   [createdby]=@createdby,
   [AppType]=@AppType,
   [Category]=@Category,
   [SubCategory]=@SubCategory
   where Id=@Id
   end
   if @flag='D'
   begin
   delete from faqs
   where Id=@Id
   end
   
   end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFares]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelFares](@Id int,@FromStop varchar(50),@ToStop varchar(50),@Fare varchar(50),@Active varchar(50),@RouteId varchar(50),@Name varchar(50))
as
begin
insert into Fares values(@FromStop,@ToStop,@Fare,@Active,@RouteId,@Name)
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetAvailability]    Script Date: 28-09-2018 18:49:44 ******/
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

			INSERT INTO [dbo].[FleetAvailability]
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
				UPDATE [dbo].[FleetAvailability]
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
     delete from [dbo].[FleetAvailability]
	 where VehicleId = @VehicleId
end
end


/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteStops]    Script Date: 08/08/2016 17:42:37 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetBTPOS]    Script Date: 28-09-2018 18:49:44 ******/
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
select @cnt = count(1) from [dbo].[FleetBTPOS] 
where vehicleid = @VehicleId 
and  BTPOSId = @btposId
end
if @cnt = 0 
begin
INSERT INTO [dbo].[FleetBtpos]
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
UPDATE [dbo].[FleetBtpos]
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
  delete from [dbo].[FleetBtpos]
where vehicleid = @VehicleId 
and [BTPOSId] = @btposId

End
End


GO
/****** Object:  StoredProcedure [dbo].[InsupddelFleetDetails]    Script Date: 28-09-2018 18:49:44 ******/
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

	INSERT INTO [dbo].[FleetDetails]
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
update [dbo].[FleetDetails]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteFare]    Script Date: 28-09-2018 18:49:44 ******/
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

UPDATE [dbo].[FleetOwnerRouteFare]
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
 INSERT INTO [dbo].[FleetOwnerRouteFare]
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
INSERT INTO [dbo].[FleetOwnerRouteFare]
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
UPDATE [dbo].[FleetOwnerRouteFare]
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
DELETE FROM [dbo].[FleetOwnerRouteFare]
      WHERE [FORouteStopId] = @fsId
*/


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRoutes]    Script Date: 28-09-2018 18:49:44 ******/
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
select @cnt = count(1) from [dbo].[FleetOwnerRoute] 
where [FleetOwnerId] = @fleetOwnerId
and  [RouteId] = @RouteId
end
if @cnt = 0 
begin
INSERT INTO [dbo].[FleetOwnerRoute]
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
  FROM [dbo].[RouteStops] rs
  inner join routes r on (rs.routeid = r.id
  and rs.fromstopid = r.[SourceId]
      and rs.tostopid = [DestinationId])
  where r.[Id] = @routeid
end
if @rsId is not null 
 begin
   INSERT INTO [dbo].[FleetOwnerRouteStop]
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
INSERT INTO [dbo].[FleetOwnerStops]
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
INSERT INTO [dbo].[FleetOwnerStops]
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


UPDATE [dbo].[FleetOwnerRoute]
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
  delete from [dbo].[FleetOwnerRoute]
where [FleetOwnerId] = @fleetOwnerId
and  [RouteId] = @RouteId

--remove all the FleetOwnerRouteStop references for the route

delete from [dbo].[FleetOwnerRouteStop] 
where id in (
select fs.id from [dbo].[FleetOwnerRouteStop] fs
inner join [RouteStops] rs on rs.id = fs.RouteStopId
where [FleetOwnerId] = @fleetOwnerId
and rs.RouteId = @RouteId
)


delete from fleetownerstops where routeid = @routeid and fleetownerid = @fleetOwnerId

delete from FORouteFleetSchedule where routeid = @routeid  and fleetownerid = @fleetOwnerId

end


End


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteStops]    Script Date: 28-09-2018 18:49:44 ******/
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
	  FROM  [dbo].[FleetOwnerStops]
	  WHERE FleetOwnerId = @FleetOwnerId 
		  and RouteId = @RouteId 
		  and StopId = @StopId

			if @cnt = 0 
			begin
				INSERT INTO [dbo].[FleetOwnerStops]
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
						 
								select @scnt = count(1) from [dbo].[FleetOwnerRouteStop]
								where RouteStopId = @sid      

								if @scnt = 0 
								INSERT INTO [dbo].[FleetOwnerRouteStop]
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
		DELETE FROM [dbo].[FleetOwnerStops]
			  WHERE FleetOwnerId = @FleetOwnerId 
			  and RouteId = @RouteId 
			  and StopId = @StopId

		delete from [dbo].[FleetOwnerRouteStop]
		where FleetOwnerId = @FleetOwnerId 
		and RouteStopId in (select Id from routestops 
		where  routeid = @RouteId
		and (fromstopid = @StopId or tostopid = @StopId))
	end

END

/****** Object:  Table [dbo].[Ex_Availableseats]    Script Date: 06/14/2016 11:15:49 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerVehicleLayout]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetRoutes]    Script Date: 28-09-2018 18:49:44 ******/
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

select @cnt = count(1) from [dbo].[FleetRoutes] 
where vehicleid = @VehicleId 
and routeid = @routeid

if @cnt = 0 
begin
INSERT INTO [dbo].[FleetRoutes]
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


UPDATE [dbo].[FleetRoutes]
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
  delete from [dbo].[FleetRoutes]
where vehicleid = @VehicleId and routeid = @routeid

End
End


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetScheduleList]    Script Date: 28-09-2018 18:49:44 ******/
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
INSERT INTO [dbo].[FleetScheduleList]
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

UPDATE [dbo].[FleetScheduleList]
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

DELETE FROM [dbo].[FleetScheduleList]
      WHERE Id = @Id
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetStaff]    Script Date: 28-09-2018 18:49:44 ******/
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
select @cnt = count(1) from [dbo].[FleetStaff] 
where vehicleid = @vehicleid 
and userid = @userid and roleid = @roleid

if @cnt = 0 
select @oldVehicleId = VehicleId, @oldUserId = UserId, @oldRoleId=RoleId from FleetStaff where Id = @Id
begin
INSERT INTO [dbo].[FleetStaff]
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
UPDATE [dbo].[FleetStaff]
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
  delete from [dbo].[FleetStaff]
where vehicleid = @VehicleId 
and userid = @UserId 
and companyid = @cmpid
and roleid = @roleid
end

End


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFORouteFare]    Script Date: 28-09-2018 18:49:44 ******/
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


UPDATE [dbo].[FORouteFare]
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
			INSERT INTO [dbo].[FORouteFare]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelFORouteFleetSchedule]    Script Date: 28-09-2018 18:49:44 ******/
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

			INSERT INTO [dbo].[FORouteFleetSchedule]
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
				UPDATE [dbo].[FORouteFleetSchedule]
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
				 INSERT INTO [dbo].[FORouteFleetSchedule]
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
     delete from [dbo].[FORouteFleetSchedule]
	 where VehicleId = @VehicleId
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelHailingPackage]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[InsUpdDelHailingPackage]
@Flag varchar,@Id int=-1,@Code varchar(50),@PackageName varchar(150),@Description varchar(500),@OpId int,@VehicleGroupId int,
@VehicleTypeId int
As
Begin
If @Flag='I'
begin
INSERT INTO [dbo].[HailingPackages]
           ([Code]
           ,[PackageName]
           ,[Description]
           ,[OpId]
           ,[VehicleGroupId]
           ,[VehicleTypeId])
     VALUES
           (@Code, @PackageName,@Description, @OpId,@VehicleGroupId,@VehicleTypeId)
end
If @Flag='U'
begin
UPDATE [dbo].[HailingPackages]
   SET [Code] = @Code,
      [PackageName] = @PackageName,
      [Description] = @Description,
      [OpId] = @OpId,
      [VehicleGroupId] = @VehicleGroupId,
      [VehicleTypeId] = @VehicleTypeId
 
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelHailingPackagePricing]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InsUpdDelHailingPackagePricing]
@Flag varchar,@Code varchar(50),@PackageName varchar(150),@Description varchar(500),@OpId int,@VehicleGroupId int,
@VehicleTypeId int
As
Begin
If @Flag='I'
begin
INSERT INTO [dbo].[HailingPackages]
           ([Code]
           ,[PackageName]
           ,[Description]
           ,[OpId]
           ,[VehicleGroupId]
           ,[VehicleTypeId])
     VALUES
           (@Code, @PackageName,@Description, @OpId,@VehicleGroupId,@VehicleTypeId)
end
If @Flag='U'
begin
UPDATE [dbo].[HailingPackages]
   SET [Code] = @Code,
      [PackageName] = @PackageName,
      [Description] = @Description,
      [OpId] = @OpId,
      [VehicleGroupId] = @VehicleGroupId,
      [VehicleTypeId] = @VehicleTypeId
 
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelInventory]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsupdDelInventoryItem]    Script Date: 28-09-2018 18:49:44 ******/
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
@ReOrderPoint int,@ItemImage varchar(max),@Price decimal(18,0),@ItemModel varchar(50),@Features varchar(50),@PublishDate datetime=null,@ExpiryDate datetime=null)
as 
begin
declare @dt datetime,@ex datetime,@type int
set @dt = GETDATE()

if (@type ='1')
set @ex = DATEADD(DD,360,GETDATE())
if (@type ='2')
set @ex = DATEADD(DD,180,GETDATE())
if (@type ='3')
set @ex = DATEADD(DD,90,GETDATE())
if (@type ='2')
set @ex = DATEADD(DD,30,GETDATE())
select @ex as expirydate



declare @edithistoryid int
declare @oldItemName varchar(50)
declare @oldCode varchar(50)
declare @oldDescription varchar(50)
declare @oldSubCategoryId int
declare @oldReOrderPoint int

UPDATE [dbo].[InventoryItem]
   SET [ItemName] = @ItemName,
   [ItemImage] = @ItemImage
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
  ReOrderPoint,
  ItemImage,
  Price,
  ItemModel,
  Features,PublishDate,ExpiryDate)
  values
 (@ItemName,
  @Code,
  @Description,
  @CategoryId,
  @SubCategoryId,
  @ReOrderPoint,
  @ItemImage,
  @Price,@ItemModel,@Features,@dt,@ex)

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
/****** Object:  StoredProcedure [dbo].[InsUpdDelInventoryReceivings]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsupddelInventorySales]    Script Date: 28-09-2018 18:49:44 ******/
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
	INSERT INTO [dbo].[InventorySales]
           ([ItemName]
           ,[Quantity]
           ,[PerUnitPrice]
           ,[PurchaseDate]
           ,[InVoiceNumber])
     VALUES
    (@ItemName,@Quantity,@PerUnitPrice,@PurchaseDate,@InVoiceNumber)




END


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenceCatergories]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenceStatus]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenseDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
INSERT INTO [dbo].[LicenseDetails]
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

UPDATE [dbo].[LicenseDetails]
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
DELETE FROM [dbo].[LicenseDetails]
      WHERE [LicenseTypeId] = @LicenseTypeId and [FeatureTypeId] = @FeatureTypeId
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicensePayments]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicensePricing]    Script Date: 28-09-2018 18:49:44 ******/
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
INSERT INTO [dbo].[LicensePricing]
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

UPDATE [dbo].[LicensePricing]
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
DELETE FROM [dbo].[LicensePricing]
      WHERE licenseId = @LicenseId

end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelMandatoryUserDocs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelMandatoryUserDocs]
(@flag varchar, @Id int= -1, @DocTypeId int, @Countryid int, @UserTypeId int,@IsMandatory int = 0
, @FileContent varchar(max) = null
,@VehicleGroupId int)
as
begin
declare @cnt int,@cont int

if @flag = 'I'
begin

select @cnt = COUNT(*) from [dbo].[MandatoryUserDocuments] where [UserTypeId] = @UserTypeId and
      [DocTypeId] = @DocTypeId and [CountryId] = @Countryid and [VehicleGroupId] = @VehicleGroupId

if @cnt = 0 
 begin 
INSERT INTO [dbo].[MandatoryUserDocuments]
           ([UserTypeId]
           ,[DocTypeId]
           ,[CountryId]
           ,[Active]
           ,[FileContent]
           ,[IsMandatory]
           ,[VehicleGroupId])
     VALUES
           (@UserTypeId
           ,@DocTypeId
           ,@CountryId
           ,1
           ,@FileContent
           ,@IsMandatory
           ,@VehicleGroupId)
    end       
DECLARE @dridsList CURSOR, @count int,@dcname varchar(50),@drid int
 begin

   SET @dridsList = CURSOR FOR
   select DID from PSDriverMaster  where  CountryId = @Countryid and VehicleGroupId = @VehicleGroupId 

   OPEN @dridsList
    FETCH NEXT FROM @dridsList
    INTO @drid
 
    WHILE @@FETCH_STATUS = 0
    begin
	 begin
		update [dbo].[DriverDocuments]
		set IsApproved =0, IsVerified = 0
		where [DriverId] = @drid and [DocTypeId] = @DocTypeId
		  
		if @@ROWCOUNT = 0 
			begin
				select @dcname=name from  types where id=@DocTypeId
				Insert INTO [dbo].[DriverDocuments]
				([DriverId],[FileName],[DocTypeId])
				values (@drid, @dcname, @DocTypeId)     
			end
	 end 
   
    FETCH NEXT FROM @dridsList INTO @drid  
    END 
 
    CLOSE @dridsList ;
    DEALLOCATE @dridsList;
	end
    
end
else if @flag = 'U'
begin
UPDATE [dbo].[MandatoryUserDocuments]
   SET [FileContent] = @FileContent
      ,[IsMandatory] = @IsMandatory
 WHERE [UserTypeId] = @UserTypeId and
      [DocTypeId] = @DocTypeId and [CountryId] = @Countryid and [VehicleGroupId] = @VehicleGroupId

end
else
if @flag = 'D'
begin

DELETE FROM [dbo].[MandatoryUserDocuments] where Id = @Id

end

end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelMandatoryVehicleDocs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelMandatoryVehicleDocs]
(@flag varchar, @Id int= -1, @DocTypeId int, @FileContent varchar(max)=null,@IsMandatory int, @Countryid int, @VehicleGroupId int)
as
declare @cnt int
begin
if @flag = 'I'
begin

select @cnt = COUNT(*) from [dbo].[MandatoryVehicleDocs] where VehicleGroupId = @VehicleGroupId and
      [DocTypeId] = @DocTypeId and [CountryId] = @Countryid

if @cnt = 0 
begin
INSERT INTO [dbo].[MandatoryVehicleDocs]
           (VehicleGroupId
           ,[DocTypeId]
           ,[FileContent]
           ,[IsMandatory]
           ,[CountryId]
           ,[Active])
     VALUES
           (@VehicleGroupId
           ,@DocTypeId
           ,@FileContent
           ,@IsMandatory
           ,@CountryId
           ,1)
end
DECLARE @vhidsList CURSOR, @count int,@dcname varchar(50),@vhid int
 begin

   SET @vhidsList = CURSOR FOR
   select VID from PSVehicleMaster  where  CountryId = @Countryid and VehicleGroupId = @VehicleGroupId 

   OPEN @vhidsList
    FETCH NEXT FROM @vhidsList
    INTO @vhid
 
    WHILE @@FETCH_STATUS = 0
    begin
	 begin
		update [dbo].[VehicleDocuments]
		set IsApproved =0, IsVerified = 0
		where [vehicleId] = @vhid and [DocTypeId] = @DocTypeId
		  
		if @@ROWCOUNT = 0 
			begin
				select @dcname=name from  types where id=@DocTypeId
				Insert INTO [dbo].[VehicleDocuments]
				([vehicleId],[FileName],[DocTypeId])
				values (@vhid, @dcname, @DocTypeId)     
			end
	 end 
   
    FETCH NEXT FROM @vhidsList INTO @vhid  
    END 
 
    CLOSE @vhidsList ;
    DEALLOCATE @vhidsList;
	end


end
else
if @flag = 'U'
begin
UPDATE [dbo].[MandatoryVehicleDocs]
   SET [FileContent] = @FileContent
      ,[IsMandatory] = @IsMandatory
 WHERE VehicleGroupId = @VehicleGroupId and
      [DocTypeId] = @DocTypeId and [CountryId] = @Countryid

end
else
if @flag = 'D'
begin

DELETE FROM [dbo].[MandatoryVehicleDocs] where VehicleGroupId = @VehicleGroupId and
      [DocTypeId] = @DocTypeId and [CountryId] = @Countryid

end

end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelMenu]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelMeteredTaxiPackagePricing]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 Create procedure [dbo].[InsUpdDelMeteredTaxiPackagePricing]
@Flag varchar,@PkgId int,@SrcLat decimal(18,4),@DestLat decimal(18,4),@SrcLon decimal(18,4),@DestLon decimal(18,4),
@Src varchar(150),@Dest varchar(150),@Distance varchar(150),@PricingTypeId int,@UnitTypeId int,
@UnitPrice int,@Amount decimal(18,0),@Code varchar(50),@Description varchar(500),@VehicleGroupId int,
@VehicleTYpeId int,@UnitId int,@FromValue int,@ToValue int,@EffectiveDate datetime,@ExpiryDate datetime

As
Begin
If @Flag='I'
begin
INSERT INTO [dbo].[MeteredTaxiPackagePricing]
           ([PkgId]
           ,[SrcLat]
           ,[DestLat]
           ,[SrcLon]
           ,[DestLon]
           ,[Src]
           ,[Dest]
           ,[Distance]
           ,[PricingTypeId]
           ,[UnitTypeId]
           ,[UnitPrice]
           ,[Amount]
           ,[Code]
           ,[Description]
           ,[VehicleGroupId]
           ,[VehicleTYpeId]
           ,[UnitId]
           ,[FromValue]
           ,[ToValue]
           ,[EffectiveDate]
           ,[ExpiryDate])
     VALUES
           (@PkgId, @SrcLat,@DestLat,@SrcLon, @DestLon,@Src,@Dest, @Distance,@PricingTypeId,@UnitTypeId,
           @UnitPrice,@Amount, @Code,@Description,@VehicleGroupId, @VehicleTYpeId,@UnitId,@FromValue,
           @ToValue, @EffectiveDate,@ExpiryDate)
end
If @Flag='U'
Begin
UPDATE [dbo].[MeteredTaxiPackagePricing]
   SET [PkgId] = @PkgId
      ,[SrcLat] = @SrcLat
      ,[DestLat] = @DestLat
      ,[SrcLon] = @SrcLon
      ,[DestLon] = @DestLon
      ,[Src] = @Src
      ,[Dest] = @Dest
      ,[Distance] = @Distance
      ,[PricingTypeId] = @PricingTypeId
      ,[UnitTypeId] = @UnitTypeId
      ,[UnitPrice] = @UnitPrice
      ,[Amount] = @Amount
      ,[Code] = @Code
      ,[Description] = @Description
      ,[VehicleGroupId] = @VehicleGroupId
      ,[VehicleTYpeId] = @VehicleTYpeId
      ,[UnitId] = @UnitId
      ,[FromValue] = @FromValue
      ,[ToValue] = @ToValue
      ,[EffectiveDate] = @EffectiveDate
      ,[ExpiryDate] = @ExpiryDate
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelMeteredTaxiPackages]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[InsUpdDelMeteredTaxiPackages]
@Flag varchar,@Id int,@Code varchar(50),@PackageName varchar(150),@Description varchar(500),@OPId int,@VehicleGroupId int,
@VehicleTypeId int

As
Begin
If @Flag='I'
begin
INSERT INTO [dbo].[MeteredTaxiPackages]
           ([Code]
           ,[PackageName]
           ,[Description]
           ,[OPId]
           ,[VehicleGroupId]
           ,[VehicleTypeId])
     VALUES
           (@Code, @PackageName,@Description,@OPId, @VehicleGroupId,@VehicleTypeId)
end
if @Flag='U'
begin
UPDATE [dbo].[MeteredTaxiPackages]
   SET [Code] = @Code, 
      [PackageName] = @PackageName, 
      [Description] = @Description, 
      [OPId] = @OPId,
      [VehicleGroupId] = @VehicleGroupId,
      [VehicleTypeId] = @VehicleTypeId
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelMOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelmulitiplicationsave]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelNewObject]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsUpdDelNewObject]
@Id int,@Name varchar(50),@Description varchar(50)=null,@Path varchar(50)=null,@ParentId int,@RootObjectId int,@Active int=null,@ObjectAccessesId int=null,@CreatedOn date=null,@CreatedBy varchar(50)=null,@UpdatedOn date=null,@UpdatedBy varchar(50)=null,@flag varchar
as
begin

declare @dt datetime
declare @cnt int
set @dt = getdate()

declare @edithistoryid int
declare @oldParentId int
declare @oldRootObjectId int


if @flag = 'I'
begin
--if @cnt = 0
insert into [NewObject]( Name,[Description],[Path],ParentID,RootObjectId,Active,CreatedOn,CreatedBy)
               values ( @Name,@Description,@Path,@ParentId,@RootObjectId,@Active,@dt,@CreatedBy )

exec InsEditHistory 'NewObject','Name', @ParentId, @RootObjectId,'NewObject Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@ParentId,'Insertion','ParentID',null			
			exec InsEditHistoryDetails @edithistoryid,null,@RootObjectId,'Insertion','RootObjectId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@CreatedBy,'Insertion','RoleId',null
  
			  
end
--else
if @flag = 'U'
begin
update [NewObject]
set Name = @Name
,RootObjectId = @RootObjectId
where Id = @Id

exec InsEditHistory 'NewObject','Name', @ParentId, @RootObjectId, 'NewObject Modification',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @RootObjectId <> @RootObjectId
exec InsEditHistoryDetails @edithistoryid,@oldParentId,@oldRootObjectId,'Modication','RootObjectId',null

end

--else
if @flag = 'D'
begin
delete from [NewObject] where Id = @Id
end


end



GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelNOCBTPOSTracking]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelNotifications]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelNotifications]
(@flag varchar, @Id int=-1,@RoleId int=null
           ,@UserId int=null
           ,@Title varchar(150)=null
           ,@Message varchar(500)=null
           ,@CreatedOn datetime=null
           ,@UpdatedOn datetime=null
           ,@UpdatedBy int=null
           ,@StateId int=null
           ,@StatusId int=null
           ,@CategoryId int=null
           ,@SubCategoryId int=null
           ,@Active int=null)
 as
 begin 
 if(@flag='I')
 begin           
 INSERT INTO [dbo].[Notifications]
           ([RoleId]
           ,[UserId]
           ,[Title]
           ,[Message]
           ,[CreatedOn]
           ,[UpdatedOn]
           ,[UpdatedBy]
           ,[StateId]
           ,[StatusId]
           ,[CategoryId]
           ,[SubCategoryId]
           ,[Active])
     VALUES
           (@RoleId 
           ,@UserId 
           ,@Title 
           ,@Message 
           ,@CreatedOn
           ,@UpdatedOn
           ,@UpdatedBy 
           ,@StateId
           ,@StatusId
           ,@CategoryId
           ,@SubCategoryId
           ,@Active )
     end
   else if(@flag='U')
   begin
   UPDATE [dbo].[Notifications]
   SET [RoleId] = @RoleId
      ,[UserId] = @UserId
      ,[Title] = @Title
      ,[Message] = @Message
      ,[CreatedOn] = @CreatedOn
      ,[UpdatedOn] = @UpdatedOn
      ,[UpdatedBy] = @UpdatedBy
      ,[StateId] = @StateId
      ,[StatusId] = @StatusId
      ,[CategoryId] = @CategoryId
      ,[SubCategoryId] = @SubCategoryId
      ,[Active] = @Active
 WHERE Id=@Id
   end
   else if(@flag='D')
   begin
   delete from Notifications where Id=@Id
   end 
   end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelObjectAccess]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsUpdDelObjectAccess]
(@Id int=-1,
@ObjectId int,
@TypeId int,
@Name varchar(50),
@flag varchar)

as
begin
declare @edithistoryid int
declare @dt datetime
set @dt = GETDATE()

if @flag = 'I'
begin
insert into ObjectAccesses(ObjectId,TypeId,Name) values(@ObjectId,@TypeId,@Name)

exec InsEditHistory 'ObjectAccesses','Name', @ObjectId, @TypeId,'ObjectAccesses Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@ObjectId,'Insertion','ParentID',null			
			exec InsEditHistoryDetails @edithistoryid,null,@TypeId,'Insertion','RootObjectId',null
			
            --exec InsEditHistoryDetails @edithistoryid,null,@CreatedBy,'Insertion','RoleId',null
  

end
end







GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelObjects]    Script Date: 28-09-2018 18:49:44 ******/
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


INSERT INTO [dbo].[Objects]
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
DELETE FROM [dbo].[Objects]
      WHERE Id = @Id
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelOperations]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelOperations] 
(@flag varchar(20),
@Id int=-1,
@OpName varchar(100)
           ,@Code varchar(15)
           ,@Description varchar(500)
           ,@Active int)

as 
begin 
if @flag='I'
BEGIN 
insert into Operations
([OpName]
           ,[Code]
           ,[Description]
           ,[Active])
values

(@OpName
           ,@Code
           ,@Description
           ,@Active) 
           end 
 if @flag='U' 
 begin
 update dbo.Operations
 set [OpName]=@OpName
           ,[Code]=@Code
           ,[Description]=@Description
           ,[Active]=@Active
           where Id=@Id
 end         
 if @flag='D'
 begin
 Delete from Operations 
 where Id=@Id
 end
           end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPackageCharges]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[InsUpdDelPackageCharges]
@flag varchar,@Id int=-1,@PackageId int,@TypeId int,@ApplyOn int,@Value int,
@Code varchar(50),@UnitTypeId int,@UnitId int,@FromValue int,@ToValue int
,@EffectiveDate datetime=null,@ExpiryDate datetime=null,@ChargeTypeId int,@OpCode int=null
,@ChargeCode varchar(50)
as
begin
if @flag ='I'
begin
Insert into dbo.PackageCharges
([PkgId],[TypeId],[ApplyOn],[Value],[Code],[UnitTypeId],[UnitId],[FromValue],[ToValue]
,[EffectiveDate],[Expirydate],[ChargeTypeId],[ChargeCode],[OpCode])

values
(@PackageId,@TypeId,@ApplyOn,@Value,@Code,@UnitTypeId,@UnitId,@FromValue
,@ToValue,@EffectiveDate,@ExpiryDate,@ChargeTypeId,@ChargeCode,@OpCode)

end
if @flag ='U'
begin
Update dbo.PackageCharges
set

[PkgId]=@PackageId,
[TypeId]=@TypeId,
[ApplyOn]=@ApplyOn,
[Value]=@Value,
[Code]=@Code,
[UnitTypeId]=@UnitTypeId,
[UnitId]=@UnitId,
[FromValue]=@FromValue,
[ToValue]=@ToValue,
[EffectiveDate]=@EffectiveDate,
[Expirydate]=@ExpiryDate,
[ChargeTypeId]=@ChargeTypeId,
[ChargeCode]=@ChargeCode,
[OpCode]=@OpCode where Id = @Id 
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPackageDiscounts]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[InsUpdDelPackageDiscounts]
@flag varchar,@Id int=-1,@PackageId int,@TypeId int,@ApplyOn int,@Value int,
@Code varchar(50),@EffectiveDate datetime=null,@ExpiryDate datetime=null,
@UnitId int,@UnitTypeId int,@DiscountTypeId int=null,@OpCode int=null 

as
begin
if @flag ='I'
begin
Insert into dbo.PackageDiscounts
([PkgId],[TypeId],[ApplyOn],[Value],[Code],
[EffectiveDate],[Expirydate],[UnitId],[UnitTypeId],[DiscountTypeId],[OpCode])

values
(@PackageId,@TypeId,@ApplyOn,@Value,@Code,
@EffectiveDate,@ExpiryDate,@UnitId,@UnitTypeId,@DiscountTypeId,@OpCode)

end
if @flag ='U'
begin
Update dbo.PackageDiscounts
set

[PkgId]=@PackageId,
[TypeId]=@TypeId,
[ApplyOn]=@ApplyOn,
[Value]=@Value,
[Code]=@Code,
[EffectiveDate]=@EffectiveDate,
[Expirydate]=@ExpiryDate,
[UnitId]=@UnitId,
[UnitTypeId]=@UnitTypeId,
[DiscountTypeId]=@DisCountTypeId,
[OpCode]=@OpCode where Id = @Id

end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPackages]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsUpdDelPackages]
(
@flag varchar(20)
,@Id int = -1
,@VehicleGroupId int
,@Name varchar(50)
 ,@Description varchar(250)
,@Code varchar(15)
,@FromDate date
           ,@ToDate date
           ,@CreatedOn int
           ,@CreatedBy int
           ,@UpdatedOn int
           ,@UpdatedBy int
           ,@Title varchar(150)
           ,@ImageOne varchar
           ,@ImageTwo varchar
           ,@VehicleType varchar(150)
           ,@CountryId int
)
As
Begin
if @flag ='I'
Begin
INSERT INTO Packages
           ([VehicleGroupId]
           ,[Name]
           ,[Description]
           ,[Code]
           ,[FromDate]
           ,[ToDate]
           ,[CreatedOn]
           ,[CreatedBy]
           ,[UpdatedOn]
           ,[UpdatedBy]
           ,[Title]
           ,[ImageOne]
           ,[ImageTwo]
           ,[VehicleType]
           ,[CountryId])
     VALUES
           (@VehicleGroupId
           ,@Name
 ,@Description
,@Code
,@FromDate
           ,@ToDate
           ,@CreatedOn
           ,@CreatedBy
           ,@UpdatedOn
           ,@UpdatedBy
           ,@Title
           ,@ImageOne
           ,@ImageTwo
           ,@VehicleType
           ,@CountryId)
           End
if @flag ='U'
Begin
UPDATE dbo.Packages
Set[VehicleGroupId]=VehicleGroupId
           ,[Name]=@Name
           ,[Description]=@Description
           ,[Code]=@Code
           ,[FromDate]=@FromDate
           ,[ToDate]=@ToDate
           ,[CreatedOn]=@CreatedOn
           ,[CreatedBy]=@CreatedBy
           ,[UpdatedOn]=@UpdatedOn
           ,[UpdatedBy]=@UpdatedBy
           ,[Title]=@Title
           ,[ImageOne]=@ImageOne
           ,[ImageTwo]=@ImageTwo
           ,[VehicleType]=@VehicleType
           ,[CountryId]=@CountryId
 WHERE id=@id
End
if @flag ='D'
Begin
DELETE FROM Packages
      WHERE id=@id
End
End


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPackagesPricing]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsUpdDelPackagesPricing]
(
@flag varchar(20)
,@Id varchar(50)
           ,@PackageTypeId varchar(150)
           ,@FromKm varchar(50)
           ,@ToKm varchar(50)
           ,@FromDate date
           ,@ToDate date
           ,@PerKmPrice varchar(50)
           ,@Amount varchar(50)
           ,@FromHrs time(7)
           ,@ToHrs time(7)
           ,@Name varchar(150)
           ,@Description varchar(500)
           ,@Code varchar(15)
)
As
Begin
if @flag ='I'
Begin
INSERT INTO PackagesPricing
           ([Id]
           ,[PackageTypeId]
           ,[FromKm]
           ,[ToKm]
           ,[FromDate]
           ,[ToDate]
           ,[PerKmPrice]
           ,[Amount]
           ,[FromHrs]
           ,[ToHrs]
           ,[Name]
           ,[Description]
           ,[Code])
     VALUES
           (@Id 
           ,@PackageTypeId 
           ,@FromKm 
           ,@ToKm 
           ,@FromDate 
           ,@ToDate 
           ,@PerKmPrice 
           ,@Amount 
           ,@FromHrs 
           ,@ToHrs 
           ,@Name 
           ,@Description 
           ,@Code )
           End
if @flag ='U'
Begin
UPDATE dbo.PackagesPricing
Set[Id]=@Id
           ,[PackageTypeId]=@PackageTypeId
           ,[FromKm]=@FromKm
           ,[ToKm]=@ToKm
           ,[FromDate]=@FromDate
           ,[ToDate]=@ToDate
           ,[PerKmPrice]=@PerKmPrice
           ,[Amount]=@Amount
           ,[FromHrs]=@FromHrs
           ,[ToHrs]=@ToHrs
           ,[Name]=@Name
           ,[Description]=@Description
           ,[Code]=@Code
 WHERE id=@id
End
if @flag ='D'
Begin
DELETE FROM PackagesPricing
      WHERE id=@id
End
End


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPackagesTypes]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsUpdDelPackagesTypes]
(@flag varchar(20)
,@Id int
           ,@PackageId int
           ,@Name varchar(150)
           ,@Code varchar(15)
           ,@CreatedOn int
           ,@CreatedBy int
           ,@UpdatedOn int
           ,@UpdatedBy int
           ,@FromDate date
           ,@ToDate date
           ,@Title varchar(150)
           ,@ImageOne varchar
           ,@ImageTwo varchar
)
As
Begin
if @flag ='I'
Begin
INSERT INTO PackagesTypes
           ([Id]
           ,[PackageId]
           ,[Name]
           ,[Code]
           ,[CreatedOn]
           ,[CreatedBy]
           ,[UpdatedOn]
           ,[UpdatedBy]
           ,[FromDate]
           ,[ToDate]
           ,[Title]
           ,[ImageOne]
           ,[ImageTwo])
     VALUES
           (@Id 
           ,@PackageId 
           ,@Name 
           ,@Code 
           ,@CreatedOn 
           ,@CreatedBy 
           ,@UpdatedOn 
           ,@UpdatedBy 
           ,@FromDate 
           ,@ToDate 
           ,@Title 
           ,@ImageOne 
           ,@ImageTwo  )
           End
if @flag ='U'
Begin
UPDATE dbo.PackagesTypes
Set[Id]=@Id
           ,[PackageId]=@PackageId
           ,[Name]=@Name
           ,[Code]=@Code
           ,[CreatedOn]=@CreatedOn
           ,[CreatedBy]=@CreatedBy
           ,[UpdatedOn]=@UpdatedOn
           ,[UpdatedBy]=@UpdatedBy
           ,[FromDate]=@FromDate
           ,[ToDate]=@ToDate
           ,[Title]=@Title
           ,[ImageOne]=@ImageOne
           ,[ImageTwo]=@ImageTwo
 WHERE id=@id
End
if @flag ='D'
Begin
DELETE FROM PackagesTypes
      WHERE id=@id
End
End


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPasswordverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayables]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayablesMaster]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentCatergory]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentgateway]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentGatewaySettings]    Script Date: 28-09-2018 18:49:44 ******/
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
UPDATE [dbo].[PaymentGatewaySettings]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentGatewayType]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentReceivings]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayments]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelplace]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelPricingCredentials]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelPricingCredentials]
@flag varchar,
@Id int=-1,
@PriceCode varchar(150),
@PriceType int,
@UnitPrice decimal(18, 2),
@VehicleGroup int,
@VehicleModel int=NULL,
@VehicleType int=NULL,
@PackageType int= NULL,
@FromDate date=NULL,
@ToDate date= NULL
	as
begin

if @flag='I'
begin
INSERT INTO [dbo].[PricingCredentials]
      (
      [PriceCode]
	   ,[PriceType]
       ,[UnitPrice]
       ,[VehicleGroup]
       ,[VehicleModel]
       ,[VehicleType]
       ,[PackageType]
       ,[FromDate]
       ,[ToDate])
 VALUES(
@PriceCode ,
@PriceType ,
@UnitPrice ,
@VehicleGroup ,
@VehicleModel ,
@VehicleType ,
@PackageType ,
@FromDate ,
@ToDate )
end
else
if @flag='U'
begin
UPDATE [dbo].[PricingCredentials]
SET [PriceCode] = @PriceCode
  ,[PriceType] = @PriceType
  ,[UnitPrice] = @UnitPrice
  ,[VehicleGroup] = @VehicleGroup
  ,[VehicleModel] = @VehicleModel
  ,[VehicleType] = @VehicleType
  ,[PackageType] = @PackageType
  ,[FromDate] = @FromDate
  ,[ToDate] = @ToDate
WHERE  Id=@Id
end
else 
if @flag='D'
begin
delete from [dbo].[PricingCredentials]
where Id=@Id
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelProducts]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsUpdDelProducts]
@flag VarChar,
@Id Int=-1,
@Image VarChar(MAX),
@ProductName VarChar(50),
@Price Float,
@DescriptionOne VarChar(100),
@DescriptionTwo VarChar(100),
@DescriptionThree VarChar(100),
@DescriptionFour VarChar(100),
@ProductUploadeDate DateTime=null,
@ProductExpiredDate DateTime=null
As
Begin
Declare @Count Int,@Dt DateTime 
Set @Dt=GETDATE()

	If(@flag='I')
	
	Select @Count=Count(Id) From Products 
	Where Id=@Id
	If(@Count<1)
	   Insert Into Products
	   ([Image],ProductName,[Price],DescriptionOne,DescriptionTwo,DescriptionThree,DescriptionFour,ProductUploadeDate,ProductExpiredDate) 
	   Values(@image,@ProductName,@Price,@DescriptionOne,@DescriptionTwo,@DescriptionThree,@DescriptionFour,@Dt,@ProductExpiredDate)
	Else
	  RAISERROR ('Already user registered with given mobile number',16,1);
				return;	
	
	End


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPromotionalDiscounts]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[InsUpdDelPromotionalDiscounts]
@flag varchar,@Id int,@OpCode int,@Condition varchar(50),@ValueType int=null,@FromValue int,@ToValue int,@TypeId int,
@ApplyOn int,@Value int,@Applicability varchar(150),@Code varchar(50)
As
Begin
If @flag='I'
Begin
Insert into [dbo].[PromotionalDiscounts]
 ([OpCode]
           ,[Condition]
           ,[ValueType]
           ,[FromValue]
           ,[ToValue]
           ,[TypeId]
           ,[ApplyOn]
           ,[Value]
           ,[Applicability]
           ,[Code])
values
(@OpCode,@Condition,@ValueType,@FromValue,@ToValue,@TypeId,@ApplyOn,@Value,@Applicability,@Code)
end
If @flag='U'
Begin
UPDATE [dbo].[PromotionalDiscounts]
   SET [OpCode] = @OpCode,
      [Condition] = @Condition,
      [ValueType] = @ValueType,
      [FromValue] = @FromValue,
      [ToValue] = @ToValue,
      [TypeId] = @TypeId,
      [ApplyOn] = @ApplyOn,
      [Value] = @Value,
      [Applicability] = @Applicability,
      [Code] = @Code where Id = @Id 

End
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelReceivings]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelReceivingsMaster]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelregisterform]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelRegistrationBTPOS]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoledetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoles]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelRouteDetails]    Script Date: 28-09-2018 18:49:44 ******/
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

INSERT INTO [dbo].[RouteDetails]
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
UPDATE [dbo].[RouteDetails]
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
  delete from [dbo].[RouteDetails] where routeid = @RouteId and StopId = @StopId  
  end

declare @sid int
declare @Var2 int
declare @sstopno int
declare @Vstopno2 int
declare @distance decimal

DECLARE db_cursor CURSOR FOR  
SELECT distinct stopid,stopno from [dbo].[RouteDetails] where routeid = @RouteId order by stopno


OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @sid,@sstopno  

WHILE @@FETCH_STATUS = 0  
BEGIN  

 declare Cursor2 CURSOR for 
    SELECT distinct stopid,stopno from [dbo].[RouteDetails] where routeid = @RouteId order by stopno

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
					select @cnt = count(1) from [dbo].[RouteStops] where fromstopid = @sid and tostopid = @Var2 and RouteId = @RouteId           

					if @cnt = 0 
					INSERT INTO [dbo].[RouteStops]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoutes]    Script Date: 28-09-2018 18:49:44 ******/
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
,@Distance decimal(18,2)
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

select @rtCount= COUNT(*) from [dbo].[Routes] where UPPER(ltrim(rtrim(Code))) = UPPER(ltrim(rtrim(@Code)))
--select @oldRouteName = RouteName, @oldCode = Code, @oldActive = Active from Routes where Id = @Id

--UPDATE [dbo].[Routes]
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

INSERT INTO [dbo].[Routes]
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
INSERT INTO [dbo].[RouteDetails]
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
INSERT INTO [dbo].[RouteDetails]
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

          INSERT INTO [dbo].[RouteStops]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoutesConfiguration]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelSalesOrder]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelSalesordernw]    Script Date: 28-09-2018 18:49:44 ******/
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

INSERT INTO [dbo].[Salesordernw]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelScheduleList]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[InsUpdDelScheduleList]
@flag varchar,@Id int=-1,@Src varchar(250),@Dest varchar(250),@VehicleGroupId int,@VehicleTypeId int
,@StatusId int,@FromDate datetime, @ToDate datetime

as
begin

declare @sccode varchar(50),@dt datetime
set @dt = GETDATE()

if @flag = 'I'
begin

select @sccode = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))

Insert into dbo.ScheduleList

([Src] ,[Dest] ,[ScheduleCode] ,[VehicleGroupId] ,[VehicleTypeId] ,[Fromdate] ,[Todate] ,[StatusId])
values
(@Src,@Dest,@sccode,@VehicleGroupId,@VehicleTypeId,@FromDate,@ToDate,@StatusId)

end

if @flag = 'U'
begin

update dbo.ScheduleList

set [Src] = @Src,
[Dest] = @Dest,
[VehicleGroupId] = @VehicleGroupId,
[VehicleTypeId] =@VehicleTypeId,
[StatusId] = @StatusId,
[Fromdate] = @FromDate,
[Todate] = @ToDate

end

end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelScheduleTimings]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[InsUpdDelScheduleTimings]
@Id int =-1,@flag varchar,@SDId int,@StopName varchar(50),@ArrivalTime time(7),@DepartureTime time(7)
as
begin

declare @dt datetime
set @dt = GETDATE()
if @flag = 'I'
begin
Insert into dbo.ScheduleDetails 
([SDId] ,[StopName] ,[ArrivalTime] ,[DepatureTime] ,[CreatedOn])
values
(@SDId,@StopName,@ArrivalTime,@DepartureTime,@dt)
end

if @flag = 'U'
begin
Update dbo.ScheduleDetails
set [StopName] = @StopName,
[SDId] = @SDId,
[ArrivalTime] =@ArrivalTime,
[DepatureTime] =@DepartureTime
where Id = @Id 
end

end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSEmailConfiguration]    Script Date: 28-09-2018 18:49:44 ******/
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
UPDATE [dbo].[SMSEmailConfiguration]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSEmailSubscribers]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSGatewayConfiguration]    Script Date: 28-09-2018 18:49:44 ******/
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
UPDATE [dbo].[SmsGatewayeConfiguration]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSProviderConfig]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelSOSMessage]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelSOSMessage]
(@flag varchar,
@Id int=-1,
@UserTypeId int,
@SentTo varchar(50)=null,
@UserId int,
@MessageId int=null,
@Message varchar(600)=null,
@SentOn DateTime=null,
@SentTime time=null,
@StatusId int=null,
@Otp varchar(10)=null,
@UpdatedOn dateTime=null,
@UpdatedBy int=null,
@Latitude numeric(8,6),
@Longitude numeric(8,6))
as 
begin
declare @cnt int,@m varchar(10),@dt date,@t time(7)
set @dt = GETDATE()
set @t = GETDATE()
select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))

if @flag = 'I'

begin

INSERT INTO [dbo].[SOSMessages]
           ([UserTypeId]
           ,[UserId]
           ,[SentTo]
           ,[MessageId]
           ,[Message]
           ,[SentOn]
           ,[SentTime]
           ,[StatusId]
           ,[Otp]          
           ,[Latitude]
           ,[Longitude])
     VALUES
           (@UserTypeId
           ,@UserId
           ,@SentTo
           ,@MessageId
           ,@Message
           ,@dt
           ,@t
           ,@StatusId
           ,@m         
           ,@Latitude
           ,@Longitude)
 end
 if (@flag='U')
 begin
 UPDATE [dbo].[SOSMessages]
   SET [UserTypeId] = @UserTypeId
      ,[UserId] = @UserId
      ,[SentTo] = @SentTo
      ,[MessageId] = @MessageId
      ,[Message] = @Message     
      ,[StatusId] = @StatusId    
      ,[UpdatedOn] = @dt
      ,[UpdatedBy] = @UpdatedBy
      ,[Latitude] = @Latitude
      ,[Longitude] = @Longitude
 WHERE Id=@Id
 end
 if(@flag='D')
 begin
  delete from SOSNumber where Id=@Id
 end
 
 select [UserId],[Message],[Otp] from SOSMessages where UserTypeId =@UserTypeId
 

end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSOSnumber]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelSOSnumber]
(@flag varchar,
@Id int=-1,
@UserTypeId int,
@MobileNumber varchar(20),
@UserId int,
--@CreatedOn DateTime,
@Active int=1,
@MobiOrder int,
@UserName varchar(50)=null
)
as 
declare @cnt int,@dt datetime
set @dt = GETDATE()

if @flag = 'I'
begin

select @cnt = COUNT(*) from [dbo].[SOSNumber] where [UserTypeId] = @UserTypeId and
      UserID=@UserId and MobileNumber=@MobileNumber

if @cnt = 0 
begin

INSERT INTO [dbo].[SOSNumber]
           ([UserTypeId]
           ,[MobileNumber]
           ,[UserId]
           ,[CreatedOn]
           ,[Active]
           ,[MobiOrder]
           )
     VALUES
           (@UserTypeId,
           @MobileNumber, 
           @UserId,
           @dt,
           @Active, 
           @MobiOrder
           )
 end
 if (@flag='U')
 begin
 UPDATE [dbo].[SOSNumber]
   SET [UserTypeId] = @UserTypeId,
      [MobileNumber] = @MobileNumber,
      [UserId] = @UserId,       
      [Active] = @Active,
      [MobiOrder] = @MobiOrder
      
 WHERE Id=@Id
 end
 if(@flag='D')
 begin
  delete from SOSNumber where Id=@Id
 end
 
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSTATE]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelSubCategory]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelTicketGeneration]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionCharges]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[InsUpdDelTransactionCharges]
@Flag varchar,@Id int,@TransactionMasterId int,@ChargeId int,@Amount decimal(18,0),@AppliedOnDate date=null
As
Begin
If @Flag='I'
Begin
INSERT INTO TransactionCharges
           ([TransactionMasterId]
           ,[ChargeId]
           ,[Amount]
           ,[AppliedOnDate])
     VALUES
           (@TransactionMasterId,@ChargeId,@Amount,@AppliedOnDate)
end
If @Flag='U'
Begin

UPDATE TransactionCharges
   SET [TransactionMasterId] =@TransactionMasterId,
      [ChargeId] = @ChargeId,
      [Amount] = @Amount,
      [AppliedOnDate] = @AppliedOnDate
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[InsUpdDelTransactionDetails]
@Flag varchar,@Id int,@TransactionMasterId int,@Date date=null,@Time time=null,@UpdatedOn datetime=null,
@PaymentTypeId int,@AccountNumber varchar(50),@TransactionOTP varchar(10)=null,@OTPVerified int=null,@StatusId int
As
Begin

declare @dt date,@t time(7),@totp varchar(20)
set @dt =GETDATE()
set @t = GETDATE()
select @totp = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
If @Flag='I'
Begin
INSERT INTO TransactionDetails
           ([TransactionMasterId]
           ,[Date]
           ,[Time]          
		   ,[PaymentTypeId]
		   ,[AccountNumber]
		   ,[TransactionOTP]		  
		   ,[StatusId])
     VALUES
           (@TransactionMasterId,@dt,@t,@PaymentTypeId,@AccountNumber,@totp,@StatusId)

		   select @Id = SCOPE_IDENTITY()

		   select [Transactionotp] from TransactionDetails where Id = @Id 
end
If @Flag='U'
Begin

UPDATE TransactionDetails
   SET [TransactionMasterId] =@TransactionMasterId,
     [Date]=@Date
           ,[Time]=@Time
           ,[UpdatedOn]=@UpdatedOn
		   ,[PaymentTypeId]=@PaymentTypeId
		   ,[AccountNumber]=@AccountNumber
		   ,[TransactionOTP]=@TransactionOTP
		   ,[OTPVerified]=@OTPVerified
		   ,[StatusId]=@StatusId
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionDetailsOld]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTransactionDetailsOld](@Id int,@TransId varchar(50),@TotalAmt int,@PaymentId varchar(50),@BTPOSid varchar(50))
as
begin
insert into OldTransactionDetails values(@Id,@TransId,@TotalAmt,@PaymentId,@BTPOSid)
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionDiscounts]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InsUpdDelTransactionDiscounts]
@Flag varchar,@Id int,@TransactionMasterId int,@DiscountId int,@Amount decimal(18,0),@AppliedOnDate datetime
As
Begin
If @Flag ='I'
Begin
INSERT INTO [dbo].[TransactionDiscounts]
           ([TransactionMasterId]
           ,[DicountId]
           ,[Amount]
           ,[AppliedOnDate])
     VALUES
           (@TransactionMasterId,@DiscountId,@Amount,@AppliedOnDate)
End
begin
UPDATE [dbo].[TransactionDiscounts]
   SET [TransactionMasterId] = @TransactionMasterId,
      [DicountId] = @DiscountId,
      [Amount] = @Amount,
      [AppliedOnDate] = @AppliedOnDate
end
End


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionInfo]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InsUpdDelTransactionInfo]
@Flag varchar,@Id int,@TransactionMasterId int,@EmailSent int,@SmsSent int,@NumberOfRetries int,@StatusId int
,@EmailSentOn datetime,@SmsSentOn datetime,@Sendphno varchar(15),@Email varchar(50)
,@TransactionDocument varchar(max)=null,
@Date date=null,@Time time(7)=null
As
Begin
declare @dt date ,@t time(7)
set @dt = GETDATE()
set @t = GETDATE()
If @Flag='I'
Begin
INSERT INTO [dbo].[TransactionInfo]
           ([TransactionMasterId]
           ,[EmailSent]
           ,[SmsSent]
           ,[NumberOfRetries]
           ,[StatusId]
           ,[EmailSentOn]
           ,[SmsSentOn]
           ,[SmsPhoneNumber]
           ,[EmailAddress]
           ,[TransactionDocument]
           ,[Date]
           ,[Time])
     VALUES
           (@TransactionMasterId,@EmailSent, @SmsSent,@NumberOfRetries,@StatusId,@EmailSentOn,@SmsSentOn,@Sendphno,
           @Email,@TransactionDocument,@dt,@t)
End
If @Flag='U'
begin
UPDATE [dbo].[TransactionInfo]
   SET [TransactionMasterId] =@TransactionMasterId,
      [EmailSent] = @EmailSent,
      [SmsSent] = @SmsSent,
      [NumberOfRetries] = @NumberOfRetries,
      [StatusId] = @StatusId,
      [EmailSentOn] = @EmailSentOn,
      [SmsSentOn] = @SmsSentOn,
      [SmsPhoneNumber] = @Sendphno, 
      [EmailAddress] = @Email,
      [TransactionDocument] = @TransactionDocument,
      [Date] = @Date,
      [Time] = @Time
end
End


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionMaster]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsUpdDelTransactionMaster]
@flag varchar,@Id int,@GatewayTransId varchar(50),@StatusId int,@BaseAmount decimal(18,0)
,@Discount decimal(18,0),@Charges decimal(18,0),@TotalAmount decimal(18,0),@Opcode varchar(50),@CreatedBy int,@PaymentTypeId int
,@Desc varchar(50)
as
begin

declare @cnt int,@dt date,@t time,@m varchar(50),@TransactionId varchar(50),@gt varchar(50),@gateId varchar(50)
set @dt = GETDATE()
set @t = GETDATE()

select @cnt = COUNT(*) from TransactionMaster where Id = @Id and TransactionId = @TransactionId and GateWayTransactionId = @GatewayTransId
select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
select @gt = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))

set @TransactionId = 'TR'+@m
set @gateId = 'GT'+@gt

if @flag = 'I'
begin
if @cnt = 0
insert into dbo.TransactionMaster
(TransactionId,GateWayTransactionId,StatusId,Date,Time,BaseAmount,Discount,Charges,TotalAmount,OpCode,CreatedBy,
PaymentTypeId,Description)
values
(@TransactionId,@gateId,@StatusId,@dt,@t,@BaseAmount,@Discount,@Charges,@TotalAmount,@Opcode,@CreatedBy,@PaymentTypeId,@Desc)
end
else
begin
Update dbo.TransactionMaster
set [StatusId] = @StatusId,
[Date] = @dt,
[Time] = @t,
[BaseAmount]  =@BaseAmount,
[Discount] =@Discount,
[Charges] =@Charges,
[TotalAmount] = @TotalAmount,
[OpCode] = @Opcode,
[PaymentTypeId] =@PaymentTypeId,
[Description] = @Desc

where Id = @Id 


end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactions]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionTypes]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingDevice]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingHandlers]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingSlaType]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDeltypes]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelULFeatures]    Script Date: 28-09-2018 18:49:44 ******/
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
INSERT INTO [dbo].[ULFeatures]
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

UPDATE [dbo].[ULFeatures]
   SET [ULPymtId] = @ULPymtId
      ,[FeatureId] = @FeatureId
      ,[FeatureValue] = @FeatureValue
      ,[FeatureDesc] = @FeatureDesc
     
     
 WHERE [Id] = @Id 
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [dbo].[ULFeatures]
      WHERE [Id] = @Id 
end
end

SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelULPymtTransDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
INSERT INTO [dbo].[ULPymtTransDetails]
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

UPDATE [dbo].[ULPymtTransDetails]
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
DELETE FROM [dbo].[ULPymtTransDetails]
      WHERE [Id] = @Id 
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDeluserdetails]    Script Date: 28-09-2018 18:49:44 ******/
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
insert into [dbo].[Userdetails]

([username],[Accountnumber],[balance] ,[expirydate] ,[startdate],[status])
values
 
(@username,@Accountnumber,@balance,@expirydate,@startdate,@status)
end
if @flag='u'
begin
update [dbo].[Userdetails]
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
delete from [dbo].[Userdetails]
where Id=@Id
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicense]    Script Date: 28-09-2018 18:49:44 ******/
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

declare @cnt int = 0,@currDate datetime,@ex datetime
select @currDate = GETDATE()
if (@LicenseTypeId ='1')
set @ex = DATEADD(DD,360,GETDATE())
if (@LicenseTypeId ='2')
set @ex = DATEADD(DD,180,GETDATE())
if (@LicenseTypeId ='3')
set @ex = DATEADD(DD,90,GETDATE())
if (@LicenseTypeId ='4')
set @ex = DATEADD(DD,30,GETDATE())


if @insupddelflag = 'I'
begin

select @cnt = COUNT(*) from [dbo].[UserLicense] where [UserId] = @UserId and [LicenseTypeId] = @LicenseTypeId

	if @cnt = 0 
	begin

	INSERT INTO [dbo].[UserLicense]
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
			   ,@ex           
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

UPDATE [dbo].[UserLicense]
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
	DELETE FROM [dbo].[UserLicense] WHERE [UserId] = @UserId
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
  FROM [dbo].[UserLicense]
   WHERE [UserId] = @UserId and [LicenseTypeId]=@LicenseTypeId

 
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicenseConfirmDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
,@soId int,@reexp datetime

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
    
If @isRenewal=1
Begin
 Update UserLicense set Expiryon=DATEADD(month,@units,ExpiryOn)Where (FOId=@foId and Id=@ULId)
 select @expDt=Expiryon from UserLicense Where (FOId=@foId and Id=@ULId)
End    
    
   
    
if @isRenewal = 0 
begin
   select @expDt = DATEADD(month,@units,GETDATE())
   UPDATE [dbo].[UserLicense]
   SET 
      [StartDate] = @currDate
      ,[ExpiryOn] =  @expDt    
      ,[ActualExpiry] = DATEADD(day,7,@expDt)--(@expDt + (select [graceperiod] from UserLicense WHERE [Id] = @ULId)) 
      ,[LastUpdatedOn] = @currDate
      ,[Active] = 1
      ,[StatusId] = 3      
 WHERE [Id] = @ULId

UPDATE [dbo].[UserLicensePymtTransactions]
   SET [GatewayTransId] = @GatewayTransId       
      ,[StatusId] =3
      where [TransId] = @TransId
      
     select  @userloginid =logininfo from UserLogins where UserId = @userId
     
     if @userloginid is null 
     begin
     select @userloginid = 'FO'+(select replace(convert(char(10), getdate(), 108), ':', ''))        
     
     INSERT INTO [dbo].[UserLogins]
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
SELECT TOP(@POSUnits) id from [dbo].[BTPOSDetails] where FleetOwnerId is null or fleetownerid  = 0 ORDER BY ID


OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @posid

WHILE @@FETCH_STATUS = 0  
BEGIN  

declare @cid int

select @cid = companyid from FleetOwner where Id = @foId


update [dbo].[BTPOSDetails]
set FleetOwnerId = @foId, CompanyId = @cid
where Id = @posid
 
FETCH NEXT FROM db_cursor INTO @posid  
END  

CLOSE db_cursor  
DEALLOCATE db_cursor 

declare @sonum varchar(20),@shipOrderNum varchar(20)

 select @sonum = 'SO'+(select replace(convert(char(10), getdate(), 108), ':', ''))
 select @shipOrderNum = 'SH'+(select replace(convert(char(10), getdate(), 108), ':', ''))

      INSERT INTO [dbo].[SalesOrder]
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
           
     --      INSERT INTO [dbo].[Notifications]
     --      ([CreatedOn]
     --      ,[Message]
     --      --,[MessageTypeId]
     --      ,[StatusId]
     --      ,[UserId]
     --      ,[Title]
     --      ,[Source])
     --VALUES
     --      (@currDate,'A sales order '+@sonum+' is generated for BT POS',1,1,1,'Admin Admin','License Payments')
          

           INSERT INTO [dbo].[ShippingOrder]
           ([ShippingOrderNum]
           ,[TransactionId]
           ,[Date]
           ,[amount]
           ,[Status]
           ,[SalesOrderId])
     VALUES
           (@shipOrderNum,@ULPymtId,@currDate,@amount,1,@soId)

--INSERT INTO [dbo].[Notifications]
--           ([CreatedOn]
--           ,[Message]
--           --,[MessageTypeId]
--           ,[StatusId]
--           ,[UserId]
--           ,[Title]
--           ,[Source])
--     VALUES
--           (@currDate,'A shipping order '+@shipOrderNum+' is generated for BT POS',1,1,1,'Admin Admin','License Payments')
           
		--update the inventory status
		--check the availability and if not possible, generate error
		--if avilable qty falls below reorder point then generate an alert also
		UPDATE [dbo].[Inventory]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicenseDetails]    Script Date: 28-09-2018 18:49:44 ******/
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

select @ulCnt = COUNT(*) from [dbo].[UserLicense] where UserId = @userid and LicenseTypeId = @licenseTypeId
    -- Insert statements for procedure here
    --1) master user license record will be maintained for all user licenses
    --FOid, licenseTypeId, active, startdate, expiryon, graceperiod,lastupdatedon
    if @ulCnt = 0 
    begin
    INSERT INTO [dbo].[UserLicense]
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
      
      select @ulPcnt = COUNT(*) from  [dbo].[UserLicensePayments] where ULId = @ULId
		if @ulPcnt = 0 
		begin
		INSERT INTO [dbo].[UserLicensePayments]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicensePayments]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsUpdDelUserLicensePayments](
@Id int = -1,
@ULId int,
@TransId varchar(20)=null,
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

--select @cnt = COUNT(*) from [dbo].[UserLicensePayments] where [ULId] = @ULId	
	declare @t varchar(50),@tt int
if @insupddelflag = 'I'
begin


select @CreatedOn = GETDATE()

INSERT INTO [dbo].[UserLicensePayments]
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
            select @tt=SCOPE_IDENTITY();
       set @t='TR'+Cast(@tt as varchar);
       update [UserLicensePayments] set [TransId]=@t where Id=@tt
end

else
if @insupddelflag = 'U'
begin

UPDATE [dbo].[UserLicensePayments]
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
DELETE FROM [dbo].[UserLicensePayments]
      WHERE [ULId] = @ULId and transid = @TransId
end


--return the fleet owner details
if @insupddelflag = 'I' or @insupddelflag = 'U'
begin

select Distinct u.[Id]
      ,[FirstName]
      ,[LastName]
      ,[MiddleName]
      ,[EmpNo]
      ,[EmailId]
      ,[RoleId]
      ,[CompanyId]
	  ,ulp.Amount
      ,[GenderId]
      ,[ManagerId]
      ,[CountryId]
      ,[StateId]
      ,[ZipCode]
      ,[ContactNo1]
      ,[ContactNo2]
      ,[Address]
      ,[AltAddress]
      ,[photo] from Users u
inner join UserLicense ul on u.Id = ul.UserId
inner join UserLicensePayments ulp on ulp.ULId = ul.Id where ulp.ULId = @ULId and ulp.Id=@tt
--and transid = @TransId

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
  FROM [dbo].[UserLicensePayments]
  where ULId=@ULId and Id=@tt 
  --and [TransId] = @TransId
end
end



GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicensePymtTransactions]    Script Date: 28-09-2018 18:49:44 ******/
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
declare @LicensePymtTransId int,@dd varchar(50)

if @insupddelflag = 'I'
begin
INSERT INTO [dbo].[UserLicensePymtTransactions]
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
            set @dd='GTTR-'+Cast(@LicensePymtTransId as varchar);
            update [dbo].[UserLicensePayments]
            set [LicensePymtTransId]  = @LicensePymtTransId
            where [Id] = @ULPymtId 
			update UserLicensePymtTransactions set [GatewayTransId]=@dd where [TransId]= @TransId
			
		

end
else
if @insupddelflag = 'U'
begin

UPDATE [dbo].[UserLicensePymtTransactions]
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
DELETE FROM [dbo].[UserLicensePymtTransactions]
      WHERE [Id] = @Id 
end
select  [TransId],[GatewayTransId] from [UserLicensePymtTransactions] where TransId = @TransId
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserRoles]    Script Date: 28-09-2018 18:49:44 ******/
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
INSERT INTO [dbo].[UserRoles]
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
UPDATE [dbo].[UserRoles]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelVehicleDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
INSERT INTO [dbo].[VehicleDetails]
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
 UPDATE [dbo].[VehicleDetails]
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelVehicleLayout]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelVehicleSchedule]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[InsUpdDelVehicleSchedule]
@flag varchar,@Id int=-1,@VehicleId int,@SDId int,@StatusId int
as
begin 
declare @dt datetime
set @dt = GETDATE()

if @flag = 'I'
begin
Insert into dbo.VehicleScheduleDetails
([SDId],[VehicleId] ,[CreatedOn],[StatusId])
values 
(@SDId,@VehicleId,@dt,@StatusId)
end

if @flag = 'U'
begin
Update dbo.VehicleScheduleDetails
set [SDId] = @SDId,
[VehicleId] =@VehicleId,
[StatusId] = @StatusId

end

end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelZipCode]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdelStops]    Script Date: 28-09-2018 18:49:44 ******/
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
      @latitude numeric(18,6)
      ,@longitude numeric(18,6),
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
           Active
           ,Latitude
           ,Longitude)
           values
           (@Name,
           @Description,
           @Code,
           @Active
           ,@latitude
           ,@longitude)
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
/****** Object:  StoredProcedure [dbo].[InsUpDelTroubleTicketingCategories]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsupdEmailBox]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsupdEmailBox]
@flag varchar,@Id int=-1, @ToMailId varchar(100)=null,@FromMailId varchar(100)=null,
@Subject varchar(150)=null,@CarbonCopy varchar(250)=null,@BlindCarbonCopy varchar(250)=null,@Text varchar(1000)=null,
@Attachments varchar(MAX)=null,@ToDate datetime=null,@FromDate datetime=null
as
begin
if @flag ='I'
begin
Insert into EmailBox
([ToMailId],[FromMailId],[Subject],[CarbonCopy],[BlindCarbonCopy],[Text],[Attachments],[ToDate],[FromDate])
values
(@ToMailId,@FromMailId,@Subject,@CarbonCopy,@BlindCarbonCopy,@Text,@Attachments,@ToDate,@FromDate)
end
if @flag ='U'
begin
update EmailBox
set[ToMailId]=@ToMailId,
   [FromMailId]=@FromMailId,
   [Subject]=@Subject,
   [CarbonCopy]=@CarbonCopy,
   [BlindCarbonCopy]=@BlindCarbonCopy,
   [Text]=@Text,
   [Attachments]=@Attachments,
   [ToDate]=@ToDate,
   [FromDate]=@FromDate
   where Id=@id
   end
   If @flag='D'
   begin
  Delete From EmailBox where Id=@Id
  End
    end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdEwalletTransaction]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[InsUpdEwalletTransaction]
@flag varchar,@Id int=-1,@MobileNo varchar(20),@AccountNo varchar(50) 
,@Amount decimal(18,0),@Status int = null,@UpdatedOn datetime = null
,@CreatedOn datetime = null
AS
BEGIN

declare @cnt int
       
	if @flag = 'I'
	begin
	
	insert into [dbo].[Transaction]
	([MobileNo] ,[AccountNo] ,[Amount] ,[Status] ,[UpdatedOn] ,[CreatedOn] )
	values
	(@MobileNo ,@AccountNo ,@Amount ,@Status ,@UpdatedOn ,@CreatedOn)	
	
	
	end
	
	
	if @flag ='U'
	begin
	
	select @cnt = COUNT(*) from [Transaction] where MobileNo = @MobileNo
	if @cnt = 0
		begin
				RAISERROR ('No User Registered with given MobileNo',16,1);
				return;	
		end   
		else
		begin
	
	Update [dbo].[Transaction]
	set [MobileNo]=@MobileNo ,	
	[AccountNo]= @AccountNo,	
	[Amount]= @Amount,
	[Status]=@Status ,
	[UpdatedOn]= @UpdatedOn,
	[CreatedOn]= @CreatedOn
	
	where MobileNo = @MobileNo 
	
	 end
	 end
	--select [MobileNo] ,[AccountNo] ,[Amount] ,[Status],[UpdatedOn],[CreatedOn] from Transaction where MobileNo = @MobileNo
	end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdEwalletTransHistory]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[InsUpdEwalletTransHistory]
@flag varchar,@Id int=-1,@Date date,@Time time 
,@TransactionType varchar(50),@Status varchar(50) = null,@Amount decimal(10,6) = null
,@Details varchar(50) = null,@TransactionId varchar(50) = null,@MobileNo varchar(20),@TransactionMode varchar(50)
AS
BEGIN

declare @cnt int
       
	if @flag = 'I'
	begin
	select @cnt = COUNT(*) from Appusers where Mobilenumber = @MobileNo
	if @cnt = 0
		begin
				RAISERROR ('No User Registered with given MobileNo',16,1);
				return;	
		end   
		else
		begin
	
	insert into [dbo].[TransHistory]
	([Date] ,[Time] ,[TransactionType] ,[Status] ,[Amount] ,[Details] ,[TransactionMode])
	values
	(@Date ,@Time ,@TransactionType ,@Status ,@Amount ,@Details,@TransactionMode)
	
	end
	end
	
	if @flag ='U'
	begin
	
	Update [dbo].[TransHistory]
	set [Date]=@Date ,	
	[Time]= @Time,	
	[TransactionType]= @TransactionType,
	[Status]=@Status ,
	[Amount]= @Amount,
	[Details]= @Details
	
	where Id = @Id
	
 end
	--select [MobileNo] ,[AccountNo] ,[Amount] ,[Status],[UpdatedOn],[CreatedOn] from Transaction where MobileNo = @MobileNo
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdFaqs]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InSupdFleetOwnerRequest]    Script Date: 28-09-2018 18:49:44 ******/
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
UPDATE [dbo].[FleetOwnerRequest]
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
/****** Object:  StoredProcedure [dbo].[InSupdFleetOwnerRequestDetails]    Script Date: 28-09-2018 18:49:44 ******/
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

INSERT INTO [dbo].[FleetOwnerRequestDetails]
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
/****** Object:  StoredProcedure [dbo].[InsupdInventoryPurchases]    Script Date: 28-09-2018 18:49:44 ******/
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
	INSERT INTO [dbo].[InventoryPurchases]
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
/****** Object:  StoredProcedure [dbo].[InsUpdLicenseTypes]    Script Date: 28-09-2018 18:49:44 ******/
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
INSERT INTO [dbo].[LicenseTypes]
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
	UPDATE [dbo].[LicenseTypes]
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
/****** Object:  StoredProcedure [dbo].[InsUpdOnlineTicketTransactions]    Script Date: 28-09-2018 18:49:44 ******/
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
	INSERT INTO [dbo].[BookingPaymentDetails]
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
UPDATE [dbo].[BookingPaymentDetails]
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
/****** Object:  StoredProcedure [dbo].[InsUpdTransactionOtp]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsUpdTransactionOtp]
@Id int,@TransmasterId Int,@Totp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from TransactionDetails where Id = @Id and TransactionMasterId = @TransmasterId

if @cnt = 0
begin
  
				RAISERROR ('Invalid Transaction Id',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from TransactionDetails where Id = @Id  and TransactionMasterId = @TransmasterId and TransactionOTP = @Totp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid Transaction OTP',16,1);
					return;
	end
  else
  begin
     update TransactionDetails set TransactionOTP = null where Id = @Id and TransactionMasterId = @TransmasterId and TransactionOTP = @Totp
     select [TransactionMasterId],[Id],[AccountNumber],[PaymentTypeId],[StatusId]   from TransactionDetails where Id = @Id 
  end
 
end

end


GO
/****** Object:  StoredProcedure [dbo].[InsupdTripPayments]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsupdTripPayments]
(@Flag varchar
  ,@Id int = -1
,@BNo int
,@Amount decimal
,@StatusId int =null
,@GatewayTransId varchar(20)=null
,@TransDate datetime =null
,@PaymentModeId int 
,@Comments varchar(250) =null
,@CustAccountId int = null
 ,@AppUserId int = null)
      As 
      Begin
  declare @dt datetime,@cnt int
  set @dt = GETDATE()
  
  select @cnt = COUNT(*) from Appusers where Id  = @AppUserId 
  if @cnt = 0 
  begin
  RAISERROR('No Registered User',18,6);
  return;
  end   
     If @Flag = 'I'
     Begin
      INSERT INTO [dbo].[TripPayments]
           ([BNo]
           ,[Amount]
           ,[GatewayTransId]
           ,[StatusId]
           ,[TransDate]
           ,[PaymentModeId]
           ,[Comments]
           ,[CustAccountId]
           ,[AppUserId])
     VALUES
           (@BNo
           ,@Amount
           ,@GatewayTransId
           ,@StatusId
           ,@dt
           ,@PaymentModeId
           ,@Comments
           ,@CustAccountId
           ,@AppUserId)
           
           select [Id] from TripPayments where BNo = @BNo  
End
If @Flag ='U'
begin
UPDATE [dbo].[TripPayments]
   SET [BNo] = @BNo
      ,[Amount] = @Amount
      ,[GatewayTransId] = @GatewayTransId
      ,[StatusId] = @StatusId
      ,[TransDate] = @dt
      ,[PaymentModeId] = @PaymentModeId
      ,[Comments] = @Comments
      ,[CustAccountId] = @CustAccountId
      ,[AppUserId] = @AppUserId
 WHERE Id=@Id
 select Id,[GatewayTransId],[PaymentModeId] from TripPayments where Id  = @Id
End
if @Flag = 'D'
Begin
 DELETE FROM [dbo].[TripPayments]
      WHERE Id=@Id
End

End


GO
/****** Object:  StoredProcedure [dbo].[InsupdTroubleTicket]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsupdTroubleTicket]
(@flag varchar,@id int=null,
@Userid int=null,@EmailId varchar(50)=null,@CreatedOn date,@Onbehalfofph Varchar(20)=null,
@TicketNo varchar(20)=null,@Catid int=null,@Description varchar(50)=null,@Emailsent int=null,@Smssent int=null,
@TicketTypeId int=null,@PhoneNumber varchar(20)=null,@StatusId int=null,@Name varchar(150)=null,@Category varchar(150)=null,@Subject varchar(150)=null)
as
begin
declare
@currDate date 
set @currDate = getdate()

if @flag = 'I'
begin
insert into [dbo].[TroubleTicket]
([Userid],[EmailId],[CreatedOn],[On behalf of ph],[TicketNo],[Catid],[Description],[Emailsent],[Sms sent],[TicketTypeId],[PhoneNumber],[StatusId],[Name],[Category],[Subject]) 
values
(@Userid,@EmailId,@currDate,@Onbehalfofph,@TicketNo,@Catid,@Description,@Emailsent,@Smssent,@TicketTypeId,@PhoneNumber,@StatusId,@Name,@Category ,@Subject)
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
[StatusId] =@StatusId,
[Name]=@Name ,
[Category]=@Category ,
[Subject]=@Subject
where id=@id

end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdTypeGroups]    Script Date: 28-09-2018 18:49:44 ******/
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

INSERT INTO [dbo].[TypeGroups]
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

UPDATE [dbo].[TypeGroups]
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
DELETE FROM [dbo].[TypeGroups]
      WHERE Id = @Id
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdTypes]    Script Date: 28-09-2018 18:49:44 ******/
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
INSERT INTO [dbo].[Types]
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
DELETE FROM [dbo].[Types]
      WHERE Id = @Id
end
end


GO
/****** Object:  StoredProcedure [dbo].[InsupdUsercard]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsupdUserdownloads]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsupdUserinfo]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsupdUserPreferences]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdUsers]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdUsers](
@FirstName varchar(40) = null
,@LastName varchar(40) = null
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
 
 UPDATE [dbo].[Users]
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
				INSERT INTO [dbo].[FleetOwner]
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
					UPDATE [dbo].[FleetOwner]
						SET 
						[CompanyId] = @cmpId
						,[Active] = 1
						,[FleetOwnerCode] = @fc
					 WHERE [UserId] = @currid
 
 end
 
 end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdUsersGroups]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdUsersGroups](
@FirstName varchar(40) = null
,@LastName varchar(40) = null
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
 
 UPDATE [dbo].[Users]
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
				INSERT INTO [dbo].[FleetOwner]
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
					UPDATE [dbo].[FleetOwner]
						SET 
						[CompanyId] = @cmpId
						,[Active] = 1
						,[FleetOwnerCode] = @fc
					 WHERE [UserId] = @currid
 
 end
 
 end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdwebsiteresetpassword]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[InsUpdWebsiteUserInfo]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[MOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[Passwordreset]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[Passwordverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[POBookingDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[POBookingDetails]
(@id int = -1

           ,@BookingType varchar(50)=null 
           ,@Src varchar(250)
           ,@Dest varchar(250)       
           ,@SrcLatitude numeric(18,6)= null 
           ,@SrcLongitude numeric(18,6) = null
           ,@DestLatitude numeric(18,6) = null
           ,@DestLongitude numeric(18,6) = null         
           ,@PackageId int = null
           ,@Pricing decimal(10,0) = null
           ,@MobileNumber varchar(20)=null         
           ,@MobileOtp varchar(20) = null        
           ,@distance decimal(18,0)=null
           ,@PaymentTypeId int =null
		   ,@VehicleGroupId int=null
		   ,@vehicleTypeId int=null
           ,@flag varchar(1) = null)
as
begin
declare @motp varchar(5),@dt datetime,@D date,@T time
Set @D=GETDATE()
set @T=GETDATE()

If @flag='I'
begin

select @motp = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
INSERT INTO POBookingConfirmation
           ([Src]
           ,[Dest]
           ,[SrcLat]
           ,[SrcLong]
           ,[DestLat]
           ,[DestLong]
           ,[BookingType]
           ,[Pricing]
           ,[PackageId]
           ,[MobileNumber]
           ,[MobileOtp]
           ,[Distance]
           ,[VehicleGroupId]
           ,[vehicleTypeId]
           ,[PaymentTypeId]
		   ,[Date]
		   ,[Time])
		   values
		   (
            @Src
           ,@Dest     
           ,@SrcLatitude
           ,@SrcLongitude
           ,@DestLatitude 
           ,@DestLongitude  
		   ,@BookingType     
           ,@Pricing 
		   ,@PackageId 
           ,@MobileNumber    
           ,@motp      
           ,@distance
		   ,@VehicleGroupId
		   ,@vehicleTypeId 
		   ,@PaymentTypeId
		   ,@D
		   ,@T
          )
		  select @Id = SCOPE_IDENTITY()
end

select [BookingType],[MobileOtp],[Id],[MobileNumber]  from POBookingConfirmation where Id = @Id
end


GO
/****** Object:  StoredProcedure [dbo].[POMobileotpVerification]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[POMobileotpVerification]
@Id int,@PhoneNo varchar(50),@Mobileotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from POBookingConfirmation where Id  = @Id

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from POBookingConfirmation where Id  = @Id and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update POBookingConfirmation set Mobileotp = null where Id  = @Id and [Mobileotp] = @Mobileotp
     select [MobileNumber],[Src],[Dest] from POBookingConfirmation where Id  = @Id
  end
 
end

end


GO
/****** Object:  StoredProcedure [dbo].[PSAcceptRejectBooking]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSAcceptRejectBooking] 
	
	@BookingId varchar(20) , 
	@BookingStatus varchar(50),
	@Vid int,
	@Did int,
	@comment varchar(150) = null
AS
BEGIN	
declare @b varchar(5),@selVid int = null,@m varchar(5)
, @selDid int = null, @newBookId int,@driverNo varchar(20),@dt datetime,@SrcLatitude numeric(18,6)= null 
           ,@SrcLongitude numeric(18,6) = null,@CustomerPhoneNo varchar(20),@oldVid int, @oldDid int 
           ,@count int

set @dt = getdate()	
	
	--if accepted then send otp,driverinfo,vechinfo
	--if Rejected then Assign another vehicle and send vech details
	if Lower(@BookingStatus) = 'accepted'
	begin
	
	Update dbo.PSVehicleBookingHistory
	SET 
	[Status]=@BookingStatus	
	WHERE BookingId = @BookingId and Vid = @Vid
	
	select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
	update PSVehicleBookingDetails	
	SET [BooKingOTP] = @m,BookingStatus=@BookingStatus	
	 where Id = @BookingId 
	
	 
	 select CustomerPhoneNo,Firstname,lastname,Username, UserPhoto as img from PSVehicleBookingDetails 
	 left outer join [Appusers] on [Appusers].Mobilenumber = CustomerPhoneNo where PSVehicleBookingDetails.Id = @BookingId
	 
	 
		end
	else 	
	begin
	
	
       select @oldDid = DriverId, @oldVid = vechid,@b = BNo from PSVehicleBookingDetails
       where Id = @BookingId
	
	 update [PSVehicleBookingDetails] 
        set [BookingStatus] = 'Rejected', Reasons = @comment
        where Id = @BookingId
        
	update [PSVehicleBookingHistory] 
	set [Date] = @dt
	,[Time] = CONVERT(time,@dt)
	,[Status] = 'Rejected'
	,[EXpirationTime] = null
	where BookingId = @BookingId and Vid = @Vid
	
	--SELECT @newBookId = SCOPE_IDENTITY()
             SELECT top 1 @selVid = Vid, @selDid = DId,@driverNo = DriverNo
    FROM dbo.PSCurrentLocationStatus  where VId <> @Vid and Status =19
    order by (ABS(@SrcLatitude) - Latitude),(ABS(@SrcLongitude) - Longitude) 
    
    
    if @selDid is not null and @selVid is not null
    begin
          
        --collect the vehicle and driver infor
        --update the booking infor, change status and
        update [PSVehicleBookingDetails] 
        set [VechId] = @selVid                      
           ,[DriverId] = @selDid
           ,[DriverPhoneNo] = @driverNo
           ,[BookingStatus] = 'To be accepted'
        where Id = @BookingId
        
        --insert the record into vehiclebookinghistory table
	if @@ROWCOUNT > 0
			begin
			
			select @count = COUNT(*) from [PSVehicleBookingHistory]
			where BookingId = @BookingId and Vid = @selVid and Status = 'To be accepted'
			
			if @count = 0
			begin
				 INSERT INTO [dbo].[PSVehicleBookingHistory]
					   ([BookingId],[BNo],[Vid],[Date],[Time],[Status],[EXpirationTime])
				 VALUES
					   (@BookingId,@b,@selVid,@dt,CONVERT(time,@dt),'To be accepted',DATEADD(mi,2,@dt))          
 
      
			end 
          select 1 as status
		end
	end
	end
	 
END


GO
/****** Object:  StoredProcedure [dbo].[PSbookingdetail]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSBookingOTP]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSBookingOTP]
@DriverPhoneNo varchar(20),@BookingOTP varchar(20)
as
begin

declare @cnt int

select @cnt = COUNT(*) from PSVehicleBookingDetails where DriverPhoneNo = @DriverPhoneNo

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from PSVehicleBookingDetails where DriverPhoneNo = @DriverPhoneNo and [BookingOTP] = @BookingOTP
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
   begin
     update PSVehicleBookingDetails set BookingOTP = null where DriverPhoneNo = @DriverPhoneNo and BookingOTP = @BookingOTP
   
      select 1
   end

  end

  end


GO
/****** Object:  StoredProcedure [dbo].[PSChangePwd]    Script Date: 28-09-2018 18:49:44 ******/
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
select @pwd = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Email = @Email and Password=@Password

  if  @pwd =0
 begin
    
					RAISERROR ('Invalid Password',16,1);
					return;										
 end
  else 

begin  
      update Appusers set Password = @NewPassword where Mobilenumber = @Mobilenumber and Email = @Email  
      end
     select [Username] ,[Email] ,[Mobilenumber]  from Appusers where Mobilenumber = @Mobilenumber and Email = @Email
  

end


GO
/****** Object:  StoredProcedure [dbo].[PSdocuments]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSdrivers]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSDriversChangePwd]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversChangePwd]
@Password varchar(50),@Email varchar(50), @Mobilenumber varchar(15),@NewPassword varchar(50)
as
begin

declare @pwd int

select @pwd = COUNT(*) from PSDriverMaster where PMobNo = @Mobilenumber and Email = @Email 

if @pwd = 0
begin
  
				RAISERROR ('Mobile number or email address is not Registered',16,1);
				return;
end
select @pwd = COUNT(*) from PSDriverMaster where Password = @Password and PMobNo = @Mobilenumber

  if @pwd = 0
	begin
	  
					RAISERROR ('Invalid Password',16,1);
					return;
	end
  else 

begin  
      update PSDriverMaster set Password = @NewPassword where PMobNo = @Mobilenumber and Email = @Email  
     
  end
  select [NAme] ,[Email] ,[PMobNo]   from PSDriverMaster where PMobNo = @Mobilenumber and Email = @Email

end


GO
/****** Object:  StoredProcedure [dbo].[PSDriversEOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversEOTPverification]
@Email varchar(50),@Emailotp varchar(10),@mobileno varchar(20)
as
begin

declare @cnt int

select @cnt = COUNT(*) from PSDriverMaster where Email = @Email and PMobNo = @mobileno

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Email address or mobile number',16,1);
				return;
   end

else

begin

  if @Emailotp = '-1'
  begin
     
     update PSDriverMaster 
     set [Emailotp] = null
     where Email = @Email  and PMobNo = @mobileno
     
  end
  else
  begin
  select @cnt = COUNT(*) from PSDriverMaster where Email = @Email and [Emailotp] = @Emailotp and PMobNo = @mobileno
  if @cnt = 0
	begin
					RAISERROR ('Invalid Email address or Email OTP',16,1);
					return;
end
  else
   begin
     update PSDriverMaster set Emailotp  = null,[IsPEmailVerified] = 1 where Email  = @Email  and [Emailotp]  = @Emailotp and PMobNo = @mobileno
   
     --select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts] 
     -- from Appusers where Email  = @Email and Mobilenumber = @mobileno
      select 1
   end
end
end

end


GO
/****** Object:  StoredProcedure [dbo].[PSDriversForgotPassword]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSDriversForgotPassword]
@Email varchar(50), @mobileno varchar(15)
as
begin

declare @cnt int,@p varchar(10)
select @p = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5

  select @cnt = COUNT(*) from PSDriverMaster where PMobNo = @mobileno and Email = @Email 
 if @cnt = 0
	begin
	            RAISERROR ('Invalid mobile number or email address',16,1);
				return;	
	end
	else
	begin
      update PSDriverMaster 
      set 
      [Passwordotp]  = @p
      where PMobNo = @mobileno and Email = @Email 
      end 
     select [Passwordotp]  from PSDriverMaster where PMobNo = @mobileno and Email = @Email
  end


GO
/****** Object:  StoredProcedure [dbo].[PSDriversInsUpdDelEOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSDriversInsUpdDelMOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSDriversInsUpdDelPasswordverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSDriversMOTPverifying]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversMOTPverifying]
@Mobilenumber varchar(20),@Mobileotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from [PSDriverMaster] where PMobNo = @Mobilenumber

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from [PSDriverMaster] where PMobNo = @Mobilenumber and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update [PSDriverMaster] set Mobileotp = null
     ,CurrentStateId = case 
      when Photo is null then 3 
      else 4 end
     where PMobNo = @Mobilenumber and [Mobileotp] = @Mobileotp
     --select [Mobilenumber],[Username],[StatusId] from Appusers where Mobilenumber = @Mobilenumber
     select 1
  end
 
end

end
/****** Object:  StoredProcedure [dbo].[PSDriversPasswordreset]    Script Date: 07/27/2017 16:59:59 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[PSDriversPasswordreset]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSDriversPasswordverification]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversPasswordverification]
@Password varchar(50),@Passwordotp varchar(10),@Email varchar(50), @mobileno varchar(15)
as
begin

declare @otp varchar(10) = null

select @otp = @Passwordotp from PSDriverMaster where PMobNo = @mobileno and Email = @Email 

if @otp is null
begin
  
				RAISERROR ('Invalid mobile number or email address',16,1);
				return;
end
else
begin

  select @otp = COUNT(*) from PSDriverMaster where PMobNo = @mobileno and Passwordotp = @Passwordotp
  if @otp = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
      update PSDriverMaster set Passwordotp  = null,Password = @Password where PMobNo = @mobileno and Email = @Email  
     select [NAme] ,[Email] ,[PMobNo]   from PSDriverMaster where PMobNo = @mobileno and Email = @Email
  end
 
end
end


GO
/****** Object:  StoredProcedure [dbo].[PSDriversRetrivePassword]    Script Date: 28-09-2018 18:49:44 ******/
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
        
    select a.PMobNo,a.Email from PSDriverMaster a
    where upper(a.Passwordotp) = upper(Passwordotp)
    
    
END


GO
/****** Object:  StoredProcedure [dbo].[PSDriversValidateCredentials]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSDriversValidateCredentials]
@Mobilenumber varchar(20),@Password varchar(50)
as
begin

declare @cnt int

select @cnt = COUNT(*) from [PSDriverMaster] where PMobNo = @Mobilenumber

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Mobilenumber',16,1);
				return;
   end
   
select @cnt = COUNT(*) from [PSDriverMaster] where Password = @Password

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Password or mobile number',16,1);
				return;
   end
else

begin

  select @cnt = COUNT(*) from [PSDriverMaster] where PMobNo = @Mobilenumber and Password = @Password 
  if @cnt = 1
	begin
	
	select
	[DId]
      ,[name]
      ,[Email]
      ,[PMobNo]          
      ,[Status]     
      ,[Firstname]
      ,[lastname]
      ,[AuthTypeId]
      from [PSDriverMaster] where PMobNo = @Mobilenumber and Password = @Password   		
	
	end
 
end

end


GO
/****** Object:  StoredProcedure [dbo].[PSEndTrip]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSEndTrip]
@BNo varchar(20),@DriverPhoneNo varchar(20)
as
begin
update dbo.PSVehicleBookingDetails
set [BookingStatus] = 'Trip Completed'
where BNo = @BNo

update PSVehicleBookingHistory
     set Status = 'Trip Completed'
     where BNo = @BNo

select [BNo],[BookingStatus],[DriverPhoneNo],[Pricing] +'30' as Amount ,[PaymentTypeId]  from PSVehicleBookingDetails where BNo = @BNo
end


GO
/****** Object:  StoredProcedure [dbo].[PSEOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSEOTPverification]
@Email varchar(50),@Emailotp varchar(10),@UserId int
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Email = @Email and Id = @UserId

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Email address or mobile number',16,1);
				return;
   end

else

begin

  select @cnt = COUNT(*) from Appusers where Email = @Email and [Emailotp] = @Emailotp and Id = @UserId
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid Email address or Email OTP',16,1);
					return;
	end
 
  else
 
   begin
     update Appusers set Emailotp  = null where Email  = @Email  and [Emailotp]  = @Emailotp and Id = @UserId
   
     select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts] 
      from Appusers where Email  = @Email and Id = @UserId
      --select 1
   end
 
end

end


GO
/****** Object:  StoredProcedure [dbo].[PSGetAddBalance]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetAddBalance]
@Mobilenumber varchar(20) 
as
 begin 
SELECT [Amount]
  FROM [dbo].[Appusers]
where Mobilenumber = @Mobilenumber


end


GO
/****** Object:  StoredProcedure [dbo].[PsGetAlerts]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PsGetAlerts]
@roleid int,
 @userid int= null, 
 @fromdate datetime= null, 
 @todate datetime= null, 
 @statusid int= null, 
 @categoryid int= null, 
 @subcategoryid int= null
as 
begin
SELECT [Id]
      ,[RoleId]
      ,[UserId]
      ,[Title]
      ,[Message]
      ,[CreatedOn]
      ,[UpdatedOn]
      ,[UpdatedBy]
      ,[StateId]
      ,[StatusId]
      ,[CategoryId]
      ,[SubCategoryId]
      ,[Active]
  FROM [dbo].[Alerts]
 
 where ([RoleId]=@roleid or[RoleId]  is null)  
 and (UserId=@userid or UserId  is null) 
 and ((CreatedOn>=@fromdate and CreatedOn<=@todate) or CreatedOn  is null) 
 and (StatusId=@statusid or StatusId  is null)
 and (categoryid=@categoryid or categoryid  is null)
 and (SubCategoryId=@subcategoryid or SubCategoryId  is null )
                    
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetAllAppUsers]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PSGetAllAppUsers]
as
begin
SELECT a.[Id]
      ,[Username]
      ,[Email]
      ,[Mobilenumber]
      ,[Password]
      ,[Mobileotp]
      ,[Emailotp]
      ,[Passwordotp]
      ,tt.Name as [Status]
      ,[CreatedOn]
      ,[Mobileotpsenton]
      ,[emailotpsenton]
      ,[noofattempts]
      ,[Firstname]
      ,[lastname]
      ,[AuthTypeId]
      ,[AltPhonenumber]
      ,[Altemail]
      ,[AccountNo]
      ,[Amount]
    ,t.Name as [Gender] 
      ,[UserPhoto]
      
  FROM [dbo].[Appusers] a
 left outer join Types t on t.Id = a.Gender
 left outer join Types tt on tt.Id = a.StatusId
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetalltickets]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetAllUserTickets]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetAppUserdetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PSGetAppUserdetails]
@id int 
as 
begin 
SELECT a.[Id]
      ,[Username]
      ,[Email]
      ,[Mobilenumber]
      ,[Password]
      ,[Mobileotp]
      ,[Emailotp]
      ,[Passwordotp]
      ,[StatusId]
      ,[CreatedOn]
      ,[Mobileotpsenton]
      ,[emailotpsenton]
      ,[noofattempts]
      ,[Firstname]
      ,[lastname]
      ,[AuthTypeId]
      ,[AltPhonenumber]
      ,[Altemail]
      ,[AccountNo]
      ,[Amount]
      ,[UserPhoto]
      ,t.Name as [Gender]
  FROM [dbo].[Appusers] a 
  left outer join Types t on t.Id = a.Gender
  
   where a.Id=@id
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetAssigndetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetAssigndetails]
@VechID int 
as
begin

SELECT v.[Id]
      ,c.Name as [CompanyId]
      ,[EntryDate]
      ,[BookingNo]
      ,[ReqDate]
      ,[ReqTime]
      ,[CallTime]
      ,[CustomerName]
      ,[CusID]
      ,[PhoneNo]
      ,[AltPhoneNo]
      ,v.[Address]
      ,[PickupAddress]
      ,[LandMark]
      ,[PickupPlace]
      ,[DropPlace]
      ,[Package]
      ,t.Name as [VehicleType]
      ,[NoofVehicle]
      ,[VechID]
      ,[RegistrationNo]
      ,[DriverName]
      ,[PresentDriverLandMark]
      ,[ExecutiveName]
      ,[EffectiveDate]
      ,[EffectiveTill]
      ,[DriverId]
      ,tt.Name as [VehicleModelId]
      ,vt.Name as [ServiceTypeId]
      ,vv.Name as [VehicleGroupId]
      ,[Status]
  FROM [dbo].[PSVehicleAssign] v
  inner join Types t on t.Id = v.VehicleType
  inner join Types tt on tt.Id = v.VehicleModelId
  inner join Types vt on vt.Id = v.ServiceTypeId
  inner join Types vv on vv.Id = v.VehicleGroupId
  inner join Company c on c.Id = v.CompanyId
  where VechID = @VechID 
  end


GO
/****** Object:  StoredProcedure [dbo].[PSGetAvailableServices]    Script Date: 28-09-2018 18:49:44 ******/
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
inner join PSVehicleMaster fd on fd.id = fofare.VehicleId
inner join Company c on c.Id = fd.CompanyId
where FromStopId = @srcId and ToStopId = @destId

   
	
END



GO
/****** Object:  StoredProcedure [dbo].[PSGetBookedHistory]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetBookingHistory]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetbookingStatus]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetbookingStatus]
@BNo varchar(50), @requestType int = 0
as
begin
if @requestType = 0
begin
	select b.BooKingOTP,d.Name,d.PMobNo,d.Photo as img,v.Id, v.RegistrationNo,V.Photo VPhoto,'Indica' as VModel
	 from PSVehicleBookingDetails b
	inner join PSDriverMaster d on d.DId = b.DriverId
	inner join PSVehicleMaster v on v.Id = b.VechId
	--inner join Types t on t.Id = v.VehicleGroupId
	where BNo = @BNo and BookingStatus = 'accepted'
end

end


GO
/****** Object:  StoredProcedure [dbo].[PSgetcountry]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetcurrency]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetCurrentBalance]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetCurrentBalance]
@Mobilenumber varchar(20) 
as
 begin 
SELECT [Amount]
  FROM [dbo].[Appusers]
where Mobilenumber = @Mobilenumber


end


GO
/****** Object:  StoredProcedure [dbo].[PSGetCurrentDriverStatus]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSGetCurrentDriverStatus] 
	(@DId int)
AS
BEGIN	
	--response	meaning	action to be taken in app
	--1	Mobile OTP pending	take to Email OTP verification screen
	--2	Email OTP Pending	take to Mobile OTP verification screen
	--3	User Photo pending	take to driver profile page
	--4	User Docs pending	take to driver profile page
	--5	Vehicle photo pending	take to vehicle profile page
	--6	vehice docs pending	take to vehicle profile page
	--7	Pending verification	take to driver profile page
	--8	Approved 	take to home page
	--9	Online	take to home page
	--10	Offline	take to home page
	--11	On Trip	take to current trips page
	--12	Blocked	take to login page 
	--13	In Active	take to login page 
	--14	Payment pending	take to payments page
	--15	Payment overdue	take to payments page
	--16	Rejected	take to login page 
	--17	Alert 	take to alerts page
	--18	notification	take to notification page
	--20    account locked 

	select
	case when Email IS null then 2 
	when Photo IS null then 3 
	else CurrentStateId end as CurrentState
	 from dbo.PSDriverMaster where DId = @DId	
	
END


GO
/****** Object:  StoredProcedure [dbo].[PSgetdetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetDistanceBasePricing]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[PSGetDistanceBasePricing]
@ctryId int,@vgId int
as
begin
select D.[Id],
VehicleGroupId,
VehicleTypeId,
PricingType,
vv.[Name] as VehicleType,
vm.[Name] as VehicleGroup ,
CountryId    
      ,FromKm
      ,ToKm,t.Name  as price,FromDate,ToDate,Amount,PerUnitPrice from PSDistancePricing D
      inner join Types vm on vm.Id=D.VehicleGroupId
      inner join Types vv on vv.Id=D.VehicleTypeId
      inner join Types t on t.Id = D.PricingType
      where CountryId = @ctryId and VehicleGroupId = @vgId
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetDownloadCount]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetdriver]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetDriverApproval]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PSGetDriverApproval]
@MobileNumber varchar(20)
As
Begin
Select 
[PMobNo]
,[IsApproved]
From [dbo].[PSDriverMaster]
where PMobNo = @MobileNumber
End


GO
/****** Object:  StoredProcedure [dbo].[PSgetDriverDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetDriverDetails]
@DID int 
as
begin
declare @cid int, @vgrpid int

select @cid = [CountryId],@vgrpid = VehicleGroupId from [dbo].[PSDriverMaster] m
where m.DId=@DID

SELECT [DId]
      ,Firstname + ' ' + Lastname as NAme
      ,[Address]
      ,[City]
      ,[Pin]
      ,[PAddress]
      ,[PCity]
      ,[PPin]
      ,[OffMobileNo]
      ,[PMobNo]
      ,[DOB]
      ,[DOJ]
      ,[BloodGroup]     
      ,[Remarks]
      ,[CountryId]
	  ,[Photo]
	  ,[VehicleGroupId]
  FROM [dbo].[PSDriverMaster] m
where m.DId=@DID


SELECT adoc.[Id]
      ,[DriverId]
      ,[FileName] docName      
      ,[DocTypeId] 
      ,[ExpiryDate] expiryDate
      ,[CreatedById]
      ,[UpdatedById]
      ,[DueDate]     dueDate      
     ,t.Name docType  
     ,(select m.IsMandatory  from MandatoryUserDocuments m where adoc.DocTypeId = m.DocTypeId  
  and m.CountryId = @cid and m.UserTypeId = 109 and Vehiclegroupid = @vgrpid) IsMandatory
     ,case when filecontent is null then 0 else 1 end as IsUploaded 
     , DATEDIFF(DAY, GETDATE(),ExpiryDate) daysLeft
           
       ,case when GETDATE() > ExpiryDate  then 1 
      when (DATEDIFF(DAY, GETDATE(),ExpiryDate)  < 90) then 2
       else 0 end as IsExpired
      ,case when  dueDate < GETDATE()  then 1 else 0 end as PastDue 
      ,[DocumentNo]
           ,[DocumentNo2]
           ,[IsVerified]      
           ,[IsApproved]   
  FROM [dbo].[DriverDocuments] adoc  
  left outer join Types t on t.Id = DocTypeId
  where [DriverId] = @DID 
  
select m.DocTypeId, t.Name,m.IsMandatory from MandatoryUserDocuments m
inner join Types t on t.Id = m.DocTypeId 
left outer join DriverDocuments dd on (dd.DocTypeId = m.DocTypeId and dd.DriverId = @DID and dd.FileContent is null)
where  
UserTypeId = 109
and VehicleGroupId = @vgrpid and CountryId = @cid
and IsMandatory = 1  
  
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetDriverlocation]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PSGetDriverlocation]
@ctryId int
as
begin
SELECT 
--c.[Id]
      [VId]
      ,c.[DId]
      ,[Latitude]
      ,[Longitude]
      --,[Date]
      --,[Time]
      --,c.[Status]
      ,[DriverNo]
      ,d.[NAme]
      ,t.Name as VehicleGroupId
       --,t.Name as [VehicleModelId]   
  FROM [dbo].[PSCurrentLocationStatus] c
  Left outer join PSDriverMaster d on d.DId = c.DId
  inner join Types t on t.Id = d.VehicleGroupId
  
  where d.CountryId = @ctryId
  --inner join Types t on t.Id = d.VehicleModelId 
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetDriverLogin]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PSGetDriverLogin]
@DId int
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
  FROM [dbo].[PSDriverLogin]
  
  where DId = @DId
  end


GO
/****** Object:  StoredProcedure [dbo].[PSgetdrivermaster]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetdrivermaster]
@DId int
as
begin
SELECT distinct [DId]
      ,d.FirstName + ' ' + d.LastName as NAme
      ,d.[Address]
      ,[City]
      ,[Pin]
      ,[PAddress]
      ,[PCity]
      ,[PPin]
      ,[OffMobileNo]
      ,[PMobNo]
      ,[DOB]
      ,[DOJ]
      ,[BloodGroup]
      ,[Remarks]
      ,d.[CompanyId]              
     -- ,pv.RegistrationNo
     -- ,p.[BookingStatus] 
      ,d.DriverCode
      ,d.photo
  FROM [dbo].[PSDriverMaster] d
--left outer join PSVehicleAssign pv on pv.PhoneNo = d.PMobNo
--left outer join PSVehicleBookingDetails p on p.DriverPhoneNo = d.PMobNo   

where DId = @DId
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetDriverProfile]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetDriverProfile]
@DId int 
as
begin
SELECT [DId]
      ,d.[NAme]
      ,d.[Address]
      ,[City]
      ,[Pin]
      ,[PAddress]
      ,[PCity]
      ,[PPin]
      ,[OffMobileNo]
      ,[PMobNo]
      ,[DOB]
      ,[DOJ]
      ,c.Name as [CompanyId]      
      ,[Photo]
      ,p.[TripCount]
      ,p.[Amount]
      
  FROM [dbo].[PSDriverMaster] d
inner join PSVehicleBookingDetails p on p.DriverId=d.DId
inner join Company c on c.Id = d.CompanyId
where DId=@DId
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetfaqs]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetFileContent]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE procedure [dbo].[PSGetFileContent] 
@FileId int,
@Category int 
as
begin
if(@Category='1')
begin
SELECT [Id]
      ,[DriverId]
      ,[FileName]
      ,[DocTypeId]
      ,[ExpiryDate]
      ,[CreatedById]
      ,[UpdatedById]
      ,[DueDate]
      ,[FileContent]
  FROM [dbo].[DriverDocuments] where Id = @FileId
	
end
else 
if(@Category='2')
begin
	SELECT [Id]
      ,[VehicleId]
      ,[FileName]
      ,[DocTypeId]
      ,[ExpiryDate]
      ,[CreatedById]
      ,[UpdatedById]
      ,[DueDate]
      ,[FileContent]
  FROM [dbo].[VehicleDocuments] where Id = @FileId
 
  end
  if @@ROWCOUNT=0
		RAISERROR('Invalid  Document ID, no document exists',16,1);
  end


GO
/****** Object:  StoredProcedure [dbo].[PSGetFileContent_]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetFileContent_]
 @fileid INT 
as
begin
 
select * from Attachments where id = @fileid end


GO
/****** Object:  StoredProcedure [dbo].[PSGetfiledetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgethelp]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetHistory]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetHourBasePricing]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[PSGetHourBasePricing]
@ctryId int ,@vgId int
as
begin
select H.[Id],
vv.[Name] as VehicleType,
vm.[Name] as VehicleGroup 
,VehicleGroupId 
,VehicleTypeId 
,PricingType as PricingTypeId
,CountryId  
      ,FromTime
      ,ToTime,[Hours],t.Name as PricingType,FromDate,ToDate,Price from PSHoursBasePricing H
      inner join Types vm on vm.Id=H.VehicleGroupId
      inner join Types vv on vv.Id=H.VehicleTypeId
      inner join Types t on t.Id = H.PricingType
      where CountryId = @ctryId and VehicleGroupId = @vgId
end


GO
/****** Object:  StoredProcedure [dbo].[PSgetlogin]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetnearestvehicles]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PsGetNotifications]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PsGetNotifications]
@roleid int,
 @userid int= null, 
 @fromdate datetime= null, 
 @todate datetime= null, 
 @statusid int= null, 
 @categoryid int= null, 
 @subcategoryid int= null
as 
begin
SELECT [Id]
      ,[RoleId]
      ,[UserId]
      ,[Title]
      ,[Message]
      ,[CreatedOn]
      ,[UpdatedOn]
      ,[UpdatedBy]
      ,[StateId]
      ,[StatusId]
      ,[CategoryId]
      ,[SubCategoryId]
      ,[Active]
  FROM [POSDashboard].[dbo].Notifications
 
 where ([RoleId]=@roleid or[RoleId]  is null)  
 and (UserId=@userid or UserId  is null) 
 and ((CreatedOn>=@fromdate and CreatedOn<=@todate) or CreatedOn  is null) 
 and (StatusId=@statusid or StatusId  is null)
 and (categoryid=@categoryid or categoryid  is null)
 and (SubCategoryId=@subcategoryid or SubCategoryId  is null )
                    
end


GO
/****** Object:  StoredProcedure [dbo].[PSgetpalce]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetPaymentdetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetPaymentdetails]
as
begin
SELECT p.[Id]
      ,[PaymentId]
      ,t.Name as [CardCategory] 
      ,[Transactiondate]
      ,[TransactionTime]
      ,tt.Name as [Status]
      ,[GatewayId]
      ,[TransactionType]
  FROM [dbo].[PaymentDetails] p
  
  inner join Types t on t.Id = p.CardCategoryId 
  inner join Types tt on tt.Id = p.StatusId
  
end


GO
/****** Object:  StoredProcedure [dbo].[PSgetPaymentModes]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSgetPaymentModes]
as
begin
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Active]
      ,[TypeGroupId]
      ,[listkey]
      ,[listvalue]
  FROM [POSDashboard].[dbo].[Types]
  where TypeGroupId=16



end


GO
/****** Object:  StoredProcedure [dbo].[PSGetPayments]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetPayments]
as
begin
SELECT p.[Id]
      ,t.Name as [CardCategory] 
      ,[PaymentDate]
      ,[PaymentTime]
      ,tt.Name as [Status]
      ,[Amount]
  FROM [dbo].[Payment] p 
  inner join Types t on t.Id = p.CardCategoryId 
  inner join Types tt on tt.Id = p.StatusId 
  
end


GO
/****** Object:  StoredProcedure [dbo].[PSgetpaysmart]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetPendingDocs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetPendingDocs]
(@userId int)
as
begin

declare @usertypeid int, @vgId int, @countryId int,@cnt int = 0, @vid int = null,@dt date
set @dt = getdate()

select @cnt=1,@usertypeid = 109, @vgId = VehicleGroupId, @countryId = CountryId from PSDriverMaster where DID = @userId

if @cnt = 0
begin
RAISERROR ('Invalid user id',16,1);
return;
end

select m.DocTypeId, t.Name,m.IsMandatory from MandatoryUserDocuments m
inner join Types t on t.Id = m.DocTypeId 
left outer join DriverDocuments dd on (dd.DocTypeId = m.DocTypeId)
where  
UserTypeId = @usertypeid
and VehicleGroupId = @vgId and CountryId = @countryId
and IsMandatory = 1
and dd.DriverId = @userId and (dd.FileContent is null or dd.IsApproved = 0)
 
select @vid = VechID from PSVehicleAssign where DriverId = @userId and @dt >= EffectiveDate and (@dt <= EffectiveTill or EffectiveTill is null)

select m.DocTypeId, t.Name from MandatoryVehicleDocs m
inner join Types t on t.Id = DocTypeId 
left outer join VehicleDocuments dd on (dd.DocTypeId = m.DocTypeId  )
where 
 VehicleGroupId = @vgId and CountryId = @countryId
and IsMandatory = 1
and dd.VehicleId = @vid
and (dd.FileContent is null or dd.IsApproved = 0)

end

/****** Object:  StoredProcedure [dbo].[PSGetCurrentDriverStatus]    Script Date: 10/11/2017 09:02:52 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[PSGetPendingVehicleDocs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetPendingVehicleDocs]
(@VId int)
as
begin

declare @usertypeid int, @vgId int, @countryId int,@cnt int = 0, @dt date
set @dt = getdate()

select @cnt=1,@vgId = VehicleGroupId, @countryId = CountryId  from PSVehicleMaster 
where Id = @VId

if @cnt = 0
begin
RAISERROR ('Invalid vehicle id',16,1);
return;
end

select m.DocTypeId, t.Name from MandatoryVehicleDocs m
inner join Types t on t.Id = DocTypeId 
left outer join VehicleDocuments dd on (dd.DocTypeId = m.DocTypeId and dd.VehicleId = @vid)
where 
 VehicleGroupId = @vgId and CountryId = @countryId
and IsMandatory = 1
and dd.FileContent is null

end


GO
/****** Object:  StoredProcedure [dbo].[PSgetprice]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetRoutes]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PSgetRoutes]
as
begin
SELECT distinct r.[Id]
      ,[RouteName]
      ,r.[Code]
      ,r.[Description]
      ,r.[Active]
      ,src.name as Source
      ,dest.name as Destination
      ,[SourceId]
      ,[DestinationId]
      ,[Distance]
      ,src.[Latitude] as SrcLatitude
      ,src.Longitude as SrcLongitude
      ,dest.Latitude as DestLatitude
      ,dest.Longitude as DestLongitude
  FROM [dbo].[Routes] r
  inner join stops src on src.id = r.sourceid
  inner join stops dest on dest.id = destinationid
  order by RouteName
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetsp_Availableseats]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetstops]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetTaxiprice]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetTaxiprice]
@SrcId int,@DestId int
as
begin
select   [Id]
      ,[SourceLoc]
      ,[DestinationLoc]
      ,[SourceLat]
      ,[SourceLng]
      ,[DestinationLat]
      ,[DestinationLng]
      ,[VehicleGroupId]
      ,[VehicleTypeId]
      ,[PricingTypeId]
      ,[Distance]
      ,[UnitPrice]
      ,[Amount]
      ,[SrcId]
      ,[DestId] from dbo.VehicleDistancePrice

where SrcId = @SrcId and DestId =@DestId
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetTicketDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetTicketHistory]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGettickets]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetTransferBalance]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetTransferBalance]
@Mobilenumber varchar(20) 
as
 begin 
SELECT [Amount]
  FROM [dbo].[Appusers]
where Mobilenumber = @Mobilenumber


end


GO
/****** Object:  StoredProcedure [dbo].[PSGetTrasferBalance]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PSGetTrasferBalance]
@Mobilenumber varchar(20) 
as
 begin 
SELECT [Amount]
  FROM [dbo].[Appusers]



end


GO
/****** Object:  StoredProcedure [dbo].[PSGetTripCost]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetTripCost]
@distance decimal,@packageId int
as
begin
declare @amt decimal,@dt date, @countryid int, @vehiclegroupid int, @vehicletypeid int, @vid int
set @dt = GETDATE()

select @vid = VechId,@distance = 9 from PSVehicleBookingDetails 

select @countryid = CountryId, @vehiclegroupid = VehicleGroupId, @vehicletypeid = VehicleTypeId from PSVehicleMaster where Id = @vid

select @amt = amount from [dbo].[PSDistancePricing]
where @distance >= FromKm and @distance <=ToKm
and @dt <= ToDate and @dt>=FromDate
and CountryId = @countryid and @vehiclegroupid = VehicleGroupId
and @vehicletypeid = VehicleTypeId

if @amt is not null 
select @amt
else
begin
if @packageId = 1 
select 100 as Price
if @packageId = 2 
select 200 as Price
if @packageId = 3 
select 300 as Price
if @packageId = 4 
select 400 as Price
if @packageId = 5 
select 500 as Price
if @packageId = 6
select 600 as Price
end
end

/****** Object:  StoredProcedure [dbo].[GetActivityLog]    Script Date: 02/05/2018 14:42:54 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[PSGetTripPayments]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetTripPayments]
@id int
as
begin
SELECT t.[Id]
      ,[BNo]
      ,[Amount]
      ,[GatewayTransId]
      ,si.Name as[Status]
      ,[TransDate]
      ,tt.Name as [PaymentMode]
      ,[Comments]
      ,[CustAccountId]
      ,[AppUserId]
  FROM [dbo].[TripPayments] t
inner join Types si on si.Id=t.StatusId
inner join Types tt on tt.Id=t.PaymentModeId
end


GO
/****** Object:  StoredProcedure [dbo].[PSgettypes]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetusercards]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetUserinfo]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetUserpreferences]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetusertickets]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSGetVechicleBookingDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetVechicleBookingDetails]
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
    
      ,[Amount]
      ,[PaymentStatus]
      ,[Rating]
      ,[RatedBy]
      ,[Comments]
      ,[UpdatedBy]
      ,[UpdatedUserId]
      ,[DriverRating]
      ,[DriverRated]
      ,[DriverComments]
  FROM [dbo].[PSVehicleBookingDetails]




end


GO
/****** Object:  StoredProcedure [dbo].[PSGetVechlogin]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetVechlogin]
@VId int
as
begin
SELECT [LoginDate]
      ,[LoginTime]
      ,[Reason]
      ,[Status]
      ,[LoginLatitude]
      ,[LoginLongitude]
      ,[DriverNo]
  FROM [dbo].[PSDriverLogin]

end


GO
/****** Object:  StoredProcedure [dbo].[PSGetVechlogout]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSGetVechlogout]
@VechId int
as
begin
SELECT [LogoutDate]
      ,[LogoutTime]
      ,[Reason]
      ,[Status]
      ,[LogoutLatitude]
      ,[LogoutLongitude]
      ,[DriverNo]
  FROM [dbo].[PSDriverLogin]
      
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetVehicleApproval]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PSGetVehicleApproval]
@RegistrationNo varchar(20)
As
Begin
Select 
[RegistrationNo]
,[IsApproved]
From [dbo].[PSVehicleMaster]
where RegistrationNo = @RegistrationNo
End


GO
/****** Object:  StoredProcedure [dbo].[PSgetvehicleDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetvehicleDetails]
@VID int
as
begin
declare  @vgrpid int, @cid int
select @vgrpid = VehicleGroupId, @cid = CountryId from PSVehicleMaster where Id = @VID

SELECT V.[Id]
      ,[VID]
      ,V.[CompanyId]
      ,[RegistrationNo]
      ,[ChasisNo]
      ,[Engineno]
      ,[FleetOwnerId]
      ,[VehicleTypeId]
      ,[ModelYear]
      ,[EntryDate]
      ,V.[VehicleModelId]
      ,[HasAC]
      ,V.[VehicleGroupId]
      ,V.[StatusId]
      ,V.[IsVerified]
      ,V.[IsApproved] 
      ,[VehicleCode]
      ,[IsDriverOwned]
      ,[DriverId]
      ,V.[CountryId]
      ,vt.Name VehicleType
      ,vmo.Name VehicleModel
      ,vg.Name VehicleGroup
      ,s.Name [Status]
      ,vm.Name VehicleMake
      ,V.[Photo]
	  ,[FrontImage] 
      ,[BackImage] 
      ,[RightImage] 
      ,[LeftImage] 
      ,u.[ContactNo1]
      ,d.NAme 
  FROM [dbo].[PSVehicleMaster] V
   left outer join Types vt on vt.Id = [VehicleTypeId]
   left outer join Types vmo on vmo.Id = [VehicleModelId]   
   left outer join Types vm on vm.Id = [VehicleMakeId] 
   left outer join Types vg on vg.Id = [VehicleGroupId]
   left outer join Types s on s.Id = [StatusId] 
   left outer join Users u on u.Id  =  V.FleetOwnerId
   left outer join PSDriverMaster d on d.DId = V.DriverId
where V.Id= @VID
  

SELECT adoc.[Id]
      ,[VehicleId]
      ,[FileName] docName
      ,[DocTypeId]
      ,adoc.[ExpiryDate] as expiryDate
      ,[CreatedById]
      ,[UpdatedById]
      ,adoc.[DueDate] as dueDate        
     ,t.Name docType  
     , DATEDIFF(DAY, GETDATE(),ExpiryDate)
           
       ,case when GETDATE() > ExpiryDate  then 1 
      when (DATEDIFF(DAY, GETDATE(),ExpiryDate)  < 90) then 2
       else 0 end as IsExpired
      ,case when  dueDate < GETDATE()  then 1 else 0 end as PastDue 
      ,[DocumentNo]
           ,[DocumentNo2]
           ,[IsVerified]
           ,[IsApproved]
           ,case when FileContent is null then 0 else 1 end uploaded    
  FROM [dbo].[VehicleDocuments] adoc  
  left outer join Types t on t.Id = DocTypeId
  where [VehicleId] = @VID  
  
  
  select m.DocTypeId Id, t.Name,m.IsMandatory,dd.DocumentNo,case when dd.FileContent IS null then 0 else 1 end as uploaded
  from MandatoryVehicleDocs m
inner join Types t on t.Id = m.DocTypeId 
left outer join VehicleDocuments dd on dd.DocTypeId = t.Id and dd.VehicleId = @VID
where VehicleGroupId = @vgrpid and CountryId = @cid 
 
SELECT 
       u.FirstName as Username     
      ,[FleetOwnerCode]
      ,[IsEmailVerified]
      ,[CreatedOn] 
      ,u.ContactNo1  
      ,u.Address   
  FROM [dbo].[FleetOwner] f 
  left outer join Users u on u.Id = f.UserId
 
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetVehicleList]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSGetVehicleList]
@ctryId int=-1,@fleetId int=-1,@vgId int=-1
as
begin
SELECT V.[Id]
      ,[VID]
      ,V.[CompanyId]
      ,[RegistrationNo]
      ,[ChasisNo]
      ,[Engineno]
      ,f.[FleetOwnerCode] as fleetowner 
      ,[VehicleTypeId]
      ,[ModelYear]
      ,[EntryDate]
      ,[VehicleModelId]
      ,[HasAC]
      ,[VehicleGroupId]
      ,[StatusId]
      ,[IsVerified]
      ,[VehicleCode]
      ,[IsDriverOwned]
      ,[DriverId]
      ,V.[CountryId]
      ,vt.Name VehicleType
      --,vmo.Name VehicleModel
      ,vg.Name VehicleGroup
      ,s.Name Status
	  ,V.[Photo]
	 ,u.FirstName
	 ,u.ContactNo1
	 ,u.EmailId
  FROM [dbo].[PSVehicleMaster] V
   left outer join Types vt on vt.Id = [VehicleTypeId]
   left outer join Types vmo on vmo.Id = [VehicleModelId]   
   left outer join Types vg on vg.Id = [VehicleGroupId]
   left outer join Types s on s.Id = [StatusId] 
   left outer join FleetOwner f on f.Id = V.FleetOwnerId
   left outer join Users u on u.CountryId = V.CountryId
 where (V.CountryId = @ctryId or @ctryId = -1) and (FleetOwnerId = @fleetId or @fleetId = -1) and (VehicleGroupId = @vgId or @vgId = -1)
 

       
end


GO
/****** Object:  StoredProcedure [dbo].[PSGetVehicleListPaging]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[PSGetVehicleListPaging]
@ctryId int=-1,@fleetId int=-1,@vgId int=-1,
@curpage int=-1,
@maxrows int=-1
as

begin
DECLARE @FirstRec int, @LastRec int,@totalpages int, @totalrec int,@totalrows int

SELECT @FirstRec = (@curpage - 1) * @maxrows
SELECT @LastRec = (@curpage * @maxrows + 1);

WITH TempResult as
(SELECT ROW_NUMBER() OVER(ORDER BY V.[Id] asc) as RowNum
      ,[VID]
      ,V.[CompanyId]
      ,[RegistrationNo]
      ,[ChasisNo]
      ,[Engineno]
      ,f.[FleetOwnerCode] as fleetowner 
      ,[VehicleTypeId]
      ,[ModelYear]
      ,[EntryDate]
      ,[VehicleModelId]
      ,[HasAC]
      ,[VehicleGroupId]
      ,[StatusId]
      ,[IsVerified]
      ,[VehicleCode]
      ,[IsDriverOwned]
      ,[DriverId]
      ,V.[CountryId]
      ,vt.Name VehicleType
      --,vmo.Name VehicleModel
      ,vg.Name VehicleGroup
      ,s.Name Status
	  ,V.[Photo]
	 ,u.FirstName
	 ,u.ContactNo1
	 ,u.EmailId
  FROM [dbo].[PSVehicleMaster] V
   left outer join Types vt on vt.Id = [VehicleTypeId]
   left outer join Types vmo on vmo.Id = [VehicleModelId]   
   left outer join Types vg on vg.Id = [VehicleGroupId]
   left outer join Types s on s.Id = [StatusId] 
   left outer join FleetOwner f on f.Id = V.FleetOwnerId
   left outer join Users u on u.CountryId = V.CountryId
 where (V.CountryId = @ctryId or @ctryId = -1) and (FleetOwnerId = @fleetId or @fleetId = -1) and (VehicleGroupId = @vgId or @vgId = -1)) 
 
SELECT top (@LastRec-1) *
FROM TempResult
WHERE RowNum > @FirstRec 
AND RowNum < @LastRec

select @totalrec =  COUNT(*)
from(SELECT ROW_NUMBER() OVER(ORDER BY V.[Id] asc) as RowNum
      ,[VID]
      ,V.[CompanyId]
      ,[RegistrationNo]
      ,[ChasisNo]
      ,[Engineno]
      ,f.[FleetOwnerCode] as fleetowner 
      ,[VehicleTypeId]
      ,[ModelYear]
      ,[EntryDate]
      ,[VehicleModelId]
      ,[HasAC]
      ,[VehicleGroupId]
      ,[StatusId]
      ,[IsVerified]
      ,[VehicleCode]
      ,[IsDriverOwned]
      ,[DriverId]
      ,V.[CountryId]
      ,vt.Name VehicleType
      --,vmo.Name VehicleModel
      ,vg.Name VehicleGroup
      ,s.Name Status
	  ,V.[Photo]
	 ,u.FirstName
	 ,u.ContactNo1
	 ,u.EmailId
  FROM [dbo].[PSVehicleMaster] V
   left outer join Types vt on vt.Id = [VehicleTypeId]
   left outer join Types vmo on vmo.Id = [VehicleModelId]   
   left outer join Types vg on vg.Id = [VehicleGroupId]
   left outer join Types s on s.Id = [StatusId] 
   left outer join FleetOwner f on f.Id = V.FleetOwnerId
   left outer join Users u on u.CountryId = V.CountryId
 where (V.CountryId = @ctryId or @ctryId = -1) and (FleetOwnerId = @fleetId or @fleetId = -1) and (VehicleGroupId = @vgId or @vgId = -1))
 as temp
	if((@totalrec%@maxrows)=0)
	select @totalpages=(@totalrec/@maxrows);
	else 
	select @totalpages=(@totalrec/@maxrows)+1;
	if((@totalrec)=0)
	select @totalrows=(@totalpages/@maxrows)+1;
	select @totalrows=(@maxrows)+1;
	 
	  
select @totalpages as totalpages, @totalrec as recordcount,@totalrows as totalrows  


       
end



GO
/****** Object:  StoredProcedure [dbo].[PSGetVehiclelocation]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PSGetVehiclelocation]
as
begin
SELECT c.[Id]
      ,c.[VId]
      ,c.[DId]
      ,[Latitude]
      ,[Longitude]
      ,[Date]
      ,[Time]
      ,c.[Status]
      ,[DriverNo]
      ,d.[NAme]
      ,t.Name as [VehicleModelId]     
  FROM [dbo].[PSCurrentLocationStatus] c
 Left outer join PSDriverMaster d on d.DId = c.DId
inner join Types t on t.Id = d.VehicleModelId 
end


GO
/****** Object:  StoredProcedure [dbo].[PSgetvehiclemaster]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSgetvehilcedetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetvehilcedetails]
@Vid int 
as
begin
SELECT m.[Id]
      ,[VID]
      ,c.Name as[CompanyId]
      ,[RegistrationNo]
      ,v.Name as[Type] 
      ,[OwnerName]
      ,[ChasisNo]
      ,[Engineno]
      ,[RoadTaxDate]
      ,[InsuranceNo]
      ,[InsDate]
      ,[PolutionNo]
      ,[PolExpDate]
      ,[RCBookNo]
      ,[RCExpDate]
      ,[CompanyVechile]
      ,[OwnerPhoneNo]
      ,[HomeLandmark]
      ,[ModelYear]
      ,[DayOnly]
      ,[VechMobileNo]
      ,[EntryDate]
      ,[NewEntry]
      ,vv.Name as [VehicleModelId]
      ,tt.Name as[ServiceTypeId]
      ,t.Name as[VehicleGroupId]
	  ,[Photo]
  FROM [dbo].[PSVechileMaster] m
inner join Types v on v.Id=m.Type
inner join Types vv on vv.Id=m.VehicleModelId
inner join Types t on t.Id=m.VehicleGroupId
inner join Types tt on tt.Id=m.ServiceTypeId 
inner join Company c on c.Id = m.CompanyId
  where VID = @Vid
end


GO
/****** Object:  StoredProcedure [dbo].[PSgetvehilcetypes]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSgetvehilcetypes]
@VID int = -1
as
begin
SELECT m.[Id]
      ,[VID]
      ,c.Name as [CompanyId]
      ,[RegistrationNo]
      ,v.Name as[Type] 
      ,[OwnerName]
      ,[ChasisNo]
      ,[Engineno]
      ,[RoadTaxDate]
      ,[InsuranceNo]
      ,[InsDate]
      ,[PolutionNo]
      ,[PolExpDate]
      ,[RCBookNo]
      ,[RCExpDate]
      ,[CompanyVechile]
      ,[OwnerPhoneNo]
      ,[HomeLandmark]
      ,[ModelYear]
      ,[DayOnly]
      ,[VechMobileNo]
      ,[EntryDate]
      ,[NewEntry]
      ,vv.Name as [VehicleModelId]
      ,t.Name as [ServiceTypeId]
      ,vt.Name as [VehicleGroupId]
      ,p.[Amount]
      ,p.[BookingStatus]
  FROM [dbo].[PSVechileMaster] m
inner join Types v on v.Id=m.Type
Left outer join PSVehicleBookingDetails p on p.VechId = m.VID
Left outer join Company c on c.Id = m.CompanyId
inner join Types vv on vv.Id=m.VehicleModelId
inner join Types t on t.Id=m.ServiceTypeId
inner join Types vt on vt.Id=m.VehicleGroupId

end


GO
/****** Object:  StoredProcedure [dbo].[PSInsupdAdd]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdallocatedriver]    Script Date: 28-09-2018 18:49:44 ******/
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
,@DriverId int,@VehicleModelId varchar(50) = null,@ServiceTypeId varchar(50) =null,@VehicleGroupId varchar(50)=null,@Status varchar(50)=null
AS
BEGIN
declare @dt datetime,@cnt int,@vtype int,@vm int,@vg int,@st int
set @dt = GETDATE()
select @vtype= t.Id from Types t where upper(t.Name)=UPPER(@VehicleType)
select @vm= t.Id from Types t where upper(t.Name)=UPPER(@VehicleModelId)
select @vg= t.Id from Types t where upper(t.Name)=UPPER(@VehicleGroupId)
select @st= t.Id from Types t where upper(t.Name)=UPPER(@ServiceTypeId)

    if @flag='I'
	begin
	select @cnt = COUNT(*) from PSVehicleAssign where  RegistrationNo = @RegistrationNo and DriverName = @DriverName

	if @cnt > 0
		begin
				RAISERROR ('Vehicle Already Assigned',16,1);
				return;	
		end
	insert into dbo.PSVehicleAssign
	([CompanyId],[EntryDate],[BookingNo],[ReqDate],[ReqTime] ,[CallTime] ,[CustomerName] ,[CusID], [PhoneNo],[AltPhoneNo],[Address],[PickupAddress],[LandMark],[PickupPlace],[DropPlace],[Package],[VehicleType],
	[NoofVehicle],[VechID] ,[RegistrationNo],[DriverName],[PresentDriverLandMark],[ExecutiveName]
	,[EffectiveDate],[EffectiveTill],[DriverId],[VehicleModelId],[ServiceTypeId],[VehicleGroupId],[Status])	
	values
	(@CompanyId, @dt ,@BookingNo ,@dt,@dt ,@dt ,@CustomerName ,@CusID ,@PhoneNo,@AltPhoneNo,@Address,@PickupAddress,@LandMark,@PickupPlace,@DropPlace,@Package,@vtype,@NoofVehicle
	,@VechID,@RegistrationNo,@DriverName,@PresentDriverLandMark,
	@ExecutiveName,@EffectiveDate,@EffectiveTill,@DriverId,@vm,@st,@vg,'Assigned')
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
	[VehicleType] = @vtype,
	[NoofVehicle] = @NoofVehicle,	
	[RegistrationNo] =@RegistrationNo,
	[DriverName] =@DriverName,
	[PresentDriverLandMark] =@PresentDriverLandMark,
	[ExecutiveName] =@ExecutiveName,
	[EffectiveDate] =@EffectiveDate,
	[EffectiveTill] =@EffectiveTill,
	[DriverId] = @DriverId,
	[VehicleModelId] = @VehicleModelId,
	[ServiceTypeId]= @ServiceTypeId,
	[VehicleGroupId]= @VehicleGroupId,
	[Status]=@Status
    where VechID = @VechID
    
    update dbo.PSDriverMaster
    Set [PMobNo] = @PhoneNo
    where DId = @DriverId
    	end
	
	select [CompanyId], [EntryDate] , [PhoneNo],[Address]
	,[Package],[VehicleType],[NoofVehicle]
	,[RegistrationNo],[DriverName],[EffectiveDate],[EffectiveTill],[DriverId],[VehicleModelId],[ServiceTypeId],[VehicleGroupId]
	from PSVehicleAssign where Id =@Id
END


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdAppDrivers]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PSInsUpdAppDrivers]
@flag varchar
,@Mobilenumber varchar(20)
,@Email varchar(50) = null
,@Password varchar(50) = null
,@Firstname varchar(20)
,@lastname varchar(20)
,@AuthTypeId int
,@Id int=-1
,@CountryId int = null
,@bioMetricData varchar(max) = null
,@DPhoto varchar(max) = null
,@VehicleGroupId int = null

,@RegistrationNo VarChar(50) = null
,@VehicleTypeId int = null
,@isDriverOwned int = null
,@VPhoto varchar(max) = null
                    
AS
BEGIN

declare @cnt int, @m varchar(4), @p varchar(4),@e varchar(4),@Did int = null, @Vid int = null
declare @dt datetime
set @dt = GETDATE()

select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))

--otp only when email id is given
	if @Email is not null
select @e = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5

   

	if @flag = 'I'
	begin
	
	select @cnt = COUNT(*) from PSDriverMaster where PMobNo = @Mobilenumber 

	if @cnt > 0
		begin
				RAISERROR ('Already user registered with given mobile number',16,1);
				return;	
		end
		
		if @Email is not null
		begin
		select @cnt = COUNT(*) from PSDriverMaster where Email = @Email
		
		if @cnt > 0
		begin
				RAISERROR ('Already user registered with given Email Address',16,1);
				return;	
		end
		end
		
		if @RegistrationNo is not null
    begin
				select @cnt = COUNT(*) from [PSVehicleMaster] where RegistrationNo = @RegistrationNo 
				if @cnt > 0
				begin
						RAISERROR ('RegistrationNo Already exists',16,1);
						return;	
				end			
	    end
    
	
	insert into dbo.PSDriverMaster 
			([NAme],[Firstname],[lastname] ,[Email],[PMobNo] ,[Password],[AuthTypeId],[CountryId]  ,[Mobileotp] ,[Emailotp],[CreatedOn],[Mobileotpsenton] ,[emailotpsenton],[AccountNo]
			,				[DriverCode],[VehicleGroupId],[StatusId], [Photo],[CurrentStateId])
	values
			(@Firstname+@lastname,@Firstname,@lastname,@Email ,@Mobilenumber ,@Password,@AuthTypeId,@CountryId,@m ,@e ,@dt ,@dt ,@dt,@Mobilenumber,'D'+@Mobilenumber, @VehicleGroupId, 1 ,@DPhoto,1)
			
			 
            --get the inserted driver id
            
            
SELECT @DId = SCOPE_IDENTITY()
declare @mss varchar(100)  = 'a new driver ' +@Mobilenumber+' is created through app'

	 exec [InsUpdDelNotifications]  'I',-1,1,1,'new driver creation',@mss,@dt,@dt,1,1,1,1,1,1 
            if @Did is not null
            begin
	
	--declare @mss varchar(100)  = 'a new driver <a href="DriverDetails.html?DId='+ cast(@DId as varchar(7)) +'">' +@Mobilenumber+'</a> is created through app'
	
           INSERT INTO [dbo].[DriverDocuments]
           ([DriverId]
           ,[FileName]
           ,[DocTypeId]
           )
			 select @Did,t.name,DocTypeId 
			 from [dbo].[MandatoryUserDocuments]
			 inner join types t on t.id = DocTypeId
           where CountryId = @CountryId and UserTypeId = 109 and VehicleGroupId = @VehicleGroupId

           end
            
            if @RegistrationNo is not null
            begin
				select @cnt = COUNT(*) from [PSVehicleMaster] where RegistrationNo = @RegistrationNo 
				if @cnt > 0
				begin
						RAISERROR ('RegistrationNo Already exists',16,1);
						return;	
	end
				else
				begin
				   
						 --insert the vehicle
							INSERT INTO [dbo].[PSVehicleMaster]
							 ([RegistrationNo],[VehicleGroupId],[StatusId],[VehicleCode],[IsDriverOwned],[DriverId],[CountryId],[VehicleTypeId],[Photo])
							VALUES
							 (@RegistrationNo,@VehicleGroupId,1,'V'+@RegistrationNo,@IsDriverOwned,@Did,@CountryId,@VehicleTypeId,@VPhoto)
	         
							--get the vehicle id
							SELECT @VId = SCOPE_IDENTITY()
							if @Vid is not null 
							begin
							--declare @vmssg varchar(100) = 'a new vehicle <a href="VehicleDetails.html?VID='+ cast(@VId as varchar(7)) +'">' +@RegistrationNo+'</a> is created through app' 
	declare @vmssg varchar(100) = 'a new vehicle ' +@RegistrationNo+' is created through app' 
								exec [InsUpdDelNotifications]  'I',-1,1,1,'new vehicle creation',@vmssg,@dt,@dt,1,1,1,1,1,1 
	
							   INSERT INTO [dbo].[VehicleDocuments]
							   ([VehicleId]
							   ,[FileName]
							   ,[DocTypeId]
							   )
								 select @Vid,t.name,DocTypeId 
								 from [dbo].[MandatoryVehicleDocs]
								 inner join types t on t.id = DocTypeId
							   where CountryId = @CountryId and VehicleGroupId = @VehicleGroupId
							end
						--insert vehicle driver assignment
	
						INSERT INTO [dbo].[PSVehicleAssign] ([DriverId],[VechID],[EffectiveDate],[EffectiveTill],[IsVerified],PhoneNo,[RegistrationNo])
						VALUES(@Did,@Vid,@dt,null,0,@Mobilenumber,@RegistrationNo)


		end
            end
	
	end
	else
	
	
	if @flag ='U'
    begin
		--select @cnt = COUNT(*) from PSDriverMaster where (upper(NAme) = upper(@Drivername) or PMobNo = @Mobilenumber
		--or Email = @Email) and DId <> @Id
	
		--if @cnt = 0
		--	begin
		--			RAISERROR ('No user registered with given mobile number',16,1);
		--			return;
		--	end
		--else
		--	begin
	
	
		--	Update dbo.PSDriverMaster 
		--	set NAme= @Drivername ,	
		--	[Email]= @Email,	
		--	[Password]= @Password,
		--	[Mobileotp]=@Mobileotp ,
		--	[Emailotp]= @Emailotp,
		--	[Passwordotp]= @Passwordotp,
		--	[Status]=@StatusId,
		--	[CreatedOn]= @CreatedOn,
		--	[Mobileotpsenton]= @Mobileotpsenton,
		--	[emailotpsenton]= @emailotpsenton,
		--	[noofattempts]= @noofattempts,
		--	[Firstname] =@Firstname,
		--	[lastname] =@lastname,
		--	[AuthTypeId] =@AuthTypeId,
		--	[AltPhonenumber] =@AltPhonenumber,
		--	[Altemail] =@Altemail,
		--	[AccountNo] =@Mobilenumber
		--	where PMobNo = @Mobilenumber 
	
		--end
	 select 1
	end
	
	
	select [Firstname]+lastname as Name ,[Email] ,[PMobNo] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[Status] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts],[Firstname],[lastname],[AuthTypeId],[AltPhonenumber],[Altemail],[AccountNo],@Did DriverId,@Vid VehicleId from PSDriverMaster where PMobNo = @Mobilenumber
	

END


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdAppusers]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PSInsUpdAppusers]
@flag varchar,@Id int=-1,@Username varchar(50) = null,@Email varchar(50) = null
,@Mobilenumber varchar(20),@Password varchar(50) = null,@Mobileotp varchar(10) = null
,@Emailotp varchar(10) = null,@Passwordotp varchar(10) = null,@Status int = null
,@CreatedOn datetime = null,
@Mobileotpsenton datetime = null,
@emailotpsenton datetime = null,
@noofattempts int = null,
@Firstname varchar(20) = null,@lastname varchar(20)= null,
@AuthTypeId int= null,@AltPhonenumber varchar(20)= null,
@Altemail varchar(50)= null,@AccountNo varchar(50)= null,
@Amount decimal = null,@UserPhoto varchar(max) = null,@Gender int = null,@PaymentModeId int =null
,@AccountNumber varchar(50)=null
,@HolderName varchar(50)=null
,@code varchar(50)=null
,@ExpMonth varchar(20)=null
,@ExpYear varchar(20)=null,
@AccountCode varchar(50)=null
,@AccountType varchar(50)=null
,@CountryId int=null
,@CurrentStateId int=null

AS
BEGIN

declare @cnt int, @m varchar(4), @p varchar(4),@e varchar(4),@nid int,@cotp varchar(5)
declare @dt datetime
set @dt = GETDATE()


select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
select @e = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5
select @cotp = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+20

	if @flag = 'I'
	begin
	
	select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber  and  Email = @Email

	if @cnt > 0
		begin
				RAISERROR ('Already user registered with given mobile number or Email Address',16,1);
				return;	
		end
		
		
		
	else
    begin
    
	
	insert into dbo.Appusers 
	([Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,
	[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,
	[noofattempts],[Firstname],[lastname],[AuthTypeId],[AltPhonenumber],[Altemail],[AccountNo],[UserPhoto] ,[Gender],[Amount],[CountryId],[CurrentStateId] )
	values
	(@Username ,@Email ,@Mobilenumber ,@Password ,@m ,@e ,null ,@Status ,
	@dt ,@dt ,@dt ,0,@Firstname,@lastname,@AuthTypeId,@AltPhonenumber,@Altemail,@AccountNumber,@UserPhoto,@Gender,0,@CountryId,@CurrentStateId)
	
	exec [InsUpdDelNotifications]  'I',-1,1,1,'New User','a new user is created through app','10/28/2017','10/28/2017',1,1,1,1,1,1 
	select @nid = SCOPE_IDENTITY()
	exec [PSInsUpdCustomerAccountDetails]  'I',-1,@nid,@PaymentModeId,@AccountNumber,@HolderName,@code,@ExpMonth,@ExpYear,@AccountCode,@AccountType,null,null,@dt,@dt,@cotp,null,null,@CountryId
exec [PSInsUpdCustomerAccountDetails]  'I',-1,@nid,@PaymentModeId,@AccountNumber,@HolderName,@code,@ExpMonth,@ExpYear,@AccountCode,@AccountType,null,null,@dt,@dt,@cotp,null,null,@CountryId

	end
	
	
	
	end
	
	else
	
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
	[StatusId]=@Status,
	[CreatedOn]= @CreatedOn,
	[Mobileotpsenton]= @Mobileotpsenton,
	[emailotpsenton]= @emailotpsenton,
	[noofattempts]= @noofattempts,
	[Firstname] =@Firstname,
	[lastname] =@lastname,
	[AuthTypeId] =@AuthTypeId,
	[AltPhonenumber] =@AltPhonenumber,
	[Altemail] =@Altemail,
	[AccountNo] =@AccountNo,
	[Amount] = @Amount,
    [UserPhoto] = @UserPhoto,
    [Gender] = @Gender,
    [CountryId]=@CountryId,
	[CurrentStateId]=@CurrentStateId
	where Mobilenumber =@Mobilenumber	 
	
	end
	
	end
	SELECT [Id]
      ,[Username]
      ,[Email]
      ,[Mobilenumber]
      ,[Password]            
      ,[Firstname]
      ,[lastname]
      ,[AuthTypeId]
      ,[AltPhonenumber]
      ,[Altemail]
      ,[AccountNo]
      ,[Amount]
      ,[UserPhoto]
      ,[Gender]
      ,[Emailotp]
      ,[Mobileotp] 
	  ,[CountryId]
	  ,CurrentStateId
  FROM [dbo].[Appusers]
 where Mobilenumber = @Mobilenumber

	--select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts],[Firstname],[lastname],[AuthTypeId],[AltPhonenumber],[Altemail],[AccountNo]  from Appusers where Mobilenumber = @Mobilenumber
	

END


GO
/****** Object:  StoredProcedure [dbo].[PSInsupdBiopw]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdbooking]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdCustomerAccountDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdCustomerAccountDetails]
@insUpdDelFlag varchar,
@Id int = -1 
,@UserId int
,@PaymentModeId int
,@AccountNumber varchar(250)=null
,@HolderName varchar(250)=null
,@code varchar(50)=null
,@ExpMonth varchar(50)=null
,@ExpYear varchar(50)=null
,@AccountCode varchar(50)=null
,@AccountType varchar(150)=null
,@IsPrimary varchar(15)=null
,@IsVerified varchar(15)=null
,@CreatedOn datetime=null
,@UpdatedOn datetime=null
,@Otp varchar(50)=null
,@OtpVerfied varchar(50)=null
,@Active varchar(50)=null
,@CountryId varchar(50)=null
,@UserTypeId int=null
           As
           Begin
           if @insUpdDelFlag = 'I'
           begin
INSERT INTO [dbo].[CustomerAccountDetails]
          ( [UserId]
           ,[PaymentModeId]
           ,[AccountNumber]           
           ,[HolderName]
           ,[code]
           ,[ExpMonth]
           ,[ExpYear]
           ,[AccountCode]
           ,[AccountType]
           ,[IsPrimary]
           ,[IsVerified]
           ,[CreatedOn]
           ,[UpdatedOn]
           ,[Otp]
           ,[OtpVerfied]
           ,[Active]
           ,[CountryId]
           ,[UserTypeId])
     VALUES
           (@UserId
           , @PaymentModeId 
           ,@AccountNumber          
           ,@HolderName 
           ,@code 
           ,@ExpMonth 
           ,@ExpYear 
           ,@AccountCode 
           ,@AccountType 
           ,@IsPrimary 
           ,@IsVerified 
           ,@CreatedOn 
           ,@UpdatedOn 
           ,@Otp 
           ,@OtpVerfied 
           ,@Active 
           ,@CountryId
           ,@UserTypeId )
end
if @insUpdDelFlag = 'U'
Begin
UPDATE [dbo].[CustomerAccountDetails]
   SET [UserId] = @UserId
        ,[PaymentModeId] = @PaymentModeId
      ,[AccountNumber] = @AccountNumber      
      ,[HolderName] = @HolderName
      ,[code] = @code
      ,[ExpMonth] = @ExpMonth
      ,[ExpYear] = @ExpYear
      ,[AccountCode] = @AccountCode
      ,[AccountType] = @AccountType
      ,[IsPrimary] = @IsPrimary
      ,[IsVerified] = @IsVerified
      ,[CreatedOn] = @CreatedOn
      ,[UpdatedOn] = @UpdatedOn
      ,[Otp] = @Otp
      ,[OtpVerfied] = @OtpVerfied
      ,[Active] = @Active
      ,[CountryId] = @CountryId
      ,[UserTypeId]=@UserTypeId
 WHERE Id=@Id
 End
 if @insUpdDelFlag = 'D'
 Begin
 DELETE FROM [dbo].[CustomerAccountDetails]
      WHERE  Id=@Id

end

end


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelDistanceBasePricing]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[PSInsUpdDelDistanceBasePricing]
@Id int = -1,
	@VehicleTypeId int = null,
	@FromKm int = null,
	@ToKm int= null,
	@PricingType int= null,
	@Fromdate date= null,
	@Todate date= null,
	@Perunitprice decimal(18,0)= null,
	@Amount decimal(18,0)= null
	,@CreatedOn datetime= null
	,@Createdby int= null
	,@UpdatedOn datetime= null
	,@Updateby int = null
	,@CountryId int= null
	,@VehicleGroupId int= null, 
	
	@insupddelflag varchar
as
begin

declare @ct varchar(50),@c varchar(50)
select @ct = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5

set @c = 'DP' +@ct

if @insupddelflag = 'I'
begin
INSERT INTO [dbo].[PSDistancePricing]
           ([VehicleTypeId]
           ,[FromKm]
           ,[ToKm]
           ,[PricingType]
           ,[FromDate]
           ,[ToDate]
           ,[PerUnitPrice] 
           ,[Amount]
           ,[CreatedOn]
           ,[CreatedBy] 
           ,[UpdatedOn] 
           ,[UpdatedBy] 
           ,[CountryId] 
           ,[VehicleGroupId]
           ,[Code])
     VALUES
           (@VehicleTypeId,
           	@FromKm,
	        @ToKm ,
	        @PricingType,
	        @Fromdate,
	        @Todate,
	        @Perunitprice,
	        @Amount 
	       ,@CreatedOn 
	       ,@Createdby 
	       ,@UpdatedOn 
	       ,@Updateby  
	       ,@CountryId 
	       ,@VehicleGroupId
	       ,@c)
  end
    if @insupddelflag = 'U'
begin
 UPDATE [dbo].[PSDistancePricing]
   SET [VehicleTypeId] = @VehicleTypeId,
      [FromKm] = @FromKm      
      ,[ToKm] = @ToKm
      ,[PricingType] = @PricingType
       ,[FromDate] = @Fromdate
      ,[ToDate] = @Todate
      ,[PerUnitPrice]=@Perunitprice
      ,[Amount]=@Amount
      ,[CreatedOn]=@CreatedOn
      ,[CreatedBy]=@Createdby
      ,[UpdatedOn]=@UpdatedOn 
      ,[UpdatedBy]=@Updateby
      ,[CountryId]=@CountryId
      ,[VehicleGroupId]=@VehicleGroupId
     
 WHERE Id=@Id
 end
 if @insupddelflag = 'D'
 begin
  delete from [dbo].[PSDistancePricing]
where Id = @Id
End
end


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelDriverDocs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSInsUpdDelDriverDocs]
(
@Id int = -1,
@DriverId int
,@FileName varchar(100)          
           ,@DocTypeId int
           ,@ExpiryDate date = null          
           ,@UpdatedById int
           ,@DueDate date = null
           ,@FileContent varchar(max) = null
           ,@change varchar
,@loggedinUserId int
	,@DocumentNo varchar(50) = NULL
	,@DocumentNo2 varchar(50)= NULL
	,@IsVerified int= NULL
)
AS
BEGIN
declare @username varchar(150),@olddoctypeId int,@oldexpirydate date,@doctype varchar(50),@fname varchar(50)
declare @dt datetime, @edithistoryid int, @oldname varchar(50), @oldDescription  varchar(250),@cnt int 

select @fname = Name from Types where Id = @DocTypeId

set @dt = GETDATE()
		
			
			UPDATE [dbo].[DriverDocuments]
		   SET [DriverId] = @DriverId
			  ,[FileName] = case when @FileName = 'application/pdf' then @fname+'.pdf'
			   when @FileName = 'image/jpeg' then @fname+'.jpg'
			   when @FileName = 'image/png' then @fname+'.png'
			   else @FileName end
			  ,[DocTypeId] = @DocTypeId
			  ,[ExpiryDate] = @ExpiryDate			  
			  ,[UpdatedById] = @loggedInUserId
			  ,[DueDate] = @DueDate
			  ,[FileContent] = @FileContent
			   ,[DocumentNo] = @DocumentNo
           ,[DocumentNo2] = @DocumentNo2
           ,[IsVerified] = @IsVerified
				WHERE DocTypeId = @DocTypeId 
		  and DriverId = @DriverId

	
	SELECT adoc.[Id]
      ,[DriverId]
      ,[FileName] docName      
      ,[DocTypeId] DocTypeId
      ,[ExpiryDate] expiryDate
      ,[CreatedById]
      ,[UpdatedById]
      ,[DueDate]     dueDate      
     ,t.Name docType  
     , DATEDIFF(DAY, GETDATE(),ExpiryDate)
           
       ,case when GETDATE() > ExpiryDate  then 1 
      when (DATEDIFF(DAY, GETDATE(),ExpiryDate)  < 90) then 2
       else 0 end as IsExpired
      ,case when  dueDate < GETDATE()  then 1 else 0 end as PastDue
      ,[DocumentNo]
           ,[DocumentNo2]
           ,[IsVerified]           
  FROM [dbo].[DriverDocuments] adoc  
  left outer join Types t on t.Id = DocTypeId
  where DriverId = @DriverId 
  
  end


/****** Object:  StoredProcedure [dbo].[PSInsUpdDelDriverDocs]    Script Date: 09/13/2017 18:30:58 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelEOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelHourBasePricing]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[PSInsUpdDelHourBasePricing]
@Id int = -1,
@VehicleGroupId int=null,
@VehicleTypeId int=null,
@CountryId int=null,
@hours varchar(5)=null,
@price decimal(18, 0)=null,
@FromTime [Time](7)=null,
@ToTime [Time](7)=null,
@fromDate date=null,
@ToDate date=null,
@PricingType int=null
,@CreatedOn date=null
,@CreatedBy int=null
,@UpdatedOn date =null
,@UpdatedBy int =null
,@insupddelflag varchar
as
begin

declare @hb varchar(50),@b varchar(50)
select @hb = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5


set @b = 'HB' + @hb

if @insupddelflag = 'I'
begin
INSERT INTO [dbo].[PSHoursBasePricing]
           ([VehicleGroupId]
           ,[Hours]
           ,[FromTime]
            ,[ToTime]
           ,[VehicleTypeId]
           ,[CountryId]
           ,[FromDate]
           ,[ToDate]
           ,[PricingType]
           ,[Price]
           ,[Code])
     VALUES
           (@VehicleGroupId
           ,@Hours
           ,@FromTime
           ,@ToTime
           ,@VehicleTypeId
           ,@CountryId
           ,@fromDate
           ,@ToDate
           ,@PricingType                     
           ,@Price
           ,@b)
        end
        
    if @insupddelflag = 'U'
begin    

UPDATE [dbo].[PSHoursBasePricing]
   SET [CountryId] = @CountryId
      ,[VehicleGroupId] = @VehicleGroupId
      ,[Hours] = @Hours
      ,[Price] = @Price
      ,FromTime = @FromTime
      ,ToTime = @ToTime
      ,[VehicleTypeId]= @VehicleTypeId    
      ,[FromDate]=@fromDate 
      ,[ToDate] =@ToDate 
      ,[PricingType] =@PricingType
 WHERE Id=@Id
 end
 
 if @insupddelflag = 'D'
 begin
 
 Delete from [dbo].[PSHoursBasePricing]
where Id = @Id
end
end


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelMOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelPasswordverification]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdDelPasswordverification]
@Mobilenumber varchar(20) = null,
@Email varchar(50) =null,@CountryId int = null
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
		 
	end

   select [Passwordotp]  from Appusers where  Mobilenumber = @Mobilenumber 
end


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelplace]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelRoutes]    Script Date: 28-09-2018 18:49:44 ******/
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

select @rtCount= COUNT(*) from [dbo].[Routes] where UPPER(ltrim(rtrim(Code))) = UPPER(ltrim(rtrim(@Code)))
--select @oldRouteName = RouteName, @oldCode = Code, @oldActive = Active from Routes where Id = @Id

--UPDATE [dbo].[Routes]
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





if @rtCount > 0 
begin

INSERT INTO [dbo].[Routes]
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
INSERT INTO [dbo].[RouteDetails]
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
INSERT INTO [dbo].[RouteDetails]
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

          INSERT INTO [dbo].[RouteStops]
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdDeltypes]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelVehicleDistancePrice]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdDelVehicleDistancePrice]
@Id int = -1,
@SourceLoc varchar(200),
@DestinationLoc varchar(200),
@SourceLat numeric(10,6),
@SourceLng numeric(10,6),
@DestinationLat numeric(10,6),
@DestinationLng numeric(10,6),
@VehicleGroupId int,
@VehicleTypeId int,
@PricingTypeId int,
@Distance int,
@UnitPrice money,
@Amount money,
@flag varchar,
@SrcId int=null,
@DestId int=null,@CountryId int
As
Begin
declare @cnt int

if @flag='I'
	Begin
	select @cnt = count(1) from TaxiSrcDest where 
	upper(Name) = upper(@SourceLoc) and
	UPPER(Name)=UPPER(@DestinationLoc)
	if @cnt = 0 
	Begin
	INSERT INTO [dbo].[TaxiSrcDest]
           ([Name]
           ,[Description]
           ,[Latitude]
           ,[Longitude]
           ,[CountryId])
     VALUES
           (@SourceLoc,
           'Description',
           @SourceLat,
           @SourceLng 
           ,@CountryId) 
           
     SELECT @SrcId = SCOPE_IDENTITY()
      INSERT INTO [dbo].[TaxiSrcDest]
           ([Name]
           ,[Description]
           ,[Latitude]
           ,[Longitude])
    VALUES
           (@DestinationLoc,'Description',
           @DestinationLat,
           @DestinationLng)
       SELECT @DestId = SCOPE_IDENTITY() 
	
		Insert into VehicleDistancePrice(SourceLoc, DestinationLoc, SourceLat, 
		SourceLng, DestinationLat, DestinationLng, VehicleGroupId, VehicleTypeId, 
		PricingTypeId,Distance,UnitPrice,Amount,SrcId,DestId,[CountryId])
		Values(@SourceLoc,@DestinationLoc,@SourceLat,
		@SourceLng,@DestinationLat,@DestinationLng,@VehicleGroupId,@VehicleTypeId,
		@PricingTypeId,@Distance,@UnitPrice,@Amount,@SrcId,@DestId,@CountryId)
	end
	else
		begin
			RAISERROR ('Source and Destination Locations already exists',16,1);
		end
	End
if @flag='U'
	Begin
		Update dbo.VehicleDistancePrice set 
		SourceLoc=@SourceLoc,
		DestinationLoc=@DestinationLoc,
		SourceLat=@SourceLat,
		SourceLng=@SourceLng,
		DestinationLat=@DestinationLat,
		DestinationLng=@DestinationLng,
		VehicleGroupId=@VehicleGroupId,
		VehicleTypeId=@VehicleTypeId,
		PricingTypeId=@PricingTypeId,
		Distance=@Distance,
		UnitPrice=@UnitPrice,
		Amount=@Amount,
		SrcId = @SrcId,
		DestId = @DestId,
		CountryId = @CountryId
		Where SourceLoc=@SourceLoc
	End
End


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDelVehicleDocs]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PSInsUpdDelVehicleDocs]
(
@Id int = -1,
@VehicleId int
,@FileName varchar(100)          
           ,@DocTypeId int
           ,@ExpiryDate date = null          
           ,@UpdatedById int
           ,@DueDate date = null
           ,@FileContent varchar(max) = null
           ,@change varchar
,@loggedinUserId int
	,@DocumentNo varchar(50) = NULL
	,@DocumentNo2 varchar(50)= NULL
	,@IsVerified int= NULL
)

AS
BEGIN
declare @username varchar(150),@RootAssetId int,@olddoctypeId int,@oldexpirydate date,@doctype varchar(50)
declare @dt datetime, @edithistoryid int, @oldname varchar(50), @oldDescription  varchar(250),@cnt int ,@fname varchar(50)


select @fname = Name from Types where Id = @DocTypeId

set @dt = GETDATE()
			
			UPDATE [dbo].[VehicleDocuments]
		   SET [VehicleId] = @VehicleId
			   ,[FileName] = case when @FileName = 'application/pdf' then @fname+'.pdf'
			   when @FileName = 'image/jpeg' then @fname+'.jpg'
			   when @FileName = 'image/png' then @fname+'.png'
			   else @FileName end
			  ,[DocTypeId] = @DocTypeId
			  ,[ExpiryDate] = @ExpiryDate			  
			  ,[UpdatedById] = @loggedInUserId
			  ,[DueDate] = @DueDate
			  ,[FileContent] = @FileContent
			  ,[DocumentNo] = @DocumentNo
           ,[DocumentNo2] = @DocumentNo2
           ,[IsVerified] = @IsVerified
				WHERE DocTypeId = @DocTypeId  
		  and VehicleId = @VehicleId 
	
	SELECT adoc.[Id]
      ,[VehicleId]
      ,[FileName]       
      ,[DocTypeId] 
      ,[ExpiryDate] expiryDate
      ,[CreatedById]
      ,[UpdatedById]
      ,[DueDate]     dueDate      
     ,t.Name docType  
     , DATEDIFF(DAY, GETDATE(),ExpiryDate)
           
       ,case when GETDATE() > ExpiryDate  then 1 
      when (DATEDIFF(DAY, GETDATE(),ExpiryDate)  < 90) then 2
       else 0 end as IsExpired
      ,case when  dueDate < GETDATE()  then 1 else 0 end as PastDue       
      ,[DocumentNo]
           ,[DocumentNo2]
           ,[IsVerified]      
  FROM [dbo].[VehicleDocuments] adoc  
  left outer join Types t on t.Id = DocTypeId
  where [VehicleId] = @VehicleId 
  
	 
END


GO
/****** Object:  StoredProcedure [dbo].[PSinsupddriverApprovals]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSinsupddriverApprovals]
@change varchar,

@IsApproved int=null,
@MobileNo Varchar(20)

as
begin
Declare @Count Int,@IsVerified int
Select @Count = Count(*) From PSDriverMaster
Where PMobNo = @MobileNo
If @Count = 0
Begin
Raiserror ('InValid Mobile Number',16,1);
Return ;
End

Select @IsVerified = IsVerified From DriverDocuments  
If @IsVerified = 0
Begin
Raiserror ('Documents verification is under process',16,1);
Return ;
End
else


if @change = '1'
begin
update dbo.PSDriverMaster
set 

[IsApproved] =@IsApproved
where PMobNo = @MobileNo
select [Email] from PSDriverMaster where PMobNo = @MobileNo
end
end



GO
/****** Object:  StoredProcedure [dbo].[PSinsupddriverdocsverifying]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSinsupddriverdocsverifying]
@change varchar,
@IsVerified int,
@IsApproved int=null,
@DriverId int,@DocType varchar(50) 

as
begin
 declare @dc varchar(50)
select @dc =  t.Id from Types t where upper(t.Name)=UPPER(@DocType)


if @change = '2'
begin
update dbo.DriverDocuments
set 
[IsVerified] =@IsVerified,
[IsApproved] =@IsApproved
where DocTypeId = @dc
and DriverId = @DriverId
end

end

/****** Object:  StoredProcedure [dbo].[PsGetAlerts]    Script Date: 10/13/2017 17:48:11 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdDriverLogin]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PSInsUpdDriverLogin]
(@loginlogout int = null
,@Reason varchar(500)=null
,@DriverNo varchar(20) 
,@LoginLatitude numeric(18,6)=null
,@LoginLongitude numeric(18,6)=null
)
as
begin

declare @dt date,@t time(7),@Did int = null, @Vid int = null,@count int,@IsApproved int
SET @dt = GETDATE()
SET @t = GETDATE()

select @Vid = vechId, @Did = DriverId from PSVehicleAssign where PhoneNo = @DriverNo 



if @Did is null or @Vid is null 
begin
  RAISERROR ('Driver not assign to any vehicle',16,1);
  return
end

select @IsApproved  = ISApproved from PSDriverMaster where PMobNo = @DriverNo 
if @IsApproved is null  or @IsApproved = 0
begin
 RAISERROR ('Driver has been not approved',16,1);
  return
end  

if @loginlogout = 1
begin
   UPDATE [dbo].[PSDriverLogin]
   SET [LoginDate] = @dt
      ,[LoginTime] = @t     
      ,[Reason] = @Reason      
      ,[LoginLatitude] = @LoginLatitude
      ,[LoginLongitude] = @LoginLongitude 
      ,[Status] = 19           
 WHERE DriverNo = @DriverNo and (logoutlatitude is null and logoutlongitude is null)
 
if @@rowcount = 0
begin
   INSERT INTO [dbo].[PSDriverLogin]
           ([DId]
           ,[VId]
           ,[LoginDate]
           ,[LoginTime]          
           ,[Reason]           
           ,[LoginLatitude]
           ,[LoginLongitude]
           ,DriverNo          
           ,Status)
     VALUES
           (@DId 
           ,@VId 
           ,@dt 
           ,@t          
           ,@Reason            
           ,@LoginLatitude 
           ,@LoginLongitude
           ,@DriverNo           
           ,19) 
end
  update [PSDriverMaster]
  set StatusId = 19
  where PMobNo = @DriverNo
  
  update dbo.PSCurrentLocationStatus
  set [Status] = 19
  where DriverNo = @DriverNo
   
end
else
begin
   UPDATE [dbo].[PSDriverLogin]
   SET [LogoutDate] = @dt
      ,[LogoutTime] = @t
      ,[Reason] = @Reason         
      ,[LogoutLatitude] = @LoginLatitude
      ,[LogoutLongitude] = @LoginLongitude  
      ,Status = 17    
 WHERE DriverNo = @DriverNo and (loginlatitude is not null and loginlongitude is not null)
 
  update [PSDriverMaster]
  set StatusId = 17
  where PMobNo = @DriverNo
  
  update dbo.PSCurrentLocationStatus
  set [Status] = 17
  where DriverNo = @DriverNo
  
end

select 1 as status
end


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdFaqs]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInSupdFleetOwnerRequestDetails]    Script Date: 28-09-2018 18:49:44 ******/
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

INSERT INTO [dbo].[FleetOwnerRequestDetails]
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdPaymentDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdPaymentDetails]
@flag varchar,@Id int=-1,@PaymentId int,@CardCategories varchar(50),@Transactiondate date=null,
@TransactionTime time(7)=null,@Status varchar(50),@GatewayId int,@TransactionType varchar(50)
as
begin
declare @dt date,@t time(7),@catid int=null,@st int=null
SET @dt = GETDATE()
SET @t = GETDATE()


select @catid= tt.Id from Types tt where upper(tt.Name)=UPPER(@CardCategories)
select @st= tt.Id from Types tt where upper(tt.Name)=UPPER(@Status)


if @flag = 'I'
begin
insert into dbo.PaymentDetails
([PaymentId],[CardCategoryId],[Transactiondate],
[TransactionTime],[StatusId],[GatewayId],[TransactionType])
values
(@PaymentId,@catid,@dt,@t,@st,@GatewayId,@TransactionType)
end
if @flag='U'
begin
Update dbo.PaymentDetails
set
[PaymentId]=@PaymentId,
[CardCategoryId] = @CardCategories,
[Transactiondate] = @Transactiondate,
[TransactionTime] = @TransactionTime,
[TransactionType] = @TransactionType,
[StatusId] = @Status,
[GatewayId] = @GatewayId
end
select 1 as status
end


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdPayments]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdPayments]
@flag varchar,@Id int=-1,@CardCategories varchar(50),
@PaymentDate date=null,@PaymentTime time(7)=null,
@Status varchar(50),@Amount decimal(18,0)
as
begin

declare @dt DATE,@t time(7),@catid int=null,@st int=null
set @dt = GETDATE()
set  @t = GETDATE()

select @catid= tt.Id from Types tt where upper(tt.Name)=UPPER(@CardCategories)
select @st= tt.Id from Types tt where upper(tt.Name)=UPPER(@Status)
if @flag = 'I'
begin
insert into dbo.Payment
([CardCategoryId] ,[PaymentDate],[PaymentTime],[StatusId],[Amount])
values
(@catid,@dt,@t,@st,@Amount)
end
if @flag='U'
begin
Update dbo.Payment   
set [CardCategoryId] = @CardCategories,
[PaymentDate] = @PaymentDate,
[PaymentTime] = @PaymentTime,
[StatusId] = @Status,
[Amount] = @Amount
end

select 1 as status
END


GO
/****** Object:  StoredProcedure [dbo].[PSInsupdTroubleTicket]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsupdTroubleTicket]
(@flag varchar,@id int=null,
@Userid int=null,@EmailId varchar(50)=null,@CreatedOn date,@Onbehalfofph Varchar(20)=null,
@TicketNo varchar(20)=null,@Catid int=null,@Description varchar(50)=null,@Emailsent int=null,@Smssent int=null,
@TicketTypeId int=null,@PhoneNumber varchar(20)=null,@StatusId int=null,@Name varchar(150)=null,@Category varchar(150)=null,@Subject varchar(150)=null)
as
begin
declare
@currDate date ,@t int
set @currDate = getdate()
select @t = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))

if @flag = 'I'
begin
insert into [dbo].[TroubleTicket]
([Userid],[EmailId],[CreatedOn],[On behalf of ph],[TicketNo],[Catid],[Description],[Emailsent],[Sms sent],[TicketTypeId],[PhoneNumber],[StatusId],[Name],[Category],[Subject]) 
values
(@Userid,@EmailId,@currDate,@Onbehalfofph,@t,@Catid,@Description,@Emailsent,@Smssent,@TicketTypeId,@PhoneNumber,@StatusId,@Name,@Category ,@Subject)
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
[StatusId] =@StatusId,
[Name]=@Name ,
[Category]=@Category ,
[Subject]=@Subject
where PhoneNumber=@PhoneNumber

end
end


GO
/****** Object:  StoredProcedure [dbo].[PSInsupdUsercard]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsupdUserdownloads]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsupdUserinfo]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsupdUserPreferences]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdVechlogin]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE  [dbo].[PSInsUpdVechlogin]
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
/****** Object:  StoredProcedure [dbo].[PSInsUpdVechlogout]    Script Date: 28-09-2018 18:49:44 ******/
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
	---check if any trips are there to be accepted and if yes then send the list
	SELECT l.[Id],[BookingId],b.BNo,[Vid],[Date],[Time],[Status],[EXpirationTime], DestLatitude, DestLongitude,DriverId
  FROM [dbo].[PSVehicleBookingHistory] l
  inner join [PSVehicleBookingDetails] b on b.Id = [BookingId] and b.BookingStatus = 'To be accepted' 
  where  VechId = @VechId 	
end
	select [CompanyId],[LogoutDate],[LogoutTime],[VechId],[RegNo],[DriverName],[EndMtr] , [VehicleModelId],[ServiceTypeId],[VehicleGroupId] from  PSVechLogOut

	where VechId = @VechId 
	

END


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdVehicleAdvBookingDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdVehicleAdvBookingDetails]
(
@id int = null
,@BNo varchar(20) = null
           ,@BookedDate date =null
           ,@BookedTime time(7) =null
           ,@DepartureDate date  = null
           ,@DepartureTime time(7) = null 
           ,@BookingType varchar(50)=null 
           ,@Src varchar(50)
           ,@Dest varchar(50)
           ,@SrcId int
           ,@DestId int
           ,@SrcLatitude numeric(18,6)= null 
           ,@SrcLongitude numeric(18,6) = null
           ,@DestLatitude numeric(18,6) = null
           ,@DestLongitude numeric(18,6) = null
           ,@VechId int = null
           ,@PackageId int = null
           ,@Pricing decimal(10,0) = null
           ,@DriverId int = null
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
           ,@BookingChannel varchar(50)= null 
           ,@Reasons varchar(500)= null
           ,@CompanyId int =null
           ,@BooKingOTP varchar(20)=null
           ,@Amount decimal(18, 0)=null
           ,@PaymentStatus varchar(50)=null
           ,@flag varchar(1) = null)
as
begin

begin try

declare @b varchar(5),@dt datetime

set @dt = getdate()

select @b = replace(CONVERT(VARCHAR(1), @dt, 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,@dt))+5 

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
           ,[Reasons]
           ,[BooKingOTP]      
           ,[Amount]
           ,[PaymentStatus])
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
           ,@CompanyId
           ,null
           ,@Amount
           ,@PaymentStatus)
end
else
  if @flag = 'U' 
  begin
  UPDATE [dbo].[PSVehicleBookingDetails]
   SET 
       [BookingStatus] = @BookingStatus
      ,[CancelledOn] = @CancelledOn
      ,[CancelledBy] = @CancelledBy
      ,[BookingChannel] = @BookingChannel
      ,[Reasons] = @Reasons      
 WHERE [BNo]=@BNo

 set @b= @BNo


  end
  select @b as bookingNumber
  end try
begin catch
 DECLARE @ErrorMessage NVARCHAR(4000);  
    DECLARE @ErrorSeverity INT;  
    DECLARE @ErrorState INT;  

    SET @ErrorMessage = ERROR_MESSAGE();  
    SET @ErrorSeverity = ERROR_SEVERITY();  
    SET @ErrorState = ERROR_STATE();  

    -- Use RAISERROR inside the CATCH block to return error  
    -- information about the original error that caused  
    -- execution to jump to the CATCH block.  
    RAISERROR (@ErrorMessage, -- Message text.  
               @ErrorSeverity, -- Severity.  
               @ErrorState -- State.  
               ); 
end catch
end


GO
/****** Object:  StoredProcedure [dbo].[PSinsupdVehicleApprovals]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PSinsupdVehicleApprovals]
@change varchar,

@IsApproved int=null,
@RegistrationNo Varchar(20)

as
begin
Declare @Count Int
Select @Count = Count(*) From PSVehicleMaster
Where RegistrationNo = @RegistrationNo
If @Count = 0
Begin
Raiserror ('InValid Registration Number',16,1);
Return ;
End



if @change = '1'
begin
update dbo.PSVehicleMaster
set 

[IsApproved] =@IsApproved
where RegistrationNo = @RegistrationNo
end


select [VehicleCode]  from PSVehicleMaster where RegistrationNo = @RegistrationNo
end


GO
/****** Object:  StoredProcedure [dbo].[PSInsUpdVehicleBookingDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSInsUpdVehicleBookingDetails]
(
@id int = null
,@BNo varchar(20) = null
           ,@BookedDate date =null
           ,@BookedTime time(7) =null
           ,@DepartureDate date  = null
           ,@DepartureTime time(7) = null 
           ,@BookingType varchar(50)=null 
           ,@Src varchar(50)
           ,@Dest varchar(50)
           ,@SrcId int=null
           ,@DestId int=null
           ,@SrcLatitude numeric(18,6)= null 
           ,@SrcLongitude numeric(18,6) = null
           ,@DestLatitude numeric(18,6) = null
           ,@DestLongitude numeric(18,6) = null
           ,@VechId int 
           ,@PackageId int = null
           ,@Pricing decimal(10,0) = null
           ,@DriverId int 
           ,@DriverPhoneNo varchar(20) 
           ,@CustomerPhoneNo varchar(20) 
           ,@CustomerId int=null 
           ,@BookingStatus varchar(50) 
           ,@NoofVehicles int=null 
           ,@NoofSeats int =null
           ,@ClosingDate date =null
           ,@ClosingTime time(7)=null 
           ,@CancelledOn datetime =null
           ,@CancelledBy varchar(50)=null 
           ,@BookingChannel varchar(50)= null 
           ,@Reasons varchar(500)= null
           ,@CompanyId int =null
           ,@BooKingOTP varchar(20)=null           
           ,@Amount decimal(18, 0)=null
           ,@PaymentStatus varchar(50)=null
           ,@distance decimal(18,0)=null
           ,@PaymentTypeId int =null
           ,@flag varchar(1) = null)
as
begin

begin try

declare @b varchar(5),@selVid int = null
, @selDid int = null, @newBookId int, @driverNo varchar(20),@dt datetime, @m varchar(5)

set @dt = getdate()

select @b = replace(CONVERT(VARCHAR(1), @dt, 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,@dt))+5 

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
           ,[Reasons]
           ,[BooKingOTP]      
           ,[Amount]
           ,[PaymentStatus]
           ,[Distance]
           ,[PaymentTypeId])
     VALUES
           (@b
           ,@dt
           ,@dt 
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
           ,@CompanyId
           ,null           
           ,@Amount
           ,@PaymentStatus
           ,@distance
           ,@PaymentTypeId)
           
           	SELECT @newBookId = SCOPE_IDENTITY()
           
           --check the nearest vehicle and assign 
           select top 1 @selDid = DId ,@selVid = Vid from PSDriverLogin where LogoutLatitude = null and LogoutLongitude = null 
          
          if @SrcLatitude < 0 or @SrcLongitude< 0
          SELECT top 1 @selVid = Vid, @selDid = DId,@driverNo = DriverNo
		  FROM dbo.PSCurrentLocationStatus  where Status = 19 --Mobilenumber = @Mobilenumber 
		  order by (@SrcLatitude - Latitude) desc,(@SrcLongitude - Longitude) desc 
    else
		  if @SrcLatitude < 0 and @SrcLongitude >  0
          SELECT top 1 @selVid = Vid, @selDid = DId,@driverNo = DriverNo
		  FROM dbo.PSCurrentLocationStatus  where Status = 19--Mobilenumber = @Mobilenumber 
		  order by (@SrcLatitude - Latitude) desc,(@SrcLongitude - Longitude)  
		  
   else
		  if @SrcLatitude > 0 and @SrcLongitude <  0
          SELECT top 1 @selVid = Vid, @selDid = DId,@driverNo = DriverNo
		  FROM dbo.PSCurrentLocationStatus  where Status = 19--Mobilenumber = @Mobilenumber 
		  order by (@SrcLatitude - Latitude) ,(@SrcLongitude - Longitude) desc
    else
          SELECT top 1 @selVid = Vid, @selDid = DId,@driverNo = DriverNo
		  FROM dbo.PSCurrentLocationStatus  where Status = 19--Mobilenumber = @Mobilenumber 
		  order by (@SrcLatitude - Latitude),(@SrcLongitude - Longitude) 
    
    
    
    if @selDid is not null and @selVid is not null
    begin
        --collect the vehicle and driver infor
        --update the booking infor, change status and
        update [PSVehicleBookingDetails]
        set [VechId] = @selVid                      
           ,[DriverId] = @selDid
           ,[DriverPhoneNo] = @driverNo
           ,[BookingStatus] = 'To be accepted'
        where Id = @newBookId
        
        --insert the record into vehiclebookinghistory table
	if @@ROWCOUNT > 0
			begin
     INSERT INTO [dbo].[PSVehicleBookingHistory]
           ([BookingId],[BNo],[Vid],[Date],[Time],[Status],[EXpirationTime])
     VALUES
           (@newBookId,@b,@selVid,@dt,CONVERT(time,@dt),'To be accepted',DATEADD(mi,2,@dt))
        
    end
  end      
           
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
      ,[Amount] = @Amount
      ,[PaymentStatus] = @PaymentStatus
      ,[Distance] = @distance
 WHERE [BNo]=@BNo



  end
  select @b as bookingNumber
  end try
begin catch
 DECLARE @ErrorMessage NVARCHAR(4000);  
    DECLARE @ErrorSeverity INT;  
    DECLARE @ErrorState INT;  

    SET @ErrorMessage = ERROR_MESSAGE();  
    SET @ErrorSeverity = ERROR_SEVERITY();  
    SET @ErrorState = ERROR_STATE();  

    -- Use RAISERROR inside the CATCH block to return error		
    -- information about the original error that caused  
    -- execution to jump to the CATCH block.  
    RAISERROR (@ErrorMessage, -- Message text.  
               @ErrorSeverity, -- Severity.  
               @ErrorState -- State.  
               ); 
end catch
end


GO
/****** Object:  StoredProcedure [dbo].[PSinsupdvehicledocsverifying]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSinsupdvehicledocsverifying]
@change varchar,
@IsVerified int = null,
@IsApproved int =null,
@VehicleId int,
@DocType varchar(50)
as
begin
 declare @dc varchar(50)
select @dc =  t.Id from Types t where upper(t.Name)=UPPER(@DocType)


if @change = '2'
begin
update dbo.VehicleDocuments
set 
[IsVerified] =@IsVerified,
[IsApproved] =@IsApproved
where DocTypeId = @dc
and VehicleId = @VehicleId
end

end


GO
/****** Object:  StoredProcedure [dbo].[PSMOTPverification]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSMOTPverifying]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSMOTPverifying]
@Mobilenumber varchar(20),@Mobileotp varchar(10),@UserId int
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Id = @UserId

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp and Id = @UserId
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update Appusers set Mobileotp = null where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp and Id = @UserId
     select [Mobilenumber],[Username],[StatusId] from Appusers where Mobilenumber = @Mobilenumber
     --select 1
  end
 
end

end


GO
/****** Object:  StoredProcedure [dbo].[PSPasswordreset]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSPasswordverification]    Script Date: 28-09-2018 18:49:44 ******/
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

  select @otp = COUNT(*) from Appusers where Mobilenumber = @mobileno and Passwordotp = @Passwordotp
  if @otp = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
      update Appusers set Passwordotp  = null,Password = @Password where Mobilenumber = @mobileno and Email = @Email  
     select [Username] ,[Email] ,[Mobilenumber],[Password] from Appusers where Mobilenumber = @mobileno and Email = @Email
  end
 
end
end


GO
/****** Object:  StoredProcedure [dbo].[PSprebookingdetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSProcessPayment]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PSProcessPayment]
@BNo varchar(20),@Amount decimal(18,0)
as
begin

update dbo.PSVehicleBookingDetails 
set [PaymentStatus] = 'Paid', Amount = @Amount, UpdatedBy = 0
where BNo = @BNo

end


GO
/****** Object:  StoredProcedure [dbo].[PSRetrivePassword]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSsp_addextendedproc]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSsp_dropextendedproc]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSStartTrip]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSStartTrip]
@BNo varchar(20),@DriverPhoneNo varchar(20),@BookingOTP varchar(20)
as
begin

declare @cnt int,@bid int

select @cnt = COUNT(*) from PSVehicleBookingDetails where DriverPhoneNo = @DriverPhoneNo and BNo = @BNo

if @cnt = 0
begin
  
				RAISERROR ('Invalid driver info or booking number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from PSVehicleBookingDetails where [BookingOTP] = @BookingOTP and BNo = @BNo
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
    
     update PSVehicleBookingDetails set [BookingOTP] = null,[BookingStatus] ='OnTrip' where  BNo = @BNo
          
      update PSVehicleBookingHistory
     set Status = 'onTrip'
     where BNo = @BNo
     
     select BookingStatus as [Status] from PSVehicleBookingDetails  where BNo = @BNo 
  end
 
end
end


GO
/****** Object:  StoredProcedure [dbo].[PSTaxiSrcDest]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSTaxiSrcDest]
@flag varchar,@Id int=-1,@Name varchar(50),@Description varchar(50),@Latitude decimal(18,6),@Longitude decimal(18,6),@PlaceId varchar(20),@ShortName varchar(50),@LongName varchar(100),@CountryId int

as
 begin 

if @flag = 'I'
begin
insert into dbo.TaxiStops
([Name],[Description],[Latitude],[Longitude],[PlaceId],[ShortName],[LongName],[CountryId])
values
(@Name,@Description,@Latitude,@Longitude,@PlaceId,@ShortName,@LongName,@CountryId)
end

if @flag='U'
begin
Update dbo.TaxiSrcDest
SET [Name]=@Name,
[Description]=@Description,
[Latitude]=@Latitude,
[Longitude]=@Longitude,
[PlaceId]=@PlaceId,
[ShortName]=@ShortName,
[LongName]=@LongName,
[CountryId]=@CountryId

end

select [Latitude],[Longitude] from TaxiSrcDest
end


GO
/****** Object:  StoredProcedure [dbo].[PSTrackVehicleHistory]    Script Date: 28-09-2018 18:49:44 ******/
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

select top 1 @vid = VId, @did = DId from [PSDriverLogin] 
where DriverNo = @Mobilenumber and (logoutlatitude is null and logoutlongitude is null)


if @did is null or @vid is null 
begin
  RAISERROR ('Driver did not login yet',16,1);
  return
end
  else		
	begin	

		select top 1 @lat = Latitude,@long = longitude from PSTrackVehicle where Mobilenumber = @Mobilenumber 
		order by id desc 

		if @lat <> @Latitude or @long <> @Longitude
		begin
			Insert into PSTrackVehicle(Mobilenumber, Latitude, Longitude, Date, Time,Status) 
			values (@Mobilenumber, @Latitude,@Longitude,convert(date,GETDATE()), CONVERT(time,GETDATE()),@Status)
		end	
			update dbo.PSCurrentLocationStatus set Latitude  = @Latitude, Longitude = @Longitude
			,[Date] = GETDATE(), [Time]= CONVERT(time,GETDATE()) 
			, DriverNo = @Mobilenumber where vid = @vid and did = @did
			
			if @@ROWCOUNT = 0
			begin
			  INSERT INTO [dbo].[PSCurrentLocationStatus]
           ([VId],[DId],[Latitude],[Longitude],[Date],[Time],[Status],[DriverNo])
			VALUES(@vid,@did,@latitude,@longitude,GETDATE(), CONVERT(time,GETDATE()),1,@Mobilenumber)			
		end
    
	END
	
	---check if any trips are there to be accepted and if yes then send the list
	SELECT l.[Id],[BookingId],b.BNo,[Vid],[DriverId],[Date],[Time],[Status],[EXpirationTime]
	, DestLatitude, DestLongitude,SrcLatitude,SrcLongitude
  FROM [dbo].[PSVehicleBookingHistory] l
  inner join [PSVehicleBookingDetails] b on b.Id = [BookingId] and [Status] = 'To be accepted' 
  where vid = @vid 
	
end


GO
/****** Object:  StoredProcedure [dbo].[PStravelling]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSTripCost]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSTripCost]
@BNo varchar(20),@packageId int
as
begin
declare @amt decimal,@distance decimal,@dt date, @countryid int, @vehiclegroupid int, @vehicletypeid int, @vid int
set @dt = GETDATE()

select @vid = VechId,@distance = 9 from PSVehicleBookingDetails where BNo = @BNo

select @countryid = CountryId, @vehiclegroupid = VehicleGroupId, @vehicletypeid = VehicleTypeId from PSVehicleMaster where Id = @vid

select @amt = amount from [dbo].[PSDistancePricing]
where @distance >= FromKm and @distance <=ToKm
and @dt <= ToDate and @dt>=FromDate
and CountryId = @countryid and @vehiclegroupid = VehicleGroupId
and @vehicletypeid = VehicleTypeId

if @amt is not null 
select @amt
else
begin
if @packageId = 1 
select 100 as Price
if @packageId = 2 
select 200 as Price
if @packageId = 3 
select 300 as Price
if @packageId = 4 
select 400 as Price
if @packageId = 5 
select 500 as Price
if @packageId = 6
select 600 as Price
end
end


GO
/****** Object:  StoredProcedure [dbo].[PSUserlocations]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSValidateCred]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PSValidateCred]
@Mobilenumber varchar(20),@Password varchar(50),@CountryId int=null
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Password = @Password 

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Mobilenumber or Password',16,1);
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
/****** Object:  StoredProcedure [dbo].[PSValidateCredentials]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSValidateFleetOwnerCode]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[PSVehicles]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[registerbtpos]    Script Date: 28-09-2018 18:49:44 ******/
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


GO
/****** Object:  StoredProcedure [dbo].[RetrivePassword]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[RetriveWebSitePassword]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[setCardDetails]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[setCardDetails]
(
@CardNumber int,
@CardName varchar(50),
@NameOnCard varchar(50),
@ReferenceId int,
@EstimatedStartDate date,
@EstimatedEndDate date,
@EffectiveFrom date,
@ValidTillDate date,
@CVV  int,
@CVV2 int,
@PIN varchar(50),
@CardStatus int,
@Customer varchar(50),
@UserId int,
@flag varchar)
as
begin
if @flag='I'
begin 
Insert into CardDetails(CardNumber, CardName, NameOnCard, ReferenceId, EstimatedStartDate, EstimatedEndDate, EffectiveFrom, ValidTillDate, CVV, CVV2, PIN, CardStatus, Customer, UserId) values
(@CardNumber,@CardName,@NameOnCard,@ReferenceId,@EstimatedStartDate,@EstimatedEndDate,@EffectiveFrom,@ValidTillDate,@CVV,@CVV2,@PIN,@CardStatus,@Customer,@UserId)
end
if @flag='U'
begin
update CardDetails set
CardNumber=@CardNumber,
CardName=@CardName,
NameOnCard=@NameOnCard,
ReferenceId=@ReferenceId,
EstimatedStartDate=@EstimatedStartDate,
EstimatedEndDate=@EstimatedEndDate,
EffectiveFrom=@EffectiveFrom,
ValidTillDate=@ValidTillDate,
CVV=@CVV,
CVV2=@CVV2,
PIN=@PIN,
CardStatus=@CardStatus,
Customer=@Customer,
UserId=@UserId where (Customer=@Customer) 
end
end


GO
/****** Object:  StoredProcedure [dbo].[SOSotpverification]    Script Date: 28-09-2018 18:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SOSotpverification]
@Mobilenumber varchar(20),@otp varchar(10),@UserTypeId int
as
begin

declare @cnt int

select @cnt = COUNT(*) from SOSMessages where UserTypeId = @UserTypeId

if @cnt = 0
begin
  
				RAISERROR ('Invalid User',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from SOSMessages where UserTypeId = @UserTypeId and [Otp] = @otp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update SOSMessages set Otp = null where UserTypeId = @UserTypeId and [Otp] = @Otp
    
  end
 
end

 select 1 as status

end


GO
/****** Object:  StoredProcedure [dbo].[sp_InsPassengerDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsPnrDetails]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsPnrToSeats]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_InsTypeGroups]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[updatebtpos]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[ValidateCredentials]    Script Date: 28-09-2018 18:49:44 ******/
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
/****** Object:  StoredProcedure [dbo].[ValidateFleetOwnerCode]    Script Date: 28-09-2018 18:49:44 ******/
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
    FROM [dbo].[UserLicense] ul
    where ul.foid = @fid
    	
	end
	
    Set @result = @fid    
    -- Insert statements for procedure here
	return @result
END


GO
/****** Object:  StoredProcedure [dbo].[VehicleConfiguration]    Script Date: 28-09-2018 18:49:44 ******/
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
    @needVehicleGroup int =0,
    @needDocuments int = 0
AS
BEGIN
	

	if @needRoutes  = 1
	select routename,ID,Code from routes order by routename

	if @needRoles  = 1 
	select name,ID from Roles order by name
		
	if @needvehicleRegno  = 1
    select RegistrationNo,Id from PSVehicleMaster
    where ((fleetownerId = @fleetownerId or @fleetownerid =-1)
    and (VehicleGroupId = 39))
    order by RegistrationNo
		
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
	
	--Documents type data
	if @needDocuments  = 1
	select Name, Id from Types where TypeGroupId = 18 order by Name
	
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
  FROM [dbo].[BTPOSDetails] b
  where (fleetownerid = @fleetownerId or @fleetownerid =-1)
order by POSID
	
if @needHireVehicle = 1
select RegistrationNo,Id from PSVehicleMaster
    where ((fleetownerid = @fleetownerId or @fleetownerid =-1)
    and (VehicleGroupId = 39))
	order by RegistrationNo
	
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
inner join [dbo].[FleetOwnerRoute] fr on r.id = fr.routeid
 inner join fleetowner f on f.id = fr.fleetownerid 
  inner join users u on f.userid = u.id 
  where f.Id = @fleetownerId
order by routename

END



GO
/****** Object:  StoredProcedure [dbo].[WebsiteValidateCredentials]    Script Date: 28-09-2018 18:49:44 ******/
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
