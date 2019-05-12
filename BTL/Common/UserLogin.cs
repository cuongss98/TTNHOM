using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL.Common
{
    [Serializable]
    public class UserLogin
    {
        public long UserID { set; get; }
        public string UserName { set; get; }
        public int? GroupID { set; get; }
    }
}