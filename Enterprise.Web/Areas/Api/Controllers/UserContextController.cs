using Sheng.Enterprise.Core;
using Sheng.Enterprise.Infrastructure;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Enterprise.Web.Areas.Api.Controllers
{
	public class UserContextController : EnterpriseController
	{
		private static readonly UserManager _userManager = UserManager.Instance;

		private static readonly DomainManager _domainManager = DomainManager.Instance;

		[AllowAnonymous]
		[HttpPost("Api/{controller}/{action}")]
		public ActionResult Login()
		{
			LoginArgs loginArgs = RequestArgs<LoginArgs>();
			if (loginArgs == null)
			{
				return RespondResult(false, "参数无效。");
			}
			User user = _userManager.Verify(loginArgs.Account, loginArgs.Password);
			if (user == null)
			{
				return RespondResult(false, "帐号或密码错误。");
			}
			Domain domain = _domainManager.GetDomain(user.DomainId);
		    AuthorizationWrapper authorizationWrapper = new AuthorizationWrapper
		    {
		        AuthorizationList = _userManager.GetAuthorizationListByUser(user.Id)
		    };
		    UserContext userContext = new UserContext(user, domain)
		    {
		        RootOrganization = _domainManager.GetOrganization(domain.Id),
		        Authorization = authorizationWrapper,
		        RoleList = _userManager.GetRoleListByUser(user.Id),
		        Organization = _domainManager.GetOrganization(user.OrganizationId)
		    };
		    SessionContainer.SetUserContext(HttpContext, userContext);
			return RespondResult();
		}

		[AllowAnonymous]
		[HttpGet("Api/UserContext/GetValidateCode")]
		public ActionResult GetValidateCode()
		{
			ValidateCode code = new ValidateCode();
			string text = code.CreateValidateCode(5);
            HttpContext.Session.SetString("ValidateCode", text);
			byte[] fileContents = code.CreateValidateGraphic(text);
			return File(fileContents, "image/jpeg");
		}

		[HttpGet("Api/UserContext/Heartbeat")]
		public ActionResult Heartbeat()
		{
			return RespondResult();
		}
	}
}
