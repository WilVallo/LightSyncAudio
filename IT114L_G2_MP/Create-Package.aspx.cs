using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Reflection;

namespace IT114L_G2_MP
{
    public partial class Create_Package : System.Web.UI.Page
    {
        string connstr = $"Data Source=.\\SQLExpress; Initial Catalog=LightSyncAudio; Integrated Security=SSPI;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmptyGrid();
                LoadPackages();
            }
        }
        protected void gvPackages_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedPackageID = gvPackages.SelectedDataKey.Value.ToString();

            packageID.Text = selectedPackageID;

            string select = $"select package_price from Packages where package_id = '{selectedPackageID}'";

            SqlConnection conn = new SqlConnection(connstr);

            conn.Open();

            SqlCommand cmd = new SqlCommand(select, conn);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                packagePrice.Text = reader["package_price"].ToString();
            }

            conn.Close();

            displayAtGrid(); 
        }
        protected void gvPackages_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string packageIDToDelete = gvPackages.DataKeys[e.RowIndex].Value.ToString();

            try
            {
                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    string deleteQuery = "DELETE FROM Packages WHERE package_id = @PackageID";
                    SqlCommand cmd = new SqlCommand(deleteQuery, conn);
                    cmd.Parameters.AddWithValue("@PackageID", packageIDToDelete);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                LoadPackages();
                gvEquipment.DataSource = null;
                gvEquipment.DataBind();
                ClearDDL();
                packageID.Text = "";
            }
            catch (System.Data.SqlClient.SqlException)
            {
                Response.Write("<script>alert('Package is currently being used');</script>");
            }
        }
        private void LoadPackages()
        {
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string query = "SELECT package_id FROM Packages";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();

                conn.Open();
                da.Fill(dt);
                conn.Close();

                gvPackages.DataSource = dt;
                gvPackages.DataBind();
            }
        }
        protected void gvEquipment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteItem")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvEquipment.Rows[index];

                string equipType = row.Cells[0].Text;
                string equipBrand = row.Cells[1].Text;
                string equipModel = row.Cells[2].Text;
                string equipQty = row.Cells[3].Text;
                string packageId = packageID.Text;

                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    conn.Open();

                    string equipIdQuery = "SELECT equip_id FROM Equipments WHERE equip_type = @Type AND equip_brand = @Brand AND equip_model = @Model";
                    SqlCommand equipIdCmd = new SqlCommand(equipIdQuery, conn);
                    equipIdCmd.Parameters.AddWithValue("@Type", equipType);
                    equipIdCmd.Parameters.AddWithValue("@Brand", equipBrand);
                    equipIdCmd.Parameters.AddWithValue("@Model", equipModel);

                    object result = equipIdCmd.ExecuteScalar();
                    if (result != null)
                    {
                        string equipId = result.ToString();

                        string deleteQuery = "DELETE FROM Package_Items WHERE package_id = @PackageID AND equip_id = @EquipID";
                        SqlCommand deleteCmd = new SqlCommand(deleteQuery, conn);
                        deleteCmd.Parameters.AddWithValue("@PackageID", packageId);
                        deleteCmd.Parameters.AddWithValue("@EquipID", equipId);

                        deleteCmd.ExecuteNonQuery();
                    }
                }
                displayAtGrid();
            }
        }
        private void ClearGrid()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Type");
            dt.Columns.Add("Brand");
            dt.Columns.Add("Model");
            dt.Columns.Add("Quantity");

            gvEquipment.DataSource = dt;
            gvEquipment.DataBind();
        }
        public void displayAtGrid()
        {
            ClearGrid();
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string retrieve = $"select A.equip_type as Type, A.equip_brand as Brand, A.equip_model as Model, B.equip_qty as Quantity from Equipments A right join package_items B on B.equip_id = A.equip_id where package_id = '{packageID.Text}'";
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
                        gvEquipment.DataSource = dt;
                        gvEquipment.DataBind();
                    }
                }
                conn.Close();
            }
        }
        private void BindEmptyGrid()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ItemType");
            dt.Columns.Add("Brand");
            dt.Columns.Add("Model");
            dt.Columns.Add("Quantity");

            // Bind empty DataTable to GridView
            gvEquipment.DataSource = dt;
            gvEquipment.DataBind();
        }

        protected void ddlItemType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (packageID.Text.Trim() != "") {
                ddlPurpose.Items.Clear();
                ddlPurpose.Items.Insert(0, new ListItem("-- Select Purpose --", "0"));

                string selectedType = ddlItemType.SelectedValue;

                if (selectedType != "0")
                {
                    using (SqlConnection conn = new SqlConnection(connstr))
                    {
                        string query = "SELECT DISTINCT equip_funct FROM Equipments WHERE equip_type = @equipType";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@equipType", selectedType);

                            conn.Open();
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.HasRows)
                                {
                                    while (reader.Read())
                                    {
                                        string functionValue = reader["equip_funct"].ToString();
                                        ddlPurpose.Items.Add(new ListItem(functionValue, functionValue));
                                    }
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Please create or select a package.');</script>");
                ClearDDL();
            }
        }

        protected void ddlPurpose_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlItemBrand.Items.Clear();
            ddlItemBrand.Items.Insert(0, new ListItem("-- Select Brand --", "0"));

            string selectedType = ddlPurpose.SelectedValue;

            if (selectedType != "0")
            {
                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    string query = "SELECT DISTINCT equip_brand FROM Equipments WHERE equip_funct = @equipType";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@equipType", selectedType);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        ddlItemBrand.Items.Add(new ListItem(reader["equip_brand"].ToString(), reader["equip_brand"].ToString()));
                    }
                    conn.Close();
                }
            }
        }
        protected void ddlItemBrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlItemModel.Items.Clear();
            ddlItemModel.Items.Insert(0, new ListItem("-- Select Model --", "0"));

            string selectedType = ddlItemBrand.SelectedValue;
            if (selectedType != "0")
            {
                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    string query = "SELECT DISTINCT equip_model FROM Equipments WHERE equip_brand = @equipBrand";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@equipBrand", selectedType);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        ddlItemModel.Items.Add(new ListItem(reader["equip_model"].ToString(), reader["equip_model"].ToString()));
                    }
                    conn.Close();
                }
            }
        }
        protected void ddlItemModel_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlItemQty.Items.Clear();
            ddlItemQty.Items.Insert(0, new ListItem("-- Select Quantity --", "0"));

            string selectedType = ddlItemModel.SelectedValue;
            if (selectedType != "0")
            {
                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    string query = "SELECT DISTINCT equip_qty FROM Equipments WHERE equip_model = @equipBrand";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@equipBrand", selectedType);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        int maxQty = Convert.ToInt32(reader["equip_qty"]);
                        for (int i = 1; i <= maxQty; i++)
                        {
                            ddlItemQty.Items.Add(new ListItem(i.ToString(), i.ToString()));
                        }
                    }
                    conn.Close();
                }
            }
        }

        protected void addbtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string package_id = packageID.Text;
                string equip_id = null;
                decimal price = 0;
                decimal equip_ppd = 0;

                string retrieve = "SELECT equip_id FROM Equipments WHERE equip_brand = @Brand AND equip_type = @Type AND equip_model = @Model";

                conn.Open();

                using (SqlCommand cmd = new SqlCommand(retrieve, conn))
                {
                    cmd.Parameters.AddWithValue("@Brand", ddlItemBrand.SelectedValue);
                    cmd.Parameters.AddWithValue("@Type", ddlItemType.SelectedValue);
                    cmd.Parameters.AddWithValue("@Model", ddlItemModel.SelectedValue);

                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        equip_id = result.ToString();
                    }
                }

                retrieve = $"select * from package_items where equip_id = '{equip_id}'";
                using (SqlCommand cmd = new SqlCommand(retrieve, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        Response.Write("<script>alert('Error: Equipment already in the list! Please delete and add the equipment again.');</script>");
                        ClearDDL();
                        return;
                    }
                }

                    if (!string.IsNullOrEmpty(equip_id))
                {
                    string insertstr = "INSERT INTO Package_Items VALUES (@PackageID, @EquipID, @Quantity)";

                    using (SqlCommand cmd = new SqlCommand(insertstr, conn))
                    {
                        cmd.Parameters.AddWithValue("@PackageID", package_id);
                        cmd.Parameters.AddWithValue("@EquipID", equip_id);
                        cmd.Parameters.AddWithValue("@Quantity", ddlItemQty.SelectedValue);

                        cmd.ExecuteNonQuery();
                    }

                    using (SqlCommand cmd = new SqlCommand("select equip_ppd from Equipments where equip_id = @ID", conn))
                    {
                        cmd.Parameters.AddWithValue("@ID", equip_id);

                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            equip_ppd = Convert.ToDecimal(result.ToString());
                        }
                    }

                    using (SqlCommand cmd = new SqlCommand("select package_price from Packages where package_id = @ID", conn))
                    {
                        cmd.Parameters.AddWithValue("@ID", package_id);

                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            price = Convert.ToDecimal(result.ToString());
                        }
                        price += equip_ppd * Convert.ToInt16(ddlItemQty.SelectedValue);

                        SqlCommand cmd2 = new SqlCommand("update Packages set package_price = @price where package_id = @ID", conn);
                        cmd2.Parameters.AddWithValue("@ID", package_id);
                        cmd2.Parameters.AddWithValue("@price", price);
                        cmd2.ExecuteNonQuery();
                    }
                    displayAtGrid();
                }
                else
                {
                    Response.Write("<script>alert('Error: Equipment not found');</script>");
                }
                ClearDDL();

                LoadPackages();
            }
        }

        protected void clearbtn_Click(object sender, EventArgs e)
        {
            ClearDDL();
        }

        public void ClearDDL()
        {
            package_name.Text = "";
            packagePrice.Text = "";
            packageID.Text = "";

            ddlItemBrand.Items.Clear();
            ddlItemModel.Items.Clear();
            ddlItemQty.Items.Clear();
            ddlPurpose.Items.Clear();

            ddlItemType.SelectedValue = "0";
            ddlItemBrand.Items.Insert(0, new ListItem("-- Select Brand --", "0"));
            ddlPurpose.Items.Insert(0, new ListItem("-- Select Purpose --", "0"));
            ddlItemModel.Items.Insert(0, new ListItem("-- Select Model --", "0"));
            ddlItemQty.Items.Insert(0, new ListItem("-- Select Quantityy --", "0"));
        }

        protected void createNew_Click(object sender, EventArgs e)
        {
            if (packageID.Text.Trim() != "" || package_name.Text.Trim() != "")
            {
                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    conn.Open();
                    string insertstr = $"insert into Packages values ('{package_name.Text}',{packagePrice.Text})";
                    SqlCommand cmd = new SqlCommand(insertstr, conn);
                    cmd.ExecuteNonQuery();

                    packageID.Text = $"{package_name.Text}";
                    createNew.Enabled = false;

                    conn.Close();
                }
            }
            else
            {
                Response.Write("<script>alert('Please create or select a package.');</script>");
            }
        }
        protected void price_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                string update = $"update Packages set package_price = {packagePrice.Text}";
                using (SqlCommand cmd = new SqlCommand(update, conn))
                {
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Package price updated!');</script>");
                }
                conn.Close();
            }
        }
    }        
}
