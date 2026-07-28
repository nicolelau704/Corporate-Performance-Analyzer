<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PredicateCreation.aspx.cs" Inherits="Corporate_Performance_Analyzer.PredicateCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<!--This page allows users to form a predicate relationship between two knowledge objects in the "knowledgeobject" table
		The bottom of the page lists all the predicate relationships already in the "isa", "isp", and "isc" tables.-->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
		<section>
			<form id="form1" runat="server">
				<section>
					<!--Page Header-->
					<h1>Knowledge</h1>
					<!--End of Page Header-->

					<!--Predicate Creation Section-->
					<section>
						<!--Section Header-->
						<h2 style="margin: 0px 0px 0px 0px;">Predicate Creation</h2>
						<!--End of Section Header-->
			
						<!--User will select an object from the dropdown of objects from the "knowledgeobject" table-->
						<div>
							<h4>Object A</h4>
							<p>
								<asp:DropDownList ID="ObjADropDown" runat="server" DataSourceID="ObjADataSource" DataTextField="KnowledgeObject1" DataValueField="KnowledgeObject1"></asp:DropDownList>
								<asp:SqlDataSource ID="ObjADataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" ProviderName="<%$ ConnectionStrings:CPADataConnectionString.ProviderName %>" 
									SelectCommand="SELECT KnowledgeObject1 FROM cpadata.knowledgeobject ORDER BY KnowledgeObject1 ASC">
								</asp:SqlDataSource>
							</p>
						</div>
						<!--End of Object A Field-->

						<!--User will select an object from the dropdown of objects from the "knowledgeobject" table-->
						<div>
							<h4>Object B</h4>
							<p>
								<asp:DropDownList ID="ObjBDropDown" runat="server" DataSourceID="ObjADataSource" DataTextField="KnowledgeObject1" DataValueField="KnowledgeObject1"></asp:DropDownList>
							</p>
						</div>
						<!--End of Object B Field-->

						<!--User will select the predicate type from the radiobutton list-->
						<div>
							<h4>Predicate Type</h4>
							<p>
								<asp:RadioButtonList ID="predType" CssClass="radioButtonList" runat="server" RepeatDirection="Vertical" Width="600px">
									<asp:ListItem Selected="true" Value="Attribute" Text="&nbsp;Attribute (&quot;OBJECT A&quot; is a &quot;OBJECT B&quot;)"></asp:ListItem>
									<asp:ListItem Value="Association" Text="&nbsp;Association (&quot;OBJECT A&quot; is part of &quot;OBJECT B&quot;)"></asp:ListItem>
									<asp:ListItem Value="Causality" Text="&nbsp;Causality (&quot;OBJECT A&quot; is caused by &quot;OBJECT B&quot;)"></asp:ListItem>
								</asp:RadioButtonList>
							</p>
						</div>
						<!--End of Predicate Type Field-->

						<!--Object A is submitted to "KnowledgeObjectA" and Object B is submitted to "KnowledgeObjectB" in the table that corresponds the Predicate Type (ISA,ISP,ISC)-->
						<div>
							<p>
								<asp:Button ID="createPredicate" runat="server" Text="Save Predicate" OnClick="createPredicate_Click" class="btn-n" width="150px"/>
							</p>
						</div>
					</section>
					<!--End of Predicate Creation Section-->

					<!--Start of Current Predicates Section-->
					<section>
						<!--Section Header-->
						<h2 style="margin: 60px 0px 0px 0px;">Current Predicates</h2>
						<!--End of Section Header-->

						<section class="columns" style="margin: 0px 0px 0px 0px;">
							<!--Column 1 shows all predicates already in the "isa" table-->
							<article class="col3">
								<h4>
									<!--Connection-->
									<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
										SelectCommand="SELECT KnowledgeObjectA, KnowledgeObjectB FROM cpadata.isa ORDER BY KnowledgeObjectA ASC"> 
									</asp:SqlDataSource>
									<!--End of Connection-->
									Is A
								</h4>
				
								<div>
									<!--List of "Is A" predicates-->
									<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowHeader="false">
										<Columns>
											<asp:BoundField DataField="KnowledgeObjectA" SortExpression="KnowledgeObjectA" />
											<asp:BoundField DataField="KnowledgeOBjectB" SortExpression="KnowledgeObjectB" />
										</Columns>
									</asp:GridView>
									<!--End of List of "Is A" predicates-->
								</div>
							</article>
							<!--End of Column 1-->

							<!--Column 2 shows all predicates already in the "isp" table-->
							<article class="col3">
								<h4>
									<!--Connection-->
									<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
										SelectCommand="SELECT KnowledgeObjectA, KnowledgeObjectB FROM cpadata.isp ORDER BY KnowledgeObjectA ASC"> 
									</asp:SqlDataSource>
									<!--End of Connection-->
									Is Part Of
								</h4>
				
								<div>
									<!--List of "Is Part Of" predicates-->
									<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" ShowHeader="false">
										<Columns>
											<asp:BoundField DataField="KnowledgeObjectA" SortExpression="KnowledgeObjectA" />
											<asp:BoundField DataField="KnowledgeObjectB" SortExpression="KnowledgeObjectB" />
										</Columns>
									</asp:GridView>
									<!--End of List of "Is Part Of" predicates-->
								</div>
							</article>
							<!--End of Column 2-->

							<!--Column 3 shows all predicates already in the "isc" table-->
							<article class="col3">
								<h4>
									<!--Connection-->
									<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
										SelectCommand="SELECT KnowledgeObjectA, KnowledgeObjectB FROM cpadata.isc ORDER BY KnowledgeObjectA ASC"> 
									</asp:SqlDataSource>
									<!--End of Connection-->
									Is Caused By
								</h4>
				
								<div>
									<!--List of "Is Caused By" predicates-->
									<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" ShowHeader="false">
										<Columns>
											<asp:BoundField DataField="KnowledgeObjectA" SortExpression="KnowledgeObjectA" />
											<asp:BoundField DataField="KnowledgeObjectB" SortExpression="KnowledgeObjectB" />
										</Columns>
									</asp:GridView>
									<!--End of List of "Is Caused By" predicates-->
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
