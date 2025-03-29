using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace IT114L_G2_MP
{
    public partial class SignUp : System.Web.UI.Page
    {
        string connstr = $"Data Source=.\\SQLExpress; Initial Catalog=LightSyncAudio; Integrated Security=SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (tb_password.Text == tb_confirm_password.Text && tb_password.Text.Trim() != "")
            {
                string query = "select count(*) from Accounts";
                int record_count = 0;

                SqlConnection conn = new SqlConnection(connstr);
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                record_count = (int)cmd.ExecuteScalar();
                record_count += 1;

                string acc_id = $"{DateTime.Now.ToString("yyyyMMdd")}{record_count.ToString("D7")}";

                string insertstr_accounts = $"insert into accounts values ('{acc_id}','{tb_username.Text}','{tb_confirm_password.Text}','customer')";
                cmd = new SqlCommand(insertstr_accounts, conn);
                cmd.ExecuteNonQuery();

                string insertstr_customer = $"insert into customer values ('{acc_id}','{tb_fname.Text}','{tb_lastname.Text}','{tb_email.Text}'," +
                    $"'{tb_phone.Text}','{tb_buss_phone.Text}','{tb_comp_name.Text}','Unverified','Active')";
                cmd = new SqlCommand(insertstr_customer, conn);

                cmd.ExecuteNonQuery();

                conn.Close();

                Response.Write("<script>alert('Account Created!');</script>");

                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write("<script>alert('Password does not match!');</script>");
            }
        }
    }
}