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
    public partial class Team_Management : System.Web.UI.Page
    {
        string connstr = $"Data Source=.\\SQLExpress; Initial Catalog=LightSyncAudio; Integrated Security=SSPI;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTeam();
            }
        }
        protected void gvPackages_SelectedIndexChanged(object sender, EventArgs e)
        {
            string teamName = gvTeams.SelectedDataKey.Value.ToString();
            string pf;
            teamname.Text = teamName;

            using (SqlConnection conn = new SqlConnection(connstr)) {
                conn.Open();
                string select = "select team_tf from Team where team_name = @Name";
                SqlCommand cmd = new SqlCommand(select, conn);
                cmd.Parameters.AddWithValue("@Name",teamName);

                using (SqlDataReader reader = cmd.ExecuteReader()){
                    if (reader.Read()) // Move to the first record
                    {
                        pf = reader["team_tf"].ToString();
                        team_pf.Text = pf;
                    }
                }
                conn.Close();
            }
            displayAtGrid();
        }

        protected void gvPackages_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string teamName = gvTeams.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string deleteQuery = "DELETE FROM Team WHERE team_name = @TeamName";
                SqlCommand cmd = new SqlCommand(deleteQuery, conn);
                cmd.Parameters.AddWithValue("@TeamName", teamName);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            LoadTeam();
            gvNewTeam.DataSource = null;
            gvNewTeam.DataBind();
            ClearPrompt();
        }

        private void LoadTeam()
        {
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string query = "SELECT team_name, team_tf FROM Team WHERE NOT team_name = 'DEFAULT'";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();

                conn.Open();
                da.Fill(dt);
                conn.Close();

                gvTeams.DataSource = dt;
                gvTeams.DataBind();
            }
        }
        protected void gvPackage_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteItem")
            {
                // Get the row index
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvNewTeam.Rows[index];

                // Extract values from the selected row
                string empID = row.Cells[0].Text;

                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    conn.Open();

                    // Delete the item from Package_Items table
                    string deleteQuery = "update Employee set team_name = '' where emp_id = @EmpID";
                    SqlCommand deleteCmd = new SqlCommand(deleteQuery, conn);
                    deleteCmd.Parameters.AddWithValue("@EmpID", empID);

                    deleteCmd.ExecuteNonQuery();
                    }
                // Refresh the GridView
                displayAtGrid();
            }
        }
        private void ClearGrid()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("First Name");
            dt.Columns.Add("Last Name");

            gvNewTeam.DataSource = dt;
            gvNewTeam.DataBind();
        }
        public void displayAtGrid()
        {
            ClearGrid();
            LoadEmployees();

            ddlEmp.Enabled = true;
            addbtn.Enabled = true;

            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string retrieve = "select emp_id, emp_fname, emp_lname from Employee where team_name = @TeamName AND NOT team_name = 'DEFAULT'";
                SqlCommand cmd = new SqlCommand(retrieve, conn);
                cmd.Parameters.AddWithValue("@TeamName", teamname.Text);

                SqlDataAdapter da2 = new SqlDataAdapter(cmd); 
                DataTable dt = new DataTable();

                conn.Open();
                da2.Fill(dt);
                conn.Close();

                gvNewTeam.DataSource = dt;
                gvNewTeam.DataBind();
                conn.Close();
            }
        }
        
        protected void addbtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string teamName = teamname.Text;

                string insert = "update Employee set team_name = @TeamName where emp_id = @empID";

                conn.Open();
                SqlCommand cmd = new SqlCommand(insert, conn);
                cmd.Parameters.AddWithValue("@TeamName", teamName);
                cmd.Parameters.AddWithValue("@empID", ddlEmp.SelectedValue);
                cmd.ExecuteNonQuery();


                displayAtGrid();

                conn.Close();
            }
        }

        public void ClearPrompt()
        {
            ddlEmp.SelectedValue = "";
            ddlEmp.Enabled = false;
            addbtn.Enabled = false;
            teamname.Text = "";
            team_pf.Text = "";
        }
        protected void save_Click(object sender, EventArgs e)
        {
            if (teamname.Text.Trim() != "" && team_pf.Text.Trim() != "" && Convert.ToDecimal(team_pf.Text.Trim()) > 700) {
                string update = "update Team set team_tf = @PF where team_name = @Name";

                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(update, conn);
                    cmd.Parameters.AddWithValue("@PF", team_pf.Text);
                    cmd.Parameters.AddWithValue("@Name", teamname.Text);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("<script>alert('Changes Saved!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please enter Professional Fee (min PF: 700).');</script>");
            }

        }
        protected void createNew_Click(object sender, EventArgs e)
        {
            if (teamname.Text.Trim() != "" && team_pf.Text.Trim() != "" && Convert.ToInt32(team_pf.Text.Trim()) > 700)
            {
                ddlEmp.Enabled = true;
                addbtn.Enabled = true;
                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    string check = "select team_name from Team";
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(check, conn);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            if (reader["team_name"].ToString().ToUpper() == teamname.Text.ToUpper())
                            {
                                Response.Write("<script>alert('Team name taken! please select another');</script>");
                                return;
                            }
                        }
                    }

                    string insertstr = $"insert into Team values ('{teamname.Text}',{team_pf.Text})";
                    cmd = new SqlCommand(insertstr, conn);
                    cmd.ExecuteNonQuery();

                    conn.Close();

                    LoadTeam();
                    LoadEmployees();
                }
            }
            else
            {
                Response.Write("<script>alert('Please enter Team Name and Professional Fee (min PF: 700).');</script>");
            }
        }

        public void LoadEmployees()
        {
            string retrieve = "select * from Employee where team_name = ''";
            ddlEmp.Items.Clear();
            ddlEmp.Items.Add(new ListItem("-- Select Employee --",""));

            using(SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(retrieve, conn);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ddlEmp.Items.Add(new ListItem($"{reader["emp_fname"].ToString() + " " + reader["emp_lname"].ToString()}", reader["emp_id"].ToString()));
                    }
                }
                conn.Close();
            }
        }
    }
}
