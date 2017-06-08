// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

App.ready(function(){

  if($('#subscriptions_edit').is('*')) {
    $('form').on('change', function(e) {
      data = $(this).serialize();

      $.ajax({
        url: App.routes.simulate_subscription_path+'?'+data,
        method: 'post'
      })
      .done(function(data) {
        $('.quantity-discount .value').html(data['quantity_discount_percent'])
        $('.total-discount-amount .value').html(data['total_discount'])
        $('.total-amount .value').html(data['amount'])
      });
    });
  }

});
