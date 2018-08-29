$(window).ready(function() {

  $(document).scroll(function() {
    var $nav = $(".navbar-fixed-top");
    var $link = $(".navbar-nav>li>a");
    $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
    $link.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
  });

  $(window).scroll(function() {
    if ($(window).scrollTop() > 100) {
      $('.light-logo').addClass('hide');
      $('.dark-logo').addClass('show');
    } else if ($(window).scrollTop() < 100) {
      $('.light-logo').removeClass('hide');
      $('.dark-logo').removeClass('show');
    }
  });



});