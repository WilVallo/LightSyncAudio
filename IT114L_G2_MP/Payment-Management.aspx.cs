using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT114L_G2_MP
{
    public partial class Payment_Management : System.Web.UI.Page
    {
        string connstr = "Data Source=.\\SQLExpress; Initial Catalog=LightSyncAudio; Integrated Security=SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {
            GenerateTOField();
        }
        public void GenerateTOField()
        {
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string retrieve = $"select cust_id, user_fname, user_lname, event_name, event_date, a.package_id, " +
                    $"booking_total, booking_dp, package_price, booking_bal, booking_discount, e.team_name, e.team_tf from Booking a " +
                    $"join Customer b on a.cust_id = b.acc_id " +
                    $"join packages c on a.package_id = c.package_id " +
                    $"join Payment d on a.booking_id = d.booking_id " +
                    $"join Team e on a.team_name = e.team_name where a.cust_id = @ID and not event_status in ('Finished','Disapproved')";

                SqlCommand cmd = new SqlCommand(retrieve, conn);
                cmd.Parameters.AddWithValue("@ID", Session["ID"].ToString());
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        if (reader["booking_dp"].ToString() == "0.00")
                        {
                            pay.Enabled = true;
                        }

                        name.Text = reader["user_fname"].ToString() + " " + reader["user_lname"].ToString();
                        eventname.Text = reader["event_name"].ToString();
                        eventdate.Text = reader.GetDateTime(4).ToString("yyyy-MM-dd");
                        package.Text = reader["package_id"].ToString();
                        package_fee.Text = reader["package_price"].ToString();
                        downpayment.Text = reader["booking_dp"].ToString();
                        balance.Text = reader["booking_bal"].ToString();
                        discount.Text = reader["booking_discount"].ToString();
                        total_service_fee.Text = reader["booking_total"].ToString();
                        team_pf.Text = reader["team_tf"].ToString();
                    }
                    else
                    {
                        Response.Write($"<script>alert('You haven't create your booking yet');</script>");
                    }
                }
                conn.Close();

            }
        }


        public void ClearItem()
        {
            name.Text = "";
            eventname.Text = "";
            eventdate.Text = "";
            package.Text = "";
            package_fee.Text = "";
            discount.Text = "";
            downpayment.Text = "";
            balance.Text = "";
            team_pf.Text = "";
            total_service_fee.Text = "";
        }
        public string bookID(string cust_id)
        {
            string id = "";

            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                string retrieve = "SELECT TOP 1 booking_id " +
                  "FROM Booking " +
                  $"WHERE cust_id = {cust_id} AND event_status NOT IN ('Finished', 'Disapproved') " +
                  "ORDER BY event_date DESC";

                SqlCommand cmd = new SqlCommand(retrieve, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read()) 
                {
                    id = reader["booking_id"].ToString();
                }

                conn.Close();
            }

            return id;
        }
        protected void paid_Click(object sender, EventArgs e)
        {
            double downp = Convert.ToDouble(downpayment.Text) * 0.5;

            string update = $"update Payment set booking_dp = {downp} " +
                $"where booking_id = @BookingID";
                
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand (update, conn);
                cmd.Parameters.AddWithValue("@BookingID", bookID(Session["ID"].ToString()));
                cmd.ExecuteNonQuery();

                conn.Close();
            }

            ClearItem();
            GenerateTOField();
            pay.Enabled = false;

            Response.Write("<script>alert('Booking sucessfully paid!');</script>");
        }
    }
}