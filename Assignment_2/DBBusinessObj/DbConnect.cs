using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Threading;

namespace Assignment_2.DBBizOb
{
    public class DbConnect
    {
        private static SqlConnection conn = 
            new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString);

        protected static void Connect()
        {
            conn.Open();
        }

        protected static void Disconnect()
        { 
            conn.Close();
        }

        public static void InsertStatementFee(string UserID, int AccountNumber){
            SqlCommand myCmd = new SqlCommand("InsertStatementFee",conn);
            myCmd.CommandType = CommandType.StoredProcedure;

            myCmd.Parameters.AddWithValue("@UserID", UserID);   
            myCmd.Parameters.AddWithValue("@CurrentAccountNumber", AccountNumber);
            
            Connect();
            myCmd.ExecuteNonQuery();
            Disconnect();
        }

        public static bool InsertTransaction(char TypeTransaction, int FromAccount, int ToAccount, float Amount, string Comment)
        {
            if (TypeTransaction == 'D')
            {
                //Check the balance
                float balance = 0;
                SqlCommand cmd = new SqlCommand("Balance", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AccountNumber", FromAccount);
                int amountSub = 0;
                cmd.Parameters.AddWithValue("@AmountSub", amountSub);
                SqlDataReader reader;

                Connect();
                reader = cmd.ExecuteReader();
                // Data is accessible through the DataReader object here.

                while (reader.Read())
                {
                    balance = float.Parse(reader[0].ToString());
                }
                Console.WriteLine(balance);
                Disconnect();
                SqlCommand myCmd = new SqlCommand("InsertDeposit", conn);
                myCmd.CommandType = CommandType.StoredProcedure;

                myCmd.Parameters.AddWithValue("@AccountChosen", FromAccount);
                myCmd.Parameters.AddWithValue("@Amount", Amount);
                myCmd.Parameters.AddWithValue("@Comment", Comment);

                Connect();
                myCmd.ExecuteNonQuery();
                Disconnect();

                //Check the balance
                float balance1 = 0;
                cmd = new SqlCommand("Balance", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AccountNumber", FromAccount);
                cmd.Parameters.AddWithValue("@AmountSub", 0);
                Connect();

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    balance1 = float.Parse(reader[0].ToString());
                }
                Disconnect();

                Console.WriteLine(balance1);

                if (balance1 != balance)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else if (TypeTransaction == 'W')
            {
                //Check the balance
                float balance = 0;
                SqlCommand cmd = new SqlCommand("Balance", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AccountNumber", FromAccount);
                int amountSub = 0;
                cmd.Parameters.AddWithValue("@AmountSub", amountSub);
                SqlDataReader reader;

                Connect();
                reader = cmd.ExecuteReader();
                // Data is accessible through the DataReader object here.
                
                while (reader.Read())
                {
                    balance = float.Parse(reader[0].ToString());
                }
                Console.WriteLine(balance);
                Disconnect();

                SqlCommand myCmd = new SqlCommand("InsertWithdraw", conn);
                myCmd.CommandType = CommandType.StoredProcedure;

                myCmd.Parameters.AddWithValue("@AccountChosen", FromAccount);
                myCmd.Parameters.AddWithValue("@Amount", Amount);
                myCmd.Parameters.AddWithValue("@Comment", Comment);

                Connect();
                myCmd.ExecuteNonQuery();
                Disconnect();

                //Check the balance
                float balance1 = 0;
                  cmd = new SqlCommand("Balance", conn);
                  cmd.CommandType = CommandType.StoredProcedure;
                  cmd.Parameters.AddWithValue("@AccountNumber", FromAccount);
                  cmd.Parameters.AddWithValue("@AmountSub", 0);
                  Connect();

                  reader = cmd.ExecuteReader();
               
                  while (reader.Read())
                  {
                      balance1 = float.Parse(reader[0].ToString());
                  }
                  Disconnect();
                 
                Console.WriteLine(balance1);

                if (balance1 != balance)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else if (TypeTransaction == 'T')
            {
                float balance_from_1 = GetBalance(FromAccount);
                float balance_to_1 = GetBalance(ToAccount);

                SqlCommand myCmd = new SqlCommand("InsertTransfer", conn);
                myCmd.CommandType = CommandType.StoredProcedure;

                myCmd.Parameters.AddWithValue("@AccountChosen", FromAccount);
                myCmd.Parameters.AddWithValue("@AccountTo", ToAccount);
                myCmd.Parameters.AddWithValue("@Amount", Amount);
                myCmd.Parameters.AddWithValue("@Comment", Comment);

                Connect();
                myCmd.ExecuteNonQuery();
                Disconnect();

                float balance_from_2 = GetBalance(FromAccount);
                float balance_to_2 = GetBalance(ToAccount);

                if (balance_from_1 != balance_from_2 && balance_to_1 != balance_to_2)
                {
                    return true;
                }
                else
                {
                    return false;
                }




            }
            else if (TypeTransaction == 'B')
            {
                return true;
            }
            else
            {
                return true;
            }

            }


        public static float GetBalance(int AccountNumber)
        {
            float balance = 0;
            SqlCommand cmd = new SqlCommand("Balance", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);
            int amountSub = 0;
            cmd.Parameters.AddWithValue("@AmountSub", amountSub);
            SqlDataReader reader;

            Connect();
            reader = cmd.ExecuteReader();
            // Data is accessible through the DataReader object here.

            while (reader.Read())
            {
                balance = float.Parse(reader[0].ToString());
            }
            Disconnect();
            return balance;
        }

        public static char GetAccountType(int AccountNumber)
        {
            char type = ' ';
            SqlCommand cmd = new SqlCommand("AccountType", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);

            SqlDataReader reader;

            Connect();
            reader = cmd.ExecuteReader();
            // Data is accessible through the DataReader object here.

            while (reader.Read())
            {
                type = char.Parse(reader[0].ToString());
            }
            Disconnect();
            return type;
        }


        public static int GetTransactionCount(int AccountNumber)
        {
            int count = 0;
            SqlCommand cmd = new SqlCommand("TransactionCount", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);

            SqlDataReader reader;

            Connect();
            reader = cmd.ExecuteReader();
            // Data is accessible through the DataReader object here.

            while (reader.Read())
            {
                count = int.Parse(reader[0].ToString());
            }
            Disconnect();
            return count;
        }

        public static int GetAccountNo(string UserID, string AccountType)
        {
            int temp_no = -1;

            SqlCommand cmd = new SqlCommand("SelectAccountNo", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@AccountType", AccountType);
            SqlDataReader reader;

            Connect();
            reader = cmd.ExecuteReader();
            // Data is accessible through the DataReader object here.

            while (reader.Read())
            {
                temp_no = int.Parse(reader[0].ToString());
            }
            Disconnect();
            return temp_no;
        }

        public static void InsertBillPayTransfer(int AccountNumber, float amount, string comment)
        {
            SqlCommand myCmd = new SqlCommand("InsertBillPayTransfer", conn);
            myCmd.CommandType = CommandType.StoredProcedure;

            myCmd.Parameters.AddWithValue("@CurrentAccountNumber", AccountNumber);
            myCmd.Parameters.AddWithValue("@amount", amount);
            myCmd.Parameters.AddWithValue("@text", comment);

            Connect();
            myCmd.ExecuteNonQuery();
            Disconnect();
        }

        public static void InsertBillPay(int AccountNumber, int PayeeID, float amount, DateTime date, char period)
        {
            SqlCommand myCmd = new SqlCommand("InsertBillPay", conn);
            myCmd.CommandType = CommandType.StoredProcedure;

            myCmd.Parameters.AddWithValue("@CurrentAccountNumber", AccountNumber);
            myCmd.Parameters.AddWithValue("@PayeeID", PayeeID);
            myCmd.Parameters.AddWithValue("@Amount", amount);
            myCmd.Parameters.AddWithValue("@ScheduleDate", date);
            myCmd.Parameters.AddWithValue("@period", period);
            myCmd.Parameters.AddWithValue("@modifydate", DateTime.Now);

            Connect();
            myCmd.ExecuteNonQuery();
            Disconnect();
        }

        public static void UpdateBillPayScheduleDate(int BillPayID, DateTime scheduleDate, DateTime ModifyDate, char period) 
        {
            SqlCommand myCmd = new SqlCommand("UpdateBillPayScheduleDate", conn);
            myCmd.CommandType = CommandType.StoredProcedure;

            myCmd.Parameters.AddWithValue("@BillPayID", BillPayID);
            myCmd.Parameters.AddWithValue("@ScheduleDate", scheduleDate);
            myCmd.Parameters.AddWithValue("@ModifyDate", ModifyDate);
            myCmd.Parameters.AddWithValue("@Period", period);


            Connect();
            myCmd.ExecuteNonQuery();
            Disconnect();
        }

        public static void UpdateBillPay(int BillPayID, int AccountNo, int PayeeID, float Amount, DateTime scheduleDate, DateTime ModifyDate, char period)
        {
            SqlCommand myCmd = new SqlCommand("UpdateBillPay", conn);
            myCmd.CommandType = CommandType.StoredProcedure;

            myCmd.Parameters.AddWithValue("@BillPayID", BillPayID);
            myCmd.Parameters.AddWithValue("@AccountNo", AccountNo);
            myCmd.Parameters.AddWithValue("@PayeeID", PayeeID);
            myCmd.Parameters.AddWithValue("@Amount", Amount);
            myCmd.Parameters.AddWithValue("@ScheduleDate", scheduleDate);
            myCmd.Parameters.AddWithValue("@ModifyDate", ModifyDate);
            myCmd.Parameters.AddWithValue("@Period", period);



            Connect();
            myCmd.ExecuteNonQuery();
            Disconnect();
        }

        public static void UpdateBillPayPauseFlag(int BillPayID, char flag)
        {
            SqlCommand myCmd = new SqlCommand("UpdateBillPayPauseFlag", conn);
            myCmd.CommandType = CommandType.StoredProcedure;


            myCmd.Parameters.AddWithValue("@BillPayID", BillPayID);
            myCmd.Parameters.AddWithValue("@Pause", flag);

            Connect();
            myCmd.ExecuteNonQuery();
            Disconnect();
        }

        public static void DeleteBillPay(int BillPayID)
        {
            SqlCommand myCmd = new SqlCommand("DeleteBillPay", conn);
            myCmd.CommandType = CommandType.StoredProcedure;

            myCmd.Parameters.AddWithValue("@BillPayID", BillPayID);

            Connect();
            myCmd.ExecuteNonQuery();
            Disconnect();
        }

        public static DataTable readBillPay() {

            SqlCommand myCmd = new SqlCommand("SelectBillPay", conn);
            myCmd.CommandType = CommandType.StoredProcedure;

            Connect();

            DataTable dt = new DataTable();
            dt.Load(myCmd.ExecuteReader());

            Disconnect();

            return dt;
        }

        public static DataRow SelectBillPayRow(int BillPayID)
        {

            SqlCommand myCmd = new SqlCommand("SelectBillPayWithBillPayNo", conn);
            myCmd.CommandType = CommandType.StoredProcedure;
            myCmd.Parameters.AddWithValue("@BillPayID", BillPayID);

            Connect();

            DataTable dt = new DataTable();
            dt.Load(myCmd.ExecuteReader());

            Disconnect();

            return dt.Rows[0];
        }

        public static void InsertBillPayFee(int AccountNumber)
        {
            SqlCommand myCmd = new SqlCommand("InsertBillPayFee", conn);
            myCmd.CommandType = CommandType.StoredProcedure;

            myCmd.Parameters.AddWithValue("@CurrentAccountNumber", AccountNumber);

            Connect();
            myCmd.ExecuteNonQuery();
            Disconnect();
        }


        private static Scheduler schedulerObject = new Scheduler();
        private static Thread schedulerThread;

        public static void StartScheduling() {
            //Start Scheduling
            if (schedulerThread == null)
            {
                DataTable temp = DBBizOb.DbConnect.readBillPay();
                schedulerThread = new Thread(() => schedulerObject.BillPayScheduler(temp));
                schedulerThread.Start();
            } 
        }

        public static void ResetScheduling()
        {
            //End the running thread
            schedulerThread.Abort();

            //Start Scheduling
                DataTable temp = DBBizOb.DbConnect.readBillPay();
                schedulerThread = new Thread(() => schedulerObject.BillPayScheduler(temp));
                schedulerThread.Start();
            
        }

        //return 0 if the customer not found, return 1 if simple customer, return 2 of admin
        public static int SelectCustomer(string username, string pwd)
        {
                int result = 0;
                bool isAdmin = false;
                string userID = "";
                SqlCommand cmd = new SqlCommand("SelectCustomer", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", username);
                int amountSub = 0;
                cmd.Parameters.AddWithValue("@pwd", pwd);
                SqlDataReader reader;

                Connect();
                reader = cmd.ExecuteReader();
                // Data is accessible through the DataReader object here.
                while (reader.Read())
                {
                    isAdmin = bool.Parse(reader[0].ToString());
                    userID = reader[1].ToString();
                }
                Disconnect();
                if (isAdmin)
                    return 2;
                else if (userID != "")
                    return 1;
                else
                    return 0;
        }

        public static void UpdateProfile(int sessionCustomerID, string customerName, string tfn, 
                                            string address, string city, string state, string postcode, string phone) 
        {
            SqlCommand cmdUpdate = new SqlCommand("UpdateProfile", conn);
            cmdUpdate.CommandType = CommandType.StoredProcedure;

            cmdUpdate.Parameters.AddWithValue("@CustomerID", sessionCustomerID);
            cmdUpdate.Parameters.AddWithValue("@CustomerName", customerName);
            cmdUpdate.Parameters.AddWithValue("@TFN", tfn);
            cmdUpdate.Parameters.AddWithValue("@Address", address);
            cmdUpdate.Parameters.AddWithValue("@City", city);
            cmdUpdate.Parameters.AddWithValue("@State", state);
            cmdUpdate.Parameters.AddWithValue("@Postcode", postcode);
            cmdUpdate.Parameters.AddWithValue("@Phone", phone);

            Connect();
            cmdUpdate.ExecuteNonQuery();
            Disconnect();
        }


        public static void ChangePassword(string userID, string newPassword) 
        {
            SqlCommand cmdChangePassword = new SqlCommand("ChangePassword", conn);
            cmdChangePassword.CommandType = CommandType.StoredProcedure;

            cmdChangePassword.Parameters.AddWithValue("@UserID", userID);
            cmdChangePassword.Parameters.AddWithValue("@Password", newPassword);

            Connect();
            cmdChangePassword.ExecuteNonQuery();
            Disconnect();
        }

        public static int GetSessionCustomerID(string userID)
        {
            int sessionCustomerID = -1;
            SqlCommand cmdGetCustomerID = new SqlCommand("GetSessionCustomerID", conn);
            cmdGetCustomerID.CommandType = CommandType.StoredProcedure;

            cmdGetCustomerID.Parameters.AddWithValue("@UserID", userID);

            SqlDataReader reader;

            Connect();
            reader = cmdGetCustomerID.ExecuteReader();

            // Data is accessible through the DataReader object here
            while (reader.Read())
            {
               sessionCustomerID = int.Parse(reader[0].ToString());
            }
            Disconnect();

            return sessionCustomerID;
        }

        public static string GetCustomerName(int sessionCustomerID) 
        {
            string customerName = "";
            SqlCommand cmdGetCustomerName = new SqlCommand("GetCustomerName", conn);
            cmdGetCustomerName.CommandType = CommandType.StoredProcedure;

            cmdGetCustomerName.Parameters.AddWithValue("@CustomerID", sessionCustomerID);

            SqlDataReader reader;

            Connect();
            reader = cmdGetCustomerName.ExecuteReader();

            // Data is accessible through the DataReader object here
            while (reader.Read())
            {
                customerName = reader[0].ToString();
            }
            Disconnect();

            return customerName;
        }


        public static string GetTFN(int sessionCustomerID)
        {
            string tfn = "";
            SqlCommand cmdGetTFN = new SqlCommand("GetTFN", conn);
            cmdGetTFN.CommandType = CommandType.StoredProcedure;

            cmdGetTFN.Parameters.AddWithValue("@CustomerID", sessionCustomerID);
            SqlDataReader reader;

            Connect();
            reader = cmdGetTFN.ExecuteReader();

            // Data is accessible through the DataReader object here
            while (reader.Read())
            {
                tfn = reader[0].ToString();
            }
            Disconnect();

            return tfn;
        }

        public static string GetAddress(int sessionCustomerID)
        {
            string address = "";
            SqlCommand cmdGetAddress = new SqlCommand("GetAddress", conn);
            cmdGetAddress.CommandType = CommandType.StoredProcedure;

            cmdGetAddress.Parameters.AddWithValue("@CustomerID", sessionCustomerID);

            SqlDataReader reader;

            Connect();
            reader = cmdGetAddress.ExecuteReader();

            // Data is accessible through the DataReader object here
            while (reader.Read())
            {
                address = reader[0].ToString();
            }
            Disconnect();

            return address;
        }

        public static string GetCity(int sessionCustomerID)
        {
            string city = "";
            SqlCommand cmdGetCity = new SqlCommand("GetCity", conn);
            cmdGetCity.CommandType = CommandType.StoredProcedure;

            cmdGetCity.Parameters.AddWithValue("@CustomerID", sessionCustomerID);

            SqlDataReader reader;

            Connect();
            reader = cmdGetCity.ExecuteReader();

            // Data is accessible through the DataReader object here
            while (reader.Read())
            {
                city = reader[0].ToString();
            }
            Disconnect();

            return city;
        }

        public static string GetState(int sessionCustomerID)
        {
            string state = "";
            SqlCommand cmdGetState = new SqlCommand("GetState", conn);
            cmdGetState.CommandType = CommandType.StoredProcedure;

            cmdGetState.Parameters.AddWithValue("@CustomerID", sessionCustomerID);
            SqlDataReader reader;

            Connect();
            reader = cmdGetState.ExecuteReader();

            // Data is accessible through the DataReader object here
            while (reader.Read())
            {
                state = reader[0].ToString();
            }
            Disconnect();

            return state;
        }

        public static string GetPostCode(int sessionCustomerID)
        {
            string postcode = "";
            SqlCommand cmdGetPostCode = new SqlCommand("GetPostCode", conn);
            cmdGetPostCode.CommandType = CommandType.StoredProcedure;

            cmdGetPostCode.Parameters.AddWithValue("@CustomerID", sessionCustomerID);

            SqlDataReader reader;

            Connect();
            reader = cmdGetPostCode.ExecuteReader();

            // Data is accessible through the DataReader object here
            while (reader.Read())
            {
                postcode = reader[0].ToString();
            }
            Disconnect();

            return postcode;
        }

        public static string GetPhone(int sessionCustomerID)
        {
            string phone = "";
            SqlCommand cmdGetPhone = new SqlCommand("GetPhone", conn);
            cmdGetPhone.CommandType = CommandType.StoredProcedure;

            cmdGetPhone.Parameters.AddWithValue("@CustomerID", sessionCustomerID);

            SqlDataReader reader;

            Connect();
            reader = cmdGetPhone.ExecuteReader();

            // Data is accessible through the DataReader object here
            while (reader.Read())
            {
                phone = reader[0].ToString();
            }
            Disconnect();

            return phone;
        }
    }
}