/* global screenReaderText */
/**
 * Theme functions file.
 *
 * Contains handlers for navigation and widget area.
 */

( function( $ ) {
	var $body, $window, $sidebar, adminbarOffset, top = false,
	    bottom = false, windowWidth, windowHeight, lastWindowPos = 0,
	    topOffset = 0, bodyHeight, sidebarHeight, resizeTimer,
	    secondary, button;

	function initMainNavigation( container ) {
		// Add dropdown toggle that display child menu items.
		container.find( '.menu-item-has-children > a' ).after( '<button class="dropdown-toggle" aria-expanded="false">' + screenReaderText.expand + '</button>' );

		// Toggle buttons and submenu items with active children menu items.
		container.find( '.current-menu-ancestor > button' ).addClass( 'toggle-on' );
		container.find( '.current-menu-ancestor > .sub-menu' ).addClass( 'toggled-on' );

		container.find( '.dropdown-toggle' ).click( function( e ) {
			var _this = $( this );
			e.preventDefault();
			_this.toggleClass( 'toggle-on' );
			_this.next( '.children, .sub-menu' ).toggleClass( 'toggled-on' );
			_this.attr( 'aria-expanded', _this.attr( 'aria-expanded' ) === 'false' ? 'true' : 'false' );
			_this.html( _this.html() === screenReaderText.expand ? screenReaderText.collapse : screenReaderText.expand );
		} );
	}
	initMainNavigation( $( '.main-navigation' ) );

	// Re-initialize the main navigation when it is updated, persisting any existing submenu expanded states.
	$( document ).on( 'customize-preview-menu-refreshed', function( e, params ) {
		if ( 'primary' === params.wpNavMenuArgs.theme_location ) {
			initMainNavigation( params.newContainer );

			// Re-sync expanded states from oldContainer.
			params.oldContainer.find( '.dropdown-toggle.toggle-on' ).each(function() {
				var containerId = $( this ).parent().prop( 'id' );
				$( params.newContainer ).find( '#' + containerId + ' > .dropdown-toggle' ).triggerHandler( 'click' );
			});
		}
	});

	secondary = $( '#secondary' );
	button = $( '.site-branding' ).find( '.secondary-toggle' );

	// Enable menu toggle for small screens.
	( function() {
		var menu, widgets, social;
		if ( ! secondary.length || ! button.length ) {
			return;
		}

		// Hide button if there are no widgets and the menus are missing or empty.
		menu    = secondary.find( '.nav-menu' );
		widgets = secondary.find( '#widget-area' );
		social  = secondary.find( '#social-navigation' );
		if ( ! widgets.length && ! social.length && ( ! menu.length || ! menu.children().length ) ) {
			button.hide();
			return;
		}

		button.on( 'click.twentyfifteen', function() {
			secondary.toggleClass( 'toggled-on' );
			secondary.trigger( 'resize' );
			$( this ).toggleClass( 'toggled-on' );
			if ( $( this, secondary ).hasClass( 'toggled-on' ) ) {
				$( this ).attr( 'aria-expanded', 'true' );
				secondary.attr( 'aria-expanded', 'true' );
			} else {
				$( this ).attr( 'aria-expanded', 'false' );
				secondary.attr( 'aria-expanded', 'false' );
			}
		} );
	} )();

	/**
	 * @summary Add or remove ARIA attributes.
	 * Uses jQuery's width() function to determine the size of the window and add
	 * the default ARIA attributes for the menu toggle if it's visible.
	 * @since Twenty Fifteen 1.1
	 */
	function onResizeARIA() {
		if ( 955 > $window.width() ) {
			button.attr( 'aria-expanded', 'false' );
			secondary.attr( 'aria-expanded', 'false' );
			button.attr( 'aria-controls', 'secondary' );
		} else {
			button.removeAttr( 'aria-expanded' );
			secondary.removeAttr( 'aria-expanded' );
			button.removeAttr( 'aria-controls' );
		}
	}

	// Sidebar scrolling.
	function resize() {
		windowWidth = $window.width();

		if ( 955 > windowWidth ) {
			top = bottom = false;
			$sidebar.removeAttr( 'style' );
		}
	}

	function scroll() {
		var windowPos = $window.scrollTop();

		if ( 955 > windowWidth ) {
			return;
		}

		sidebarHeight = $sidebar.height();
		windowHeight  = $window.height();
		bodyHeight    = $body.height();

		if ( sidebarHeight + adminbarOffset > windowHeight ) {
			if ( windowPos > lastWindowPos ) {
				if ( top ) {
					top = false;
					topOffset = ( $sidebar.offset().top > 0 ) ? $sidebar.offset().top - adminbarOffset : 0;
					$sidebar.attr( 'style', 'top: ' + topOffset + 'px;' );
				} else if ( ! bottom && windowPos + windowHeight > sidebarHeight + $sidebar.offset().top && sidebarHeight + adminbarOffset < bodyHeight ) {
					bottom = true;
					$sidebar.attr( 'style', 'position: fixed; bottom: 0;' );
				}
			} else if ( windowPos < lastWindowPos ) {
				if ( bottom ) {
					bottom = false;
					topOffset = ( $sidebar.offset().top > 0 ) ? $sidebar.offset().top - adminbarOffset : 0;
					$sidebar.attr( 'style', 'top: ' + topOffset + 'px;' );
				} else if ( ! top && windowPos + adminbarOffset < $sidebar.offset().top ) {
					top = true;
					$sidebar.attr( 'style', 'position: fixed;' );
				}
			} else {
				top = bottom = false;
				topOffset = ( $sidebar.offset().top > 0 ) ? $sidebar.offset().top - adminbarOffset : 0;
				$sidebar.attr( 'style', 'top: ' + topOffset + 'px;' );
			}
		} else if ( ! top ) {
			top = true;
			$sidebar.attr( 'style', 'position: fixed;' );
		}

		lastWindowPos = windowPos;
	}

	function resizeAndScroll() {
		resize();
		scroll();
	}

	$( document ).ready( function() {
		$body          = $( document.body );
		$window        = $( window );
		$sidebar       = $( '#sidebar' ).first();
		adminbarOffset = $body.is( '.admin-bar' ) ? $( '#wpadminbar' ).height() : 0;

		$window
			.on( 'scroll.twentyfifteen', scroll )
			.on( 'load.twentyfifteen', onResizeARIA )
			.on( 'resize.twentyfifteen', function() {
				clearTimeout( resizeTimer );
				resizeTimer = setTimeout( resizeAndScroll, 500 );
				onResizeARIA();
			} );
		$sidebar.on( 'click.twentyfifteen keydown.twentyfifteen', 'button', resizeAndScroll );

		resizeAndScroll();

		for ( var i = 1; i < 6; i++ ) {
			setTimeout( resizeAndScroll, 100 * i );
		}

		$("input[name='form_count'],input[name='foil_count'],input[name='rubber_count'],input[name='lacquer_count']").attr('disabled', 'disabled');
	} );

} )( jQuery );
jQuery('.order_paper, .order_roll, .salePaperFormContent, .saleRollFormContent, .saleOtherFormContent').on('change', 'select[name="material"],select[name="material_size"],select[name="density"],select[name="type"]', function (e) {
	var formName = jQuery(this).closest('form');
	var elementName = jQuery(this).attr('name');
	var valueSelected = (elementName == 'material')?jQuery(this).find('option:selected').text():this.value;
	var material = size = density = '';
	var selectField = "name";
	var switchDensity = false;
	var selector = '';
	if(jQuery(formName).find("select[name='type']").length > 0){
		switchDensity = true;
		selector = 'select[name="material"],select[name="material_size"],select[name="type"]';
	}else {
		selector = 'select[name="material"],select[name="material_size"],select[name="density"]';
	}
	var materialArray = {};
	jQuery(formName).find(selector).not(this).each(function(index, el) {

		if(el.value != ''){
			if(jQuery(el).attr('name') == 'material'){
				materialArray['name'] = jQuery(this).find('option:selected').text();
			} else if(jQuery(el).attr('name') == 'material_size'){
				sizeArray = el.value.split('x');
				materialArray['size_x'] = sizeArray[0];
				materialArray['size_y'] = sizeArray[1];
			} else{
				materialArray[jQuery(el).attr('name')] = el.value;
			}
		}
	});
	switch(elementName) {
		case "material":
			size = 'material_size';
			if(switchDensity)
				type = 'type';
			else
				density = 'density';

			break;
		case "material_size":
			material = "material";
			selectField = "size_x";
			if(switchDensity)
				type = 'type';
			else
				density = 'density';
			
			break;
		case "density":
			material = "material";
			size = 'material_size';
			selectField = "density";
			break;
		case "type":
			material = "material";
			size = 'material_size';
			selectField = "type";
			break;
	}
	if(valueSelected != '') {
		jQuery.ajax({
			url: "../../wp-admin/admin-ajax.php",
			type: 'POST',
			dataType: 'json',
			data: {
				action: "ajaxConversion",
				selectField: selectField,
				material: valueSelected,
				materialArray: materialArray,
				switchDensity: switchDensity
			},
		})
		.done(function(data) {
			jQuery.each( data, function( key, value ) {
				var defaultOption = "<option disabled selected value='' >"+jQuery(formName).find('select[name="'+key+'"] option:selected').text()+"</option>"
				if(jQuery(formName).find('select[name="'+key+'"] option:selected').val() == ''){
					jQuery(formName).find("#"+key).html(defaultOption+value);
				}else if (value == null) {
					defaultOption = "<option value=''>"+jQuery(formName).find('select[name="'+key+'"] option:disabled').text()+"</option>"
					jQuery(formName).find("#"+key).html(defaultOption);
				}
			});
		})
		.fail(function(xhr) {
			console.log(xhr.responseText);
		});
	} else {
		jQuery('select[name="material"],select[name="material_size"],select[name="density"]').not(this).each(function(index, el) {
			if(jQuery(el).val() != ''){
				jQuery(el).trigger('change');
				return false;
			}
		});
	}
});
jQuery('select#form,select#foil,select#rubber,select#lacquer').on('change', function (e) {
	if(jQuery(this).val() != ""){
		var countElement = jQuery(this).attr('id')+'_count';
		jQuery('input[name="'+countElement+'"]').removeAttr('disabled');
	}
})
var content_selling = jQuery('#selling_price').html();
var content_debt = jQuery('#debt').html();
jQuery('#selling_price, #debt').blur(function() {
	if (content_selling!=jQuery(this).html() || content_debt!=jQuery(this).html()){
		var tableName = jQuery('#table_name').val();
		tableName = "'"+tableName+"'";
		var totalCost = jQuery(this).parent('tr').find('td:nth-child(3)').html();
		var orderId = jQuery(this).parent('tr').find('td:nth-child(1)').html();
		var order_type = jQuery(this).parent('tr').find(".order_type").val();
		var customerName;
		order_type = "'"+order_type+"'";
		switch (jQuery(this).attr('id')) {
			case "selling_price":
				content_selling = jQuery(this).html();
				content_debt = jQuery(this).parent('tr').find('#debt').html();
				jQuery(this).next('td').html(content_selling-totalCost);
				customerName = null;
				// jQuery(this).parent('tr').find('td:nth-child(6)').html(content_selling);
				break;
			case "debt":
				content_selling = jQuery(this).parent('tr').find('#selling_price').html();
				content_debt = jQuery(this).html();
				customerName = "'"+jQuery(this).parent('tr').find('.customerName').text()+"'";
				break;
		}
		if(jQuery(this).parent('tr').find(".order-action").length == 0 ){
			jQuery(this).parent('tr').append('<td class="order-action"><button type="button" onclick="saveOrderData('+customerName+','+ content_selling+','+content_debt+','+tableName+','+orderId+','+order_type+')">Сохранять</button></td>');
		}else {
			jQuery(this).parent('tr').find(".order-action button").attr('onclick', 'saveOrderData('+customerName+','+content_selling+','+content_debt+','+tableName+','+orderId+','+order_type+')');
		}
	}
});
jQuery(".order_type").on('change', function(event) {
	event.preventDefault();
	jQuery(this).parents('tr').find("#debt").trigger('blur');
	jQuery(this).parents('tr').find("button").trigger('click');
});
jQuery(".type_of_order").on('change', function(event) {
	event.preventDefault();
	if(jQuery(this).val() == "Продажа"){
		jQuery(this).parents("form").find('input,select').not(jQuery(this)).each(function(index, el) {
			var elementAttr = jQuery(el).attr("required");
			if (typeof elementAttr !== typeof undefined && elementAttr !== false) {
				var excludeEl = ["customer_name","date"];
				if(jQuery.inArray(jQuery(el).attr('name'),excludeEl) == -1){
					jQuery(el).removeAttr('required');
				}
			}
		});
	}else{
		jQuery(this).parents("form").find('input,select').not(jQuery(this)).each(function(index, el) {
			var excludeEl = ["customer_name","phone_number","form","form_count","foil","foil_count","rubber","rubber_count","lacquer","lacquer_count"];
			if(jQuery.inArray(jQuery(el).attr('name'),excludeEl) == -1){
				jQuery(el).attr('required',true);
			}
		});
	}
});

function saveOrderData(customer_name, content_selling,debt,tableName,orderId,orderType){
	debt = (debt > content_selling)?0:debt;
	jQuery.ajax({
			url: "../../wp-admin/admin-ajax.php",
			type: 'POST',
			dataType: 'json',
			data: {
				action: "ajaxCostUpdate",
				content_selling: content_selling,
				debt: debt,
				orderId: orderId,
				order_type: orderType,
				tableName: tableName,
				customer_name: customer_name
			},
		})
		.done(function(data) {
			if(data){
				jQuery(".order-action").remove();
			}
		})
		.fail(function(xhr) {
			console.log(xhr.responseText);
		});
}