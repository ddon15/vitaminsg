$(document).ready(function() {
	/* Search old implementation*/
	// $('.button-search').bind('click', function() {
	// 	url = $('base').attr('href') + 'index.php?route=product/search';
				 
	// 	var search = $('input[name=\'search\']').attr('value');
		
	// 	if (search) {
	// 		url += '&search=' + encodeURIComponent(search);
	// 	}
		
	// 	location = url;
	// });

	/*
		Search Product Keyword
		This will redirect to new url search/$keyword
	*/
        var search = function(keyword) {
		var url = $('base').attr('href') + 'search/';

		location = search ? url.concat(encodeURIComponent(keyword)) : url;

                return;
	};

	$('.button-search').bind('click', function(e) {
		var keyword = $('input[name=\'search\']').attr('value');
		
                search(keyword);

		e.preventDefault();
	});
	
	$('.search-bar').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			//url = $('base').attr('href') + 'index.php?route=product/search';
                        var keyword = null;
			$('.search-bar').each(function(){
				if(($(this).is(":visible"))&&($(this).parent().get(0).tagName=="DIV")) {
					keyword = $(this).attr('value');
                                        if (keyword) { 
                                                search(keyword);
                                                return;
                                        }
					//if (search) {
						//url += '&search=' + encodeURIComponent(search);
						//location = url;
                                                //search(keyword);
						//return;
					//}
				}
			});
			search(keyword);
		}
	});
	
	/* Ajax Cart */
	$('#cart > .heading a').live('mouseover', function() {
		$('#cart').addClass('active');
		
		$('#cart').load('index.php?route=module/cart #cart > *');
		
		$('#cart').live('mouseleave', function() {
			$(this).removeClass('active');
		});
	});
	
	/* Mega Menu */
	$('#menu ul > li > a + div').each(function(index, element) {
		// IE6 & IE7 Fixes
		if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
			var category = $(element).find('a');
			var columns = $(element).find('ul').length;
			
			$(element).css('width', (columns * 143) + 'px');
			$(element).find('ul').css('float', 'left');
		}		
		
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});
	
	// Bulk Pricing Link
	$(".product-details-price-bulk-price a").on('click', function () {
		var strWindowFeatures = "location=yes,height=600,width=600,scrollbars=yes,status=no";
		var URL = $(this).attr("href");
		var win = window.open(URL, "_blank", strWindowFeatures);
		return false;
	});
	
	// IE6 & IE7 Fixes
	if ($.browser.msie) {
		if ($.browser.version <= 6) {
			$('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');
			
			$('#column-right + #content').css('margin-right', '195px');
		
			$('.box-category ul li a.active + ul').css('display', 'block');	
		}
		
		if ($.browser.version <= 7) {
			$('#menu > ul > li').bind('mouseover', function() {
				$(this).addClass('active');
			});
				
			$('#menu > ul > li').bind('mouseout', function() {
				$(this).removeClass('active');
			});	
		}
	}
	
	$('.success img, .warning img, .attention img, .information img').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});	
});

function getURLVar(key) {
	var value = [];
	
	var query = String(document.location).split('?');
	
	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 

function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/oxy/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				setTimeout(function() {
					$('.success').delay(500).fadeOut(1000);
				}, 7000);
				
				$('#cart-total').html(json['total']);

			}	
		}
	});
	
}
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/oxy/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				setTimeout(function() {
					$('.success').delay(500).fadeOut(1000);
				}, 7000);
				
				$('#wishlist-total').html(json['total']);

			}	
		}
	});
	
	//[KianAnn] track add to wishlist in GA
	ga('sainhall_tracker.send', 'pageview', '/index.php?route=account/wishlist/add');
	
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/oxy/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				setTimeout(function() {
					$('.success').delay(500).fadeOut(1000);
				}, 7000);
				
				$('#compare-total').html(json['total']);

			}	
		}
	});
	
	//[KianAnn] track add to compare in GA
	ga('sainhall_tracker.send', 'pageview', '/index.php?route=product/compare/add');
	
}