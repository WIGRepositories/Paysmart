using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.Web;

namespace Paysmart.Helpers
{
    /// <summary>  
    /// Api Business Exception  
    /// </summary>  
    [Serializable]
    [DataContract]
    public class ApiException : Exception, IApiExceptions
    {
        #region Public Serializable properties.  
        [DataMember]
        public int ErrorCode { get; set; }
        [DataMember]
        public string ErrorDescription { get; set; }
        [DataMember]
        public HttpStatusCode HttpStatus { get; set; }

        string reasonPhrase = "ApiException";

        [DataMember]
        public string ReasonPhrase
        {
            get { return this.reasonPhrase; }

            set { this.reasonPhrase = value; }
        }
        #endregion

        #region Public Constructor.  
        /// <summary>  
        /// Public constructor for Api Business Exception  
        /// </summary>  
        /// <param name="errorCode"></param>  
        /// <param name="errorDescription"></param>  
        /// <param name="httpStatus"></param>  
        public ApiException(int errorCode, string errorDescription, HttpStatusCode httpStatus)
        {
            ErrorCode = errorCode;
            ErrorDescription = errorDescription;
            HttpStatus = httpStatus;
        }

        public ApiException(int errorCode, string errorDescription, HttpStatusCode httpStatus,string reasonPhrase)
        {
            ErrorCode = errorCode;
            ErrorDescription = errorDescription;
            HttpStatus = httpStatus;
            this.reasonPhrase = reasonPhrase;
        }
        #endregion

    }
}