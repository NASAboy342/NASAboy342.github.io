﻿using Microsoft.AspNetCore.Mvc;
using Pnut.Enums;
using Pnut.Models;
using Pnut.Models.Requests;
using Pnut.Models.Response;
using Pnut.Services.Interfacess;

namespace Pnut.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost("login")]
        public LoginResponse Login(LoginRequest req)
        {
            try
            {
                return _userService.Login(req);
            }
            catch (Exception ex)
            {
                return new LoginResponse
                {
                    ErrorCode = ErrorCode.GeneralError,
                    ErrorMessage = ex.Message
                };
            }
        }

        [HttpPost("register")]
        public BaseResponse Register(UserRegisterRequest req)
        {
            try
            {
                return _userService.Register(req);
            }
            catch (Exception ex)
            {
                return new BaseResponse
                {
                    ErrorCode = ErrorCode.GeneralError,
                    ErrorMessage = ex.Message
                };
            }
        }

        [HttpPost("swicht-user-work-mode")]
        public SwichtUserWorkModeResponse SwichtUserWorkMode(SwichtUserWorkModeRequest req)
        {
            try
            {
                return _userService.SwichtUserWorkMode(req);
            }
            catch (Exception ex)
            {
                return new SwichtUserWorkModeResponse
                {
                    ErrorCode = ErrorCode.GeneralError,
                    ErrorMessage = ex.Message
                };
            }
        }

        [HttpPost("search-users")]
        public SearchUsersResponse SearchUsers(SearchUsersRequest req)
        {
            try
            {
                return _userService.SearchUsers(req);
            }
            catch (Exception ex)
            {
                return new SearchUsersResponse
                {
                    ErrorCode = ErrorCode.GeneralError,
                    ErrorMessage = ex.Message
                };
            }
        }

        [HttpPost("get-users-info")]
        public GetUsersInfoResponse GetUsersInfo(GetUsersInfoRequest req)
        {
            try
            {
                return _userService.GetUsersInfo(req);
            }
            catch (Exception ex)
            {
                return new GetUsersInfoResponse
                {
                    ErrorCode = ErrorCode.GeneralError,
                    ErrorMessage = ex.Message
                };
            }
        }

        [HttpPost("update-profile-info")]
        public BaseResponse UpdateProfileInfo(UpdateProfileInfoRequest req)
        {
            try
            {
                return _userService.UpdateProfileInfo(req);
            }
            catch (Exception ex)
            {
                return new BaseResponse
                {
                    ErrorCode = ErrorCode.GeneralError,
                    ErrorMessage = ex.Message
                };
            }
        }
            
        [HttpPost("get-profile-img-paths")]
        public GetProfileImgPathsResponse GetProfileImgPaths()
        {
            try
            {
                return _userService.GetProfileImgPaths();
            }
            catch (Exception ex)
            {
                return new GetProfileImgPathsResponse
                {
                    ErrorCode = ErrorCode.GeneralError,
                    ErrorMessage = ex.Message
                };
            }
        }

        [HttpPost("sync-account-info")]
        public SyncAccountInfoResponse SyncAccountInfo(SyncAccountInfoRequest req)
        {
            try
            {
                return _userService.SyncAccountInfo(req);
            }
            catch (Exception ex)
            {
                return new SyncAccountInfoResponse
                {
                    ErrorCode = ErrorCode.GeneralError,
                    ErrorMessage = ex.Message
                };
            }
        }
    }
}