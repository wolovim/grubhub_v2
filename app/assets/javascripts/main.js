$(document).ready(function(){

	// "Sticky" sidebar on main menu
	$("#sticker").sticky({ topSpacing: 80 });

  // Checkout form: hide/show delivery address & credit card form
  $("#address-selector").hide();
  $("#payment-selector").hide();

	$("#order_order_type_pickup").on("click", function() {
	   $("#address-selector").slideUp();
	});

	$("#order_order_type_delivery").on("click", function() {
	   $("#address-selector").slideDown(); 
	});

	$("#cash-radio").on("click", function() {
	   $("#payment-selector").slideUp();
	});

	$("#credit-radio").on("click", function() {
	   $("#payment-selector").slideDown(); 
	});

	$("#saved-address-selector").hide();
	$("#new-address-form").hide();

	$("#saved-address-radio").on("click", function () {
		$("#saved-address-selector").slideDown();
		$("#new-address-form").slideUp();
	});

	$("#new-address-radio").on("click", function () {
		$("#new-address-form").slideDown();
		$("#saved-address-selector").slideUp();
	});

});
