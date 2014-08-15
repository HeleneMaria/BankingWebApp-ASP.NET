using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Assignment_2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PasswordFail"] != null)
            {
                if ((int)Session["PasswordFail"] == 1)
                {
                    LoginFail.Visible = true;
                }
                else
                {
                    LoginFail.Visible = false;
                }
            }
            else
            {
                LoginFail.Visible = false;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string username = Login1.UserName;
            string pwd = Login1.Password;

            string s;
            int isAdmin = DBBizOb.DbConnect.SelectCustomer(username,pwd);

            if (isAdmin != 0)
            {
                Session["UserAuthentication"] = username;
                Session.Timeout = 30;
                Session["PasswordFail"] =0;
                if (isAdmin == 1)
                {
                    Session["UserAdmin"] = 0;
                Response.Redirect("user/ATM.aspx");
                }
                else if (isAdmin == 2)
                {
                    Session["UserAdmin"] = 1;
                    Response.Redirect("Admin/AccountDetails.aspx");
                }
                
            }
            else
            {
                Session["PasswordFail"] = 1;
                Response.Redirect("Login.aspx");
            }
        }
    }
}