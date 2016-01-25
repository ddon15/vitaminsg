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
<div class="box">
    <div class="heading">
    <h1><img src="view/image/feed.png" alt="" /> <?php echo $heading_title; ?></h1>
    </div>
    <div class="content">
        <div id="tabs" class="htabs">
        <a href="#tab-badges" class="selected">Product Badges</a>
        <a href="#tab-hl">Brands Banner</a>
        <a href="#tab-bp">Brands Bulk Pricing</a>
        </div>
        <div id="tab-badges">
            <h3>Sale</h3><hr>
            <table class="form">
                <tbody>
                    <input type="hidden" name="group_code" value="<?php echo $group_code_sale_label; ?>">
                    <tr>
                        <td><span class="required"></span> Background:</td>
                        <td>
                            <input type="color" name="sale_label_background" value="<?php echo $sale_label_config->bgcolor; ?>" class="color">
                        </td>
                    </tr>
                    <tr>
                        <td>Text Color:<br><span class="help">Text Color</span></td>
                        <td>
                            <input type="color" value="<?php echo $sale_label_config->textcolor; ?>" name="sale_label_text_color">
                        </td>
                    </tr>
                     <tr>
                        <td>Border:<br><span class="help">Border Styles</span></td>
                        <td>
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
                        </td>
                    </tr>
                    <tr>
                        <td>Caption:<br><span class="help">Sale Text</span></td>
                        <td>
                            <input type="text" value="<?php echo $sale_label_config->caption; ?>" name="sale_label_caption">
                        </td>
                    </tr>
                    <tr>
                        <td>Enabled:<br><span class="help">Enabled</span></td>
                        <td><input name="sale_label_status" type="checkbox" <?php echo $sale_label_status ?>></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="right"><a class="button" id="btn-save-sl">Save</a></td>
                    </tr>
                </tbody>
            </table>

             <h3>Buy One Take One</h3><hr>
            <table class="form">
               <tbody>
                   <tr>
                       <td><span class="required"></span> Background:</td>
                       <td><input type="text" name="model" value=""></td>
                   </tr>
                   <tr>
                       <td>Text Color:<br><span class="help">Text Color</span></td>
                       <td><input type="text" name="sku" value=""></td>
                   </tr>
                    <tr>
                       <td>Border:<br><span class="help">Border Styles</span></td>
                       <td><input type="text" name="sku" value=""></td>
                   </tr>
                    <tr>
                       <td>Caption:<br><span class="help">Sale Text</span></td>
                       <td><input type="text" name="sku" value=""></td>
                   </tr>
                   <tr>
                       <td>Enabled:<br><span class="help">Enabled</span></td>
                       <td><input name="sale_label_status" type="checkbox" <?php echo $sale_label_status ?>></td>
                   </tr>
                    <tr>
                        <td></td>
                        <td align="right"><a class="button" id="btn-save">Save</a></td>
                    </tr>
            </table>
        </div>
        <div id="tab-hl">
            <table class="form">
                <tbody>
                    <tr>
                        <td><span class="required"></span> Banner Header Label:</td>
                        <td><input type="text" id="brands-banner-header" value="<?php echo $brands_banner_header; ?>"></td>
                    </tr>
                    <tr>
                        <td><span class="required"></span> Brands:</td>
                        <td>
                            <select id="select-brands">
                                <option value="all">All Brands</option>
                                <?php foreach ($manufacturers as $m): ?>
                                    <option value="<?php echo $m['manufacturer_id']; ?>"><?php echo $m['name']; ?></option>
                                <?php endforeach; ?>
                            </select>
                            <a class="button" id="btn-add-brand">Add To List</a>
                            <a class="button" id="btn-clear-brand">Clear List</a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                        <div id="brand-list" class="scrollbox">
                            <?php foreach ($brands as $each): ?>
                                <img src="view/image/delete.png" alt="" data-id="<?php echo $each['manufacturer_id']; ?>" style="float:right" class="btn-remove-brand">
                                <div id="<?php echo $each['manufacturer_id'] . '-brand-list'; ?>" class="brands" data-id="<?php echo $each['manufacturer_id']; ?>" data-name="<?php echo $each['name'] ?>"><?php echo $each['name']; ?></div>
                            <?php endforeach; ?>
                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required"></span> Top Brands:</td>
                        <td>
                            <select id="select-brands-top">
                                <?php foreach ($manufacturers as $m): ?>
                                    <option value="<?php echo $m['manufacturer_id']; ?>"><?php echo $m['name']; ?></option>
                                <?php endforeach; ?>
                            </select>
                            <a class="button" id="btn-add-to-top3">Add To List</a>
                            <a class="button" id="btn-clear-brand-top">Clear List</a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                        <div id="brand-list-top-three" class="scrollbox">
                            <?php foreach ($brands_top as $each): ?>
                                <img src="view/image/delete.png" alt="" style="float:right" data-id="<?php echo $each['manufacturer_id']; ?>" class="btn-remove-brand-top">
                                <div id="<?php echo $each['manufacturer_id'] . '-brand-list-top'; ?>" class="brands-top" data-id="<?php echo $each['manufacturer_id']; ?>" data-name="<?php echo $each['name'] ?>"><?php echo $each['name']; ?></div>
                            <?php endforeach; ?>
                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required"></span> Banner:</td>
                        <td>
                            <select id="select-banner">
                                <option value="">Select One</option>
                                <?php foreach ($banners as $b): ?>
                                    <option <?php echo $banner_id === $b['banner_id'] ? 'selected' : ''; ?> value="<?php echo $b['banner_id']; ?>"><?php echo $b['name']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Enabled</td>
                        <td>
                        <select id="select-enabled">
                            <option value="1">True</option>
                            <option value="0">False</option>
                        </select>
                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="right">
                            <a class="button" id="btn-save-home-banner">Save</a>
                            <a class="button" id="btn-cancel-home-banner">Cancel</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="tab-bp">
            <table class="form">
                <tbody>
                    <tr>
                        <td><span class="required"></span> Brand:</td>
                        <td>
                            <select name="bp-brand">
                                <?php foreach ($manufacturers as $m): ?>
                                    <option value="<?php echo $m['manufacturer_id']; ?>"><?php echo $m['name']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required"></span> Label:</td>
                        <td>
                            <input type="text" value="" name="bp-label"> 
                        </td>
                    </tr>
                     <tr>
                        <td><span class="required"></span> Quantity</td>
                        <td>
                            <input type="number" value="" name="bp-qty"> 
                        </td>
                    </tr>
                    <tr>
                        <td>Enabled</td>
                        <td>
                        <select name="bp-is-enabled">
                            <option value="1">True</option>
                            <option value="0">False</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="right">
                            <a class="button" id="btn-add-bp">Add</a>
                            <a class="button" id="btn-bp-cancel">Cancel</a>
                        </td>
                    </tr>
                    <tr>
                        <table class="form">
                          <tr>
                            <td>Manufacturer</td>
                            <td>Label</td>
                            <td>Quantity</td>
                            <td>Enabled</td>
                          </tr>
                          <?php foreach ($brand_bulk_pricing as $bp): ?>
                          <tr>
                                <td><?php echo $bp['name']; ?></td>
                                <td><?php echo $bp['label']; ?></td>
                                <td><?php echo $bp['qty']; ?></td>
                                <td><?php echo $bp['is_enabled']; ?></td>
                                <td><a class="button btn-remove-bp" id="" data-id="<?php echo $bp['id']; ?>">Remove</a></td>
                          </tr>
                          <?php endforeach; ?>
                        </table>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">

$('#btn-save-sl').on('click', function(e) {
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
        url: 'index.php?route=extension/custom_settings/saveSaleLabel&token=<?php echo $token; ?>',
        data: data,
        dataType: 'json',
        success: function(res) {
            console.log(res);
            if(res.save)
              alert('Sale Label custom settings successfully save.');

            elem.attr('disabled', false);
        }
    });
});

$('#btn-add-bp').on('click',function(e) {
  var data = {
    brand: $('select[name="bp-brand"]').val(),
    label: $('input[name="bp-label"]').val(), 
    qty: $('input[name="bp-qty"]').val(), 
    is_enabled: $('select[name="bp-is-enabled"]').val()
  };

  console.log(data);
  $.ajax({
        type:'post',
        url: 'index.php?route=extension/custom_settings/saveBrandBulkPricing&token=<?php echo $token; ?>',
        data: data,
        dataType: 'json',
        success: function(res) {
          console.log(res);
            if(res.save) {
              alert('Brand Bulk Pricing successfully save.');
              location.reload();
            }

            elem.attr('disabled', false);
        }
    });

  e.preventDefault();
});

$('.btn-remove-bp').on('click', function(e) {
  var id = $(this).data('id');
  e.preventDefault();
  $.ajax({
        type:'post',
        url: 'index.php?route=extension/custom_settings/deleteBrandBulkPricing&token=<?php echo $token; ?>',
        data: {id:id},
        dataType: 'json',
        success: function(res) {
          console.log(res);
            if(res.save) {
              alert('Brand Bulk Pricing successfully deleted.');
              location.reload();
            }

            elem.attr('disabled', false);
        }
    });  
});

$('#btn-add-brand').click(function(e) {
    var brandName = $('#select-brands option:selected').text();
    var brandId = $('#select-brands').val();
    var brandDivId = brandId + '-brand-list';

    if(brandId == 'all') {
        $('.brands').remove();  
        $("#select-brands > option").each(function() {
            if (this.value !== 'all') {
                brandDivId = this.value + '-brand-list';
                $('#brand-list').append('<img src="view/image/delete.png" alt="" data-id='+this.value+' style="float:right" class="btn-remove-brand"><div id='+brandDivId+' class="brands" data-id='+this.value+' data-name='+this.text+'>'+this.text+'</div>');
            }
        });
        return;
    }

    if(brandId) {
        $('#' + brandDivId).remove(); 
        $('#brand-list').append('<img src="view/image/delete.png" alt="" data-id='+brandId+' style="float:right" class="btn-remove-brand"><div id='+brandDivId+' class="brands" data-id='+brandId+' data-name='+brandName+'>'+brandName+'</div>');
    } else {
        alert('No brand selected.');
    }

    e.preventDefault();
});

$('#btn-clear-brand').click(function() {
    $('.brands').remove();
});

$('#btn-clear-brand-top').click(function() {
    $('.brands-top').remove();
});

$('#btn-add-to-top3').click(function(e) {
    var brandName = $('#select-brands-top option:selected').text();
    var brandId = $('#select-brands-top').val();
    var brandsTopDivId = brandId + '-brand-list-top';
    var brandsDivId = brandId + '-brand-list';

    if(brandId) {
        $('#' + brandsTopDivId).remove(); 
        $('#' + brandsDivId).remove(); 
        $('#brand-list-top-three').append('<img src="view/image/delete.png" alt="" data-id='+brandId+' style="float:right" class="btn-remove-brand-top"><div id='+brandsTopDivId+' class="brands-top" data-id='+brandId+' data-name='+brandName+'>'+brandName+'</div>');
    } else {
        alert('No brand selected.');
    }

    e.preventDefault();
})

$('#btn-save-home-banner').click(function(e) { 
    var brands = [];
    var brandsTop = [];
    var isEnabled = $('#select-enabled').val();
    var bannerId = $('#select-banner').val();
    var headerLabel = $('#brands-banner-header').val();

    $('.brands').each(function() {
        var elem = $(this);
        var brand = {
            id: elem.data('id'),
            name: elem.data('name')
        }

        brands.push(elem.data('id'));
    });


    $('.brands-top').each(function() {
        var elem = $(this);
        var brand = {
            id: elem.data('id'),
            name: elem.data('name')
        }

        brandsTop.push(elem.data('id'));

    });

    if(!brands.length) {
      alert('Brands list is empty.');
      return;
    }

    if(!brandsTop.length) {
      alert('Brands Top list is empty.');
      return;
    }

    if(!bannerId) {
      alert('Select where you want to add this banner.');
      return;
    }

    $(this).attr('disabled', true);
    $.ajax({
        url: 'index.php?route=extension/custom_settings/saveBrandsBanner&token=<?php echo $token; ?>',
        type: 'post',
        data: {banner_id:bannerId, header_label: headerLabel, brands: brands, brands_top: brandsTop ,is_enabled: isEnabled},
        dataType: 'json',
        success: function(res) {
            if(res.save)
              alert('Brands Banner Custom settings successfully save.');

            $(this).attr('disabled', false);
        }
    });

   e.preventDefault();
});


$('#btn-cancel-home-banner').click(function() {
    location.reload();
});

$('.btn-remove-brand').live('click', function(e) {
  var id = $(this).data('id') + '-brand-list';
  $('#' + id).remove(); 
  $(this).remove();
  e.preventDefault();
});

$('.btn-remove-brand-top').live('click', function(e) {
  var id = $(this).data('id') + '-brand-list-top';
  $('#' + id).remove();
  $(this).remove();
  e.preventDefault(); 
});

$('#tabs a').tabs(); 
</script>
<?php echo $footer; ?>