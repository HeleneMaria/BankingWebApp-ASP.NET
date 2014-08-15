using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Assignment_2.Admin
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
               if (!IsPostBack)
            {
                DisplayCustomerDataToBeUpdated();
               
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Session["CustomerChosen"] == null)
            {
                title.Visible = false;
                contentpage.Visible = false;
            }
            else
            {
                title.Visible = true;
                contentpage.Visible = true;
            }
        }

        /* Call this function to display the customer data to be edited from the customer table
         * in the text boxes on "UserProfile"-page*/
        public void DisplayCustomerDataToBeUpdated() 
        {
            /*Hide earlier results of updateprofile label and changepassword label*/
            UpdateProfileLabel.Visible = false;
            ChangePasswordLabel.Visible = false;

            /*Change the color of the text in the text boxes back to the basic gray ("not updated")
             *instead of the color black which shows that the text has been updated*/
            NameTextBox.ForeColor = System.Drawing.Color.Gray;
            TFNTextBox.ForeColor = System.Drawing.Color.Gray;
            AddressTextBox.ForeColor = System.Drawing.Color.Gray;
            CityTextBox.ForeColor = System.Drawing.Color.Gray;
            StateTextBox.ForeColor = System.Drawing.Color.Gray;
            PostCodeTextBox.ForeColor = System.Drawing.Color.Gray;
            PhoneTextBox.ForeColor = System.Drawing.Color.Gray;


            /*Get the customerID from the given userID from the customer chosen from 
             * the dropdown-list on the masterpage*/
            string userID = Session["CustomerChosen"].ToString();
            int sessionCustomerID = DBBizOb.DbConnect.GetSessionCustomerID(userID);


            /*Assigning the data variables from the db to the right textbox-fields*/
            NameTextBox.Text = DBBizOb.DbConnect.GetCustomerName(sessionCustomerID);
            TFNTextBox.Text = DBBizOb.DbConnect.GetTFN(sessionCustomerID);
            AddressTextBox.Text = DBBizOb.DbConnect.GetAddress(sessionCustomerID);
            CityTextBox.Text = DBBizOb.DbConnect.GetCity(sessionCustomerID);
            StateTextBox.Text = DBBizOb.DbConnect.GetState(sessionCustomerID);
            PostCodeTextBox.Text = DBBizOb.DbConnect.GetPostCode(sessionCustomerID);
            PhoneTextBox.Text = DBBizOb.DbConnect.GetPhone(sessionCustomerID);

        }

        /*When the ChangePasswordButton is clicked change the password to the user logged in,
         *by updating the table Login with modifydate and the password changed*/
        protected void ChangePasswordButton_Click(object sender, EventArgs e)
        {
           
            /*Check that the input from both "new password" and "confirm password" is the same
             *and if they are the same then change the password in the db */
            if (NewPasswordTextBox.Text.Equals(ConfirmPasswordTextBox.Text))
            {
                string userID = Session["CustomerChosen"].ToString();
                string newPassword = NewPasswordTextBox.Text;

                DBBizOb.DbConnect.ChangePassword(userID, newPassword);

                ChangePasswordLabel.ForeColor = System.Drawing.Color.DarkGreen;
                ChangePasswordLabel.Text = "Password changed successfully!";
                ChangePasswordLabel.Visible = true;
            }
            else
            {
                ChangePasswordLabel.ForeColor = System.Drawing.Color.Crimson;
                ChangePasswordLabel.Text = "Error: Password not changed, please try again!";
                ChangePasswordLabel.Visible = true;
            }
        }

        /* When UpdateProfileButton on MyProfile.aspx is clicked, connect to the database,
         * update the customer data in the customer table, using the data from the textboxes 
         * on the "UserProfile"-page, and display a successful-message in the UpdateProfileLabel 
         * if validation was OK*/
        protected void UpdateProfileButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string userID = Session["CustomerChosen"].ToString();
                int sessionCustomerID = DBBizOb.DbConnect.GetSessionCustomerID(userID);

                DBBizOb.DbConnect.UpdateProfile(sessionCustomerID,
                                                NameTextBox.Text,
                                                TFNTextBox.Text,
                                                AddressTextBox.Text,
                                                CityTextBox.Text,
                                                StateTextBox.Text,
                                                PostCodeTextBox.Text,
                                                PhoneTextBox.Text);

                UpdateProfileLabel.ForeColor = System.Drawing.Color.DarkGreen;
                UpdateProfileLabel.Text = "User-profile updated successfully!";
                UpdateProfileLabel.Visible = true;
            }
            else 
            {
                UpdateProfileLabel.ForeColor = System.Drawing.Color.Crimson;
                UpdateProfileLabel.Text = "Error: User-profile did not get updated!";
                UpdateProfileLabel.Visible = true;
            }

          
        }

        protected void NameTextBox_TextChanged(object sender, EventArgs e)
        {
            NameTextBox.ForeColor = System.Drawing.Color.Black;
        }

        protected void TFNTextBox_TextChanged(object sender, EventArgs e)
        {
            TFNTextBox.ForeColor = System.Drawing.Color.Black;
        }

        protected void AddressTextBox_TextChanged(object sender, EventArgs e)
        {
            AddressTextBox.ForeColor = System.Drawing.Color.Black;
        }

        protected void CityTextBox_TextChanged(object sender, EventArgs e)
        {
            CityTextBox.ForeColor = System.Drawing.Color.Black;
        }

        protected void StateTextBox_TextChanged(object sender, EventArgs e)
        {
            StateTextBox.ForeColor = System.Drawing.Color.Black;
        }

        protected void PostCodeTextBox_TextChanged(object sender, EventArgs e)
        {
            PostCodeTextBox.ForeColor = System.Drawing.Color.Black;
        }
        
        protected void PhoneTextBox_TextChanged(object sender, EventArgs e)
        {
            PhoneTextBox.ForeColor = System.Drawing.Color.Black;
        }
 
    }
}
