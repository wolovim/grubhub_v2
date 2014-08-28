function stripeResponseHandler(status, response) {
  var $form = $('#new_order');

  if (response.error) {
    // Show the errors on the form
    //$form.find('.payment-errors').text(response.error.message);
    alert(response.error.message);
    $form.find('button').prop('disabled', false);
  } else {
    // response contains id and card, which contains additional card details
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="stripeToken" />').val(token));
    // and submit
    $form.get(0).submit();
  }
};

$(document).ready(function(){
  Stripe.setPublishableKey('pk_test_jx6ScMJZ77A8MeDxmDiwbuFM');

  $('#new_order').submit(function(event) {
    if ($('#order_payment_type_credit').is(':checked')) {
      var $form = $(this);

      // Disable the submit button to prevent repeated clicks
      $form.find('button').prop('disabled', true);

      Stripe.card.createToken($form, stripeResponseHandler);

      // Prevent the form from submitting with the default action
      return false;
    }
  });

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

  $("#order_payment_type_cash").on("click", function() {
    $("#payment-selector").slideUp();
  });

  $("#order_payment_type_credit").on("click", function() {
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
