using System;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Collections;
using System.Web;

namespace Corporate_Performance_Analyzer
{
    public partial class CreateRatio : System.Web.UI.Page
    {
        //Connection for SQL database
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\cpadata.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Populate the combined numerator textbox
            TextBox2.Text = DropDownList1.SelectedValue + DropDownList2.SelectedItem.Text + DropDownList3.SelectedValue;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Connection for MS SQL Server Database
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            SqlCommand cmd2 = con.CreateCommand();
            cmd2.CommandType = CommandType.Text;

            //Populate the combined numerator textbox
            TextBox2.Text = DropDownList1.SelectedValue + DropDownList2.SelectedItem.Text + DropDownList3.SelectedValue;

            //Save form input into cpadata.ratioconstruct table
            cmd.CommandText = "INSERT INTO cpadata.ratioconstruct values ('" + TextBox1.Text + "','" + TextBox2.Text + "','" + DropDownList4.SelectedValue + "','" + DropDownList2.SelectedValue + "','" + DropDownList1.SelectedValue + "','" + DropDownList3.SelectedValue + "')";
            cmd.ExecuteNonQuery();

            //Save ratio name into cpadata.rationames table
            cmd2.CommandText = "INSERT INTO cpadata.rationames values ('" + TextBox1.Text + "')";
            cmd2.ExecuteNonQuery();

            //Display success message
            Response.Write("<script>alert('Submission successful'); window.location ='CreateRatio.aspx';</script>");
            con.Close();
        }
    }
}