<?php if ($banners && $banner_type) { $banner = $banners[0]; ?>
<div id="special_banner<?php echo $module . '_' . $banner_id; ?>" class="special_banner ui<?php if (!$banner['show_boxframe']) { ?> basic<?php } ?> modal">
    <?php if ($banner['show_boxframe']) { ?>
        <?php if ($banner['heading_text']) { ?>
            <div class="header">
                <?php echo $banner['heading_text']; ?>
            </div>
        <?php } ?>
        <div class="content">
            <?php echo $banner['content']; ?>
            <?php if ($banner['products_in_banner'] && $banner['product']) { ?>
                <div class="box-product">
                    <?php foreach ($banner['product'] as $product) { ?>
                        <div>
                            <?php if ($product['thumb']) { ?>
                                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
                            <?php } ?>
                            <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                            <?php if ($product['price']) { ?>
                                <div class="price">
                                    <?php if (!$product['special']) { ?>
                                        <?php echo $product['price']; ?>
                                    <?php } else { ?>
                                        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                            <div class="cart">
                                <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            <?php } ?>
        </div>
        <?php if ($banner['close_button_text']) { ?>
            <div class="actions">
                <a onclick="$('#special_banner<?php echo $module . '_' . $banner_id; ?>').modal('hide');" class="button"><?php echo $banner['close_button_text']; ?></a>
            </div>
        <?php } ?>
    <?php } else { ?>
        <?php echo $banner['content']; ?>
        <?php if ($banner['products_in_banner'] && $banner['product']) { ?>
            <div class="box-product">
                <?php foreach ($banner['product'] as $product) { ?>
                    <div>
                        <?php if ($product['thumb']) { ?>
                            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
                        <?php } ?>
                        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                        <?php if ($product['price']) { ?>
                            <div class="price">
                                <?php if (!$product['special']) { ?>
                                    <?php echo $product['price']; ?>
                                <?php } else { ?>
                                    <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                                <?php } ?>
                            </div>
                        <?php } ?>
                        <div class="cart">
                            <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a>
                        </div>
                    </div>
                <?php } ?>
            </div>
        <?php } ?>
    <?php } ?>
</div>
<?php } else { ?>
<div id="special_banner<?php echo $module . '_' . $banner_id; ?>" class="special_banner">
    <?php foreach ($banners as $banner) { ?>
        <?php if ($banner['show_boxframe']) { ?>
            <div class="box special_banner_content">
                <div class="box-heading"><?php echo $banner['heading_text'] ? $banner['heading_text'] : '&nbsp;'; ?></div>
                <div class="box-content">
                    <?php echo $banner['content']; ?>
                    <?php if ($banner['products_in_banner'] && $banner['product']) { ?>
                        <div class="box-product">
                            <?php foreach ($banner['product'] as $product) { ?>
                                <div>
                                    <?php if ($product['thumb']) { ?>
                                        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
                                    <?php } ?>
                                    <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                                    <?php if ($product['price']) { ?>
                                        <div class="price">
                                            <?php if (!$product['special']) { ?>
                                                <?php echo $product['price']; ?>
                                            <?php } else { ?>
                                                <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                                            <?php } ?>
                                        </div>
                                    <?php } ?>
                                    <div class="cart">
                                        <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                    <?php } ?>
                </div>
            </div>
        <?php } else { ?>
            <div class="special_banner_content">
                <?php echo $banner['content']; ?>
                <?php if ($banner['products_in_banner'] && $banner['product']) { ?>
                    <div class="box-product">
                        <?php foreach ($banner['product'] as $product) { ?>
                            <div>
                                <?php if ($product['thumb']) { ?>
                                    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
                                <?php } ?>
                                <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                                <?php if ($product['price']) { ?>
                                    <div class="price">
                                        <?php if (!$product['special']) { ?>
                                            <?php echo $product['price']; ?>
                                        <?php } else { ?>
                                            <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                                        <?php } ?>
                                    </div>
                                <?php } ?>
                                <div class="cart">
                                    <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                <?php } ?>
            </div>
        <?php } ?>
    <?php } ?>
</div>
<?php } ?>
<script type="text/javascript"><!--
    $(function() {
        <?php if ($banner_type) { ?>
            if (!$.cookie('sp_modal_timeout')) {
                $('#special_banner<?php echo $module . "_" . $banner_id; ?>').modal('show');
            }

            <?php if ($modal_timeout > 0) { ?>
                if (!$.cookie('sp_modal_timeout')) {
                    var sp_modal_timeout = new Date();
                    sp_modal_timeout.setTime(sp_modal_timeout.getTime() + <?php echo $modal_timeout * 60 * 1000; ?>);
                    $.cookie('sp_modal_timeout', true, {expires: sp_modal_timeout, path: '/'});
                }
            <?php } ?>
        <?php } else { ?>
            var special_banner = function() {
                $('#special_banner<?php echo $module . "_" . $banner_id; ?>').cycle({
                    timeout: <?php echo $cycle_timeout; ?>*1000,
                    cssFirst: {
                        display: 'block'
                    },
                    before: function(current, next) {
                        $(next).parent().height($(next).outerHeight() - 20);
                    }
                });
            }
            setTimeout(special_banner, <?php echo $cycle_timeout; ?>*500);
        <?php } ?>
    });
//--></script>