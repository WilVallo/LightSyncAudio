using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace IT114L_G2_MP
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        string connStr = $"Data Source=.\\SQLExpress; Initial Catalog=LightSyncAudio; Integrated Security=SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None; //not connected
            if (!IsPostBack)
            {
                LoadPackages();
            }
        }
        private void LoadPackages()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT package_id FROM Packages";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlPackages.DataSource = dt;
                ddlPackages.DataValueField = "package_id";
                ddlPackages.DataBind();
                ddlPackages.Items.Insert(0, new ListItem("-- Select a Package --", "0"));
            }
        }
        protected void ddlPackages_SelectedIndexChanged(object sender, EventArgs e)
        {
            string packageID = ddlPackages.SelectedValue;
            if (packageID != "0")
            {
                LoadPackageContents(packageID);
            }
            else
            {
                gvPackageContents.DataSource = null;
                gvPackageContents.DataBind();
            }
        }

        private void LoadPackageContents(string packageID)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                SELECT pi.equip_id, e.equip_brand, e.equip_model, pi.equip_qty
                FROM Package_Items pi
                JOIN Equipments e ON pi.equip_id = e.equip_id
                WHERE pi.package_id = @PackageID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PackageID", packageID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPackageContents.DataSource = dt;
                gvPackageContents.DataBind();
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string accID = Session["ID"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            int record_count = 0;
            string query = "select count(*) from Booking";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            record_count = (int)cmd.ExecuteScalar();
            record_count += 1;

            string insertstr = $"insert into Booking values ('{record_count.ToString("D15")}','{accID}','NONE','{name.Text}','{evtType.Text}',{numAttendees.Text},'{bookDate.Text}','{ddlPackages.SelectedValue}','Pending')";
            cmd = new SqlCommand(insertstr, conn);
            cmd.ExecuteNonQuery();

            insertstr = $"insert into LocationTBL values ('{record_count.ToString("D15")}','{region.Text}','{province.Text}','{city.Text}','{barangay.Text}','{address.Text}')";
            cmd = new SqlCommand(insertstr, conn);
            cmd.ExecuteNonQuery();

            decimal price = 0;
            string retrieve = "select package_price from Packages where package_id = @ID";

            cmd = new SqlCommand(retrieve, conn);
            cmd.Parameters.AddWithValue("@ID", ddlPackages.SelectedValue);
            object result = cmd.ExecuteScalar();

            if (result != null)
            {
                 price = Convert.ToDecimal(result.ToString());
            }
            
            insertstr = $"insert into Payment values ('{record_count.ToString("D15")}',0,0,{price},{price})";
            cmd = new SqlCommand(insertstr, conn);
            cmd.ExecuteNonQuery();

            conn.Close();

            clearPrompt();

            Response.Write("<script>alert('Booking created!');</script>");
        }

        public void clearPrompt()
        {
            name.Text = "";
            evtType.Text = "";
            numAttendees.Text = "";
            bookDate.Text = "";
            region.Text = "";
            city.Text = "";
            province.Text = "";
            barangay.Text = "";
            address.Text = "";
            ddlPackages.SelectedValue = "0";
            CheckBox1.Checked = false;
            LoadPackageContents("");
        }
    }
}