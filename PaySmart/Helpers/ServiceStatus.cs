using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Paysmart.Helpers
{
        
        [Serializable]
        [DataContract]
        public class ServiceStatus
        {
            #region 属性
            
            [DataMember]
            public int StatusCode { get; set; }

            
            [DataMember]
            public string StatusMessage { get; set; }

         
            [DataMember]
            public string ReasonPhrase { get; set; }

            #endregion
        
        
    }
}