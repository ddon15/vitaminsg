<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op"><?php echo $content_top; ?>
<div class="row">
  <div class="four columns">
    <h2><img src="http://riglist.com/email-system/sg/images/vitamin.sg-header.jpg"></h2>
    <center><em><b>Vitamin.sg</b> is the leading distributor for health and nutritional products in South East Asia.</em></center>
  </div>
  
  <div class="eight columns">  
    <h2>Thank You</h2>
    <em>Note: Free shipping applies in <b>Singapore</b> only.</em>
    <h3> Please enter your shipping address </h3>
    <div class="info warning <?php if (!$_GET['err']) echo "hide"; ?>"><b>Ops!</b> You have to let us know where we will ship your FREE Sundown Naturals</div>
    <div class="info success <?php if (!$_GET['show']) echo "hide"; ?>"><b>Congratulations!</b> Your FREE Sundown Naturals will be sent to you in a couple of days.</div>
    <form action="<?php echo $_SERVER['REQUEST_URI'];?>" method="POST" name="referral">
    	<input type="hidden" name="referrer" value="<?php echo $_GET['email']?>" />
    	<input type="hidden" name="campaign" value="<?php echo $_GET['cpn']?>" />
    	<table>
    		<tr>
    			<td colspan="2">
    				<input placeholder="Street" name="street" style="width: 460px; margin: 5px auto 5px; border-radius: 3px; padding: 10px; border: 1px solid #A8A9A9;" type="text" /> 
    			</td>
    			<td>
    				<input placeholder="City" name="city" style="width: 220px; margin: 5px auto 5px; border-radius: 3px; padding: 10px; border: 1px solid #A8A9A9; float: right;" type="text" />
    			</td>
    		</tr>
    		<tr>
    			<td><input placeholder="State" name="state" style="width: 220px; margin: 5px auto 5px; border-radius: 3px; padding: 10px; border: 1px solid #A8A9A9;" type="text" /> </td>
    			<td><input disabled value="Singapore" style="width: 220px; margin: 5px auto 5px; border-radius: 3px; padding: 10px; border: 1px solid #A8A9A9;" type="text" /> </td>
    			<td><input placeholder="Zip Code" name="zip" style="width: 220px; margin: 5px auto 5px; border-radius: 3px; padding: 10px; border: 1px solid #A8A9A9; float: right;" type="text" /></td>
    		</tr>
    		<tr>
    			<td colspan="3"><div class="right"><input type="submit" value="Save" class="button" /></div></td>
    		</tr>
    	</table>

    </form>
</div>

<?php echo $content_bottom; ?></section>
<?php echo $footer; ?>