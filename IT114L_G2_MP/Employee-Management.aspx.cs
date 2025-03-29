using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;

namespace IT114L_G2_MP
{
    public partial class AccountManagement : System.Web.UI.Page
    {
        string connstr = $"Data Source=.\\SQLExpress; Initial Catalog=LightSyncAudio; Integrated Security=SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {
            displayAtGrid();
        }
        public void clearAddInput()
        {
            FirstName.Text = "";
            LastName.Text = "";
            Birthdate.Text = "";
            Email.Text = "";
            EmpType.ClearSelection();
            EmpGender.ClearSelection();
            EmpStatus.ClearSelection();
        }
        public void clearEditInput()
        {
            EditFirstName.Text = "";
            EditLastName.Text = "";
            EditEmployee.ClearSelection();
            EditStatus.ClearSelection();
            EditGender.ClearSelection();
            EmpID.Text = "";
            EditEmail.Text = "";
            EditBirthdate.Text = "";
        }
        public void Select_Row(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                EmpID.Text = "";

                int rowIndex = Convert.ToInt32(e.CommandArgument);

                if (rowIndex >= 0 && rowIndex < Emp_GridView.DataKeys.Count)
                {
                    string selectedID = Emp_GridView.DataKeys[rowIndex].Value.ToString();
                    EmpID.Text = selectedID;

                    using(SqlConnection conn = new SqlConnection(connstr))
                    {
                        string retrieve = $"select * from Employee where emp_id = '{selectedID}'";
                        SqlCommand cmd = new SqlCommand(retrieve, conn);
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string userid = reader.GetString(0);
                                string fname = reader.GetString(1);
                                string lname = reader.GetString(2);
                                string email = reader.GetString(3);
                                string type = reader.GetString(4);
                                string status = reader.GetString(5);
                                string gender = reader.GetString(6);
                                DateTime bdate = reader.GetDateTime(7);

                                EmpID.Text = userid;
                                EditFirstName.Text = fname;
                                EditLastName.Text = lname;
                                EditBirthdate.Text = bdate.ToString("yyyy-MM-dd");
                                EditEmail.Text = email;
                                EditStatus.SelectedValue = status;
                                EditGender.SelectedValue = gender;
                                EditEmployee.SelectedValue = type;
                            }
                        }
                        conn.Close();
                    }
                }
                else
                {
                    EmpID.Text = "Error: Invalid row index!";
                }
            }
        }
        public void displayAtGrid()
        {
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                string retrieve = "select emp_id, emp_fname, emp_lname, emp_email, emp_status from Employee";
                SqlCommand cmd = new SqlCommand(retrieve, conn);
                SqlDataAdapter da2 = new SqlDataAdapter(retrieve, conn);

                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {

                    if (reader.Read())
                    {
                        No_EMP.Text = "";
                        DataTable dt = new DataTable();
                        reader.Close();
                        da2.Fill(dt);
                        Emp_GridView.DataSource = dt;
                        Emp_GridView.DataBind();
                        
                    }
                    else
                    {
                        No_EMP.Text = "No Employees";
                    }
                    
                }
                conn.Close();
            }
        }
        protected void AddBtn_Click(object sender, EventArgs e)
        {
            if (FirstName.Text.Trim() != "" && LastName.Text.Trim() != "" && Email.Text.Trim() != "" && EmpType.SelectedIndex != -1 && EmpGender.SelectedIndex != -1 && EmpStatus.SelectedIndex != -1) {
                string fname = $"{FirstName.Text}";
                string lname = $"{LastName.Text}";
                string bdate = $"{Birthdate.Text}";
                string email = Email.Text;
                string type = EmpType.Text;
                string status = EmpStatus.Text;
                string gender = EmpGender.Text;

                string username = $"{Email.Text}";
                string password = $"{fname.ToLower()}{lname.ToLower()}";
                string query = "select count(*) from Accounts";
                int record_count = 0;

                SqlConnection conn = new SqlConnection(connstr);
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                record_count = (int)cmd.ExecuteScalar();
                record_count += 1;

                string acc_id = $"{DateTime.Now.ToString("yyyyMMdd")}{record_count.ToString("D7")}";

                string insertstr_accounts = $"insert into accounts values ('{acc_id}','{username}','{password}','staff')";
                cmd = new SqlCommand(insertstr_accounts, conn);
                cmd.ExecuteNonQuery();

                insertstr_accounts = $"insert into employee values ('{acc_id}','{fname}','{lname}','{email}','{type}','{status}','{gender}','{bdate}','')";
                cmd = new SqlCommand(insertstr_accounts, conn);
                cmd.ExecuteNonQuery();

                conn.Close();

                Response.Write($"<script>alert('New employee ({fname} {lname}) was added!');</script>");

                clearAddInput();
                displayAtGrid();
            }
            else
            {
                Response.Write("<script>alert('Please fill up the Add Employee section.');</script>");
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            string selectedID = EmpID.Text;

            using (SqlConnection conn = new SqlConnection(connstr))
            {
                try
                {
                    string retrieve = $"select * from Employee where emp_id = '{selectedID}'";
                    SqlCommand cmd = new SqlCommand(retrieve, conn);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (!reader.HasRows)
                        {
                            Response.Write("<script>alert('Employee Not Found!');</script>");
                            return;
                        }

                        while (reader.Read())
                        {
                            string userid = reader.GetString(0);
                            string fname = reader.GetString(1);
                            string lname = reader.GetString(2);
                            string email = reader.GetString(3);
                            string type = reader.GetString(4);
                            string status = reader.GetString(5);
                            string gender = reader.GetString(6);
                            DateTime bdate = reader.GetDateTime(7);

                            EmpID.Text = userid;
                            EditFirstName.Text = fname;
                            EditLastName.Text = lname;
                            EditBirthdate.Text = bdate.ToString("yyyy-MM-dd");
                            EditEmail.Text = email;
                            EditStatus.SelectedValue = status;
                            EditGender.SelectedValue = gender;
                            EditEmployee.SelectedValue = type;
                        }
                    }
                    conn.Close();
                }
                catch
                {
                    Response.Write($"<script>alert('Something went wrong on our end');</script>");
                }
            }

        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            string empID = EmpID.Text;
            if (empID.Trim() != "" && EditGender.SelectedIndex != -1 && EditStatus.SelectedIndex != -1 && EditFirstName.Text.Trim() != "" && EditLastName.Text.Trim() != "" && EditEmployee.SelectedIndex != -1) {
                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    string updatestr = $"update Employee set emp_fname = '{EditFirstName.Text}', emp_lname = '{EditLastName.Text}', emp_email = '{EditEmail.Text}'," +
                        $"emp_acc_type = '{EditEmployee.Text}', emp_status = '{EditStatus.Text}', emp_gender = '{EditGender.Text}', emp_bdate = '{EditBirthdate.Text}' where emp_id = '{empID}'";
                    SqlCommand cmd = new SqlCommand(updatestr, conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                Response.Write($"<script>alert('Employee edited!');</script>");

                displayAtGrid();
                clearEditInput();
            }
            else
            {
                Response.Write($"<script>alert('Please Select an Employee!');</script>");
            }
        }

        protected void RemoveBtn_Click(object sender, EventArgs e)
        {
            clearEditInput();
        }
    }
}