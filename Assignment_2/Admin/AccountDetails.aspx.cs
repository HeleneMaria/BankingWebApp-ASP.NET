using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_2.Admin
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Here this is called before the page_load of the master page, so the customerchosen is not the current one
         
        }
        //Called after the master page page_load
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Session["CustomerChosen"] == null)
            {
                title.Visible = false;
            }
            else
            {
                title.Visible = true;
            }
        }
    }
}