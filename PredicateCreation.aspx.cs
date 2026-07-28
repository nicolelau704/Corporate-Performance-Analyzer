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
    public partial class PredicateCreation : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\cpadata.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void createPredicate_Click(object sender, EventArgs e)
        {
            /*
            //Connection for MS Access Database
            string connetionString = ConfigurationManager.ConnectionStrings["CPADataConnectionString"].ConnectionString;
            
            using (OleDbConnection myCon = new OleDbConnection(connetionString))
            {
                OleDbCommand cmd = new OleDbCommand();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = myCon;

                switch (PredicateDropDown.SelectedValue)
                {
                    case "Attribute":
                        myCon.Open();
                        cmd.CommandText = "INSERT INTO ISA ([KnowledgeObjectA],[KnowledgeObjectB]) values (?,?)";
                        cmd.Parameters.AddWithValue("@KnowledgeObjectA", ObjADropDown.SelectedValue);
                        cmd.Parameters.AddWithValue("@KnowledgeObjectB", ObjBDropDown.SelectedValue);
                        cmd.ExecuteNonQuery();
                        break;
                    case "Association":
                        myCon.Open();
                        cmd.CommandText = "INSERT INTO ISP ([KnowledgeObjectA],[KnowledgeObjectB]) values (?,?)";
                        cmd.Parameters.AddWithValue("@KnowledgeObjectA", ObjADropDown.SelectedValue);
                        cmd.Parameters.AddWithValue("@KnowledgeObjectB", ObjBDropDown.SelectedValue);
                        cmd.ExecuteNonQuery();
                        break;
                    case "Causality":
                        myCon.Open();
                        cmd.CommandText = "INSERT INTO ISC ([KnowledgeObjectA],[KnowledgeObjectB]) values (?,?)";
                        cmd.Parameters.AddWithValue("@KnowledgeObjectA", ObjADropDown.SelectedValue);
                        cmd.Parameters.AddWithValue("@KnowledgeObjectB", ObjBDropDown.SelectedValue);
                        cmd.ExecuteNonQuery();
                        break;
                    default:
                        // System.Windows.Forms.MessageBox.Show("Please Select A Predicate Type", "Caption", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                        break;
                }

                Response.Write("<script>alert('Submission successful');</script>");
                myCon.Close();                
            }
            */

            //Connection for MS SQL Server Database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;

            switch (predType.SelectedItem.Value)
            {
                case "Attribute":
                    con.Open();
                    cmd.CommandText = "INSERT INTO cpadata.isa values ('" + ObjADropDown.SelectedValue + "','" + ObjBDropDown.SelectedValue + "')";
                    cmd.ExecuteNonQuery();
                    break;
                case "Association":
                    con.Open();
                    cmd.CommandText = "INSERT INTO cpadata.isp values ('" + ObjADropDown.SelectedValue + "','" + ObjBDropDown.SelectedValue + "')";
                    cmd.ExecuteNonQuery();
                    break;
                case "Causality":
                    con.Open();
                    cmd.CommandText = "INSERT INTO cpadata.isc values ('" + ObjADropDown.SelectedValue + "','" + ObjBDropDown.SelectedValue + "')";
                    cmd.ExecuteNonQuery();
                    break;
                default:
                    // System.Windows.Forms.MessageBox.Show("Please Select A Predicate Type", "Caption", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                    break;
            }
                
            Response.Write("<script>alert('Submission successful'); window.location = 'PredicateCreation.aspx';</script>");
            con.Close();

        }
    }
}