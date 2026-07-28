<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Statements.aspx.cs" Inherits="Corporate_Performance_Analyzer.Statements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--This page displays both the income statement and balance sheet for the selected company and selected year-->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
        <section>
		    <form id="form1" runat="server">
		        <section>
                    <!--Page Header-->
                    <h1>Statements</h1>
                    <!--End of Page Header->

                    <!--Select the company and year (Data comes from "company" table and "year" table)-->
                    <h4>Choose a Company and Year</h4>
                    <p>
                        <!--Connection-->
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
                            SelectCommand="SELECT Company FROM cpadata.company ORDER BY Company ASC"> 
                        </asp:SqlDataSource> <!--Gets information about companies in the company table-->
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
                            SelectCommand="SELECT year FROM cpadata.year ORDER BY year ASC"> 
                        </asp:SqlDataSource> <!--Gets year numbers from the year table-->
                        <!--End of connection-->

                        <!--Input-->
                        <asp:DropDownList ID="DropdownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Company" DataValueField="Company" Width="300px"></asp:DropDownList>&nbsp; <!--Lists company names-->
                        <asp:DropDownList ID="DropdownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="Year" DataValueField="Year" Width="200px"></asp:DropDownList> <!--Lists years 2015-2019-->
                        <!--End of Input-->
                    </p>
                    <!--End of company selection-->
                
                    <section class="columns">
                        <!--Income Statement-->
                        <article class="col2"> 
                            <h3>
                                Income Statement
                            </h3>
                            <!--Display table(Data comes from "incomestatement" table)-->
                            <div>
                                <div>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                                        <Columns>
                                            <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
                                            <asp:BoundField DataField="CompanyYear" HeaderText="Year" SortExpression="CompanyYear"/>
                                            <asp:BoundField DataField="FinancialConstructs" HeaderText="Financial Construct" SortExpression="FinancialConstructs" />
                                            <asp:BoundField DataField="Numbers" HeaderText="Numbers" SortExpression="Numbers" />
                                        </Columns>
                                    </asp:GridView>

                                    <!--Connect table to data source-->
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
                                        SelectCommand="SELECT Company, CompanyYear, FinancialConstructs, Numbers FROM cpadata.incomestatement WHERE (Company = @Param1) AND (CompanyYear = @Param2)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropdownList1" Name="Param1" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="DropdownList2" Name="Param2" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <!--End of Connection to data source-->
                                </div>
                            </div>
                            <!--End of table-->
                        </article>
                        <!--End of Income Statement-->
                            
                        <!--Balance Sheet-->
                        <article class="col2"> 
                            <h3>
                                Balance Sheet
                            </h3>
                            <!--Display table(Data comes from "balancesheet" table)-->
                            <div>
                                <div>
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
                                        <Columns>
                                            <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company"/>
                                            <asp:BoundField DataField="CompanyYear" HeaderText="Year" SortExpression="CompanyYear"/>
                                            <asp:BoundField DataField="FinancialConstructs" HeaderText="Financial Construct" SortExpression="FinancialConstructs" />
                                            <asp:BoundField DataField="Numbers" HeaderText="Numbers" SortExpression="Numbers" />
                                        </Columns>
                                    </asp:GridView>

                                    <!--Connect table to data source -->
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
                                        SelectCommand="SELECT Company, CompanyYear, FinancialConstructs, Numbers FROM cpadata.balancesheet WHERE (Company = @Param1) AND (CompanyYear = @Param2)">
                                        <SelectParameters>                                   
                                            <asp:ControlParameter ControlID="DropdownList1" Name="Param1" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="DropdownList2" Name="Param2" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <!--End of connection to data source-->
                                </div>
                            </div>
                            <!--End of table-->
                        </article>
                        <!--End of Balance Sheet-->
                    </section>
                </section>
		    </form>
        </section>
	</section>
</asp:Content>
