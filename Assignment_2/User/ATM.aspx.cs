using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_2
{
    public partial class ATM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList2.AppendDataBoundItems = true;
                DropDownList2.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                DropDownList2.SelectedIndex = 0;
            }
            if (DropDownList1.SelectedIndex == 2) //Transfer
            {
                DropDownList3.Visible = true;
                Label3.Visible = true;
            }
            else
            {
                DropDownList3.Items.Add("1");
                DropDownList3.SelectedIndex = 0;
                DropDownList3.Visible = false;
                Label3.Visible = false;
            }
            if (DropDownList2.SelectedIndex != 0)
            {
                Label9.Visible = false;
            }
        }
        
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedIndex != 0)
            {
                balance.Text = DBBizOb.DbConnect.GetBalance(Convert.ToInt32(DropDownList2.SelectedValue)).ToString();
                Label9.Visible = false;
            }
            else
            {
                Label9.Visible = true;
                balance.Text = "";
            }
            Parameter p = SqlDataSource2.SelectParameters[0];
            SqlDataSource2.SelectParameters.Remove(p);
            SqlDataSource2.SelectParameters.Add("AccountChosen", DropDownList2.SelectedValue);

            if (DropDownList2.SelectedIndex == 0)
            {
                DropDownList3.Visible = false;
                Label3.Visible = false;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 2 && DropDownList2.SelectedIndex != 0) //Transfer
            {
                DropDownList3.Visible = true;
                Label3.Visible = true;
                Parameter p = SqlDataSource2.SelectParameters[0];
                SqlDataSource2.SelectParameters.Remove(p);
                SqlDataSource2.SelectParameters.Add("AccountChosen", DropDownList2.SelectedValue);
            }
            else
            {
                DropDownList3.Visible = false;
                Label3.Visible = false;
            }
            //"refresh" the field of the page
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            TextBox4.Text = "";
            TextBox5.Text = "";
            balance.Text = "";

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Label7.Visible = false;
            Label8.Visible = false;
            Label6.Visible = false;

            if (DropDownList2.SelectedIndex != 0)
            {
                Label9.Visible = false;
                try
                {
                    bool test = DBBizOb.DbConnect.InsertTransaction(Convert.ToChar(DropDownList1.SelectedValue), Convert.ToInt32(DropDownList2.SelectedValue), Convert.ToInt32(DropDownList3.SelectedValue), float.Parse(TextBox4.Text), TextBox5.Text);
                    if (test == true)
                        Label7.Visible = true;
                    else
                        Label8.Visible = true;
                }
                catch (Exception exc)
                {
                    Label6.Visible = true;
                    throw exc;
                }
            }
            else
            {
                Label9.Visible = true;
            }
            if (DropDownList2.SelectedIndex != 0)
            {
                balance.Text = DBBizOb.DbConnect.GetBalance(Convert.ToInt32(DropDownList2.SelectedValue)).ToString();
                Label9.Visible = false;
            }
            else
            {
                Label9.Visible = true;
                balance.Text = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
            

            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            balance.Visible = false;
        }

    }
}