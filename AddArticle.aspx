<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddArticle.aspx.cs" Inherits="Corporate_Performance_Analyzer.AddArticle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<!--This page allows users to submit articles about companies-->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<section class="content">
		<section>
			<form id="form1" runat="server">
				<section>
					<!--Page Header-->
					<h1>Text</h1>
					<!--End of Page Header-->

					<!--Start of Article Submission section-->
					<article>
						<!--Section Header-->
						<h2 style="margin: 0px 0px 0px 0px;">Article Submission</h2>
						<!--End of Section Header-->

						<!--User will select a company from a dropdown-->
						<div>
							<h4>Choose a Company</h4>
							<p>
								<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
									SelectCommand="SELECT Company FROM cpadata.company ORDER BY Company ASC"> 
								</asp:SqlDataSource> 
								<asp:DropDownList ID="companyDropDown" runat="server" DataSourceID="SqlDataSource1" DataTextField="Company" DataValueField="Company" Width="116px" AutoPostBack="True"></asp:DropDownList> <!--Lists company names-->
							</p>
						</div>
						<!--End of Company Selection-->
					
						<!--User will enter where the article comes from-->
						<div>
							<h4>Text Source</h4>
							<p>
								<asp:TextBox ID="textSource" runat="server"></asp:TextBox>
							</p>
						</div>
						<!--End of text source-->
					
						<!--User will enter the url for the article-->
						<div>
							<h4>Article URL</h4>
							<p>
								<asp:TextBox ID="articleURL" runat="server"></asp:TextBox>
							</p>
						</div>
						<!--End of article url-->
					
						<!--User will enter the title of the article-->
						<div>
							<h4>Article Title</h4>
							<p>
								<asp:TextBox ID="articleTitle" runat="server"></asp:TextBox>
							</p>
						</div>
						<!--End of article title-->

						<!--User will enter the contents of the article-->
						<div>
							<h4>Article Text</h4>
							<p>
								<asp:TextBox ID="articleText" runat="server" TextMode="MultiLine" Columns="20" Rows="10" Wrap="true"></asp:TextBox>
							</p>
						</div>
						<!--End of article text-->
					
						<!--Form values are submitted to cpadata.articles table-->
						<div>
							<p class="submit">
								<asp:Button ID="Button1" runat="server" Height="43px" OnClick="Button1_Click" Text="Submit Article" class="btn-n" width="150px"/>
							</p>
						</div>
					</article><br /><br />
					<!--End of Article Submission section--> 

					<!--Start of Current Articles Section-->
					<article>
						<div>
							<!--Section Header-->
							<h2 style="margin: 0px 0px 0px 0px;">Current Articles</h2>
							<!--End of Section Header-->
							<!--User will select a company from a dropdown-->
							<div>
								<h4>Choose a Company</h4>
								<p>
									<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
										SelectCommand="SELECT Company FROM cpadata.company ORDER BY Company ASC"> 
									</asp:SqlDataSource> 
									<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Company" DataValueField="Company" Width="116px" AutoPostBack="True"></asp:DropDownList> <!--Lists company names-->
								</p>
							</div>
							<!--End of Company Selection-->

							<section>
								<article>
									<!--List of articles(sorted by Company name)-->
									<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ArticleID" DataSourceID="SqlDataSource2" Width="950px" >
										<Columns>
											<asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
											<asp:BoundField DataField="ArticleTitle"  HeaderText="ArticleTitle" SortExpression="ArticleTitle" HTMLEncode="false"/>
											<asp:HyperLinkField DataTextField="ArticleURL" DataNavigateUrlFields="ArticleURL" HeaderText="ArticleURL" SortExpression="ArticleURL" />
										</Columns>
									</asp:GridView>
									<!--End of list of articles-->

									<!--Connection-->
									<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CPADataConnectionString %>" 
										SelectCommand="SELECT ArticleID, Company, ArticleTitle, ArticleURL FROM cpadata.articles WHERE (Company = @Param1) ORDER BY Company ASC">
										<SelectParameters>
                                            <asp:ControlParameter ControlID="DropdownList1" Name="Param1" PropertyName="SelectedValue" />
                                        </SelectParameters>
									</asp:SqlDataSource>
									<!--End of Connection-->
								</article>
							</section>
						</div>
					</article>
					<!--End of Current Articles Section-->
				</section>
			</form>
		</section>
	</section>
</asp:Content>
