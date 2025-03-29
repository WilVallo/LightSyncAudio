using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Drawing.Drawing2D;
using System.Reflection;

namespace IT114L_G2_MP
{
    public partial class Equipment_Management : System.Web.UI.Page
    {
        string connstr = "Data Source=.\\SQLExpress; Initial Catalog=LightSyncAudio; Integrated Security=SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            equip_acq.Text = DateTime.Now.ToString("yyyy-MM-dd");
            LoadGrid();
        }
        public void LoadGrid()
        {
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string retrieve = "select * from Equipments";
                SqlCommand cmd = new SqlCommand(retrieve, conn);
                SqlDataAdapter da2 = new SqlDataAdapter(retrieve, conn);

                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        DataTable dt = new DataTable();
                        reader.Close();
                        da2.Fill(dt);
                        gvEquipments.DataSource = dt;
                        gvEquipments.DataBind();
                    }
                }
                conn.Close();
            }
        }
        public void GeneratePurpose()
        {
            equip_purpose.Items.Clear();
            equip_purpose.Items.Add(new ListItem("-- Select Purpose --", ""));

            if (equip_type.SelectedValue == "Lights")
            {

                equip_purpose.Items.Add(new ListItem("Blinder", "Blinder"));
                equip_purpose.Items.Add(new ListItem("Moving Head", "Moving Head"));
                equip_purpose.Items.Add(new ListItem("PAR Light", "PAR Light"));
                equip_purpose.Items.Add(new ListItem("Strip Light", "Strip Light"));
            }
            else if (equip_type.SelectedValue == "Sounds")
            {
                equip_purpose.Items.Add(new ListItem("DI Box", "DI Box"));
                equip_purpose.Items.Add(new ListItem("Drum", "Drum"));
                equip_purpose.Items.Add(new ListItem("Guitar Amp", "Guitar Amp"));
                equip_purpose.Items.Add(new ListItem("House Speakers", "House Speakers"));
                equip_purpose.Items.Add(new ListItem("Keyboard Amp", "Keyboard Amp"));
                equip_purpose.Items.Add(new ListItem("Microphone", "Microphone"));
                equip_purpose.Items.Add(new ListItem("Mixer", "Backline"));
                equip_purpose.Items.Add(new ListItem("Monitors", "Monitors"));
                equip_purpose.Items.Add(new ListItem("Subwoofer", "Subwoofer"));
            }
            else if (equip_type.SelectedValue == "Others")
            {
                equip_purpose.Items.Add(new ListItem("Lazer", "Lazer"));
                equip_purpose.Items.Add(new ListItem("LED Wall", "LED Wall"));
                equip_purpose.Items.Add(new ListItem("Multimedia", "Multimedia"));
                equip_purpose.Items.Add(new ListItem("Roofing", "Roofing"));
                equip_purpose.Items.Add(new ListItem("Smoke Machine", "Smoke Machine"));
                equip_purpose.Items.Add(new ListItem("Stage", "Stage"));
                equip_purpose.Items.Add(new ListItem("Truss", "Truss"));
            }
            else
            {
                equip_purpose.Enabled = false;
            }
        }
        protected void ddl_typeChange(object sender, EventArgs e)
        {
            GeneratePurpose();
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string id = "";
            string type = equip_type.SelectedValue;
            string brand = equip_brand.Text;
            string model = equip_model.Text;
            int qty = Convert.ToInt32(equip_quant.Text);
            string acq = Convert.ToDateTime(equip_acq.Text).ToString("yyyy-MM-dd");
            string fuct = equip_purpose.Text;
            decimal ppd = Convert.ToDecimal(equip_ppd.Text);

            if (equip_type.SelectedValue == "Lights") { id += "L"; }
            else if (equip_type.SelectedValue == "Sounds") { id += "S"; }
            else { id += "O"; }

            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string getID_Length = $"select count(*) from equipments where equip_type = '{type}'";
                int record_count = 0;

                SqlCommand cmd = new SqlCommand(getID_Length, conn);
                conn.Open();
                record_count = (int)cmd.ExecuteScalar();
                record_count += 1;

                string insertstr = $"insert into equipments values ('{id}{record_count.ToString("D13")}','{brand}','{model}',{ppd},{qty},'{acq}','{fuct}','{type}')";

                cmd = new SqlCommand(insertstr, conn);
                cmd.ExecuteNonQuery();

                conn.Close();
            }
            LoadGrid();

            Response.Write("<script>alert('Equipment Added!');</script>");
        }
        public void editPurpose()
        {
            edit_func.Items.Clear();
            edit_func.Items.Add(new ListItem("-- Select Purpose --", ""));

            if (edit_type.SelectedValue == "Lights")
            {

                edit_func.Items.Add(new ListItem("Blinder", "Blinder"));
                edit_func.Items.Add(new ListItem("Moving Head", "Moving Head"));
                edit_func.Items.Add(new ListItem("PAR Light", "PAR Light"));
                edit_func.Items.Add(new ListItem("Strip Light", "Strip Light"));
            }
            else if (edit_type.SelectedValue == "Sounds")
            {
                edit_func.Items.Add(new ListItem("DI Box", "DI Box"));
                edit_func.Items.Add(new ListItem("Drum", "Drum"));
                edit_func.Items.Add(new ListItem("Guitar Amp", "Guitar Amp"));
                edit_func.Items.Add(new ListItem("House Speakers", "House Speakers"));
                edit_func.Items.Add(new ListItem("Keyboard Amp", "Keyboard Amp"));
                edit_func.Items.Add(new ListItem("Microphone", "Microphone"));
                edit_func.Items.Add(new ListItem("Mixer", "Backline"));
                edit_func.Items.Add(new ListItem("Monitors", "Monitors"));
                edit_func.Items.Add(new ListItem("Subwoofer", "Subwoofer"));
            }
            else if (edit_type.SelectedValue == "Others")
            {
                edit_func.Items.Add(new ListItem("Lazer", "Lazer"));
                edit_func.Items.Add(new ListItem("LED Wall", "LED Wall"));
                edit_func.Items.Add(new ListItem("Multimedia", "Multimedia"));
                edit_func.Items.Add(new ListItem("Roofing", "Roofing"));
                edit_func.Items.Add(new ListItem("Smoke Machine", "Smoke Machine"));
                edit_func.Items.Add(new ListItem("Stage", "Stage"));
                edit_func.Items.Add(new ListItem("Truss", "Truss"));
            }
            else
            {
                edit_func.Enabled = true;
            }
        }
        protected void ddl_typeEdit(object sender, EventArgs e)
        {
            editPurpose();
        }
        protected void gvEquipments_SelectedIndexChanged(object sender, EventArgs e)
        {
            edit_func.Enabled = true;
            string equipID = gvEquipments.SelectedRow.Cells[1].Text;

            SqlConnection conn = new SqlConnection(connstr);
            conn.Open();
            SqlCommand cmd = new SqlCommand($"select * from Equipments where equip_id = '{equipID}'",conn);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                edit_ID.Text = reader["equip_id"].ToString();
                edit_type.SelectedValue = reader["equip_type"].ToString();
                editPurpose();

                edit_brand.Text = reader["equip_brand"].ToString();
                edit_model.Text = reader["equip_model"].ToString();

                DateTime dateVal = Convert.ToDateTime(reader["equip_acq"]);
                edit_acq.Text = dateVal.ToString("yyyy-MM-dd");

                edit_quant.Text = reader["equip_qty"].ToString();
                edit_ppd.Text = reader["equip_ppd"].ToString();
                edit_func.SelectedValue = reader["equip_funct"].ToString();
            }
            conn.Close();
        }

        protected void save_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string update = $"update Equipments set equip_brand = '{edit_brand.Text}', equip_model = '{edit_model.Text}', " +
                    $"equip_ppd = '{edit_ppd.Text}', equip_qty = '{edit_quant.Text}', equip_acq = '{edit_acq.Text}', equip_funct = '{edit_func.SelectedValue}'," +
                    $" equip_type = '{edit_type.SelectedValue}' where equip_id = {edit_ID.Text}";

                SqlCommand cmd = new SqlCommand(update, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();
            }
            LoadGrid();

            Response.Write("<script>alert('Equipment Updated!');</script>");
            edit_func.Enabled = false;
        }
    }
}