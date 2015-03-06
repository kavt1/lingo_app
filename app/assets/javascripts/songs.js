// Airbnb infinite smooth list
// http://airbnb.github.io/infinity/
$(document).ready(function() {


  var media_pop = Popcorn("#media_player");

  $('body').on('click', function (e) {
    if ($(e.target).data('toggle') !== 'popover'
      && $(e.target).parents('.popover.in').length === 0) {
      $('[data-toggle="popover"]').popover('hide');
    }
  });



  // $('.word').click(function() {
  //   var audio = $('#media_player');
  //   var translation = $(this).data('content');
  //   if (translation != null) {
  //     $(this).popover('show');
  //   }
  //   audio[0].currentTime = parseFloat($(this).data('start'), 10);
  //   audio[0].play();
  // });

  $('.line').click(function() {
    var audio = $('#media_player');
    audio[0].currentTime = parseFloat($(this).data('start'), 10);
    audio[0].play();
  });


  $('#start').click(function() {
    media_pop.play(0);
  });

  $('#play').click(function() {
    media_pop.play();
  });

  $('#pause').click(function() {
    media_pop.pause();
  });


  // $.each(wordsTransition, function(id, time) {
  //   media_pop.footnote({
  //     start: time.time_start,
  //     end: time.time_end,
  //     text: '',
  //     target: id,
  //     effect: "applyclass",
  //     applyclass: "selected"
  //   });
  // });

$.each(linesTransition, function(id, time) {
    media_pop.code( {
      start: time.time_start,
      end: time.time_end,
      onStart: function(options) {

        window.location = ('#' + id);
        // var list = $('#line_list');
        // var line = list.find('[id=\'' + id + '\']');
        // var optionTop = line.offset().top;
        // var listTop = list.offset().top;
        // container.animate({
        //   scrollTop: optionTop - listTop + list.scrollTop()
        // });
      },
      onEnd: function(options) {
        // nothing to do
      }
    });
  });



  $.each(linesTransition, function(id, time) {
    media_pop.footnote({
      start: time.time_start,
      end: time.time_end,
      text: '',
      target: id,
      effect: "applyclass",
      applyclass: "active"
    });
  });



  // http://jsfiddle.net/xsgy41wz/


});
