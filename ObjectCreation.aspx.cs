using System;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace Corporate_Performance_Analyzer
{
    public partial class ObjectCreation : System.Web.UI.Page
    {
        //Connection for SQL database
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\cpadata.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void createObject_Click(object sender, EventArgs e)
        {
            /*
            //Connection for MS Access Database
            string connetionString = ConfigurationManager.ConnectionStrings["CPADataConnectionString"].ConnectionString;

            using (OleDbConnection myCon = new OleDbConnection(connetionString))
            {

                OleDbCommand cmd = new OleDbCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO KnowledgeObject ([KnowledgeObject1],[ObjectType]) values (?,?)";
                cmd.Parameters.AddWithValue("@KnowledgeObject1", TextBox1.Text);
                cmd.Parameters.AddWithValue("@ObjectType", DropDownList1.SelectedValue);

                cmd.Connection = myCon;
                myCon.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Submission successful');</script>");
                myCon.Close();
            }
            */

            //Connection for MS SQL Server Database
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;

            //Convert form inputs to encoded html text
            string TextBox1Safe = Server.HtmlEncode(TextBox1.Text);

            //Save form input into cpadata.knowledgeobject table
            cmd.CommandText = "INSERT INTO cpadata.knowledgeobject values ('" + TextBox1Safe + "','" + objType.SelectedItem.Value + "','" + DropdownList1.SelectedValue + "')";
            cmd.ExecuteNonQuery();

            //Display success message
            Response.Write("<script>alert('Submission successful'); window.location ='ObjectCreation.aspx';</script>");
            con.Close();
        }
    }
}