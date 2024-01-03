using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;



namespace webForm_DB
{
    public partial class StudentDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Remove("Name");
                Session.Remove("Department");
                Session.Remove("Age");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ConnectionString;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Student (Name, Department, Age) VALUES (@Name, @Department, @Age)", connection))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Department", ddlDept.SelectedValue);
                        cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(txtAge.Text));

                        cmd.ExecuteNonQuery();

                        Session["Name"] = txtName.Text;
                        Session["Department"] = ddlDept.SelectedValue;
                        Session["Age"] = txtAge.Text;
                    }
                }

                Response.Redirect("~/Details.aspx");
            }
            catch (Exception ex)
            {
                lblSubmit.Text = "Error during form submission: " + ex.Message;
                lblSubmit.Visible = true;
            }
        }
    }
}
