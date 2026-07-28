<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ObjectCreation.aspx.cs" Inherits="Corporate_Performance_Analyzer.ObjectCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<!--This page allows users to create knowledge objects and select the type of object that it is. The object is added to the "knowledgeobject" table. 
		The bottom of the page lists all the current objects already in the "knowledgeobject" table. They are sorted by object type and alphabetical order-->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
		<section>
			<form id="form1" runat="server">
				<section>
					<!--Page Header-->
					<h1>Knowledge</h1>
					<!--End of Page Header-->

					<!--Object Creation Section-->
					<section>
						<!--Section Header-->
						<h2 style="margin: 0px 0px 0px 0px;">Object Creation</h2>
						<!--End of Section Header-->

						<!--User will enter the object name in the textbox-->
						<div>
							<h4>Object Name</h4>
							<p>
								<asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
							</p>
						</div>
						<!---End of Object Name Field-->
				
						<!--User will select the object type from the radiobutton list-->
						<div>
							<h4>Object Type</h4>
							<p>
								<asp:RadioButtonList ID="objType" CssClass="radioButtonList" runat="server" RepeatDirection="Vertical" Width="300px">
									<asp:ListItem Selected="true" Value="Resource" Text="&nbsp;Resource"></asp:ListItem>
									<asp:ListItem Value="Event" Text="&nbsp;Event"></asp:ListItem>
									<asp:ListItem Value="Agent" Text="&nbsp;Agent"></asp:ListItem>
								</asp:RadioButtonList>
							</p>
						</div>
						<!--End of Object Type Field-->

						<!--User will select the type of financial construct it is a part of-->
						<div>
							<h4>Financial Construct</h4>
							<p>
								<!--Connection-->
								<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
									SelectCommand="SELECT FinancialConstructs FROM cpadata.financialconstructs ORDER BY FinancialConstructs ASC"> 
								</asp:SqlDataSource>
								<!--End of Connection-->
								<asp:DropDownList ID="DropdownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" 
									DataTextField="FinancialConstructs" DataValueField="FinancialConstructs" Width="300px">
								</asp:DropDownList>
							</p>
						</div>
						<!--End of Financial Construct Selection-->

						<!--Object Name is submitted to "KnowledgeObject1" and Object Type is submitted to "ObjectType" and Financial Construct is submitted to "FinancialConstructs" in the "knowledgeobject" table-->
						<div>
							<p>
								<asp:Button name="send" ID="createObject" value="1" type="submit" runat="server" OnClick="createObject_Click" Text="Save Object" class="btn-n" width="150px"/>
							</p>
						</div>
					</section>
					<!--End of Object Creation Section-->

					<!--Start Current Objects Section-->
					<section>
						<!--Section Header-->
						<h2 style="margin: 60px 0px 0px 0px;">Current Objects</h2>
						<!--End of Section Header-->

						<section class="columns" style="margin: 0px 0px 0px 0px;">
							<!--Column 1 shows all Resource objects already in the "knowledgeobject" table-->
							<article class="col3">
								<h4>
									<!--Connection-->
									<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
										SelectCommand="SELECT KnowledgeObject1, ObjectType FROM cpadata.knowledgeobject WHERE (ObjectType = 'Resource') ORDER BY KnowledgeObject1 ASC"> 
									</asp:SqlDataSource>
									<!--End of Connection-->
									Resources
								</h4>
				
								<div>
									<!--List of Resources-->
									<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowHeader="false">
										<Columns>
											<asp:BoundField DataField="KnowledgeObject1" SortExpression="KnowledgeObject1" />
											<asp:BoundField DataField="ObjectType" SortExpression="ObjectType" />
										</Columns>
									</asp:GridView>
									<!--End of List of Resources-->
								</div>
							</article>
							<!--End of Column 1-->

							<!--Column 2 shows all Event objects already in the "knowledgeobject" table-->
							<article class="col3">
								<h4>
									<!--Connection-->
									<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
										SelectCommand="SELECT KnowledgeObject1, ObjectType FROM cpadata.knowledgeobject WHERE (ObjectType = 'Event') ORDER BY KnowledgeObject1 ASC"> 
									</asp:SqlDataSource>
									<!--End of Connection-->
									Events
								</h4>
				
								<div>
									<!--List of Events-->
									<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" ShowHeader="false">
										<Columns>
											<asp:BoundField DataField="KnowledgeObject1" SortExpression="KnowledgeObject1" />
											<asp:BoundField DataField="ObjectType" SortExpression="ObjectType" />
										</Columns>
									</asp:GridView>
									<!--End of List of Events-->
								</div>
							</article>
							<!--End of Column 2-->

							<!--Column 3 shows all Agent objects already in the "knowledgeobject" table-->
							<article class="col3">
								<h4>
									<!--Connection-->
									<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
										SelectCommand="SELECT KnowledgeObject1, ObjectType FROM cpadata.knowledgeobject WHERE (ObjectType = 'Agent') ORDER BY KnowledgeObject1 ASC"> 
									</asp:SqlDataSource>
									<!--End of Connection-->
									Agents
								</h4>
				
								<div>
									<!--List of Agents-->
									<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" ShowHeader="false">
										<Columns>
											<asp:BoundField DataField="KnowledgeObject1" SortExpression="KnowledgeObject1" HTMLEncode="false"/>
											<asp:BoundField DataField="ObjectType" SortExpression="ObjectType" />
										</Columns>
									</asp:GridView>
									<!--End of List of Agents-->
								</div>
							</article>
							<!--End of Column 3-->
						</section>
					</section>
					<!--End of Current Objects Section-->
				</section>
			</form>
		</section>
	</section>
</asp:Content>