using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Assignment_2.User
{
    public partial class BillPay : System.Web.UI.Page
    {
        private bool updatemode = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["BillPayID"] != null)
            {
                updatemode = true;
                lbl_EditText.Visible = true;
                lbl_editID.Visible = true;
                lbl_editID.Text = Session["BillPayID"].ToString();

                DataRow selectedRow = Assignment_2.DBBizOb.DbConnect.SelectBillPayRow(int.Parse(Session["BillPayID"].ToString()));
                account_selector.SelectedValue = selectedRow["AccountNumber"].ToString();
                payee_selector.SelectedValue   = selectedRow["PayeeID"].ToString();

                txtAmount.Text = selectedRow["Amount"].ToString();
                txtAmount.Text = txtAmount.Text.Substring(0, txtAmount.Text.Length - 2);
                DateTime scheduledDate = DateTime.Parse(selectedRow["ScheduleDate"].ToString());
                if (scheduledDate.Year == 9999)
                    scheduledDate = DateTime.Today;
                Calendar1.SelectedDate = scheduledDate;
                period_selector.SelectedValue = selectedRow["Period"].ToString();

                Session["BillPayID"] = null;

            }

            if (txtDate.Text == "")
            {
                Calendar1.SelectedDate = DateTime.Today;
                txtDate.Text = (Calendar1.SelectedDate.Day).ToString() + "/" + (Calendar1.SelectedDate.Month).ToString() + "/" + (Calendar1.SelectedDate.Year).ToString();
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = (Calendar1.SelectedDate.Day).ToString() + "/" + (Calendar1.SelectedDate.Month).ToString() + "/" + (Calendar1.SelectedDate.Year).ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (lbl_editID.Visible == false)
            {
                DBBizOb.DbConnect.InsertBillPay(
                    int.Parse(account_selector.SelectedValue),
                    int.Parse(payee_selector.SelectedValue),
                    float.Parse(txtAmount.Text),
                    DateTime.Parse(txtDate.Text),
                    char.Parse(period_selector.SelectedValue)
                    );

                txtAmount.Text = "";
                txtDate.Text = "";
                lbl_finish.Visible = true;

                DBBizOb.DbConnect.ResetScheduling();

                Calendar1.SelectedDate = DateTime.Today;
            }
            else {
                DBBizOb.DbConnect.UpdateBillPay(
                       int.Parse(lbl_editID.Text),
                       int.Parse(account_selector.SelectedValue),
                       int.Parse(payee_selector.SelectedValue),
                       float.Parse(txtAmount.Text),
                       DateTime.Parse(txtDate.Text),
                       DateTime.Now,
                       char.Parse(period_selector.SelectedValue)
                       );
                DBBizOb.DbConnect.ResetScheduling();
                Response.Redirect("ManageBillPay.aspx");

            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (lbl_editID.Visible == true)
            {
                DBBizOb.DbConnect.DeleteBillPay(int.Parse(lbl_editID.Text));
                DBBizOb.DbConnect.ResetScheduling();
                Response.Redirect("ManageBillPay.aspx");
            }
            else {
                txtAmount.Text = "";
                txtDate.Text = "";
                Calendar1.SelectedDate = DateTime.Today;
            }
        }
    }
}