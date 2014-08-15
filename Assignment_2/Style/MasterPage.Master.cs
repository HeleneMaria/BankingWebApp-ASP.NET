using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Data;

namespace Assignment_2
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        // Create the thread object. This does not start the thread.


        protected void Page_Load(object sender, EventArgs e)
        {
            DBBizOb.DbConnect.StartScheduling();

            string username = (string)(Session["UserAuthentication"]);

            if (Session["UserAuthentication"] != null && Session["UserAdmin"].Equals(0))
            {
                Label1.Text = username;
                navigation.Visible = true;
                navigationadmin.Visible = false;
            }
            else if (Session["UserAuthentication"] != null && Session["UserAdmin"].Equals(1))
            {
                Label2.Text = username;
                navigation.Visible = false;
                navigationadmin.Visible = true;
                //We add an empty line at the beginning of the dropdownlist
                if (!IsPostBack)
                {
                    CustomersList.AppendDataBoundItems = true;
                    CustomersList.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                    CustomersList.SelectedIndex = 0;
                    Label3.Text = " Please, choose a customer : ";
                    Menu1.Visible = false;
                }
                if (Session["CustomerChosen"] != null && Session["indexCustomer"] != null && !IsPostBack)
                {
                    Label3.Text = "You are currently looking at the customer : ";
                    CustomersList.SelectedIndex = (int)Session["indexCustomer"];
                    Menu1.Visible = true;
                }
            }
            else if (!Request.RawUrl.Contains("Login.aspx"))
            {
                navigation.Visible = false;
                navigationadmin.Visible = false;
                Response.Redirect("/Login.aspx");
            }
            else
            {
                navigation.Visible = false;
                navigationadmin.Visible = false;
            }
            //if someone tries to open this user page in a fresh browser
            //window without logging in, these lines will prevent that
            /*  if (Session.IsNewSession && !Request.RawUrl.Contains("Login.aspx"))
                  Response.Redirect("Login.aspx");*/
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Remove("UserAuthentication");
            Session.Abandon();
            HttpContext.Current.Response.Redirect("/Login.aspx", true);
            //We do not want this page to be cached by the browser 
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        }

        protected void foo_MenuItemClick(object sender, MenuEventArgs e)
        {

        }



        protected void CustomersList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CustomersList.SelectedIndex != 0)
            {
                Session["CustomerChosen"] = CustomersList.SelectedValue;
                Label3.Text = "You are currently looking at the customer : ";
                Session["indexCustomer"] = CustomersList.SelectedIndex;
                Menu1.Visible = true;

                Assignment_2.Admin.UserProfile userProfile = this.Page as Assignment_2.Admin.UserProfile;
                if(userProfile != null)
                {
                    userProfile.DisplayCustomerDataToBeUpdated();
                }
                
                
            }
            else if (CustomersList.SelectedIndex == 0)
            {
                Label3.Text = " Please, choose a customer : ";
                Session["CustomerChosen"] = null;
                Menu1.Visible = false;
            }

        }

    }
}