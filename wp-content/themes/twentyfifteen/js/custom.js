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
		debugger;
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
});

function changeCustomerId(thisInput, topic) {
	jQuery("."+topic+"CustomerId").val(jQuery(thisInput).find("[value='"+jQuery(thisInput).val()+"']").attr("id"));
	jQuery("."+topic+"CustomerInput").val(jQuery(thisInput).val());
}