<div class="formdiv">
	<div class="instruction">You are <strong>ONE STEP AWAY</strong> from being <strong>OUR SWEETHEART</strong>...</div>
	<form method="POST">
		<?php 
			if (is_array($errors) && sizeof($errors)) {
				echo "<ul class='error'><li>". implode("</li><li>", $errors) ."</li></ul>";
			}
		?>
		<div><label class="question">Simply share your most concerned health topic with us and submit your particulars!</label></div>
		<div>
			<select name="question">
				<option value="-">--Please select a health topic--</option>
				<?php
					$allvals = array(
						'Allergies',
						'Anti-Ageing',
						'Brain Health',
						'Cardiovascular Health',
						'Children Health',
						'Cholesterol',
						'Digestive Health',
						'Energy',
						'Eye Health',
						'Hair Care',
						'Immune Support',
						'Joint and Bone Support',
						'Liver Health',
						'Memory Support',
						'Men\'s Health',
						'Pain Relief',
						'Prenatal',
						'Prostate Health',
						'Sexual Health',
						'Skin Care',
						'Sleep Health',
						'Stress Relief',
						'Urinary Tract Health',
						'Weight Management',
						'Women\'s Health',
						);					
					foreach ($allvals as $val) {
						if ($formdata['question'] == $val) {
							echo "<option value='" . $val . "' selected='selected'>" . $val . "</option>";	
						}
						else {
							echo "<option value='" . $val . "'>" . $val . "</option>";	
						}
					}
				?>			
			</select>
		</div>
		<div>
			<label>Name</label>
			<input type="text" value="<?php echo $formdata['frmname'];  ?>" name="frmname"/>
		</div>
		<div>
			<label>Mobile No</label>
			<input type="text" value="<?php echo $formdata['frmmobile'];  ?>" name="frmmobile"/>
		</div>
		<div>
			<label>Email Address</label>
			<input type="text" value="<?php echo $formdata['frmemail'];  ?>" name="frmemail"/>
		</div>
		<div style="margin-left: 150px; font-size: 1.2em;">Please provide a valid Mobile No. and Email Address. We will be contacting you via call / email on the prize collection details.</div>
		<div>
			
			<input type="submit" value="Next"/>
			<input type="hidden" value="1" name="frmsubmitted"/>
		</div>
	</form>	
</div>