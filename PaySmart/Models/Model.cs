﻿using System;
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
    }

    public class UserAccount
    {

        public string flag { get; set; }
        public int id { get; set; }
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
    }
    public class UserLogin
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

    public class payments
    {
        public int Transactionid { get; set; }
        public string Transaction_Number { get; set; }
        public int Amount { get; set; }
        public int Paymentmode { get; set; }

        public int Pnr_Id { get; set; }
        public string Pnr_No { get; set; }
        public string Gateway_transId { get; set; }
        public int TransactionStatus { get; set; }

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
        public int CompanyId { get; set; }
        public int BNo { get; set; }
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
        public string RatedBy { get; set; }
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
        public DateTime? DepartueDate { get; set; }
        public DateTime? DepartueTime { get; set; }
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
        public DateTime? CancelledOn { get; set; }
        public int cancellationType { get; set; }
        public string CancelledBy { get; set; }
        public string BookingChannel { get; set; }
        public string Reasons { get; set; }
        public String BVerificationCode { get; set; }
        public string OTPVerification { get; set; }
        public decimal Amount { get; set; }
        public string PaymentStatus { get; set; }
        public string BookingOTP { get; set; }
        public int UpdatedBy { get; set; }
        public int UpdatedUserId { get; set; }
    }

    public class driverdetails
    {
        public string flag { get; set; }
        public int id { get; set; }
        public int CompanyId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Pin { get; set; }
        public string PAddress { get; set; }
        public string PCity { get; set; }
        public string PPin { get; set; }
        public float OffMobileNo { get; set; }
        public string PMobNo { get; set; }
        public DateTime DOB { get; set; }
        public DateTime DOJ { get; set; }
        public string BloodGroup { get; set; }
        public string LicenceNo { get; set; }
        public DateTime LiCExpDate { get; set; }
        public string BadgeNo { get; set; }
        public DateTime BadgeExpDate { get; set; }
        public string Remarks { get; set; }
    }

    public class vehicledetails
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public int CompanyId { get; set; }
        public int VID { get; set; }
        public string RegistrationNo { get; set; }
        public string Type { get; set; }
        public string OwnerName { get; set; }
        public string ChasisNo { get; set; }
        public string Engineno { get; set; }
        public string WirelessFleetNo { get; set; }
        public string AllotmentType { get; set; }
        public float RoadNo { get; set; }
        public DateTime RoadTaxDate { get; set; }
        public string InsuranceNo { get; set; }
        public DateTime InsDate { get; set; }
        public string PolutionNo { get; set; }
        public DateTime PolExpDate { get; set; }
        public string RCBookNo { get; set; }
        public DateTime RCExpDate { get; set; }
        public int CompanyVechile { get; set; }
        public string OwnerPhoneNo { get; set; }
        public string HomeLandmark { get; set; }
        public DateTime ModelYear { get; set; }
        public string DayOnly { get; set; }
        public string DayNight { get; set; }
        public string InsProvider { get; set; }
        public string VechMobileNo { get; set; }
        public DateTime EntryDate { get; set; }
        public string NewEntry { get; set; }
        public string AirPortCab { get; set; }
        public string deletedVech { get; set; }
        public string Carrier { get; set; }
        public string PayGroup { get; set; }
        public float latitude { get; set; }
        public float longitude { get; set; }
        public string PMobNo { get; set; }

        public int VehicleModelId { get; set; }
        public int ServiceTypeId { get; set; }
        public int VehicleGroupId { get; set; }
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
        public int VehicleModelId { get; set; }
        //public string VehicleModel { get; set; }
        public string Hours { get; set; }
        public DateTime FromTime { get; set; }
        public DateTime ToTime { get; set; }
        public decimal Price { get; set; }

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
}


