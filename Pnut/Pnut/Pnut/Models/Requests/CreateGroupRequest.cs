﻿namespace Pnut.Models.Requests
{
    public class CreateGroupRequest
    {
        public string GroupName { get; set; }
        public string GroupDescription { get; set; }
        public int CreatorUserId { get; set; }
    }
}
