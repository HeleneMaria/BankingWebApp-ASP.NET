using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_2.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Session["CustomerChosen"] == null)
            {
                title.Visible = false;
                contentpage.Visible = false;
                Session["AccountChosen"] = null;
                Balance.Text = "";
            }
            else
            {
                title.Visible = true;
                contentpage.Visible = true;
            }
        }
        //Called qfter the sqldatasource had been loading
        protected void Page_PreRenderComplete(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != "")
            {
                //Session["AccountChosen"] = DropDownList1.SelectedValue;
                int accountNo = int.Parse(DropDownList1.SelectedValue);
                float balance = DBBizOb.DbConnect.GetBalance(accountNo);
                Balance.Text = balance.ToString();
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Session["AccountChosen"] = DropDownList1.SelectedValue;
            int accountNo = int.Parse(DropDownList1.SelectedValue);
            float balance = DBBizOb.DbConnect.GetBalance(accountNo);
            Balance.Text = balance.ToString();
            GridView1.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["AccountChosen"] = DropDownList1.SelectedValue;
            int accountNo = int.Parse(DropDownList1.SelectedValue);
            float balance = DBBizOb.DbConnect.GetBalance(accountNo);
            Balance.Text = balance.ToString();
            GridView1.DataBind();
            GridView1.Visible = true;
        }
    }
}