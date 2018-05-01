using System.Net.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace School.WebApi.Attribute
{
    public class ValidationActionFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            var modelState = actionContext.ModelState;

            if (!modelState.IsValid)
                actionContext.Response = actionContext.Request
                     .CreateErrorResponse(System.Net.HttpStatusCode.BadRequest, modelState);
        }


    }
}