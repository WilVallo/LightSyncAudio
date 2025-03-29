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
    public partial class Client_Management : System.Web.UI.Page
    {
        string connstr = $"Data Source=.\\SQLExpress; Initial Catalog=LightSyncAudio; Integrated Security=SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {
            displayAtGrid();
        }
        public void clearInputFields()
        {
            acc_id_tb.Text = "";
            acc_name_tb.Text = "";
            verification.ClearSelection();
        }
        public void displayAtGrid()
        {
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string retrieve = "select acc_id, user_fname, user_lname, user_email, user_phone_num, user_verification, user_status from customer";
                SqlCommand cmd = new SqlCommand(retrieve, conn);
                SqlDataAdapter da2 = new SqlDataAdapter(retrieve, conn);

                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {

                    if (reader.Read())
                    {
                        No_Client.Text = "";
                        DataTable dt = new DataTable();
                        reader.Close();
                        da2.Fill(dt);
                        client_table.DataSource = dt;
                        client_table.DataBind();

                    }
                    else
                    {
                        No_Client.Text = "No Employees";
                    }

                }
                conn.Close();
            }
        }
        public void Select_Row(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                acc_id_tb.Text = "";

                int rowIndex = Convert.ToInt32(e.CommandArgument);

                if (rowIndex >= 0 && rowIndex < client_table.DataKeys.Count)
                {
                    string selectedID = client_table.DataKeys[rowIndex].Value.ToString();
                    acc_id_tb.Text = selectedID;

                    using (SqlConnection conn = new SqlConnection(connstr))
                    {
                        string retrieve = $"select acc_id, user_fname, user_lname, user_verification from Customer where acc_id = '{selectedID}'";
                        SqlCommand cmd = new SqlCommand(retrieve, conn);
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string userid = reader.GetString(0);
                                string fname = reader.GetString(1);
                                string lname = reader.GetString(2);
                                string verification_stats = reader.GetString(3);

                                acc_id_tb.Text = userid;
                                acc_name_tb.Text = fname + " " + lname;
                                verification.SelectedValue = verification_stats;
                            }
                        }
                        conn.Close();
                    }
                }
                else
                {
                    acc_id_tb.Text = "Error: Invalid row index!";
                }
            }
        }

        protected void save_btn_Click(object sender, EventArgs e)
        {
            if(acc_id_tb.Text.Trim() != "" && acc_name_tb.Text.Trim() != "") { 
                string acc_ID = acc_id_tb.Text;
                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    string updatestr = $"update Customer set user_verification = '{verification.SelectedValue}' where acc_id = '{acc_ID}'";
                    SqlCommand cmd = new SqlCommand(updatestr, conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                Response.Write($"<script>alert('Client {verification.SelectedValue}!');</script>");

                displayAtGrid();
                clearInputFields();
            }
            else
            {
                Response.Write($"<script>alert('Please select a client');</script>");
            }
        }

        protected void clear_btn_Click(object sender, EventArgs e)
        {
            clearInputFields();
        }
    }
}