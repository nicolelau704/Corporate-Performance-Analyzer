<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CreateRatio.aspx.cs" Inherits="Corporate_Performance_Analyzer.CreateRatio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<!--This page allows users to create ratios based on the constructs in the "ratioconstruct" table-->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<section class="content">
		<section>
			<form id="form1" runat="server"> 			
				<section>
					<!--Page Header-->
					<h1>Ratios</h1>
					<!--End of Page Header-->

					<!--Ratio Creation Section-->
					<section>
						<!--Section Header-->
						<h2 style="margin: 0px 0px 0px 0px;">Ratio Creation</h2>
						<!--End of Section Header-->

						<!--Ratio Name Section-->
						<div>
							<h4>Ratio Name</h4>
							<p>
                                <asp:TextBox ID="TextBox1" runat="server" Style="width: 200px;"></asp:TextBox>
							</p>
						</div>
						<!--End of Ratio Name Section-->

						<!--Numerator Section-->
						<div>
							<h4>Numerator</h4>
							<p>
								<!--Connection-->
								<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
									SelectCommand="SELECT FinancialConstructs FROM cpadata.financialconstructs ORDER BY FinancialConstructs ASC"> 
								</asp:SqlDataSource>
								<!--End of Connection-->

								<!--User selects first financial construct-->
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="FinancialConstructs" DataValueField="FinancialConstructs" Style="width:265px;"></asp:DropDownList>&nbsp;
								<!--End of first financial construct selection-->

								<!--User selects operation-->
                                <asp:DropDownList ID="DropDownList2" runat="server" Style="width: 60px;">
									<asp:ListItem Selected="True" Value="None" Text=""></asp:ListItem>
									<asp:ListItem Value="+" Text=" + "></asp:ListItem>
									<asp:ListItem Value="-" Text=" - "></asp:ListItem>
									<asp:ListItem Value="*" Text=" * "></asp:ListItem>
									<asp:ListItem Value="/" Text=" / "></asp:ListItem>
                                </asp:DropDownList>&nbsp;
								<!--End of operation selection-->

								<!--User selects second financial construct-->
                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="FinancialConstructs" DataValueField="FinancialConstructs" Style="width:265px;"></asp:DropDownList>&nbsp;
								<!--End of second financial construct selection-->

                                <asp:Button ID="Button2" runat="server" Text="=" OnClick="Button2_Click"/>&nbsp;
								
								<!--Display combined numerator-->
								<asp:TextBox ID="TextBox2" runat="server" style="width:300px"></asp:TextBox>
								<!--End of combined numerator display-->
							</p>
						</div>
						<!--End of Numerator Section-->

						<!--Denominator Section-->
						<div>
							<h4>Denominator</h4>
							<p>
								<!--User selects financial construct-->
                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1" DataTextField="FinancialConstructs" DataValueField="FinancialConstructs" Style="width:265px;"></asp:DropDownList>&nbsp;
								<!--End of financial construct selection-->
							</p>
						</div>
						<!--End of Denominator Section-->

						<!--Submit Form with button-->
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save Ratio" Class="btn-n"/>
						<!--End of submission button-->
					</section><br /><br />
					<!--End of Ratio Creation Section-->

					<!--Current Ratios Section-->
					<section>
						<div>
							<!--Section Header-->
							<h2 style="margin: 0px 0px 0px 0px;">Current Ratios</h2>
							<!--End of Section Header-->

							<section>
								<article>
									<!--List of articles(sorted by Company name)-->
									<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RatioConstructID" DataSourceID="SqlDataSource2" Width="950px" >
										<Columns>
											<asp:BoundField DataField="RatioName" HeaderText="Ratio Name" SortExpression="RatioName" />
											<asp:BoundField DataField="Numerator"  HeaderText="Numerator" SortExpression="Numerator"/>
											<asp:BoundField DataField="Denominator"  HeaderText="Denominator" SortExpression="Denominator"/>
										</Columns>
									</asp:GridView>
									<!--End of list of articles-->

									<!--Connection-->
									<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
										SelectCommand="SELECT RatioConstructID, RatioName, Numerator, Denominator FROM cpadata.ratioconstruct ORDER BY RatioName ASC">
									</asp:SqlDataSource>
									<!--End of Connection-->
								</article>
							</section>
						</div>
					</section>
					<!--End of Current Ratios Section-->		
				</section>
			</form>
		</section>
	</section>
</asp:Content>
