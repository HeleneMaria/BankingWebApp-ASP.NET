using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_2
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserAuthentication"] == "")
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["UserAuthentication"] != null && Session["UserAdmin"].Equals(0))
            {
                Response.Redirect("/user/ATM.aspx");                
            }
            else if (Session["UserAuthentication"] != null && Session["UserAdmin"].Equals(1))
            {
                Response.Redirect("/Admin/AccountDetails.aspx");
            }
        }
    }
}