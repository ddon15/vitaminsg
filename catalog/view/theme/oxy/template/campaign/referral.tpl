<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op"><?php echo $content_top; ?>
<div class="row">
  <div class="four columns">
    <h2><img src="http://riglist.com/email-system/sg/images/vitamin.sg-header.jpg"></h2>
  </div>
  
  <div class="eight columns" id="referrals">  
    <h2>Refer your loved ones</h2>
    <em>Note: Free shipping applies in <b>Singapore</b> only.</em>
    <div class="info warning <?php if (!$_GET['uniq']) echo "hide"; ?>">You must refer 3 unique email addresses.</div>
    <div class="info warning <?php if (!$_GET['show']) echo "hide"; ?>">You have to refer at least 3 loved ones to continue</div>
    <form action="<?php echo $_SERVER['REQUEST_URI'];?>" method="POST" name="referral">
    	<input type="hidden" name="referrer" value="<?php echo $_GET['email']?>" />
    	<input type="hidden" name="campaign" value="<?php echo $_GET['cpn']?>" />
    	<table>
    		<tr>
    			<td><input placeholder="Name" name="name1" style="width: 220px; margin: 5px auto 5px; border-radius: 3px; padding: 10px; border: 1px solid #A8A9A9;" type="text" /> </td>
    			<td><input placeholder="Email" name="email1" style="width: 220px; margin: 5px auto 5px; border-radius: 3px; padding: 10px; border: 1px solid #A8A9A9; float: right;" type="text" /></td>
    		</tr>
    		<tr>
    			<td><input placeholder="Name" name="name2" style="width: 220px; margin: 5px auto 5px; border-radius: 3px; padding: 10px; border: 1px solid #A8A9A9;" type="text" /> </td>
    			<td><input placeholder="Email" name="email2" style="width: 220px; margin: 5px auto 5px; border-radius: 3px; padding: 10px; border: 1px solid #A8A9A9; float: right;" type="text" /> </td>
    		</tr>
    		<tr>
    			<td><input placeholder="Name" name="name3" style="width: 220px; margin: 5px auto 5px; border-radius: 3px; padding: 10px; border: 1px solid #A8A9A9;" type="text" /> </td>
    			<td><input placeholder="Email" name="email3" style="width: 220px; margin: 5px auto 5px; border-radius: 3px; padding: 10px; border: 1px solid #A8A9A9; float: right;" type="text" /></td>
    		</tr>
    		<tr>
    			<td colspan="2"><div class="right"><input type="submit" value="Continue" class="button" /></div></td>
    		</tr>
    	</table>

    </form>
</div>

<?php echo $content_bottom; ?></section>
<?php echo $footer; ?>