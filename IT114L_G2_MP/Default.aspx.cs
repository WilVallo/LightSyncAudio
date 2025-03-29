using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Emit;

namespace IT114L_G2_MP
{
    public partial class Default : System.Web.UI.Page
    {
        string connstr = $"Data Source=.\\SQLExpress; Initial Catalog=LightSyncAudio; Integrated Security=SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = unameTB.Text.Trim();
            string password = pwordTB.Text.Trim();

            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string query = "select acc_type, acc_id from accounts where acc_uname = @username and acc_pword = @password";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {

                    if (reader.Read())
                    {
                        string accType = reader["acc_type"].ToString();
                        string accID = reader["acc_id"].ToString();

                        Session["Username"] = username;
                        Session["AccountType"] = accType;
                        Session["ID"] = accID;

                        if (accType == "staff")
                        {
                            Response.Redirect("Event-Management.aspx");
                        }

                        else if (accType == "customer")
                        {
                            Response.Redirect("Home.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Something went wrong on our end');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Please enter a username or password');</script>");
                    }
                    reader.Close();
                    conn.Close();
                }
            }
        }
    }
}