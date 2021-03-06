App.ready(function(){

  setRatings();

});

function setRatings(){
  // TOWER CARD & REPORT CARD
  $('.tower-card, .report-card').find('.rating-stars').each(function(){
        var elem = this;
        var elemRating = $(this).data('rating');
        var rating = Math.round(elemRating/0.5) * 0.5;

        $(elem).rateYo({
            readOnly: true,
            numStars: 5,
            rating: rating,
            maxValue: 5,
            spacing: '1px',
            normalFill: '#DBDBDB',
            ratedFill: '#29339E',
            starWidth: '12px'
        });

    });

    // TOWER SHOW
    $('.tower-show__header--content').find('.rating-stars').each(function(){
        var elem = this;
        var elemRating = $(this).data('rating');
        var rating = Math.round(elemRating/0.5) * 0.5;

        $(elem).rateYo({
            readOnly: true,
            numStars: 5,
            rating: rating,
            maxValue: 5,
            spacing: '1px',
            normalFill: '#7C7C7C',
            ratedFill: '#FFFFFF',
            starWidth: '13px'
        });

    });

    $('.tower-show__content--side').find('.rating-stars').each(function(){
      var elem = this;
      var elemRating = $(this).data('rating');
      var rating = Math.round(elemRating/0.5) * 0.5;

      $(elem).rateYo({
          readOnly: true,
          numStars: 5,
          rating: rating,
          maxValue: 5,
          spacing: '1px',
          normalFill: '#DBDBDB',
          ratedFill: '#29339E',
          starWidth: '20px'
      });

    });

    $('.tower-show__header--content').find('.rating-stars').each(function(){
      var elem = this;
      var elemRating = $(this).data('rating');
      var rating = Math.round(elemRating/0.5) * 0.5;

      $(elem).rateYo({
          readOnly: true,
          numStars: 5,
          rating: rating,
          maxValue: 5,
          spacing: '1px',
          normalFill: '#7C7C7C',
          ratedFill: '#FFFFFF',
          starWidth: '13px'
      });

    });

    // REPORT SHOW
    $('.report-container__content').find('.rating-stars').each(function(){
        var elem = this;
        var form = $(this).parents('.rating-form');
        var input = $(elem).parent().find('input.notation');
        var value = parseFloat(input.val());

        $(elem).rateYo({
            numStars: 5,
            maxValue: 5,
            spacing: '2px',
            normalFill: '#DBDBDB',
            ratedFill: '#29339E',
            starWidth: '26px',
            fullStar: true,
            onInit: function(rating, rateYoInstance){
                input.val(rating);
            },
            onSet: function(rating, rateYoInstance){
                input.val(rating);
                $(form).submit();
            }
        });

    });
}
