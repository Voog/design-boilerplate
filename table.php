<!DOCTYPE html>
<html lang="et">
	<!-- <html lang="{{ page.language_code }}"> -->
<head>
	<?php require("components/html-head.php") ?>
		<!-- {% include "html-head" %} -->
</head>

<body>
	<main class="site-content cfx" role="main">
		<?php require("components/site-header.php") ?>
			<!-- {% include "site-header" %} -->

		<main class="page-content cfx" role="main">
			<h1>Here's a good place for your slogan.</h1>
				<!-- <h1>{% contentblock name="slogan" %}{{ "title_goes_here" | lc }}{% endcontentblock %}</h1> -->
				<table width="100%">
					<tbody>
						<tr>
							<td><b>First name</b></td>
							<td><b>Last name</b></td>
							<td><b>Points</b></td>
						</tr>
						<tr>
							<td>Jill</td>
							<td>Smith</td>
							<td>50</td>
						</tr>
						<tr>
							<td>Eve</td>
							<td>Jackson</td>
							<td>94</td>
						</tr>
						<tr>
							<td>John</td>
							<td>Doe</td>
							<td>80</td>
						</tr>
						<tr>
							<td>Adam</td>
							<td>Johnson</td>
							<td>67</td>
						</tr>
					</tbody>
				</table>
				<!-- {% content %} -->
		</main>

		<?php require("components/site-footer.php") ?>
			<!-- {% include "site-footer" %} -->

	</section>
	<script>project.initCommonPage();</script>
</body>
</html>