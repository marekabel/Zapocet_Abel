using Zapocet_Abel.Services.Interfaces;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Net;
using Microsoft.AspNetCore.Mvc;

namespace Zapocet_Abel.Filters
{
    public class IdentityFilter : Attribute, IResourceFilter
    {

        public void OnResourceExecuted(ResourceExecutedContext context)
        {

        }

        public void OnResourceExecuting(ResourceExecutingContext context)
        {
            IIdentityService _identityService;
            var service = context.HttpContext.RequestServices.GetService(typeof(IIdentityService));

            if (service != null)
            {

                _identityService = (IIdentityService)service;

                var token = context.HttpContext.Request.Headers
                    .Where(x => x.Key == "Security-Identifier"
                    ).FirstOrDefault();

                var result = _identityService.TokenisValid(token.Value.ToString());

                if (!result)
                {
                    context.Result = new ContentResult()
                    {
                        StatusCode = (int)HttpStatusCode.Unauthorized
                    };
                }
            }
            else
            {
                context.Result = new ContentResult()
                {
                    StatusCode = (int)420
                };

            }

        }
    }
}
