<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op"><?php echo $content_top; ?>
<div class="row">
  <h2>Referral Report </h2>
  <div class="four columns">
    <h2><input type="button" value="Export to Excel" onclick="fnExcelReport()" /></h2>
  </div>
  <div class="eight columns" class="referrals">
    
    <table style="width: 100%" id = "referral_table">
        <thead>
            <tr>
                <th>Referrals</th>
                <th>Shipping Address</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach ($refers as $referrer => $refs) { ?>
          <tr>
            <td colspan="2"><b>Referrer: <?php echo $referrer;?></b></td>
          </tr>
          <?php foreach ($refs as $ref) { ?>
          <tr>
            <td><?php echo $ref['ref_email']?></td>
            <td><?php echo $ref['street'].' '.$ref['city'].' Singapore '.$ref['zip']?></td>
          </tr>
          <?php }?>
          <?php }?>
        </tbody>
    </table>
    
  </div>
</div>

<?php echo $content_bottom; ?></section>
<?php echo $footer; ?>

<script type="text/javascript">

  function fnExcelReport()
  {
      var tab_text = ''; var j=0;
      tab = document.getElementById('referral_table');

      for(j = 0 ; j < tab.rows.length ; j++) 
      {     
          tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
      }

      tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");
      tab_text= tab_text.replace(/<img[^>]*>/gi,""); 
      tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); 
      tab_text= tab_text.replace(/<tr>/gi, ""); 
      tab_text= tab_text.replace(/<\/tr>/gi, ""); 
      tab_text= tab_text.replace(/<\/tbody>/gi, ""); 
      tab_text= tab_text.replace(/<tbody>/gi, ""); 
      tab_text= tab_text.replace(/<td>/gi, ""); 
      tab_text= tab_text.replace(/<\/td>/gi, ""); 
      tab_text= tab_text.replace(/<td colspan="2">/gi, ""); 
      tab_text= tab_text.replace(/<th>Referrals<\/th>/gi, ""); 
      tab_text= tab_text.replace(/<th>Shipping Address<\/th>/gi, ""); 
      tab_text= tab_text.replace(/<\/b>/gi, ""); 
      tab_text= tab_text.replace(/<b>/gi, ""); 
      tab_text= tab_text.replace(/\t/gi,''); 
      tab_text= tab_text.replace(/0/gi,'');

      var ua = window.navigator.userAgent;
      var msie = ua.indexOf("MSIE "); 

      if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
      {
          txtArea1.document.open("txt/html","replace");
          txtArea1.document.write(tab_text);
          txtArea1.document.close();
          txtArea1.focus(); 
          sa=txtArea1.document.execCommand("SaveAs",true,"Reports.xls");
      }  
      else                 //other browser not tested on IE 11
          sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));  

      deleteEmptyRows()
      return (sa);
  }

  function deleteEmptyRows(){ 
    var sh = SpreadsheetApp.getActiveSheet();
    var data = sh.getDataRange().getValues();
    var targetData = new Array();
    for(n=0;n<data.length;++n){
      if(data[n].join().replace(/,/g,'')!=''){ targetData.push(data[n])};
      Logger.log(data[n].join().replace(/,/g,''))
    }
    sh.getDataRange().clear();
    sh.getRange(1,1,targetData.length,targetData[0].length).setValues(targetData);
  }
</script>