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
			<header class="content-header">
				<h1>Here's a good place for your slogan.</h1>
			</header>
				<!-- <h1>{% contentblock name="slogan" %}{{ "title_goes_here" | lc }}{% endcontentblock %}</h1> -->
			<form action="/form" method="post" id="form_285">
				<div style="margin:0;padding:0;">
					<input id="ticket_form_id" name="ticket[form_id]" type="hidden" value="285">
				</div>
				<div class="form_area">
					<div class="form_notice">Form has been submitted. Thank you!</div>
					<div class="form_error">Invalid data has been submitted!</div>
					<div style="display: none; visibility: hidden;">
						Email again: <input type="text" name="ticket[email]" value="" id="fci_ticket_email">
					</div>
					<div class="form_fields">
						<div class="form_field">
							<label for="field_field40">Pick from list</label>
							<select class="form_field_select" id="field_field40" name="ticket[data][field40]">
								<option value="Valik 1" selected="selected">First offender</option>
								<option value="Valik 2">Second offender</option>
								<option value="Valik 3">Third offender</option>
							</select>
						</div>
						<div class="form_field form_field_required form_field_with_errors">
							<label for="field_field46">Required field and field size large *</label>
							<input class="form_field_textfield form_field_size_large" id="field_field46" name="ticket[data][field46]" type="text" value="Something important">
							<div class="form_field_error">Field is required, Invalid e-mail format</div>
						</div>
						<div class="form_field">
							<label for="field_field_1319705466338">Field size medium</label>
							<input class="form_field_textfield form_field_size_medium" id="field_field_1319705466338" name="ticket[data][field_1319705466338]" type="text">
						</div>
						<div class="form_field">
							<label for="field_field_1319705467081">Field size small</label>
							<input class="form_field_textfield form_field_size_small" id="field_field_1319705467081" name="ticket[data][field_1319705467081]" type="text">
						</div>
						<div class="form_field">
							<label for="field_field_1319705467089">Field size default</label>
							<input class="form_field_textfield" id="field_field_1319705467089" name="ticket[data][field_1319705467081]" type="text">
						</div>
						<div class="form_field">
							<label for="field_field_1383817710">Textarea large</label>
							<textarea class="form_field_textarea form_field_size_large" cols="20" id="field_field_1383817710" name="ticket[data][field_1383817710]" rows="4"></textarea>
						</div>
						<div class="form_field">
							<label for="field_field_1383817711">Textarea medium</label>
							<textarea class="form_field_textarea form_field_size_medium" cols="20" id="field_field_1383817711" name="ticket[data][field_1383817710]" rows="4"></textarea>
						</div>
						<div class="form_field">
							<label for="field_field_1383817712">Textarea small</label>
							<textarea class="form_field_textarea form_field_size_small" cols="20" id="field_field_1383817712" name="ticket[data][field_1383817710]" rows="4"></textarea>
						</div>
						<div class="form_field">
							<label for="field_field_1383817717">Textarea default</label>
							<textarea class="form_field_textarea" cols="20" id="field_field_1383817717" name="ticket[data][field_1383817713]" rows="4"></textarea>
						</div>
						<div class="form_field">
							<label>Write a field title here</label>
							<div>
								<input class="form_field_checkbox" id="field_field_1359541473814_1" name="ticket[data][field_1359541473814][]" type="checkbox" value="Joy">
								<label class="form_field_label checkbox_label" for="field_field_1359541473814_1">Joy</label>
							</div>
							<div>
								<input class="form_field_checkbox" id="field_field_1359541473814_2" name="ticket[data][field_1359541473815][]" type="checkbox" value="Honey">
								<label class="form_field_label checkbox_label" for="field_field_1359541473814_2">Honey</label>
							</div>
							<div>
								<input class="form_field_checkbox" id="field_field_1359541473814_3" name="ticket[data][field_1359541473816][]" type="checkbox" value="Money">
								<label class="form_field_label checkbox_label" for="field_field_1359541473814_3">Money</label>
							</div>
						</div>
						<div class="form_field">
							<label>Write a field title here</label>
							<div>
								<input class="form_field_radio" id="field_field_1359541496629_4" name="ticket[data][field_1359541496629]" type="radio" value="Wife">
								<label class="form_field_label radio_label" for="field_field_1359541496629_4">Knife</label>
							</div>
							<div>
								<input class="form_field_radio" id="field_field_1359541496629_5" name="ticket[data][field_1359541496629]" type="radio" value="Knife">
								<label class="form_field_label radio_label" for="field_field_1359541496629_5">Wife</label>
							</div>
							<div>
								<input class="form_field_radio" id="field_field_1359541496629_6" name="ticket[data][field_1359541496629]" type="radio" value="Gun">
								<label class="form_field_label radio_label" for="field_field_1359541496629_6">Gun</label>
							</div>
						</div>
					</div>
					<div class="form_submit">
						<input name="commit" type="submit" value="Send!">
					</div>
				</div>
			</form>
				<!-- CONTENT AREA THAT DISABLES TEXT AND GALLERY AREAS -->
				<!-- {% content only="form" %} -->
		</main>

		<?php require("components/site-footer.php") ?>
			<!-- {% include "site-footer" %} -->

	</section>
	<script>project.initCommonPage();</script>
</body>
</html>