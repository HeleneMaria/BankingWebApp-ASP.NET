using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_2.Admin
{
    public partial class ScheduledPayments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*foreach (ListViewItem i in ScheduleListView.Items) {
                Button stopButton = i.FindControl("StopButton") as Button;
                Label lbl_scheduledDate = i.FindControl("ScheduleDateLabel") as Label;
                if (lbl_scheduledDate != null)
                {
                    DateTime dt_scheduledDate = DateTime.Parse(lbl_scheduledDate.Text);
                    stopButton.Text = "Start";
                }
            }*/
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Session["CustomerChosen"] == null)
            {
                title.Visible = false;
                ScheduleListView.Visible = false;
            }
            else
            {
                title.Visible = true;
                ScheduleListView.Visible = true;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }

        protected void StopButtonClick(object sender, CommandEventArgs e)
        {
            int BillPayID = Convert.ToInt32(e.CommandArgument);
            
        }

        protected void StartButtonClick(object sender, CommandEventArgs e)
        {
            int BillPayID = Convert.ToInt32(e.CommandArgument);
        }


        protected void ScheduleListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewItem i = e.Item;
            Button pauseButton = i.FindControl("pauseButton") as Button;
            Label lbl_pause_flag = i.FindControl("PauseFlagLabel") as Label;


            if (lbl_pause_flag.Text == "P")
            {
                pauseButton.Text = "Start";
            }
        }

        protected void PauseButton_Click(object sender, EventArgs e)
        {
            Button b = sender as Button;
            int BillPayID = Convert.ToInt32(b.CommandArgument);

            if (b.Text == "Pause")
            {
                b.Text = "Start";
                DBBizOb.DbConnect.UpdateBillPayPauseFlag(BillPayID, 'P');
                DBBizOb.DbConnect.ResetScheduling();
            }
            else if (b.Text == "Start")
            {
                b.Text = "Pause";
                DBBizOb.DbConnect.UpdateBillPayPauseFlag(BillPayID, ' ');
                DBBizOb.DbConnect.ResetScheduling();
            }

            ScheduleListView.DataBind();
        }
    }
}