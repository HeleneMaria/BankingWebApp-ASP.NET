using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data;

namespace Assignment_2
{
    public class Scheduler
    {
        public void BillPayScheduler (DataTable BillPays) {
            bool changed = false;
            char pause_flag = ' ';

            do{
                System.Threading.Thread.Sleep(60000);


                foreach (DataRow r in BillPays.Rows)
                {
                    pause_flag = ' ';
                    try
                    {
                        pause_flag = char.Parse(r["PauseFlag"].ToString());
                    }
                    catch (FormatException e)
                    { 
                        //null in DB
                    }
                    DateTime date = DateTime.Parse(r["ScheduleDate"].ToString());
                    if (date.Date <= DateTime.Today && pause_flag != 'P') {

                        int accountNum = int.Parse(r["AccountNumber"].ToString());
                        float amount = (float)decimal.Parse(r["Amount"].ToString());


                        //First check for sufficient funds
                        char accounttype    = DBBizOb.DbConnect.GetAccountType(accountNum);
                        float balance       = DBBizOb.DbConnect.GetBalance(accountNum);
                        int trans_count     = DBBizOb.DbConnect.GetTransactionCount(accountNum);


                        //round sum
                        double sum = (Math.Round((double)balance-amount, 2));

                        //do the transfer if funds are sufficient
                        if (accounttype == 'S' && trans_count < 5 && (sum >= 0) ||
                            accounttype == 'C' && trans_count < 5 && (sum >= 200) ||
                            accounttype == 'S' && trans_count >= 5 && (sum >= 0.20) ||
                            accounttype == 'C' && trans_count >= 5 && (sum >= 200.20)
                            )
                        {

                            string comment = "Transfer to PayeeID " + r["PayeeID"];
                            DBBizOb.DbConnect.InsertBillPayTransfer(
                                    accountNum,
                                    amount,
                                    comment
                                );

                            if (trans_count >= 5)
                                DBBizOb.DbConnect.InsertBillPayFee(accountNum);


                            char period = char.Parse(r["Period"].ToString());

                            if (period == 'S')
                            {
                                // Once --> Delete from BillPay
                                DBBizOb.DbConnect.DeleteBillPay(int.Parse(r["BillPayID"].ToString()));
                            }
                            else
                            {
                                if (period == 'M')
                                {
                                    date = date.AddMonths(1);
                                }

                                if (period == 'Q')
                                {
                                    date = date.AddMonths(3);
                                }

                                if (period == 'Y')
                                {
                                    date = date.AddYears(1);
                                }

                                // monthly/quart/yearly --> update schedule date
                                DBBizOb.DbConnect.UpdateBillPayScheduleDate(
                                        int.Parse(r["BillPayID"].ToString()),
                                        date,
                                        DateTime.Now,
                                        period
                                    );
                            }
                        }
                        else { 
                        //Insert Error
                            DBBizOb.DbConnect.UpdateBillPayScheduleDate(
                                        int.Parse(r["BillPayID"].ToString()),
                                        DateTime.MaxValue,
                                        DateTime.Now,
                                        'E'
                                    );
                        }

                        changed = true;
                    }

                    if (changed == true)
                    {
                        BillPays = DBBizOb.DbConnect.readBillPay();
                        changed = false;
                    }
                }

            } while (!_shouldStop);
        }

        public void RequestStop()
        {
            _shouldStop = true;
        }

        private volatile bool _shouldStop;

    }
}