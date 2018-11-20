using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace Paysmart.Areas.HelpPage
{
    public interface IModelDocumentationProvider
    {

        
            string GetDocumentation(MemberInfo member);

            string GetDocumentation(Type type);
       

}
}