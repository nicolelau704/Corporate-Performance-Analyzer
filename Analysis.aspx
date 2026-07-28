<%@ Page Title="" validateRequest="false" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Analysis.aspx.cs" Inherits="Corporate_Performance_Analyzer.Analysis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<!--This page allows users to select a company and a financial ratio, then it displays the financial ratio calculation for years 2015-2019.
		Below are articles related to the selected company and financial ratio-->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
		<section>
			<form id="form1" runat="server">
				<section>
					<!--Page Header-->
					<h1>Analysis</h1>
					<!--End of Page Header-->

					<!--Connection-->
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
                        SelectCommand="SELECT Company FROM cpadata.company ORDER BY Company ASC"> 
                    </asp:SqlDataSource>
					<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
                        SelectCommand="SELECT * FROM cpadata.articles WHERE (ArticleTitle = @Param1) ORDER BY ArticleTitle ASC"> 
						<SelectParameters>
                            <asp:ControlParameter ControlID="DropdownList3" Name="Param1" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
					<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
                        SelectCommand="SELECT RatioName FROM cpadata.rationames ORDER BY RatioName ASC"> 
                    </asp:SqlDataSource>
					<!--End of Connection-->

					<!--Start of Ratio Section-->
					<section>
						<!--Section Header-->
						<h2 style="margin: 0px 0px 0px 0px;">Ratio Comparison</h2>
						<!--End of Section Header-->
						
						<!--User will select a company-->
						<div>
							<h4>Select a Company</h4>
							<p>
								<asp:DropDownList ID="DropdownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" 
									DataTextField="Company" DataValueField="Company" Width="300px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
								</asp:DropDownList>
							</p>
						</div>
						<div>
							<h4>Select a Ratio</h4>
							<p>
								<asp:DropDownList ID="DropdownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" 
									DataTextField="RatioName" DataValueField="RatioName" Width="300px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"> 
								</asp:DropDownList>
							</p>
						</div>
						<div>
							<h4>Calculated Ratios for Each Year</h4>
							<p>2015: <asp:TextBox ID="TextBox1" runat="server" BorderStyle="none"></asp:TextBox></p> <br />
							<p>2016: <asp:TextBox ID="TextBox3" runat="server" BorderStyle="none"></asp:TextBox></p> <br />
							<p>2017: <asp:TextBox ID="TextBox4" runat="server" BorderStyle="none"></asp:TextBox></p> <br />
							<p>2018: <asp:TextBox ID="TextBox5" runat="server" BorderStyle="none"></asp:TextBox></p> <br />
							<p>2019: <asp:TextBox ID="TextBox6" runat="server" BorderStyle="none"></asp:TextBox></p> <br />
						</div>
						<!--End of company selection-->
					</section>
					<!--End of Ratio Section-->

					<!--Start of Articles Section-->
					<section>
						<!--Section Header-->
						<h2 style="margin: 0px 0px 0px 0px;">Related Articles</h2>
						<!--End of Section Header-->

						<!--Display of words searched-->
						<h4>Based on your selection, articles containing the following words were searched: </h4>
						<asp:TextBox runat="server" ID="MyBox" TextMode="MultiLine" Rows="10" />
						<!--End of display of words searched-->

						<!--List of Articles-->
						<section class="columns" style="margin: 0px 0px 0px 0px;">
							<article class="col2">
								<h4>Select an Article Title to View</h4>
								<p>
									<asp:DropDownList ID="DropDownList3" runat="server" Width="440px" AutoPostBack="True"></asp:DropDownList>
								</p>
							</article>
							<article class="col2">
								<h4>Article Text</h4>
								<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ArticleID" DataSourceID="SqlDataSource3" Width="950px" ShowHeader="false">
									<Columns>
										<asp:BoundField DataField="ArticleText"  HeaderText="ArticleText" SortExpression="ArticleText" HTMLEncode="false"/>
									</Columns>
								</asp:GridView>
							</article>
						</section>
						<!--End of List of Articles-->
					</section>
					<!--End of Articles Section-->
				</section>
			</form>
		</section>
	</section>
</asp:Content>
