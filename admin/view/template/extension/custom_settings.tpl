<?php echo $header; ?>
<style type="text/css">
  label {
    width: 85px !important;
    display: inline-block;
  }
</style>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error) { ?>
  <div class="warning"><?php echo $error; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/feed.png" alt="" /> <?php echo $heading_title; ?></h1>
    </div>
    <div class="content">
      <table class="list">
        <thead>
          <tr>
            <td class="left">Name</td>
            <td class="left">Configuration</td>
            <td class="left">Enabled</td>
            <td class="left">Action</td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong>Sale Badge</strong><input type="hidden" name="group_code" value="SALE_LABEL"></td>
            <td>
              <div class="config-elem">
              <label>Background:</label>
              <input type="color" name="sale_label_background" value="<?php echo $sale_label_config->bgcolor; ?>" class="color"> 
              </div>
              <div class="config-elem">
              <label>Text:</label>
              <input type="color" value="<?php echo $sale_label_config->textcolor; ?>" name="sale_label_text_color">
              <input type="text" value="<?php echo $sale_label_config->caption; ?>" name="sale_label_caption"> 
              </div>
              <div class="config-elem">
              <label>Border Style:</label>
              <select name="sale_label_border_style">
                <?php if ($sale_label_config->border->style === 'solid'): ?>
                   <option value="solid" selected>Solid</option>   
                   <option value="dotted">Dotted</option>  
                   <option value="dashed">Dashed</option>  
                <?php endif; ?>
                
                <?php if ($sale_label_config->border->style === 'dotted'): ?>
                   <option value="solid">Solid</option>   
                   <option value="dotted" selected>Dotted</option>  
                   <option value="dashed">Dashed</option> 
                <?php endif; ?>
                
                <?php if ($sale_label_config->border->style === 'dashed'): ?>
                   <option value="solid">Solid</option>   
                   <option value="dotted">Dotted</option>  
                    <option value="dashed" selected>Dashed</option>   
                <?php endif; ?>
              </select> 
              <select name="sale_label_border_width">
                <?php if ($sale_label_config->border->width === '0px'): ?>
                   <option value="0px" selected>0px</option> 
                   <option value="1px">1px</option> 
                   <option value="2px">2px</option>  
                   <option value="3px">3px</option>  
                <?php endif; ?>

                <?php if ($sale_label_config->border->width === '1px'): ?>
                   <option value="0px">0px</option> 
                   <option value="1px" selected>1px</option> 
                   <option value="2px">2px</option>  
                   <option value="3px">3px</option>  
                <?php endif; ?>

                <?php if ($sale_label_config->border->width === '2px'): ?>
                   <option value="0px">0px</option> 
                   <option value="1px">1px</option>
                   <option value="2px" selected>2px</option>  
                   <option value="3px">3px</option>                
                <?php endif; ?>
                <?php if ($sale_label_config->border->width === '3px'): ?>
                   <option value="0px">0px</option> 
                   <option value="1px">1px</option>
                   <option value="2px">2px</option>  
                   <option value="3px" selected>3px</option>
                <?php endif; ?>
              
              </select>
              <input type="color" value="<?php echo $sale_label_config->border->color; ?>" name="sale_label_border_color">
              </div>
            </td>
            <td>
              <input name="sale_label_status" type="checkbox" <?php echo $sale_label_status ?>>
            </td>
            <td class="center">
              <input type="button" value="Save" id="btn-sale-label">
              <a href="/">Preview</a>
            </td>
          </tr>
      </table>
    </div>
  </div>
</div>
<script type="text/javascript">

   $('#btn-sale-label').on('click', function(e) {
      e.preventDefault();
      var elem = $(this);

      var data = {
        group_code: $('input[name="group_code"]').val(), 
        data_config: {
          caption: $('input[name="sale_label_caption"]').val(),
          bgcolor: $('input[name="sale_label_background"]').val(),
          textcolor: $('input[name="sale_label_text_color"]').val(),
          border: {
            style: $('select[name="sale_label_border_style"]').val(), 
            width: $('select[name="sale_label_border_width"]').val(),
            color: $('input[name="sale_label_border_color"]').val()
          }
        },
        status: $('input[name="sale_label_status"]').is(':checked') ? 1 : 0
      };

      elem.attr('disabled', true);

      $.ajax({
        type:'post',
        url: 'index.php?route=extension/custom_settings/save&token=<?php echo $token; ?>',
        data: data,
        dataType: 'json',
        success: function(res) {
          console.log(res);
          if(res.save)
            alert('Sale Label Custom settings successfully save.');

          elem.attr('disabled', false);
        }
      });

   });
</script>
<?php echo $footer; ?>