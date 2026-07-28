using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Corporate_Performance_Analyzer
{
    public partial class AddArticle : System.Web.UI.Page
    {
        // connection string
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\cpadata.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            // connect to database
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;

            //Convert form inputs to encoded html text
            string textSourceSafe = Server.HtmlEncode(textSource.Text);
            string articleURLSafe = Server.HtmlEncode(articleURL.Text);
            string articleTitleSafe = Server.HtmlEncode(articleTitle.Text);
            string articleTextSafe = Server.HtmlEncode(articleText.Text);

            //Save form to cpadata.articles table
            cmd.CommandText = "INSERT INTO cpadata.articles values ('" + companyDropDown.SelectedValue + "','" + textSourceSafe + "', '" + articleURLSafe + "','" + articleTitleSafe + "', '" + articleTextSafe + "')";
            cmd.ExecuteNonQuery();

            //Display success 
            Response.Write("<script type='text/javascript'>alert('Submission successful'); window.location ='AddArticle.aspx';</script>");
            con.Close();
        }
    }
}