<input type="hidden" name="product[<?php echo $product_row; ?>][name]" value="<?php echo $name; ?>" />
<input type="hidden" name="product[<?php echo $product_row; ?>][model]" value="<?php echo $model; ?>" />
<input type="hidden" name="product[<?php echo $product_row; ?>][image]" value="<?php echo $image; ?>" />

<h2><?php echo $name; ?></h2>
<h4><?php echo $model; ?></h4>
<img src="<?php echo $image; ?>" alt="<?php echo $name; ?>" />
<?php if ($options) { ?>
    <h3><?php echo $text_option; ?></h3>
    <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
            <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                    <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br/>
                <select name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($option['option_value'] as $option_value) { ?>
                        <option value="<?php echo $option_value['product_option_value_id']; ?>">
                            <?php echo $option_value['name']; ?>
                        </option>
                    <?php } ?>
                </select>
            </div>
            <br/>
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
            <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                    <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br/>
                <?php foreach ($option['option_value'] as $option_value) { ?>
                    <input type="radio" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>"/>
                    <label for="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>">
                        <?php echo $option_value['name']; ?>
                    </label>
                    <br/>
                <?php } ?>
            </div>
            <br/>
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
            <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                    <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br/>
                <?php foreach ($option['option_value'] as $option_value) { ?>
                    <input type="checkbox" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>"/>
                    <label for="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>">
                        <?php echo $option_value['name']; ?>
                    </label>
                    <br/>
                <?php } ?>
            </div>
            <br/>
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
            <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                    <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br/>
                <table class="option-image">
                    <?php foreach ($option['option_value'] as $option_value) { ?>
                        <tr>
                            <td style="width: 1px;">
                                <input type="radio" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>"/>
                            </td>
                            <td>
                                <label for="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>"/>
                                </label>
                            </td>
                            <td>
                                <label for="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                    <?php echo $option_value['name']; ?>
                                </label>
                            </td>
                        </tr>
                    <?php } ?>
                </table>
            </div>
            <br/>
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
            <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                    <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br/>
                <input type="text" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>"/>
            </div>
            <br/>
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
            <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                    <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br/>
                <textarea name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
            </div>
            <br/>
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
            <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                    <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br/>
                <input type="text" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date"/>
            </div>
            <br/>
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
            <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                    <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br/>
                <input type="text" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime"/>
            </div>
            <br/>
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
            <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                    <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br/>
                <input type="text" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time"/>
            </div>
            <br/>
        <?php } ?>
    <?php } ?>
<?php } ?>