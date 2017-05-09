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
});

function changeCustomerId(thisInput, topic) {
	jQuery("."+topic+"CustomerId").val(jQuery(thisInput).find("[value='"+jQuery(thisInput).val()+"']").attr("id"));
	jQuery("."+topic+"CustomerInput").val(jQuery(thisInput).val());
}