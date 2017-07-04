using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Paysmart.Models
{
    public class Model
    {
        public string flag { get; set; }
        public int id { get; set; }
        public string Mobilenumber { get; set; }
        public string Mobileotp { get; set; }
        public string Email { get; set; }


        public object Emailotp { get; set; }
    }
    public class Model1
    {
        public string flag { get; set; }
        public int id { get; set; }
        public string Email { get; set; }
        public string Emailotp { get; set; }
        public string Mobilenumber { get; set; }


      
    }
    public class Model2
    {
        public string flag { get; set; }
        public int id { get; set; }
        public string Password { get; set; }
        public string Passwordotp { get; set; }
        public string Mobilenumber { get; set; }



    }
    public class Userlogin
    {
        public string flag { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }




    }
    public class Register
    {
        public string flag { get; set; }

        public int id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Mobilenumber { get; set; }
        public string Password { get; set; }
       

    }

    public class UserLogin
    {


        public string Mobilenumber { get; set; }
        public string Password { get; set; }

    }
}