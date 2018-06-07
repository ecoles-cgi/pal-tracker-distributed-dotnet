using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.DependencyInjection;

namespace AuthDisabler
{
    public static class AuthDisablerServiceCollectionExtensions
    {
        public static void DisableClaimsVerification(this IServiceCollection services)
        {
            if (services == null)
            {
                throw new ArgumentNullException(nameof(services));
            }

            services.AddSingleton<IAuthorizationHandler>(sp => new AllowAllClaimsAuthorizationHandler());
        }
    }
}