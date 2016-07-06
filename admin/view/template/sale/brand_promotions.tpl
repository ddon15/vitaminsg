<?php echo $header; ?>

<div id="content">

    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>

    <?php if ($error_warning) { ?>

        <div class="warning"><?php echo $error_warning; ?></div>

    <?php } ?>

    <div class="box">
        <div class="heading">
            <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>

            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">

            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

                <div id="tab-special">

                    <table id="special" class="list">

                        <thead>
                            <tr>
                                <td class="left"><?php echo $entry_customer_group; ?></td>

                                <td class="right"><?php echo $entry_brands; ?></td>
                              
                                <td class="right"><?php echo $entry_priority; ?></td>

                                <td class="right"><?php echo $entry_discount; ?></td>

                                <td class="left"><?php echo $entry_date_start; ?></td>

                                <td class="left"><?php echo $entry_date_end; ?></td>

                                <!-- <td class="left">Enabled</td> -->

                                <td></td>
                            </tr>
                        </thead>
                        <?php $bp_row = 0; ?>
                        <?php foreach ($brand_promotions as $bp) { ?>
                        <tbody id="bp-row<?php echo $bp; ?>">
                            <input type="hidden" value="<?php echo $bp['id'] ?>" name="bp[<?php echo $bp_row; ?>][bp_id]">
                            <input type="hidden" value="<?php echo $bp['product_ids'] ?>" name="bp[<?php echo $bp_row; ?>][productids]">
                            <tr data-id="<?php echo $bp['id'] ?>" data-productids="<?php echo $bp['product_ids'] ?>">

                            <td class="left"><select name="bp[<?php echo $bp_row; ?>][customer_group_id]" required>
                            <?php foreach ($customer_groups as $customer_group) { ?>

                            <?php if ($customer_group['customer_group_id'] == $bp['customer_group_id']) { ?>
                            <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                            <?php } else { ?>

                            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>

                            <?php } ?>

                            <?php } ?>

                            </select></td>

                            <td class="right">
                               <select name="bp[<?php echo $bp_row; ?>][brand]" required>
                                   <option value="">Select One</option>
                                   <?php foreach ($manufacturers as $m): ?>
                                       <option value="<?php echo $m['manufacturer_id']; ?>" <?php echo $bp['brand_id'] == $m['manufacturer_id'] ? 'selected' : '' ?> ><?php echo $m['name']; ?></option>
                                   <?php endforeach; ?>
                               </select>
                            </td>

                            <td class="right"><input type="number" name="bp[<?php echo $bp_row; ?>][priority]" value="<?php echo $bp['priority']; ?>" size="2" required/></td>

                            <td class="right"><input type="number" name="bp[<?php echo $bp_row; ?>][discount_value]" value="<?php echo $bp['discount_value']; ?>" required/></td>

                            <td class="left"><input type="text" name="bp[<?php echo $bp_row; ?>][date_start]" value="<?php echo $bp['date_start']; ?>" class="date" required/></td>

                            <td class="left"><input type="text" name="bp[<?php echo $bp_row; ?>][date_end]" value="<?php echo $bp['date_end']; ?>" class="date" required/></td>
                         
                       <!--      <td><input type="checkbox" name="bp[<?php echo $bp_row; ?>][status]" <?php echo $bp['status'] ? 'checked' : ''; ?> ></td> -->
                           
                            <td class="left"><button data-new="0" class="btn-delete button" data-productids="<?php echo $bp['product_ids'] ?>" data-url="<?php echo $action_delete; ?>" data-id="<?php echo $bp['id'] ?>" data-rowid="<?php echo $bp_row; ?>"><?php echo $button_remove; ?></button></td>

                            </tr>
                        </tbody>
                        <?php $bp_row++; ?>
                        <?php } ?>
                        <tfoot>
                            <tr>
                            <td colspan="7"></td><?php //[SB] Increased colspan ?>
                            <td class="left"><a onclick="addBrandPromotion();" class="button"><?php echo $button_add_bp; ?></a></td>
                            </tr>
                        </tfoot>

                    </table>

                </div>

            </form>

        </div>

    </div>

</div>

// <script type="text/javascript">

// $.widget('custom.catcomplete', $.ui.autocomplete, {

//     _renderMenu: function(ul, items) {

//         var self = this, currentCategory = '';

        

//         $.each(items, function(index, item) {

//             if (item.category != currentCategory) {

//                 ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');

                

//                 currentCategory = item.category;

//             }

            

//             self._renderItem(ul, item);

//         });

//     }

// });

// </script>

// <script type="text/javascript">
//     // Manufacturer

//     $('input.manufacturer').autocomplete({

//         delay: 500,

//         source: function(request, response) {

//             $.ajax({
//                 url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
//                 dataType: 'json',
//                 success: function(json) {   
//                     response($.map(json, function(item) {
//                         return {
//                             label: item.name,

//                             value: item.manufacturer_id
//                         }

//                     }));
//                 }
//             });

//         }, 
//         select: function(event, ui) {
//             $(e.target).attr('value', ui.item.label);
//             $(e.target).next().attr('value', ui.item.value);
//             return false;
//         },
//         focus: function(event, ui) {
//             return false;
//         }

//     });
// </script> 

<script type="text/javascript">
var bp_row = <?php echo $bp_row; ?>;

function addBrandPromotion() {

    html  = '<tbody id="bp-row' + bp_row + '">';

    html += '  <tr>'; 

    html += '    <td class="left"><select name="bp[' + bp_row + '][customer_group_id]" required>';

    <?php foreach ($customer_groups as $customer_group) { ?>

    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';

    <?php } ?>

    html += '    </select></td>';   

    html += '    <td class="right"><select name="bp[' + bp_row + '][brand]" required>';

    <?php foreach ($manufacturers as $m) { ?>

        html += '      <option value="<?php echo $m['manufacturer_id']; ?>"><?php echo addslashes($m['name']); ?></option>';

        <?php } ?>

        html += '    </select></td>';   

    html += '    <td class="right"><input type="number" name="bp[' + bp_row + '][priority]" value="" size="2" required/></td>';

    html += '    <td class="right"><input type="number" name="bp[' + bp_row + '][discount_value]" value="" required/></td>';

    html += '    <td class="left"><input type="text" name="bp[' + bp_row + '][date_start]" value="" class="date" required/></td>';

    html += '    <td class="left"><input type="text" name="bp[' + bp_row + '][date_end]" value="" class="date" required/></td>';

    html += '    <td class="left"><input type="checkbox" name="bp[' + bp_row + '][status]" checked required/></td>';

    html += '    <td class="left"><a href="#" class="btn-delete button" data-new="1"><?php echo $button_remove; ?></a></td>';

    html += '  </tr>';

    html += '</tbody>';

    $('#special tfoot').before(html);

    $('#bp-row' + bp_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});

    bp_row++;
}

</script> 

<script type="text/javascript"><!--

function image_upload(field, thumb) {

$('#dialog').remove();



$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');



$('#dialog').dialog({

title: '<?php echo $text_image_manager; ?>',

close: function (event, ui) {

if ($('#' + field).attr('value')) {

$.ajax({

url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),

dataType: 'text',

success: function(text) {

$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');

}

});

}

},  

bgiframe: false,

width: 800,

height: 400,

resizable: false,

modal: false

});

};

//--></script> 

<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 

<script type="text/javascript"><!--

$('.date').datepicker({dateFormat: 'yy-mm-dd'});

$('.datetime').datetimepicker({

dateFormat: 'yy-mm-dd',

timeFormat: 'h:m'

});

$('.time').timepicker({timeFormat: 'h:m'});

</script> 

<script type="text/javascript">
   
    // $('form').on('submit' ,function(e) {
    //     var formData = $(this).serialize();
    //     var url =  '<?php echo $action; ?>';
    //     $.ajax({
    //         url: url.replace(/&amp;/g, '&'),
    //         type: 'POST',
    //         dataType: 'json',
    //         data: formData,
    //         success: function(response) {
    //             console.log(response);
    //         }
    //     });

    //     e.preventDefault();
    // });

    // $('.btn-delete').on('click', function(e) {
    //     var rowId = $(this).data('id');
    //     $('#bp-row' + rowId).remove();
    //     e.preventDefault();
    // });

    $('body').on('click', '.btn-delete', function () {
        var elem = $(this);
        var rowId = elem.data('rowid');
        var productids = elem.data('productids');
        var url = elem.data('url');
        var isNew = elem.data('new');
        var id = elem.data('id');
        
        elem.attr('disabled', true);
        
        if (!isNew) {
            console.log('Not is new');
            
            $.ajax({
                url: url.replace(/&amp;/g, '&'),
                type: 'POST',
                dataType: 'json',
                data: {id: id, productids: productids},
                success: function(response) {
                    console.log(response);
                    elem.attr('disabled', false);
                }
            });
        }
        
        $('#bp-row' + rowId).remove();
    });
</script>
<?php echo $footer; ?>