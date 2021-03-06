using Sheng.Enterprise.Core;
using Sheng.Enterprise.Infrastructure;
using System;
using System.Text;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Enterprise.Web.Areas.Api.Controllers
{
	public class UserController : EnterpriseController
	{
		private UserManager _userManager = UserManager.Instance;

		private static readonly DomainManager _domainManager = DomainManager.Instance;

		[AllowAnonymous]
		[HttpPost("Api/User/Register")]
		public ActionResult Register()
		{
			UserRegisterArgs userRegisterArgs = RequestArgs<UserRegisterArgs>();
			if (userRegisterArgs == null)
			{
				return RespondResult(false, "参数无效。");
			}

            if (!HttpContext.Session.TryGetValue("ValidateCode", out var value))
            {
                return RespondResult(false, "验证码无效。");
            }
			if (Encoding.UTF8.GetString(value) != userRegisterArgs.ValidateCode)
			{
				return RespondResult(false, "验证码无效。");
			}
			UserRegisterResult userRegisterResult = _userManager.Register(userRegisterArgs);
			if (userRegisterResult.Result == UserRegisterResultEnum.Success)
			{
			    UserContext userContext = new UserContext(userRegisterResult.User, userRegisterResult.Domain)
			    {
			        RootOrganization = UserController._domainManager.GetOrganization(userRegisterResult.Domain.Id),
			        Authorization = new AuthorizationWrapper(),
			        Organization = UserController._domainManager.GetOrganization(userRegisterResult.User.OrganizationId)
			    };
			    SessionContainer.SetUserContext(HttpContext, userContext);
				return RespondResult();
			}
			ApiResult apiResult = new ApiResult
			{
				Success = false
			};
			switch (userRegisterResult.Result)
			{
			case UserRegisterResultEnum.Unknow:
				apiResult.Message = "未知错误。";
				break;
			case UserRegisterResultEnum.AccountInUse:
				apiResult.Message = "帐户被占用，请尝试其它帐户名称。";
				break;
			case UserRegisterResultEnum.UserInfoInvalid:
				apiResult.Message = "帐户被占用，用户信息无效。";
				break;
			}
			return RespondResult(apiResult);
		}

		[HttpPost("Api/User/GetUserList")]
		public ActionResult GetUserList()
		{
			GetUserListArgs getUserListArgs = RequestArgs<GetUserListArgs>();
			if (getUserListArgs == null)
			{
				return RespondResult(false, "参数无效。");
			}
			getUserListArgs.DomainId = UserContext.Domain.Id;
			GetItemListResult userList = _userManager.GetUserList(getUserListArgs);
			return RespondDataResult(userList);
		}

		[HttpPost("Api/User/Update")]
		public ActionResult Update()
		{
			UserDto userDto = RequestArgs<UserDto>();
			if (userDto == null)
			{
				return RespondResult(false, "参数无效。");
			}
			User user = userDto.User;
			UserOperatorResult userOperatorResult = _userManager.Update(user, userDto.WorkTypeList);
			if (userOperatorResult == UserOperatorResult.Success)
			{
				return RespondResult();
			}
			ApiResult apiResult = new ApiResult
			{
				Success = false
			};
			if (userOperatorResult == UserOperatorResult.AccountExistent)
			{
				apiResult.Message = "指定的帐号已被占用。";
			}
			return RespondResult(apiResult);
		}

		[HttpPost("Api/User/Create")]
		public ActionResult Create()
		{
			UserDto userDto = RequestArgs<UserDto>();
			if (userDto == null)
			{
				return RespondResult(false, "参数无效。");
			}
			User user = userDto.User;
			user.Id = Guid.NewGuid();
			UserOperatorResult userOperatorResult = _userManager.Create(user, userDto.WorkTypeList);
			if (userOperatorResult == UserOperatorResult.Success)
			{
				return RespondResult();
			}
			ApiResult apiResult = new ApiResult
			{
				Success = false
			};
			if (userOperatorResult == UserOperatorResult.AccountExistent)
			{
				apiResult.Message = "指定的帐号已被占用。";
			}
			return RespondResult(apiResult);
		}

		[HttpPost("Api/User/Remove")]
		public ActionResult Remove()
		{
			Guid guid = Guid.Parse(Request.Query["id"]);
			if (guid == UserContext.User.Id)
			{
				return RespondResult(false, "您不能删除自己。");
			}
			_userManager.Remove(guid);
			return RespondResult();
		}

		[HttpPost("Api/User/ResetPasswordToDefault")]
		public ActionResult ResetPasswordToDefault()
		{
			string input = Request.Query["id"];
			_userManager.ResetPasswordToDefault(Guid.Parse(input));
			return RespondResult();
		}

		[HttpPost("Api/User/ResetPassword")]
		[AllowAnonymous]
		public ActionResult ResetPassword()
		{
			ResetPasswordArgs resetPasswordArgs = RequestArgs<ResetPasswordArgs>();
			if (resetPasswordArgs == null)
			{
				return RespondResult(false, "参数无效。");
			}
			if (_userManager.ResetPassword(resetPasswordArgs))
			{
				return RespondResult();
			}
			ApiResult apiResult = new ApiResult
			{
				Success = false
			};
			apiResult.Message = "请检查您输入的帐户及电子邮件地址是否正确。";
			return RespondResult(apiResult);
		}

		[HttpPost("Api/User/UpdatePassword")]
		public ActionResult UpdatePassword()
		{
			UpdatePasswordArgs updatePasswordArgs = RequestArgs<UpdatePasswordArgs>();
			if (updatePasswordArgs == null)
			{
				return RespondResult(false, "参数无效。");
			}
			bool success = _userManager.UpdatePassword(UserContext.User.Id, updatePasswordArgs);
			return RespondResult(success, string.Empty);
		}
	}
}
