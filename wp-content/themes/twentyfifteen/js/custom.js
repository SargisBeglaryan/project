jQuery( document ).ready(function() {

    jQuery("#roll_customer").on("change", function (){
    	changeCustomerId(this, 'roll');
    });
    jQuery("#paper_customer").on("change", function (){
    	changeCustomerId(this, 'paper');
    });
    jQuery(".rollCustomerInput, .paperCustomerInput").on('change', function (){
    	jQuery(this).next().val('');
    })
    var columNumber, sortingColum, checkAscOrDesc;
	jQuery(".fa-arrow-down, .fa-arrow-up").on("click", function() {
		var numberColums = ['tableId', 'tableDate', 'tableTiraj', 'tableOrderFormat', 'tableMass',
		'tableProcent', 'tablePrice', 'tableCount', 'tableWeight', 'tableList', 'tableDensity',
		'tableCostPrice', 'tableDept', 'tableIncome'];
		checkAscOrDesc = jQuery(this).attr('sort');
		sortingColum = jQuery(this).parent().attr('class');
		columNumber = jQuery(this).parent().attr('colum');
		var thisTable = '.'+ jQuery(this).closest('table').attr('class');
		jQuery(thisTable).find('.activeSort').removeClass('activeSort');
		jQuery(this).addClass('activeSort');
		var rows = jQuery(thisTable +" tbody tr").detach().get();
		if(numberColums.indexOf(sortingColum) > -1){
			rows.sort(sortByNumber);
		} else {
			var english = []; armenian= [];
			for (var i = 0; i < rows.length; i++ ){
				var text = jQuery(rows[i]).find("td:eq("+columNumber+")").text().charAt(0);
				var regExp = /^[a-zA-Z]+$/;
				var object = regExp.exec(text)
				if (object){
					english.push(rows[i]);
				} else {
					armenian.push(rows[i]);
				}
			}
			english.sort(sortByChars);
			armenian.sort(sortByChars);
			jQuery(thisTable+ ' tbody').append(english);
			jQuery(thisTable+ ' tbody').append(armenian);
			return true;
		}
		jQuery(thisTable+ ' tbody').append(rows);
	});
	function sortByNumber(row1, row2) {
		var v1, v2;
		if(sortingColum == 'tableDate') {
			var originText1 = jQuery(row1).find("td:eq("+columNumber+")").text();
			var originText2 = jQuery(row2).find("td:eq("+columNumber+")").text();
			v1 = originText1.replace(/-/gi, "");
			v2 = originText2.replace(/-/gi, "");
		} else if(sortingColum == 'tableOrderFormat'){
			var originText1 = jQuery(row1).find("td:eq("+columNumber+")").text();
			var originText2 = jQuery(row2).find("td:eq("+columNumber+")").text();
			v1 = originText1.replace(" x ", "");
			v2 = originText2.replace(" x ", "");
		} else {
			v1 = jQuery(row1).find("td:eq("+columNumber+")").text();
			v2 = jQuery(row2).find("td:eq("+columNumber+")").text();
		}
		// for numbers you can simply return a-b instead of checking greater/smaller/equal
		if(checkAscOrDesc == "desc"){
			return v2-v1;
		} else {
			return v1-v2;
		}
	}
	function sortByChars(row1, row2) {
		var r;
		v1 = jQuery(row1).find("td:eq("+columNumber+")").text().toLowerCase();;
		v2 = jQuery(row2).find("td:eq("+columNumber+")").text().toLowerCase();;
		if(checkAscOrDesc == "asc"){
			if (v1 < v2) {
				r = -1;
			} else if (v1 > v2) {
				r = 1;
			} else {
				r = 0;
			}
		} else {
			if (v1 < v2) {
				r = 1;
			} else if (v1 > v2) {
				r = -1;
			} else {
				r = 0;
			}
		}
		return r;
	}

	jQuery("#material_size, #material, #density, #type").on("change", function(){
		var formName = jQuery(this).closest("form");
		var ignoredTables = ["salePaperForm", "saleRollForm", "saleOtherForm"]
		if(numberColums.indexOf(jQuery(formName).attr("class")) == -1){
			jQuery(formName).find(".page_count").trigger("blur",  {trigger: true});
		}
	});

	jQuery("#form, #foil, #rubber, #lacquer").on('change', function(){
		var thisSelect = jQuery(this);
		var formName = jQuery(this).closest("form");
		jQuery.ajax({
		url: "../../wp-admin/admin-ajax.php",
		type: 'POST',
		dataType: 'json',
		data: {
			action: "ajaxGetOtherProductPrice",
			otherProductId: jQuery(thisSelect).val(),
		}
		})
		.done(function(otherProductDetails) {
			if(otherProductDetails != null){
				jQuery(thisSelect).attr({
				    price: otherProductDetails.price,
				    percent:otherProductDetails.percent
				});
			}
		})
		.fail(function(xhr) {
			console.log(xhr.responseText);
		});
	});

	jQuery(".form_count, .foil_count, .rubber_count, .lacquer_count").on('blur', function(){
		var formName = jQuery(this).closest("form");
		if(jQuery(formName).find('.orderPriceSum').val() == null || jQuery(formName).find('.orderPriceSum').val() == ""){
			return false;
		} else {
			var otherProductPrice = parseInt(jQuery(this).prev().attr("price"));
			var otherProductPercent = parseInt(jQuery(this).prev().attr("percent"));
			var otherProductCount = parseInt(jQuery(this).val());
			var currentPrice = parseInt(jQuery(formName).find('.orderPriceSum').val());
			var productPricePercentSum = otherProductPrice * otherProductPercent / 100;
			var sum = (productPricePercentSum + otherProductPrice) * otherProductCount + currentPrice;
			jQuery(formName).find('.orderPriceSum').val(sum);
		}
	});

	jQuery(".page_count").on("blur", function(event, trigger){
		var formName = jQuery(this).closest("form");
		if(jQuery(".page_count").val() != null) {
			var oneCountPrice = jQuery(formName).find('.oneCountPrice');
			if( jQuery(oneCountPrice).val() != null && jQuery(oneCountPrice).val() != ""){
				"#form, #foil, #rubber, #lacquer"
				var percent = jQuery(oneCountPrice).attr('percent');
				var percentPrice = parseInt(jQuery(".page_count").val()) * parseInt(percent) / 100;
				var sum = parseInt(jQuery(".page_count").val()) * (parseInt(jQuery(oneCountPrice).val()) + percentPrice);
				jQuery(formName).find('.orderPriceSum').val(sum);
				if(jQuery(formName).find("#form").val() != undefined){
					addedToPrice(jQuery(formName).find("#form").attr("price"),
							jQuery(formName).find("#form").attr("percent"),
							jQuery(formName).find(".form_count").val(),
							sum, jQuery(formName)
						);
				} else if(jQuery(formName).find("#foil").val() != undefined){
					addedToPrice(jQuery(formName).find("#foil").attr("price"),
							jQuery(formName).find("#foil").attr("percent"),
							jQuery(formName).find(".foil_count").val(),
							sum, jQuery(formName)
						);
				} else if(jQuery(formName).find("#rubber").val() != undefined){
					addedToPrice(jQuery(formName).find("#rubber").attr("price"),
							jQuery(formName).find("#rubber").attr("percent"),
							jQuery(formName).find(".rubber_count").val(),
							sum, jQuery(formName)
						);
				} else if(jQuery(formName).find("#lacquer").val() != undefined){
					addedToPrice(jQuery(formName).find("#lacquer").attr("price"),
							jQuery(formName).find("#lacquer").attr("percent"),
							jQuery(formName).find(".lacquer_count").val(),
							sum, jQuery(formName)
						);
				}
			}
		}
		if(jQuery(formName).attr("class") == "orderPaper"){
			if(jQuery(formName).find("#material").val() != null && jQuery(formName).find("#material_size").val() != null
			&&	jQuery(formName).find("#density").val() != null && trigger.trigger == true) {
				var data = {};
				data["orderType"] = "paper";
				data["material"] = jQuery(formName).find("#material").val();
				var xIndex = jQuery(formName).find("#material_size").val().indexOf('x');
				data["size_y"] = jQuery(formName).find("#material_size").val().slice(xIndex+1);
				data["size_x"] = jQuery(formName).find("#material_size").val().slice(0, xIndex);
				data["density"] = jQuery(formName).find("#density").val();
				getMaterialOnePagePrice(data);
			}
		} else {
			if(jQuery(formName).find("#material").val() != null && jQuery(formName).find("#material_size").val() != null
			&&	jQuery(formName).find("#type").val() != null && trigger.trigger == true) {
				var data = {};
				data["orderType"] = "roll";
				data["material"] = jQuery(formName).find("#material").val();
				var xIndex = jQuery(formName).find("#material_size").val().indexOf('x');
				data["size_y"] = jQuery(formName).find("#material_size").val().slice(xIndex+1);
				data["size_x"] = jQuery(formName).find("#material_size").val().slice(0, xIndex);
				data["type"] = jQuery(formName).find("#type").val();
				getMaterialOnePagePrice(data);
			}
		}
	});

	jQuery("#status").on("change", function(){
		var formName = jQuery(this).closest("form");
		jQuery(formName).find(".submitStatus").css("display", "block");
	});
	jQuery(".submitStatus").on("click", function(){
		var formName = jQuery(this).closest("form");
		var data = {};
		if(jQuery(formName).attr('class') == "rollTable"){
			data["orderType"] = "roll"
		} else {
			data["orderType"] = "paper";
		}
		data["status"] = jQuery(formName).find("#status").val();
		data["product_id"] = jQuery(formName).find(".orderProductId").val();
		data["action"] = "ajaxChangeOrderStatus";
	jQuery.ajax({
		url: "../../wp-admin/admin-ajax.php",
		type: 'POST',
		dataType: 'json',
		data: data,
		})
		.done(function(material) {
			if(material != true){
				if(data.orderType == 'paper'){
					jQuery('.paperTable').find('#status').html(material.options);
					jQuery('.paperTable').find(".submitStatus").hide();
				} else {
					jQuery('.rollTable').find('#status').html(material.options);
					jQuery('.rollTable').find(".submitStatus").hide();
				}
			}
		})
		.fail(function(xhr) {
			console.log(xhr.responseText);
		});
	});

	/*sale product functionality */
	jQuery(".salePaperFormContent, .saleRollFormContent, .saleOtherFormContent").on("change", "#sale_material_size,"+ 
		"#sale_material, #sale_density, #sale_type, #otherType, #otherName", function(){
		var formName = jQuery(this).closest("form");
		if(jQuery(this).attr("id") == "otherType" || jQuery(this).attr("id") == "otherName") {
			var otherData = {};
			otherData["action"] = "ajaxFilterOtherSelect";
			if(jQuery(this).attr("id") == "otherType"){
				otherData["colum"] = "type";
				otherData["option"] = "Имя";
			} else {
				otherData["colum"] = "name";
				otherData["option"] = "Kатегория";
			}
			otherData["name"] = jQuery(this).val();
			filterOtherSelectOptions(otherData);
		}
		saleProductValidation(formName);
	});

	jQuery(".salePaperFormContent, .saleRollFormContent, .saleOtherFormContent").on("keyup", ".sale_page_count", function(){
		var formName = jQuery(this).closest("form");
		saleProductValidation(formName);
	});

	jQuery("#sale_paper, #sale_roll, #sale_other").on("click", function(){
		if(jQuery(this).attr("id") == "sale_paper"){
			var formContent = jQuery(".salePaperFormStructure");
			jQuery(".salePaperFormContent").html(jQuery(formContent).html()).show(500);
			jQuery(".salePaperForm").show(500);
		} else if(jQuery(this).attr("id") == "sale_roll"){
			var formContent = jQuery(".saleRollFormStructure");
			jQuery(".saleRollFormContent").html(jQuery(formContent).html()).show(500);
			jQuery(".saleRollForm").show(500);
		} else {
			var formContent = jQuery(".saleOtherFormStructure");
			jQuery(".saleOtherFormContent").html(jQuery(formContent).html()).show(500);
			jQuery(".saleOtherForm").show(500);
		}
	});

	jQuery(".salePaperFormContent, .saleRollFormContent, .saleOtherFormContent").on("click", ".fa-minus-circle", function(){
		var formName = jQuery(this).closest("form");
		var contentName = jQuery(formName).parent();
		jQuery(formName).hide(600).remove();
		if(jQuery(contentName).html().trim() == ""){
			jQuery(contentName).hide(300)
		}

	});

	jQuery(".salePaperFormContent, .saleRollFormContent, .saleOtherFormContent").on("click", ".fa-plus-circle", function(){
		var currentForm = jQuery(this).closest("form");
		if(jQuery(currentForm).attr("class") == "salePaperForm"){
			var newformContent = jQuery(".salePaperFormStructure");
		} else if(jQuery(currentForm).attr("class") == "saleRollForm"){
			var newformContent = jQuery(".saleRollFormStructure");
		} else {
			var newformContent = jQuery(".saleOtherFormStructure");
		}
		if(jQuery(currentForm).parent().find(".salePageTitle").length > 0){
			jQuery(newformContent).find(".salePageTitle").remove();
		}
		jQuery(currentForm).parent().append(jQuery(newformContent).html());
		jQuery(this).hide(300);
	});

	jQuery(".salePaperFormContent, .saleRollFormContent, .saleOtherFormContent").on("click", "#saleProductButton", function(){
		var currentForm = jQuery(this).closest("form");
		var contentName = jQuery(currentForm).parent();
		var data = {};
		if(jQuery(currentForm).attr("class") == "salePaperForm"){
			data["orderType"] = "paper";
			data["material"] = jQuery(currentForm).find("#sale_material").val();
			var xIndex = jQuery(currentForm).find("#sale_material_size").val().indexOf('x');
			data["size_y"] = jQuery(currentForm).find("#sale_material_size").val().slice(xIndex+1);
			data["size_x"] = jQuery(currentForm).find("#sale_material_size").val().slice(0, xIndex);
			data["density"] = jQuery(currentForm).find("#sale_density").val();
		} else if(jQuery(currentForm).attr("class") == "saleRollForm"){
			data["orderType"] = "roll";
			data["material"] = jQuery(currentForm).find("#sale_material").val();
			var xIndex = jQuery(currentForm).find("#sale_material_size").val().indexOf('x');
			data["size_y"] = jQuery(currentForm).find("#sale_material_size").val().slice(xIndex+1);
			data["size_x"] = jQuery(currentForm).find("#sale_material_size").val().slice(0, xIndex);
			data["type"] = jQuery(currentForm).find("#sale_type").val();
		} else {
			data["orderType"] = "other";
			data["otherName"] = jQuery(currentForm).find("#otherName").val();
			data["otherType"] = jQuery(currentForm).find("#otherType").val();
		}
		data["sale_page_count"] = jQuery(currentForm).find(".sale_page_count").val();
		data["action"] = "ajaxAddedNewSaleProduct";
	jQuery.ajax({
		url: "../../wp-admin/admin-ajax.php",
		type: 'POST',
		dataType: 'json',
		data: data,
		})
		.done(function(material) {
			if(material == true) {
				jQuery(currentForm).parent().append("<p class='infoMessage'>Продажа сохранена</p>");
				jQuery(currentForm).remove();
			} else {
				jQuery(currentForm).parent().append("<p class='infoMessage errorMessage'>Продажа не сохранена</p>");
			}
			jQuery(contentName).find(".infoMessage").fadeOut(4000, function() {
				jQuery(this).remove();
				if(jQuery(contentName).html().trim() == ""){
					jQuery(contentName).hide(1000);
				}
			});
		})
		.fail(function(xhr) {
			console.log(xhr.responseText);
		});
	});

});


/* document ready finish these are functions */
function addedToPrice(price, percent, count, currentSum, formName){
	var otherProductPrice = parseInt(price);
	var otherProductPercent = parseInt(percent);
	var otherProductCount = parseInt(count);
	var currentPrice = parseInt(currentSum);
	var productPricePercentSum = otherProductPrice * otherProductPercent / 100;
	var sum = (productPricePercentSum + otherProductPrice) * otherProductCount + currentPrice;
	jQuery(formName).find('.orderPriceSum').val(sum);
}

function changeCustomerId(thisInput, topic) {
	jQuery("."+topic+"CustomerId").val(jQuery(thisInput).find("[value='"+jQuery(thisInput).val()+"']").attr("id"));
	jQuery("."+topic+"CustomerInput").val(jQuery(thisInput).val());
}

function createTypeForm(button) {

}

function getMaterialOnePagePrice (data){
	data["action"] = "ajaxGetMaterialPrice";
	jQuery.ajax({
		url: "../../wp-admin/admin-ajax.php",
		type: 'POST',
		dataType: 'json',
		data: data,
		})
		.done(function(material) {
			if(material != null){
				if(data.orderType == 'paper'){
					jQuery('.orderPaper').find('.oneCountPrice').val(material.price).attr('percent', material.percent);
				} else {
					jQuery('.orderRoll').find('.oneCountPrice').val(material.price).attr('percent', material.percent);
				}
			}
		})
		.fail(function(xhr) {
			console.log(xhr.responseText);
		});
}

function filterOtherSelectOptions(data){
	jQuery.ajax({
		url: "../../wp-admin/admin-ajax.php",
		type: 'POST',
		dataType: 'json',
		data: data,
		})
		.done(function(otherOption) {
			if(otherOption != null){
				var allOptions = "<option value='' disabled selected>"+data["option"]+"</option>";
				for(var i=0; i < otherOption.length; i++){
					allOptions += "<option value='"+otherOption[i].name+"''>"+otherOption[i].name+"</option>";
				}
				if(data.colum == 'type'){
					jQuery('#otherType').html("<option value='"+data["name"]+"' selected>"+data["name"]+"</option>");
					if(jQuery('#otherName').val() == null){
						jQuery('#otherName').html(allOptions);
					}
				} else {
					jQuery('#otherName').html("<option value='"+data["name"]+"' selected>"+data["name"]+"</option>");
					if(jQuery('#otherType').val() == null){
						jQuery('#otherType').html(allOptions);
					}
				}
			}
		})
		.fail(function(xhr) {
			console.log(xhr.responseText);
		});
}

function saleProductValidation(formName) {
	if(jQuery(formName).attr("class") == "salePaperForm") {
		if(jQuery(formName).find("#sale_material_size").val() != null && jQuery(formName).find("#sale_material").val() != null
			&& jQuery(formName).find("#sale_density").val() != null && jQuery(formName).find(".sale_page_count").val() != ""){
			jQuery(formName).find("#saleProductButton").fadeIn(300);
			jQuery(formName).find(".fa-plus-circle").fadeIn(300);
		} else {
			jQuery(formName).find("#saleProductButton").fadeOut(300);
			jQuery(formName).find(".fa-plus-circle").fadeOut(300);
		}
	} else if (jQuery(formName).attr("class") == "saleRollForm"){
		if(jQuery(formName).find("#sale_material_size").val() != null && jQuery(formName).find("#sale_material").val() != null
			&& jQuery(formName).find("#sale_type").val() != null && jQuery(formName).find(".sale_page_count").val() != ""){
			jQuery(formName).find("#saleProductButton").fadeIn(300);
			jQuery(formName).find(".fa-plus-circle").fadeIn(300);
		} else {
			jQuery(formName).find("#saleProductButton").fadeOut(300);
			jQuery(formName).find(".fa-plus-circle").fadeOut(300);
		}
	} else {
		if(jQuery(formName).find("#otherType").val() != null && jQuery(formName).find("#otherName").val() != null
			&&  jQuery(formName).find(".sale_page_count").val() != ""){
			jQuery(formName).find("#saleProductButton").fadeIn(300);
			jQuery(formName).find(".fa-plus-circle").fadeIn(300);
		} else {
			jQuery(formName).find("#saleProductButton").fadeOut(300);
			jQuery(formName).find(".fa-plus-circle").fadeOut(300);
		}
	}
}