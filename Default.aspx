<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Corporate_Performance_Analyzer.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<!--This page displays the home page, which has a carousel that leads to each tab in the navigation bar and a features section that
		expresses the site's basic features-->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Carousel of images under the navigation bar-->
	<section class="slider slider8">
		<article><!--Leads to Statements.aspx-->
			<img src="images/temp/slider1-image-06.jpg" alt="">
			<div><div>
				<h3><strong>Financial</strong> Statements</h3>
				<p>We provide real-time access to financial statements for your and rival companies through our algorithm to develop models for continued success. </p>
				<p><a href="Statements.aspx" class="cta">View Annual Reports</a></p>
			</div></div>
		</article>
		<article><!--Leads to CreateRatio.aspx-->
			<img src="images/temp/slider1-image-02.jpg" alt="">
			<div><div>
				<h3><strong>Ratio</strong> Construction</h3>
				<p>Build real-time ratios based on collected performance data to formulate new strategies.</p>
				<p><a href="CreateRatio.aspx" class="cta">Construct Ratios</a></p>
			</div></div>
		</article>
		<article><!--Leads to ObjectCreation.aspx-->
			<img src="images/temp/slider1-image-03.jpg" alt="">
			<div><div>
				<h3><strong>Semantic</strong> Knowledge </h3>
				<p>Engineer new objects to our semantic network to capture and view specific objects capable of being compared and indexed.	</p>
				<p><a href="ObjectCreation.aspx" class="cta">Create Objects</a></p>
			</div></div>
		</article>
		<article><!--Leads to AddArticle.aspx-->
			<img src="images/temp/slider1-image-04.jpg" alt="">
			<div><div>
				<h3><strong>Contextual</strong> Data</h3>
				<p>Add and view your companies information to our database to be further searched contextually based on our semantic objects.</p>
				<p><a href="AddArticle.aspx" class="cta">Add Source</a> </p>
			</div></div>
		</article>
		<article><!--Leads to Analysis.aspx-->
			<img src="images/temp/slider1-image-05.jpg" alt="">
			<div><div>
				<h3><strong>Our</strong> Analysis</h3>
				<p>Pull together all resources from our database for analyzation and corporate presentation.</p>
				<p><a href="Analysis.aspx" class="cta">Compile Resources</a> </p>
			</div></div>
		</article>
	</section>
	<!--End of carousel-->

	<!--Display features-->
	<section class="content">
		<section class="columns">
		 	<h2><span>Features</span></h2>
		 	<article class="col3 team">
		 		<div class="img-border"><img src="images/temp/chart-icon.png" alt="chart icon" height="256"></div>
		 		<h3>Standardized Performance</h3>
				<p class="position">Corporate Performance Analyzer provides standardized performance data and financial analysis on today’s leading companies. This decision support system leverages four key data resources through a knowledge-based intelligent agent. Through this platform, users are able to construct and calculate financial ratios, retrieve financial data, as well as view relevant qualitative information.</p>
		 	</article>
			<article class="col3 team">
		 		<div class="img-border"><img src="images/temp/money-icon.png" alt="money icon" height="256"></div>
		 		<h3>Financial Ratios</h3>
		 		<p class="position">Financial ratio analysis allow users to measure corporate performance in the past and determine what can be done to improve it in the future. Financial ratios are an ideal metric for performance, given its preciseness, reliability, and significance. We present the five types of ratios can be used in different stages of the business operating cycle - financing structure, asset allocation, asset utilization, sales profitability, and return on investment.</p>
		 	</article>
		 </section>
	</section>
	<!--End of features-->
</asp:Content>
