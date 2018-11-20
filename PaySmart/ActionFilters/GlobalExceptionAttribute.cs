using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Filters;
using System.Web.Http;
using System.Web.Http.Tracing;
using Paysmart.Helpers;
using System.ComponentModel.DataAnnotations;
using System.Net.Http;
using System.Net;

namespace Paysmart.ActionFilters
{
    /// <summary>  
    /// Action filter to handle for Global application errors.  
    /// </summary>  
    public class GlobalExceptionAttribute : ExceptionFilterAttribute
    {
        public override void OnException(HttpActionExecutedContext context)
        {
            GlobalConfiguration.Configuration.Services.Replace(typeof(ITraceWriter), new NLogger());
            var trace = GlobalConfiguration.Configuration.Services.GetTraceWriter();
            trace.Error(context.Request, "Controller : " + context.ActionContext.ControllerContext.ControllerDescriptor.ControllerType.FullName + Environment.NewLine + "Action : " + context.ActionContext.ActionDescriptor.ActionName, context.Exception);

            var exceptionType = context.Exception.GetType();

            if (exceptionType == typeof(ValidationException))
            {
                var resp = new HttpResponseMessage(HttpStatusCode.BadRequest) { Content = new StringContent(context.Exception.Message), ReasonPhrase = "ValidationException", };
                throw new HttpResponseException(resp);

            }
            else if (exceptionType == typeof(UnauthorizedAccessException))
            {
                //throw new HttpResponseException(context.Request.CreateResponse(HttpStatusCode.Unauthorized, new ApiException( (int)HttpStatusCode.Unauthorized, "UnAuthorized", HttpStatusCode.ExpectationFailed, "UnAuthorized Access" )));
                throw new HttpResponseException(context.Request.CreateResponse(HttpStatusCode.Unauthorized, new ServiceStatus() { StatusCode = (int)HttpStatusCode.Unauthorized, StatusMessage = "UnAuthorized", ReasonPhrase = "UnAuthorized Access" }));
            }
            else if (exceptionType == typeof(ApiException))
            {
                var webapiException = context.Exception as ApiException;
                if (webapiException != null)
                    throw new HttpResponseException(context.Request.CreateResponse(webapiException.HttpStatus, new ServiceStatus() { StatusCode = webapiException.ErrorCode, StatusMessage = webapiException.ErrorDescription, ReasonPhrase = webapiException.ReasonPhrase }));
                //throw new HttpResponseException(context.Request.CreateResponse(webapiException.HttpStatus, new ApiException( webapiException.ErrorCode, webapiException.ErrorDescription, HttpStatusCode.ExpectationFailed)));
            }
            else
            {
                throw new HttpResponseException(context.Request.CreateResponse(HttpStatusCode.InternalServerError));
            }
        }
    }
}