using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assignment_2
{
    public partial class MyStatement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //int AccountNo = DBBizOb.DbConnect.GetAccountNo(Session["UserAuthentication"].ToString(), AccountSelector.SelectedValue);

            int AccountNo = int.Parse( AccountSelector.SelectedValue);

            if (AccountNo != -1)
            {
                //Check for sufficient funds
                float balance = DBBizOb.DbConnect.GetBalance(AccountNo);


                if (balance >= 200.20 && (AccountSelector.SelectedItem.Text).Substring(0,1) == "C" ||
                    balance >= 0.20 && (AccountSelector.SelectedItem.Text).Substring(0, 1) == "S")
                {
                    TransactionListView.Visible = true;
                    lbl_nofunds.Visible = false;

                    //Charge Transaction Fee
                    DBBizOb.DbConnect.InsertStatementFee(Session["UserAuthentication"].ToString(), AccountNo);

                    TransactionListView.DataSourceID = "SqlDataSource1";
                    TransactionListView.DataBind();
                }
                else
                {
                    TransactionListView.Visible = false;
                    lbl_nofunds.Visible = true;
                }

                balance = DBBizOb.DbConnect.GetBalance(AccountNo);

                lbl_balanceText.Visible = true;
                lbl_balance.Visible = true;

                lbl_balance.Text = balance.ToString();
            }
        }

        protected void AccountSelector_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}