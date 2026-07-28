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
    public partial class Analysis : System.Web.UI.Page
    {
        //Connection for SQL database
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\cpadata.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Section for extracting the financial constructs from the numerator and denominator of the chosen ratio name
            //Create initial variables
            string query3;
            ArrayList fcList = new ArrayList(); //Lists all the financial constructs available from the financialconstructs table
            ArrayList numList = new ArrayList(); //Gets the value of the numerator from the ratioconstruct table
            ArrayList oppList = new ArrayList(); //Gets the value of the operation from the ratioconstruct table
            ArrayList denList = new ArrayList(); //Gets the value of the denominator from the ratioconstruct table
            ArrayList usedfcList = new ArrayList(); //Holds all the financial constructs inside the numerator and denominator
            ArrayList articlesList = new ArrayList(); //Holds all articles titles for the related articles
            ArrayList fcISList = new ArrayList(); //Lists all the financial constructs from the financialconstructs table that come from the income statement
            ArrayList usedNum1List = new ArrayList(); //Holds the financial constructs from the first numerator textbox
            ArrayList usedNum2List = new ArrayList(); //Holds the financial constructs from the second numerator textbox
            ArrayList usedfc2List = new ArrayList(); //Holds all the financial constructs inside the numerator 
            ArrayList usedfc3List = new ArrayList(); //Holds all the financial constructs inside the denominator

            con.Open();
            SqlCommand command3 = new SqlCommand();
            SqlDataReader dataReader3;

            //Get the financial constructs from the financialconstructs table
            query3 = "SELECT FinancialConstructs FROM cpadata.financialconstructs ORDER BY FinancialConstructs ASC";
            command3.CommandType = CommandType.Text;
            command3.CommandText = query3;
            command3.Connection = con;
            dataReader3 = command3.ExecuteReader();

            //Save each financial construct to the arraylist
            while (dataReader3.Read())
            {
                fcList.Add(dataReader3[0].ToString());
            }
            con.Close();

            //Get the financial constructs that come from the income statement
            query3 = "SELECT FinancialConstructs FROM cpadata.incomestatement ORDER BY FinancialConstructs ASC";
            con.Open();
            command3.CommandType = CommandType.Text;
            command3.CommandText = query3;
            command3.Connection = con;
            dataReader3 = command3.ExecuteReader();

            //Save each financial construct to the arraylist
            while (dataReader3.Read())
            {
                //Checks if it is already in the arraylist before adding it
                if (!fcISList.Contains(dataReader3[0].ToString()))
                {
                    fcISList.Add(dataReader3[0].ToString());
                }
            }
            con.Close();

            //Get the whole numerator value for the selected ratio name
            query3 = "SELECT Numerator FROM cpadata.ratioconstruct WHERE (RatioName = '" + DropdownList4.SelectedValue + "')";
            con.Open();
            command3.CommandType = CommandType.Text;
            command3.CommandText = query3;
            command3.Connection = con;
            dataReader3 = command3.ExecuteReader();

            //Save the numerator value 
            while (dataReader3.Read())
            {
                numList.Add(dataReader3[0].ToString());
            }
            con.Close();

            //Convert the arraylist into a string
            string wholeNum = numList[0].ToString();

            //Get the numerator value for the selected ratio name for the first part
            query3 = "SELECT NV1 FROM cpadata.ratioconstruct WHERE (RatioName = '" + DropdownList4.SelectedValue + "')";
            con.Open();
            command3.CommandType = CommandType.Text;
            command3.CommandText = query3;
            command3.Connection = con;
            dataReader3 = command3.ExecuteReader();

            //Save the numerator value for the first part
            while (dataReader3.Read())
            {
                usedfcList.Add(dataReader3[0].ToString());
                usedfc2List.Add(dataReader3[0].ToString());
            }
            con.Close();

            //Get the numerator value for the selected ratio name for the second part
            query3 = "SELECT NV2 FROM cpadata.ratioconstruct WHERE (RatioName = '" + DropdownList4.SelectedValue + "')";
            con.Open();
            command3.CommandType = CommandType.Text;
            command3.CommandText = query3;
            command3.Connection = con;
            dataReader3 = command3.ExecuteReader();

            //Save the numerator value for the second part
            while (dataReader3.Read())
            {
                usedfcList.Add(dataReader3[0].ToString());
                usedfc2List.Add(dataReader3[0].ToString());
            }
            con.Close();

            //Get the operation value for the selected ratio name
            query3 = "SELECT Operation FROM cpadata.ratioconstruct WHERE (RatioName = '" + DropdownList4.SelectedValue + "')";
            con.Open();
            command3.CommandType = CommandType.Text;
            command3.CommandText = query3;
            command3.Connection = con;
            dataReader3 = command3.ExecuteReader();

            //Save operation 
            while (dataReader3.Read())
            {
                oppList.Add(dataReader3[0].ToString());
            }
            con.Close();

            //Save operation as string
            string operation = oppList[0].ToString();

            //Get the denominator value for the selected ratio name
            query3 = "SELECT Denominator FROM cpadata.ratioconstruct WHERE (RatioName = '" + DropdownList4.SelectedValue + "')";
            con.Open();
            command3.CommandType = CommandType.Text;
            command3.CommandText = query3;
            command3.Connection = con;
            dataReader3 = command3.ExecuteReader();

            //Save the denominator value 
            while (dataReader3.Read())
            {
                denList.Add(dataReader3[0].ToString());
            }
            con.Close();

            //Convert the arraylist into a string
            string wholeDen = denList[0].ToString();

            
            //Check if any of the financial constructs in fcList is inside numList and add it to the usedfcList if it is used(check for duplicates)
            for (int h = 0; h < fcList.Count; h++)
            {
                if (wholeNum.Contains(fcList[h].ToString()))
                {
                    //Checks if it is already in the arraylist before adding it
                    if (!usedfcList.Contains(fcList[h].ToString()))
                    {
                        usedfcList.Add(fcList[h].ToString());
                    }

                    //Checks if it is already in the arraylist befor adding it
                    if (!usedfc2List.Contains(fcList[h].ToString()))
                    {
                        usedfc2List.Add(fcList[h].ToString());
                    }
                }
            }
            
            
            //Check if any of the financial constructs in fcList is inside denList and add it to the usedfcList if it is used(check for duplicates)
            for (int f = 0; f < fcList.Count; f++)
            {
                if (wholeDen.Contains(fcList[f].ToString()))
                {
                    //Checks if it is already in the arraylist before adding it
                    if (!usedfcList.Contains(fcList[f].ToString()))
                    {
                        usedfcList.Add(fcList[f].ToString());
                    }

                    //Checks if it is already in the arraylist before adding it
                    if (!usedfc3List.Contains(fcList[f].ToString()))
                    {
                        usedfc3List.Add(fcList[f].ToString());
                    }
                }
            }
            //End of section for extracting the financial constructs from the numerator and denominator of the chosen ratio name

            //Section for pulling numeric values from the income statement or balance sheet depending on the selected rationame
            string query4;
            ArrayList numValue1List = new ArrayList(); //Holds all numeric values for each year of the selected company for the ratio construct selected in the first part of the numerator
            ArrayList numValue2List = new ArrayList(); //Holds all numeric values for each year of the selected company for the ratio construct selected in the second part of the numerator
            ArrayList denValueList = new ArrayList(); //Holds all numeric values for each year of the selected company for the ratio construct selected in the denominator
            ArrayList calculatedRatiosList = new ArrayList(); //Holds all calculated values for the selected rationame for the selected company
            SqlCommand command4 = new SqlCommand();
            SqlDataReader dataReader4;

            //Check if the selected financial construct is from the income statement(default balance sheet if now)
            for (int n = 0; n < usedfcList.Count; n++)
            {
                if (usedfcList[1].ToString().Equals(usedfc2List[1].ToString())) //numValue2 exists
                {
                    if (fcISList.Contains(usedfcList[n].ToString()))
                    {
                        //Pulls numbers from income statement
                        query4 = "SELECT Numbers FROM cpadata.incomestatement WHERE (Company = '" + DropdownList2.SelectedValue + "') AND (FinancialConstructs = '" + usedfcList[n].ToString() + "')";
                    }
                    else
                    {
                        //Pulls numbers from balance sheet
                        query4 = "SELECT Numbers FROM cpadata.balancesheet WHERE (Company = '" + DropdownList2.SelectedValue + "') AND (FinancialConstructs = '" + usedfcList[n].ToString() + "')";
                    }

                    con.Open();
                    command4.CommandType = CommandType.Text;
                    command4.CommandText = query4;
                    command4.Connection = con;
                    dataReader4 = command4.ExecuteReader();

                    //fix this later
                    //Save the value for each year to the arraylist
                    while (dataReader4.Read())
                    {
                        if (n < 1)
                        {
                            //add to numValue1
                            numValue1List.Add(dataReader4[0].ToString());
                        }
                        else if (n < 2)
                        {
                            //add to numValue2
                            numValue2List.Add(dataReader4[0].ToString());
                        }
                        else
                        {
                            //add to denValue
                            denValueList.Add(dataReader4[0].ToString());
                        }
                    }
                    con.Close();
                }
                else
                {
                    //second usedfcList item is the denominator
                    if (fcISList.Contains(usedfcList[n].ToString()))
                    {
                        //Pulls numbers from income statement
                        query4 = "SELECT Numbers FROM cpadata.incomestatement WHERE (Company = '" + DropdownList2.SelectedValue + "') AND (FinancialConstructs = '" + usedfc2List[n].ToString() + "')";
                    }
                    else
                    {
                        //Pulls numbers from balance sheet
                        query4 = "SELECT Numbers FROM cpadata.balancesheet WHERE (Company = '" + DropdownList2.SelectedValue + "') AND (FinancialConstructs = '" + usedfc2List[n].ToString() + "')";
                    }

                    con.Open();
                    command4.CommandType = CommandType.Text;
                    command4.CommandText = query4;
                    command4.Connection = con;
                    dataReader4 = command4.ExecuteReader();

                    //Save the value for each year to the arraylist
                    while (dataReader4.Read())
                    {
                        if (n < 1)
                        {
                            //add to numValue1
                            numValue1List.Add(dataReader4[0].ToString());
                        }
                        else
                        {
                            //add to denValueList
                            denValueList.Add(dataReader4[0].ToString());
                        }
                    }
                    con.Close();
                }
            }
            /*
            //Check that the numbers are added to the arraylist
            TextBox8.Text = ""; TextBox9.Text = ""; TextBox10.Text = "";
            for (int g = 0; g < 5; g++)
            {
                if (numValue1List.Count > 0)
                {
                    TextBox8.Text += numValue1List[g].ToString() + "|";
                }
                if (numValue2List.Count > 0)
                {
                    TextBox9.Text += numValue2List[g].ToString() + "|";
                }
                if (denValueList.Count > 0)
                {
                    TextBox10.Text += denValueList[g].ToString() + "|";
                }
            }
            */

            //End of section for pulling numeric values from the income statement or balance sheet depending on the selected rationame

            //Section for calculating the ratios for each year
            //calculate the ratio value for each year for the selected company and selected rationame
            double temp;

            for (int p = 0; p < 5; p++)
            {
                if (operation != "None")
                {
                    switch (operation.Trim())
                    {
                        case "+":
                            temp = (Int32.Parse(numValue1List[p].ToString()) + Int32.Parse(numValue2List[p].ToString())) / Double.Parse(denValueList[p].ToString()); calculatedRatiosList.Add(temp); break;
                        case "-":
                            temp = (Int32.Parse(numValue1List[p].ToString()) - Int32.Parse(numValue2List[p].ToString())) / Double.Parse(denValueList[p].ToString()); calculatedRatiosList.Add(temp); break;
                        case "*":
                            temp = (Int32.Parse(numValue1List[p].ToString()) * Int32.Parse(numValue2List[p].ToString())) / Double.Parse(denValueList[p].ToString()); calculatedRatiosList.Add(temp); break;
                        default:
                            temp = (Int32.Parse(numValue1List[p].ToString()) / Int32.Parse(numValue2List[p].ToString())) / Double.Parse(denValueList[p].ToString()); calculatedRatiosList.Add(temp); break;
                    }
                }
                else
                {
                    if (denValueList.Count > 0)
                    {
                        temp = (Double.Parse(numValue1List[p].ToString()) / Double.Parse(denValueList[p].ToString()));
                        calculatedRatiosList.Add(temp);
                    }
                }
            }

            //Display calculations based on year
            TextBox1.Text = calculatedRatiosList[0].ToString();
            TextBox3.Text = calculatedRatiosList[1].ToString();
            TextBox4.Text = calculatedRatiosList[2].ToString();
            TextBox5.Text = calculatedRatiosList[3].ToString();
            TextBox6.Text = calculatedRatiosList[4].ToString();


            //End of section for calculating the ratios for each year

            //Section for saving all knowledgeobjects related to the selected financialconstruct into an arraylist
            //Create initial variables
            string query;
            ArrayList valuesList = new ArrayList();
            SqlCommand command = new SqlCommand();
            SqlDataReader dataReader;

            //Get the knowledgeobject for each financial construct in the selected ratioconstruct formula
            for (int q = 0; q < usedfcList.Count; q++)
            {

                query = "SELECT KnowledgeObject1 FROM cpadata.knowledgeobject WHERE FinancialConstructs='" + usedfcList[q].ToString() + "'";
                con.Open();
                command.CommandType = CommandType.Text;
                command.CommandText = query;
                command.Connection = con;
                dataReader = command.ExecuteReader();

                //Save each knowledgeobject to an arraylist
                while (dataReader.Read())
                {
                    valuesList.Add(dataReader[0].ToString());
                }
                con.Close();

                /*
                //Checks if the knowledgeobjects were saved to the arraylist correctly by displaying what is in
                //the arraylist (each item is separated by a space)
                for (int i = 0; i < valuesList.Count; i++)
                {
                    TextBox1.Text += valuesList[i].ToString() + " ";
                }
                */

                //Save the number of original values in the array(so that you don't end up grabbing all those new words each time)
                int number = valuesList.Count;

                //Get related knowledgeobjects from isp based on selected words in the arraylist
                for (int j = 0; j < number; j++)
                {
                    query = "SELECT KnowledgeObjectB FROM cpadata.isp WHERE KnowledgeObjectA ='" + valuesList[j].ToString() + "'";
                    con.Open();
                    command.CommandType = CommandType.Text;
                    command.CommandText = query;
                    command.Connection = con;
                    dataReader = command.ExecuteReader();

                    //Save each isp word to the same arraylist
                    while (dataReader.Read())
                    {
                        //Checks if it is already in the arraylist before adding it
                        if (!valuesList.Contains(dataReader[0].ToString()))
                        {
                            valuesList.Add(dataReader[0].ToString());
                        }
                    }
                    con.Close();

                    //Save each isa word to the same arraylist
                    query = "SELECT KnowledgeObjectB FROM cpadata.isa WHERE KnowledgeObjectA ='" + valuesList[j].ToString() + "'";
                    con.Open();
                    command.CommandType = CommandType.Text;
                    command.CommandText = query;
                    command.Connection = con;
                    dataReader = command.ExecuteReader();
                    while (dataReader.Read())
                    {
                        //Checks if it is already in the arraylist before adding it
                        if (!valuesList.Contains(dataReader[0].ToString()))
                        {
                            valuesList.Add(dataReader[0].ToString());
                        }
                    }
                    con.Close();

                    //Saves each isc word to the same arraylist
                    query = "SELECT KnowledgeObjectB FROM cpadata.isc WHERE KnowledgeObjectA ='" + valuesList[j].ToString() + "'";
                    con.Open();
                    command.CommandType = CommandType.Text;
                    command.CommandText = query;
                    command.Connection = con;
                    dataReader = command.ExecuteReader();
                    while (dataReader.Read())
                    {
                        //Checks if it is already in the arraylist before adding it
                        if (!valuesList.Contains(dataReader[0].ToString()))
                        {
                            valuesList.Add(dataReader[0].ToString());
                        }
                    }
                    con.Close();
                }
            }

            //Checks if isp,isa, and isc made it into the arraylist
            int count = 0;
            for (int k = 0; k < valuesList.Count; k++)
            {
                if (k > 0) {
                    MyBox.Text += " #" + valuesList[k].ToString(); 
                } else {
                    MyBox.Text += "#" + valuesList[k].ToString();
                }
                count++;
            }
            
            //End of section for saving all knowledge objects to the arraylist

            //Section for pulling up articles with words like the ones in the arraylist
            //Create initial variables
            string query2;
            SqlCommand command2 = new SqlCommand();
            SqlDataReader dataReader2;

            //Get the articletitle of all articles that contain words from the arraylist in the articletext
            for (int a = 0; a < valuesList.Count; a++)
            {
                query2 = "SELECT ArticleTitle FROM cpadata.articles WHERE (ArticleText LIKE '%" + valuesList[a].ToString() + "%') AND (Company ='" + DropdownList2.SelectedValue + "')";
                con.Open();
                command2.CommandType = CommandType.Text;
                command2.CommandText = query2;
                command2.Connection = con;
                dataReader2 = command2.ExecuteReader();

                //Save each related article title to the arraylist
                while (dataReader2.Read())
                {
                    //Checks if it is already in the arraylist before adding it
                    if (!articlesList.Contains(dataReader2[0].ToString()))
                    {
                        articlesList.Add(dataReader2[0].ToString());
                    }
                }
                con.Close();
            }
            //Populate DropDownList3 with the article titles
            DropDownList3.DataSource = articlesList;
            DropDownList3.DataBind();

            //End of section for pulling up articles with words like the ones in the arraylist
        }


        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Calls Financial Construct dropdown to refresh the results
            DropDownList1_SelectedIndexChanged(sender, e);
        }

    }
}