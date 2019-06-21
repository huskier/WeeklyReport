using Sheng.Enterprise.Infrastructure;
using Microsoft.AspNetCore.Http;

namespace Enterprise.Web
{
	public static class AuthorizationHelper
	{
		public static bool Verify(string key, HttpContext httpContext)
		{
			UserContext userContext = SessionContainer.GetUserContext(httpContext);
			return userContext.RoleList == null || userContext.RoleList.Count == 0 || userContext.Authorization.Verify(key);
		}
	}
}
