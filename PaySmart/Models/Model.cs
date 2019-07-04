using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Paysmart.Models
{
    public class Appusers
    {
        public string flag { get; set; }

        public int id { get; set; }
        public string Username { get; set; }

        public string Email { get; set; }

        public string Mobilenumber { get; set; }

        public string Password { get; set; }

        public string Mobileotp { get; set; }

        public string Emailotp { get; set; }

        public string Passwordotp { get; set; }

        public int Status { get; set; }

        public string Createdon { get; set; }

        public string Mobileotpsenton { get; set; }

        public string Emailotpsenton { get; set; }

        public string noofattempts { get; set; }
        public decimal Amount { get; set; }
    }

    public class UserAccount
    {
        public string flag { get; set; }
        public int id { get; set; }  
        public int userId { get; set; }
        public string Username { get; set; }

        public string Email { get; set; }
        public string Mobilenumber { get; set; }
        public string Password { get; set; }
        public String EVerificationCode { get; set; }
        public DateTime EVerifiedOn { get; set; }
        public int IsEmailVerified { get; set; }
        public String MVerificationCode { get; set; }
        public string Passwordotp { get; set; }
        public DateTime MVerifiedOn { get; set; }
        public int IsMobileVerified { get; set; }

        public DateTime CreatedOn { get; set; }
        public int ENoOfAttempts { get; set; }
        public int MNoOfAttempts { get; set; }
        public string Firstname { get; set; }
        public string lastname { get; set; }
        public int AuthTypeId { get; set; }
        public string AltPhonenumber { get; set; }
        public string Altemail { get; set; }
        public string AccountNo { get; set; }
        public string NewPassword { get; set; }
        public object Mobileotp { get; set; }

        public object Emailotp { get; set; }

        public int Gender { get; set; }
        public string UserPhoto { get; set; }

        public decimal Amount { get; set; }
        public int CountryId { get; set; }
        public int PaymentModeId { get; set; }
        public int CurrentStateId { get; set; }
        public int Active { get; set; }
        public string CCode { get; set; }
        public string UserAccountNo { get; set; }

        public int change { get; set; }

    }

    public class BusinessAppUser
    {
        //public int Id { get; set; }
        public string flag { get; set; }
        //public int id { get; set; }
        public int userId { get; set; }
        public string Username { get; set; }

        public string Email { get; set; }
        public string Mobilenumber { get; set; }
        public string Password { get; set; }
        public String EVerificationCode { get; set; }
        public DateTime EVerifiedOn { get; set; }
        public int IsEmailVerified { get; set; }
        public String MVerificationCode { get; set; }
        public string Passwordotp { get; set; }
        public DateTime MVerifiedOn { get; set; }
        public int IsMobileVerified { get; set; }

        public DateTime CreatedOn { get; set; }
        public int ENoOfAttempts { get; set; }
        public int MNoOfAttempts { get; set; }
        public string Firstname { get; set; }
        public string lastname { get; set; }
        public int AuthTypeId { get; set; }
        public string AltPhonenumber { get; set; }
        public string Altemail { get; set; }
        public string AccountNo { get; set; }
        public string NewPassword { get; set; }
        public object Mobileotp { get; set; }

        public object Emailotp { get; set; }

        public int Gender { get; set; }
        public string UserPhoto { get; set; }

        public decimal Amount { get; set; }
        public int CountryId { get; set; }
        public int PaymentModeId { get; set; }
        public int CurrentStateId { get; set; }
        public int Active { get; set; }
        public string CCode { get; set; }
        public string UserAccountNo { get; set; }
        public int usertypeid { get; set; }

        public string Address { get; set; }
        public int change { get; set; }
        public int type { get; set; }
        public int ownerId { get; set; }

        public string RegistrationNo { get; set; }
        public string VPhoto { get; set; }
        public string VehicleType { get; set; }
        public int isDriverOwned { get; set; }

        public int VehicleTypeId { get; set; }

        public int VehicleGroupId { get; set; }

    }

    public class DriverAccount
    {
        public string flag { get; set; }
        public int id { get; set; }
        public string Drivername { get; set; }
        public string Email { get; set; }
        public string Mobilenumber { get; set; }
        public string Password { get; set; }
        public String EVerificationCode { get; set; }
        public DateTime EVerifiedOn { get; set; }
        public int IsEmailVerified { get; set; }
        public String MVerificationCode { get; set; }
        public string Passwordotp { get; set; }
        public DateTime MVerifiedOn { get; set; }
        public int IsMobileVerified { get; set; }
        public DateTime CreatedOn { get; set; }
        public int ENoOfAttempts { get; set; }
        public int MNoOfAttempts { get; set; }
        public string Firstname { get; set; }
        public string lastname { get; set; }
        public int AuthTypeId { get; set; }
        public string AltPhonenumber { get; set; }
        public string Altemail { get; set; }
        public string AccountNo { get; set; }
        public string NewPassword { get; set; }
        public object Mobileotp { get; set; }
        public object Emailotp { get; set; }
        public string bioMetricData { get; set; }
        public string Country { get; set; }
        public string DPhoto { get; set; }
        public string VehicleGroup { get; set; }
        public vehicledetails Vehicle { get; set; }
        public string RegistrationNo { get; set; }
        public string VPhoto { get; set; }
        public string VehicleType { get; set; }
        public int isDriverOwned { get; set; }

        public int CountryId { get; set; }
        public int VehicleGroupId { get; set; }
        public int VehicleTypeId { get; set; }
        public int BusinessAppUserId { get; set; }
        public string UserAccountNo { get; set; }
    }
    public class UserLogin
    {
        public string UserAccountNo { get; set; }
        public string Password { get; set; }
        public int usertypeid { get; set; }
        public int CountryId { get; set; }
        

    }
    public class DriverLogin
    {
        public string Mobilenumber { get; set; }
        public string Password { get; set; }
    }

    public class Tickets
    {
        public string flag { get; set; }
        public int id { get; set; }
        public int Userid { get; set; }
        public string EmailId { get; set; }

        public DateTime CreatedOn { get; set; }

        public string Onbehalfofph { get; set; }


        public int Catid { get; set; }

        public string Description { get; set; }
        public int Emailsent { get; set; }
        public int Smssent { get; set; }
        public int TicketTypeId { get; set; }
        public string PhoneNumber { get; set; }
        public int StatusId { get; set; }

    }

    public class faqs
    {

        public int Id { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
        public string Catid { get; set; }
        public DateTime CreatedOn { get; set; }

        public int Createdby { get; set; }
        public string flag { get; set; }
    }

    public class UserInfo
    {

        public int Id { get; set; }
        public string Firstname { get; set; }
        public string lastname { get; set; }
        public string username { get; set; }
        public string Emailid { get; set; }
        public string Phonenumber { get; set; }
        public string Mobileotp { get; set; }
        public string Emailotp { get; set; }
        public string Pwdotp { get; set; }
        public string Password { get; set; }
        public int statusId { get; set; }
        public string AccountNo { get; set; }
        public int AuthTypeId { get; set; }

        public string AltPhonenumber { get; set; }
        public string Altemail { get; set; }

        public string flag { get; set; }
    }

    public class Users
    {
        public int Id { get; set; }

        public int userid { get; set; }
        public string email { get; set; }
        public string Address { get; set; }
        public int Accountid { get; set; }
        public int preferenceTypeId { get; set; }
        public int preferenceId { get; set; }
        public string flag { get; set; }
    }
    public class Usercards
    {


        public int Id { get; set; }

        public int AccId { get; set; }
        public string Cardno { get; set; }
        public string ccv { get; set; }
        public int Expyear { get; set; }
        public int expmonth { get; set; }
        public int Statusid { get; set; }
        public string isDefault { get; set; }

        public string flag { get; set; }
    }

    public class UserDownloads
    {
        public int Id { get; set; }
        public string Android { get; set; }
        public string Win { get; set; }
        public string Ios { get; set; }
        public string Websitedown { get; set; }
        public string Iosdown { get; set; }
        public string Wincount { get; set; }
        public string flag { get; set; }

    }


    public class passenger
    {
        public string Fname { get; set; }

        public string Lname { get; set; }
        public int Age { get; set; }
        public int Sex { get; set; }
        public string datetime { get; set; }
        public int Pnr_Id { get; set; }
        public string Pnr_No { get; set; }
        public int Identityproof { get; set; }
    }
    public class Seats
    {
        public int Src_Id { get; set; }
        public int Des_Id { get; set; }
    }
    public class ResetPwd
    {
        public string Password { get; set; }

        public string NewPassword { get; set; }
    }

    public class book
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public string Username { get; set; }
        public string PhoneNumber { get; set; }
        public string EmailId { get; set; }
        public string src { get; set; }
        public string dest { get; set; }
        public string Gender { get; set; }
        public int Age { get; set; }
        public string Blocked { get; set; }


    }

    public class VehicleBooking
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public int UserId { get; set; }
        public int CompanyId { get; set; }
        public int BNo { get; set; }
        public int withluggage { get; set; }
        public int luggageweight { get; set; }
        public string BookingType { get; set; }

        public string ReqVehicle { get; set; }
        public string Customername { get; set; }
        public string CusID { get; set; }
        public string PhoneNo { get; set; }
        public string AltPhoneNo { get; set; }
        public string CAddress { get; set; }
        public string PickupAddress { get; set; }
        public string LandMark { get; set; }
        public string Package { get; set; }
        public string PickupPalce { get; set; }
        public string DropPalce { get; set; }
        public string ReqType { get; set; }
        public int ExtraCharge { get; set; }
        public int NoofVehicles { get; set; }
        public string ExecutiveName { get; set; }
        public int VID { get; set; }
        public string BookingStatus { get; set; }
        public string CustomerSMS { get; set; }
        public string CancelReason { get; set; }
        public decimal CBNo { get; set; }
        public string ModifiedBy { get; set; }
        public string CancelBy { get; set; }
        public string ReconfirmedBy { get; set; }
        public string AssignedBy { get; set; }

        public float lat { get; set; }
        public float lng { get; set; }
        public string Mobileotp { get; set; }

        public int VehicleGroupId { get; set; }
        public int VehicleTypeId { get; set; }
        public float Rating { get; set; }
        public int RatedBy { get; set; }
        public string Comments { get; set; }
        public string PMobNo { get; set; }
        public float latitude { get; set; }
        public float longitude { get; set; }
        public int SrcId { get; set; }
        public int DestId { get; set; }
        public string Src { get; set; }
        public string Dest { get; set; }
        public int PackageId { get; set; }
        public DateTime? Time { get; set; }
        public DateTime? Date { get; set; }
        public DateTime? ETA { get; set; }
        public string BookingId { get; set; }
        public DateTime? BookedDate { get; set; }
        public DateTime? BookedTime { get; set; }
        public DateTime? TravelDate { get; set; }
        public DateTime? TravelTime { get; set; }
        public DateTime? DepartueDate { get; set; }
        public DateTime? DepartureTime { get; set; }
        public float SrcLatitude { get; set; }
        public float SrcLongitude { get; set; }
        public float DestLatitude { get; set; }
        public float DestLongitude { get; set; }
        public int VechId { get; set; }
        public decimal Pricing { get; set; }
        public int DriverId { get; set; }
        public string DriverPhoneNo { get; set; }
        public string CustomerPhoneNo { get; set; }
        public int CustomerId { get; set; }
        public int NoofSeats { get; set; }
        public DateTime? ClosingDate { get; set; }
        public DateTime? ClosingTime { get; set; }
        public DateTime? CancelledOn { get; set; }
        public int cancellationType { get; set; }
        public string CancelledBy { get; set; }
        public string BookingChannel { get; set; }
        public string Reasons { get; set; }
        public String BVerificationCode { get; set; }
        public string OTPVerification { get; set; }
        public decimal Amount { get; set; }
        public string PaymentStatus { get; set; }
        public int PaymentModeId { get; set; }
        public string CouponCode { get; set; }
        public string EstPrice { get; set; }
        public string BookingOTP { get; set; }
        public int UpdatedBy { get; set; }
        public int UpdatedUserId { get; set; }
        public float DriverRating { get; set; }
        public int DriverRated { get; set; }
        public string DriverComments { get; set; }
        public decimal distance { get; set; }
        public int PaymentTypeId { get; set; }
    }

    public class driverdetails
    {
        public string flag { get; set; }
        public int DId { get; set; }
        public string Company { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Pin { get; set; }
        public string PermanentAddress { get; set; }
        public string PCity { get; set; }
        public string PermanentPin { get; set; }
        public float OffMobileNo { get; set; }
        public string Mobilenumber { get; set; }
        public DateTime DOB { get; set; }
        public DateTime DOJ { get; set; }
        public string BloodGroup { get; set; }
        public string LicenceNo { get; set; }
        public DateTime LiCExpDate { get; set; }
        public string BadgeNo { get; set; }
        public DateTime BadgeExpDate { get; set; }
        public string Remarks { get; set; }
        public string Photo { get; set; }
        public string licenseimage { get; set; }
        public string badgeimage { get; set; }
        public string FleetOwnerCode { get; set; }
        public string EmailId { get; set; }
        public string drivercode { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int CurrentStateId { get; set; }
        public string CountryId { get; set; }
        public string VehicleGroup { get; set; }


    }

    public class vehicledetails
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public int CompanyId { get; set; }
        public int VID { get; set; }
        public string RegistrationNo { get; set; }       
        public int VehicleTypeId { get; set; }
        public string OwnerName { get; set; }
        public string ChasisNo { get; set; }
        public string Engineno { get; set; }
        public string ModelYear { get; set; }      
        public DateTime EntryDate { get; set; }
        public float latitude { get; set; }
        public float longitude { get; set; }
        public string PMobNo { get; set; }
        public int VehicleModelId { get; set; }
        public int VehicleGroupId { get; set; }
        public string Photo { get; set; }
        public int StatusId { get; set; }
        public int FleetOwnerCode { get; set; }
        public int HasAC { get; set; }
        public int IsVerified { get; set; }
        public int isDriverOwned { get; set; }
        public string VehicleCode { get; set; }
        public int CountryId { get; set; }
        public int change { get; set; }
        public int type { get; set; }
    }

    public class travels
    {
        public string flag { get; set; }
        public int SlNo { get; set; }



        public int VechID { get; set; }
        public string RegistrationNo { get; set; }
        public string DriverName { get; set; }
        public string PartyName { get; set; }
        public string PickupPlace { get; set; }
        public string DropPlace { get; set; }
        public int StartMeter { get; set; }

        public string ExecutiveName { get; set; }
        public decimal BookingNo { get; set; }

        public string CloseStatus { get; set; }


    }

    public class allocatedriver
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public int CompanyId { get; set; }

        public int BookingNo { get; set; }
        public string CustomerName { get; set; }
        public string CusID { get; set; }
        public string PhoneNo { get; set; }
        public string AltPhoneNo { get; set; }
        public string Address { get; set; }
        public string PickupAddress { get; set; }
        public string LandMark { get; set; }
        public string PickupPlace { get; set; }
        public string DropPlace { get; set; }
        public string Package { get; set; }
        public string VehicleType { get; set; }
        public int NoofVehicle { get; set; }
        public int VechID { get; set; }
        public string RegistrationNo { get; set; }
        public string DriverName { get; set; }
        public string PresentDriverLandMark { get; set; }
        public string ExecutiveName { get; set; }
        public DateTime EffectiveDate { get; set; }
        public DateTime EffectiveTill { get; set; }
        public int DriverId { get; set; }
        public int VehicleModelId { get; set; }
        public int ServiceTypeId { get; set; }
        public int VehicleGroupId { get; set; }
        public int fleetId { get; set; }
    }
    public class cancel
    {
        public int BNo { get; set; }

        public string BookingStatus { get; set; }

        public string CancelReason { get; set; }

        public string CancelBy { get; set; }

    }

    public class BookingDetails
    {
        public int Id { get; set; }
        public string TicketNo { get; set; }
        public string TransId { get; set; }
        public string EmailId { get; set; }
        public string MobileNo { get; set; }
        public string AltMobileNo { get; set; }
        public string Address { get; set; }
        public DateTime? JourneyDate { get; set; }
        public DateTime? JourneyTime { get; set; }
        public decimal perunitprice { get; set; }
        public DateTime? ArrivalDate { get; set; }
        public DateTime? ArrivalTime { get; set; }
        public DateTime? DepartureDate { get; set; }
        public DateTime? DepartureTime { get; set; }
        public string Src { get; set; }
        public string Dest { get; set; }
        public int SrcId { get; set; }
        public int DestId { get; set; }
        public int RouteId { get; set; }
        public int VehicleId { get; set; }
        public int NoOfSeats { get; set; }
        public string Seats { get; set; }
        public string Status { get; set; }
        public int StatusId { get; set; }
        public string BookedBy { get; set; }
        public int BookedById { get; set; }
        public decimal Amount { get; set; }
        public string BookingType { get; set; }
        public int BookingTypeId { get; set; }
        public string JourneyType { get; set; }
        public int JourneyTypeId { get; set; }
        public int UserId { get; set; }
        public decimal distance { get; set; }
        public string insupddelflag { get; set; }

        public IEnumerable<BookedSeats> BookedSeats { get; set; }

    }
    public class BookedSeats
    {
        public int Id { get; set; }
        public int BookingId { get; set; }
        public string TicketNo { get; set; }
        public string SeatNo { get; set; }
        public int SeatId { get; set; }
        public int VehicleId { get; set; }
        public int Row { get; set; }

        public int Col { get; set; }

        public DateTime JourneyDate { get; set; }
        public DateTime JourneyTime { get; set; }
        public string Status { get; set; }
        public int StatusId { get; set; }
        public string FName { get; set; }
        public string LName { get; set; }
        public int Age { get; set; }
        public int Gender { get; set; }
        public string IdProof { get; set; }
        public string PassengerType { get; set; }
        public int PrimaryPassenger { get; set; }

        public string insupddelflag { get; set; }
    }
    public class BookedTicketDetails
    {
        public int Id { get; set; }
        public int BookingId { get; set; }
        public string TicketNo { get; set; }
        public string TransId { get; set; }
        public string EmailId { get; set; }
        public string MobileNo { get; set; }
        public string TicketContent { get; set; }
        public string insupddelflag { get; set; }
    }
    public class HourBase
    {
        public string insupddelflag { get; set; }
        public int Id { get; set; }
        public int VehicleTypeId { get; set; }
        public DateTime? FromTime { get; set; }
        public DateTime? ToTime { get; set; }
        public int PricingType { get; set; }
        public DateTime? FromDate { get; set; }
        public DateTime? ToDate { get; set; }
        public int CreatedBy { get; set; }
        public int UpdatedBy { get; set; }
        public int CountryId { get; set; }
        public int VehicleGroupId { get; set; }
        public int Hours { get; set; }
        public decimal price { get; set; }

    }
    public class VehicleDist
    {
        public string insupddelflag { get; set; }
        public int Id { get; set; }
        public string VehicleModelId { get; set; }
        public int FromKm { get; set; }
        public int ToKm { get; set; }
        public decimal Pricing { get; set; }
        public DateTime FromTime { get; set; }
        public DateTime ToTime { get; set; }
    }
    public class Vechlogin
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public int CompanyId { get; set; }

        public int VechId { get; set; }
        public string RegNo { get; set; }
        public string DriverName { get; set; }
        public string LoginLandMark { get; set; }
        public string CurrentLandMark { get; set; }
        public string StartKiloMtr { get; set; }
        public string CurStatus { get; set; }
        public string DriverMobileNo { get; set; }
        public string ExecutiveName { get; set; }
        public string Remarks { get; set; }
        public int GenratedAmount { get; set; }
        public int NoofTimesLogin { get; set; }
        public int TotalGeneratedAmount { get; set; }
        public string VechType { get; set; }
        public int VehicleModelId { get; set; }
        public int ServiceTypeId { get; set; }
        public int VehicleGroupId { get; set; }

    }

    public class vechlogout
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public int CompanyId { get; set; }
        public int VechId { get; set; }
        public string RegNo { get; set; }
        public string DriverName { get; set; }
        public string LoginLandMark { get; set; }
        public string CurrentLandMark { get; set; }
        public string EndMtr { get; set; }
        public string CurStatus { get; set; }
        public string DriverMobileNo { get; set; }
        public string ExecutiveName { get; set; }
        public string Remarks { get; set; }
        public int GenratedAmount { get; set; }
        public int NoofTimesLogin { get; set; }

        public int TotalGeneratedAmount { get; set; }

        public string VechType { get; set; }
        public int VehicleModelId { get; set; }
        public int ServiceTypeId { get; set; }
        public int VehicleGroupId { get; set; }


    }
    public class drivers
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public int DId { get; set; }
        public int VId { get; set; }
        public int CompanyId { get; set; }
        public String Reason { get; set; }
        public String Status { get; set; }

        public float LoginLatitude { get; set; }

        public float LoginLongitude { get; set; }
        public float LogoutLatitude { get; set; }

        public float LogoutLongitude { get; set; }
        public int loginlogout { get; set; }
        public string DriverNo { get; set; }
    }
    public class paymentdetails
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public int PaymentId { get; set; }
        public string cardcategory { get; set; }
        public string status { get; set; }
        public int gatewayid { get; set; }
        public string transactiontype { get; set; }


        public string servicetype { get; set; }

        public int Transactionid { get; set; }
        public string Transaction_Number { get; set; }
        public int Amount { get; set; }
        public int Paymentmode { get; set; }

        public int Pnr_Id { get; set; }
        public string Pnr_No { get; set; }
        public string Gateway_transId { get; set; }
        public int TransactionStatus { get; set; }
    }

    public class balance
    {
        public string flag { get; set; }
        public string mobileno { get; set; }
        public decimal Amount { get; set; }
    }

    public class ewallet
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public int transhistoryid { get; set; }
        public decimal Amount { get; set; }
        public string TransactionType { get; set; }

        public string Status { get; set; }
        public string Comment { get; set; }
        public DateTime? Date { get; set; }
        public DateTime? Time { get; set; }
        public int TransrefId { get; set; }
        public string MobileNo { get; set; }
        public string AccountNo { get; set; }
        public DateTime UpdatedOn { get; set; }
        public DateTime CreatedOn { get; set; }

        public object Details { get; set; }

        public string TransactionId { get; set; }

        public string TransactionMode { get; set; }
        public string GatewayTransId { get; set; }
    }

    public class Taxi
    {

        public string flag { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal latitude { get; set; }
        public decimal longitude { get; set; }
    }
    public class VehicleDistancePriceConfiguration
    {
        public string SourceLoc { get; set; }
        public string DestinationLoc { get; set; }
        public float SourceLat { get; set; }
        public float SourceLng { get; set; }
        public float DestinationLat { get; set; }
        public float DestinationLng { get; set; }
        public string VehicleModelId { get; set; }
        public string VehicleTypeId { get; set; }
        public string PricingTypeId { get; set; }

        public float UnitPrice { get; set; }
        public float Amount { get; set; }
        public string flag { get; set; }
        public int srcid { get; set; }
        public int destid { get; set; }
    }

    public class VehicleDocuments
    {
        public int Id { get; set; }

        public int VehicleId { get; set; }

        public string FileName { get; set; }

        public int DocTypeId { get; set; }

        public DateTime ExpiryDate { get; set; }

        public int UpdatedById { get; set; }

        public DateTime DueDate { get; set; }

        public string FileContent { get; set; }

        public string change { get; set; }

        public int loggedinUserId { get; set; }
        public string DocumentNo { get; set; }
        public string DocumentNo2 { get; set; }
        public int isVerified { get; set; }
    }

    public class DriverDocuments
    {

        public int Id { get; set; }

        public int DriverId { get; set; }
        public string FileName { get; set; }

        public int DocTypeId { get; set; }

        public DateTime ExpiryDate { get; set; }
        public int CreatedById { get; set; }
        public int UpdatedById { get; set; }

        public DateTime DueDate { get; set; }

        public string FileContent { get; set; }
        public string change { get; set; }

        public int loggedinUserId { get; set; }
        public string DocumentNo { get; set; }
        public string DocumentNo2 { get; set; }
        public int isVerified { get; set; }
    }
    public class bankdetails
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public string Accountnumber { get; set; }
        public string BankName { get; set; }
        public string BranchAddress { get; set; }
        public string Bankcode { get; set; }
        public string Country { get; set; }
        public int IsActive { get; set; }
        public int IsPrimary { get; set; }
        public int DriverId { get; set; }
        public string Code { get; set; }
        public string QRCode { get; set; }
    }

    public class SOSNumber
    {

        public string flag { get; set; }

        public int Id { get; set; }

        public int UserId { get; set; }

        public string MobileNumber { get; set; }

        public int UserTypeId { get; set; }

        public string Username { get; set; }

        public int Active { get; set; }

        public int MobiOrder { get; set; }
    }
    public class ConfigData
    {
        public int includeStatus { get; set; }
        public int includeCategories { get; set; }
        public int includeLicenseCategories { get; set; }
        public int includeVehicleGroup { get; set; }
        public int includeGender { get; set; }
        public int includeFrequency { get; set; }
        public int includePricingType { get; set; }
        public int includeTransactionType { get; set; }
        public int includeApplicability { get; set; }
        public int includeFeeCategory { get; set; }
        public int includeTransChargeType { get; set; }
        public int includeVehicleType { get; set; }
        public int includeVehicleModel { get; set; }
        public int includeVehicleMake { get; set; }
        public int includeDocumentType { get; set; }
        public int includePaymentType { get; set; }
        public int includeMiscellaneousTypes { get; set; }
        public int includeCardCategories { get; set; }
        public int includeCardTypes { get; set; }
        public int includeVehicleLayoutType { get; set; }
        public int includeLicenseFeatures { get; set; }
        public int includeCardModels { get; set; }
        public int includeCards { get; set; }
        public int includeTransactions { get; set; }
        public int includeCountry { get; set; }
        public int includeActiveCountry { get; set; }
        public int includeFleetOwner { get; set; }
        public int includeUserType { get; set; }
        public int includeBusinessAppUserTypes { get; set; }
    }
   
    public class SOSMessage
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public int UserId { get; set; }
        public int UserTypeId { get; set; }
        public string SentTo { get; set; }
        public int MessageId { get; set; }
        public string Message { get; set; }
        public DateTime SentOn { get; set; }
        public TimeSpan SentTime { get; set; }
        public int StatusId { get; set; }
        public string Otp { get; set; }
        public DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public float Latitude { get; set; }
        public float Longitude { get; set; }
        public string Mobilenumber { get; set; }
    }

    
    public class Approvals
    {
        public string change { get; set; }
        public int IsApproved { get; set; }
        public string MobileNo { get; set; }
        public string RegistrationNo { get; set; }
        public string Email { get; set; }
        
    }

    public class CustomerAccounts
    {
        public string insUpdDelflag { get; set; }
        public int Id { get; set; }
        public int UserId { get; set; }
        public int UserTypeId { get; set; }
        public int PaymentModeId { get; set; }
        public string AccountNumber { get; set; }        
        public string HolderName { get; set; }
        public string code { get; set; }
        public string ExpMonth { get; set; }
        public string ExpYear { get; set; }
        public string AccountCode { get; set; }
        public string AccountType { get; set; }
        public int IsPrimary { get; set; }
        public int IsVerified { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime UpdatedOn { get; set; }
        public string BVerificationCode { get; set; }
        public string OtpVerfied { get; set; }
        public int Active { get; set; }
        public int CountryId { get; set; }
        public string Mobilenumber { get; set; }
       
    }


    public class TripPayment
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public int BNo { get; set; }
        public decimal Amount { get; set; }
        public int StatusId { get; set; }
        public string GatewayTransId { get; set; }
        public DateTime? TransDate { get; set; }
        public int PaymentModeId { get; set; }
        public string Comments { get; set; }
        public int CustAccountId { get; set; }
        public int AppUserId { get; set; }
        public string CouponCode { get; set; }
    }
    public class Transmaster
    {
        public int Id { get; set; }
        public decimal Amount { get; set; }
        public int StatusId { get; set; }
        public decimal Charges { get; set; }
        public decimal Discount { get; set; }
        public decimal TotalAmount { get; set; }
        public int TransferId { get; set; }
        public string TransGatewayId { get; set; }
        public int TransCatId { get; set; }
        public int TransModeId { get; set; }
        public int TransactionTypeId { get; set; }
        public string AccountNumber { get; set; }
        public string HolderName { get; set; }
        public string Code { get; set; }
        public string ExpMonth { get; set; }
        public string ExpYear { get; set; }
        public string AccountCode { get; set; }
        public string TransCode { get; set; }
        public string Mobileno { get; set; }
    }
    public class FleetOwnerRequest
    {
        //user details

        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string PhoneNo { get; set; }
        public string AltPhoneNo { get; set; }
        public string EmailAddress { get; set; }
        public string Address { get; set; }
        public int Gender { set; get; }

        public string userPhoto { get; set; }

        //Company details
        public string CompanyName { get; set; }
        public string CmpEmailAddress { get; set; }
        public string CmpTitle { get; set; }
        public string CmpCaption { get; set; }
        public string FleetSize { set; get; }
        public int StaffSize { get; set; }
        public string Country { get; set; }
        public string Code { get; set; }
        public string CmpFax { get; set; }
        public string CmpAddress { get; set; }
        public string CmpAltAddress { get; set; }
        public string state { get; set; }
        public string ZipCode { get; set; }
        public string CmpPhoneNo { set; get; }
        public string CmpAltPhoneNo { set; get; }
        public string CurrentSystemInUse { set; get; }
        public string howdidyouhearaboutus { get; set; }
        public string SendNewProductsEmails { set; get; }
        public int Agreetotermsandconditions { get; set; }


        public string CmpLogo { get; set; }

        public string insupdflag { get; set; }
    }
    public class LicenseTypes
    {
        public int Id { set; get; }
        public string LicenseType { set; get; }
        public string LicenseCode { set; get; }
        public int LicenseCategoryId { set; get; }
        public int Active { set; get; }
        public string Desc { set; get; }
        public string LicenseCategory { set; get; }
        public DateTime? fromDate { get; set; }
        public DateTime? toDate { get; set; }
        public int LicenseId { get; set; }
        public int LicensePricingId { get; set; }
        public String RenewalFreqType { get; set; }
        public int RenewalFreqTypeId { get; set; }
        public int RenewalFreqUnit { get; set; }
        public string RenewalFreq { get; set; }
        public decimal UnitPrice { get; set; }
        public DateTime? Pfromdate { get; set; }
        public DateTime? Ptodate { get; set; }

        public int PActive { get; set; }
        public string insupddelflag { get; set; }

        //license pos      
        public int LPOSId { get; set; }
        public int BTPOSTypeId { get; set; }
        public int NoOfUnits { get; set; }
        public string POSType { get; set; }
        public String POSLabel { get; set; }
        public String POSLabelClass { get; set; }
        public DateTime? POSfromdate { get; set; }
        public DateTime? POStodate { get; set; }
        public int POSActive { get; set; }

    }
    public class LicensePricing
    {
        public int LicenseId { get; set; }
        public String RenewalFreqType { get; set; }
        public int RenewalFreqTypeId { get; set; }
        public int RenewalFreqUnit { get; set; }
        public string RenewalFreq { get; set; }
        public decimal UnitPrice { get; set; }
        public DateTime? fromdate { get; set; }
        public DateTime? todate { get; set; }
        public int Id { get; set; }

        public int categoryid { get; set; }
        public int Active { get; set; }
        public string insupddelflag { get; set; }
    }
    public class ULLicense
    {
        public int Id { set; get; }
        public int ULId { set; get; }
        public string TransId { set; get; }
        public DateTime? CreatedOn { set; get; }
        public decimal Amount { set; get; }
        public decimal UnitPrice { set; get; }
        public decimal Units { set; get; }
        public int StatusId { set; get; }
        public int LicensePymtTransId { set; get; }
        public int IsRenewal { set; get; }
        public string insupddelflag { set; get; }
    }
    public class ULPTrasaction
    {
        public int Id { get; set; }
        public string TransId { set; get; }
        public string GatewayTransId { set; get; }
        public DateTime? TransDate { set; get; }
        public int ULPymtId { set; get; }
        public string Desc { set; get; }
        public Decimal Tax { set; get; }
        public Decimal Discount { set; get; }
        public int PymtTypeId { set; get; }
        public string Amount { set; get; }
        public int StatusId { set; get; }
        //public string LicensePymtTransId { set; get; }
        public string insupddelflag { set; get; }

    }
    public class UserLicenseDetails
    {
        public List<ULLicense> checkSchedule { get; set; }
        public int Id { set; get; }
        public int UserId { set; get; }
        public int FOId { set; get; }
        public string FOCode { set; get; }
        public int LicenseTypeId { set; get; }
        public DateTime? StartDate { set; get; }
        public DateTime? ExpiryOn { set; get; }
        public int GracePeriod { set; get; }
        public DateTime? ActualExpiry { set; get; }
        public DateTime? LastUpdatedOn { set; get; }
        public int Active { set; get; }
        public int RenewFreqTypeId { set; get; }
        public int StatusId { set; get; }

        public string insupddelflag { set; get; }

    }
    public class ULConfirmDetails
    {
        public int Id { set; get; }
        public int ULId { set; get; }
        public int ULPymtId { set; get; }
        public int foId { set; get; }
        public int userId { set; get; }
        public string TransId { set; get; }
        public string GatewayTransId { set; get; }
        public int itemId { set; get; }
        public string address { set; get; }
        public decimal Amount { set; get; }
        public decimal Units { set; get; }
        public decimal POSUnits { set; get; }
        public int IsRenewal { set; get; }
        public string insupddelflag { set; get; }
    }
    public class BusinessUserStafff
    {
        public int Id { get; set; }
        public string flag { get; set; }
        public int id { get; set; }
        public int userId { get; set; }
        public string Username { get; set; }

        public string Email { get; set; }
        public string Mobilenumber { get; set; }
        public string Password { get; set; }
        public String EVerificationCode { get; set; }
        public DateTime EVerifiedOn { get; set; }
        public int IsEmailVerified { get; set; }
        public String MVerificationCode { get; set; }
        public string Passwordotp { get; set; }
        public DateTime MVerifiedOn { get; set; }
        public int IsMobileVerified { get; set; }

        public DateTime CreatedOn { get; set; }
        public int ENoOfAttempts { get; set; }
        public int MNoOfAttempts { get; set; }
        public string Firstname { get; set; }
        public string lastname { get; set; }
        public int AuthTypeId { get; set; }
        public string AltPhonenumber { get; set; }
        public string Altemail { get; set; }
        public string AccountNo { get; set; }
        public string NewPassword { get; set; }
        public object Mobileotp { get; set; }

        public object Emailotp { get; set; }

        public int Gender { get; set; }
        public string UserPhoto { get; set; }

        public decimal Amount { get; set; }
        public int CountryId { get; set; }
        public int PaymentModeId { get; set; }
        public int CurrentStateId { get; set; }
        public int Active { get; set; }
        public string CCode { get; set; }
        public string UserAccountNo { get; set; }
        public int UserTypeId { get; set; }

    }
    public class roledetails
    {
        public int Id { get; set; }


        public string Name { get; set; }

        public string Path { get; set; }

    }
    public class roles
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Active { get; set; }
        public string IsPublic { get; set; }
        public string Company { get; set; }
        public int CompanyId { get; set; }


    }
    public class CardsGroup
    {

        public CardsGroup[] cg = null;
        //public List<VehiclesGroups> list3 { get; set; }
        public int Id { get; set; }
        public string CardNumber { get; set; }
        public string CardModel { get; set; }
        public string CardType { get; set; }
        public string CardCategory { get; set; }
        public int Status { get; set; }
        public int UserId { get; set; }
        public string Customer { get; set; }
        public DateTime? EffectiveFrom { get; set; }
        public DateTime? EffectiveTo { get; set; }
        public string insupdflag { get; set; }
       
    }
    public class airlines
    {
        public int Id { get; set; }
        public string name { get; set; }
        public string desce { get; set; }
        public string code { get; set; }
        public int active { get; set; }
        public string flag { get; set; }
    }
    public class airport
    {
        public int Id { get; set; }
        public string name { get; set; }
        public string desce { get; set; }
        public string code { get; set; }
        public int active { get; set; }
        public string flag { get; set; }
        public decimal longitude { set; get; }
        public decimal latitude { set; get; }
        public string countryid { set; get; }

    }
    public class fbpricing
    {
        public int Id { get; set; }
        public string routeid { get; set; }
        public string airlineid { get; set; }
        public decimal amount { get; set; }
        public decimal taxes { get; set; }
        public decimal discounts { get; set; }
        public string flag { set; get; }
        public DateTime ?fromdate { set; get; }
        public DateTime ?todate { set; get; }

    }
    public class fbrouting
    {
        public int Id { get; set; }
        public string srcPortid { get; set; }
        public string destPortid { get; set; }
        public string RouteCode { get; set; }
        public decimal distance { get; set; }
        public decimal discounts { get; set; }
        public string flag { set; get; }
        public DateTime? fromdate { set; get; }
        public DateTime? todate { set; get; }

    }
    public class fbtax
    {
        public int Id { get; set; }
        public string routeid { get; set; }
        public string airlineid { get; set; }
        public string ChargeType { get; set; }
        public decimal amount { get; set; }
        public decimal discounts { get; set; }
        public string flag { set; get; }
        public DateTime? fromdate { set; get; }
        public DateTime? todate { set; get; }
    }
    public class flight
    {
        public int Id { get; set; }
        public string flightseatingid { get; set; }
        public string flightscheduleid { get; set; }
        public int passengerid { get; set; }
        public int fbTransMasterid { get; set; }
        public string SentSMS { get; set; }
        public string flag { set; get; }
        public string SentEmail { set; get; }
      
    }
    public class fly
    {
        public int Id { get; set; }
        public string code { get; set; }
        public string type { get; set; }
        public int airlineid { get; set; }
        public int capacity { get; set; }
        public string rows { get; set; }
        public string flag { set; get; }
        public string cols { set; get; }
       // public DateTime? todate { set; get; }

    }

    public class flightschedule
    {
        public int Id { get; set; }
        public string flightid { get; set; }
        public string FBRoutingId { get; set; }
        public string weekdays { get; set; }
       // public int capacity { get; set; }
       // public int rows { get; set; }
        public string flag { set; get; }
       // public int cols { set; get; }
        public DateTime arrivaltime { set; get; }
        public DateTime depttime { set; get; }
        public DateTime interval { set; get; }
        public int srcid { get; set; }
        public int destid { get; set; }

    }
    public class flightseating
    {
        public int Id { get; set; }
        public string flightid { get; set; }
        public string rowid { get; set; }
        public string columnid { get; set; }
        public string seatno { get; set; }
        public string seattype { get; set; }
        public string flag { set; get; }
        public string category { set; get; }
        public DateTime? arrivaltime { set; get; }
        public DateTime? depttime { set; get; }
        public DateTime? interval { set; get; }

    }
    public class passengerfight
    {
        public int Id { get; set; }
        public string name { get; set; }
        public int age { get; set; }
        public string gender { get; set; }
        public string appuserid { get; set; }
        public string passengercode { get; set; }
        public string flag { set; get; }

    }
    public class FBTra
    {
        public int Id { get; set; }
        public string TransId { get; set; }
        public decimal TotalAmt { get; set; }
        public string PaymentId { get; set; }
        public string BTPOSid { get; set; }
        public string flag { set; get; }

    }
    public class FBTranMaster
    {
        public int Id { get; set; }
        public DateTime? TransactionDate { get; set; }
        public DateTime? TransactionTime { get; set; }
        public decimal Amount { get; set; }
        public int StatusId { get; set; }
        public decimal Charges { get; set; }
        public decimal Discount { get; set; }
        public decimal TotalAmount { get; set; }
        public int TransRefId { set; get; }
        public int TransGatewayId { get; set; }
        public int TransCatId { get; set; }
        public int TransModeId { set; get; }

        public int TransactionTypeId { get; set; }
        public string AccountNumber { get; set; }
        public string HolderName { get; set; }
        public string Code { get; set; }
        public string ExpMonth { get; set; }
        public string ExpYear { set; get; }
        public string AccountCode { get; set; }
        public string TransCode { get; set; }
        public string flag { set; get; }

    }
}


