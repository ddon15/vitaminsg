<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op"><?php echo $content_top; ?>
<div class="row">
  <h2>Referral Report </h2>
  <div class="four columns">
    <h2><input type="button" value="Export to Excel" onclick="fnExcelReport()" /></h2>
  </div>
  <div class="eight columns" id="referrals">
    <?php foreach ($refers as $referrer => $refs) { ?>
    <table style="width: 100%" id = "referral_table">
        <thead>
            <tr>
                <th colspan="2">Referrer: <?php echo $referrer;?></th>
            </tr>
            <tr>
                <th>Referrals</th>
                <th>Shipping Address</th>
            </tr>
        </thead>
        <tbody>
          <?php foreach ($refs as $ref) { ?>
          <tr>
            <td><?php echo $ref['ref_email']?></td>
            <td><?php echo $ref['street'].' '.$ref['city'].' Singapore '.$ref['zip']?></td>
          </tr>
          <?php }?>
        </tbody>
    </table>
    <?php }?>
  </div>
</div>

<?php echo $content_bottom; ?></section>
<?php echo $footer; ?>

<script type="text/javascript">

  function fnExcelReport()
  {
      var j=0;
      tab = document.getElementById('referral_table');

      for(j = 0 ; j < tab.rows.length ; j++) 
      {     
          tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
      }

      tab_text=tab_text+"</table>";
      tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
      tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
      tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

      var ua = window.navigator.userAgent;
      var msie = ua.indexOf("MSIE "); 

      if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
      {
          txtArea1.document.open("txt/html","replace");
          txtArea1.document.write(tab_text);
          txtArea1.document.close();
          txtArea1.focus(); 
          sa=txtArea1.document.execCommand("SaveAs",true,"Say Thanks to Sumit.xls");
      }  
      else                 //other browser not tested on IE 11
          sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));  

      return (sa);
  }
</script>