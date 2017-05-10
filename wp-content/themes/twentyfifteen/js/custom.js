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

	jQuery("#button1, #button2").on("click", function() {
		var numberColums = ['tableId', 'tableDate', "tableTiraj"];
		var checkAscOrDesc = jQuery(this).attr('sort');
		var sortingColum = jQuery(this).parent().attr('class');
		var rows = jQuery("#paperTableColums tbody tr").detach().get();
		if(numberColums.indexOf(sortingColum) > -1){
			rows.sort(sortByChars);
		} else {
			rows.sort(sortByNumber);
		}
		$("#paperTableColums tbody").append(rows);
	});
});

function changeCustomerId(thisInput, topic) {
	jQuery("."+topic+"CustomerId").val(jQuery(thisInput).find("[value='"+jQuery(thisInput).val()+"']").attr("id"));
	jQuery("."+topic+"CustomerInput").val(jQuery(thisInput).val());
}

function sortByNumber(row1, row2) {
var v1, v2;
v1 = $(row1).find(".number").text();
v2 = $(row2).find(".number").text();
// for numbers you can simply return a-b instead of checking greater/smaller/equal
return v2 - v1;
}
function sortByChars(row1, row2) {
	var r;
	v1 = $(row1).find("td:eq(4)").text();
	v2 = $(row2).find("td:eq(4)").text();
	if (v1 < v2) {
		r = -1;
	} else if (v1 > v2) {
		r = 1;
	} else {
		r = 0;
	}
	return r;
}