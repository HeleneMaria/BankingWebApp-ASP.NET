<h2>BankingWebApp - ASP.NET <br/> National Wealth Bank of Australia</h2>

This project was realized in october 2013 at the RMIT university. The team is composed of Camilla Knutsen, Dominik Bruechner, Charles Lahaye and me, Hélène MARIA.

This web application developing with ASP.NET permits to the user to log in, deposit money, make withdrawal, transfer money to another user. Those represents all the ATM transactions possible.
The user can also schedule his "bill pay" = transfer realized on a special date, or on a frequency.
The user can also see all the transactions he has done on an account, and change his details such as his address or phone number.

Service chage is applied as follows :<br/>
-Internet Transaction History : 0.20$ <br/>
-Internet FUnds Transfer : 0.20$ <br/>
-Internet "bill pay" : 0.30$ <br/>
-ATM Transactions : 0.20$ (4 free transactions) <br/>
-No negative balances are allowed <br/>
-Minimum balance allowed in a savings account : 0$, and 200$ for a checking account <br/>

For the project to work, simply create the database called banking by importing the script sql.sql in your microsoft SQL Server Management Studio. All the tables and stored procedures are in it. To login, try UserName : HMaria and Password : 1234
