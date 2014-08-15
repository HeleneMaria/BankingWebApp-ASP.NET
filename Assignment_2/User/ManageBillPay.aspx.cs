using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_2.User
{
    public partial class ManageBillPay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BillPayListView.DataBind();
        }

        protected void EditButtonClick(object sender, CommandEventArgs e)
        {
            int BillPayID = Convert.ToInt32(e.CommandArgument);
            Session["BillPayID"] = BillPayID;
            Response.Redirect("BillPay.aspx");
        }


    }
}