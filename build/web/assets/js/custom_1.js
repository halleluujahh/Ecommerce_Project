// ==================================================
// Project Name  :  Neoncart
// File          :  JS Base
// Version       :  1.0.0
// Author        :  jthemes (https://themeforest.net/user/jthemes)
// ==================================================


(function($) {
  "use strict";


  // back to top - start
  // --------------------------------------------------
  $(window).scroll(function() {
    if ($(this).scrollTop() > 200) {
      $('.backtotop:hidden').stop(true, true).fadeIn();
    } else {
      $('.backtotop').stop(true, true).fadeOut();
    }
  });
  $(function() {
    $(".scroll").on('click', function() {
      $("html,body").animate({
        scrollTop: $("#thetop").offset().top
      }, "slow");
      return false
    })
  });
  // back to top - end
  // --------------------------------------------------


  // preloader - start
  // --------------------------------------------------
  // $(window).on('load', function(){
  //   $('#preloader').fadeOut('slow',function(){$(this).remove();});
  // });
  // preloader - end
  // --------------------------------------------------


  // search box - start
  // --------------------------------------------------
  $('.search_btn').on('click', function() {
    $('.search_btn > .fa-search').toggleClass('fa-times');
  });
  // search box - end
  // --------------------------------------------------


  // background - start
  // --------------------------------------------------
  $("[data-text-color]").each(function () {
    $(this).css("color", $(this).attr("data-text-color"))
  });

  $("[data-bg-color]").each(function () {
    $(this).css("background", $(this).attr("data-bg-color"))
  });
  
  $('[data-background]').each(function() {
    $(this).css('background-image', 'url('+ $(this).attr('data-background') + ')');
  });
  // background - end
  // --------------------------------------------------


  // select options - start
  // --------------------------------------------------
  $('select').niceSelect();
  // select options - end
  // --------------------------------------------------


  // tooltip - start
  // --------------------------------------------------
  // $('.tooltips').tooltip();
  // tooltip - end
  // --------------------------------------------------


  // sticky header - start
  // --------------------------------------------------
  $(window).on('scroll', function () {
    if ($(this).scrollTop() > 120) {
      $('.sticky_header').addClass("stuck")
    } else {
      $('.sticky_header').removeClass("stuck")
    }
  });
  // sticky header - end
  // --------------------------------------------------


  // sidebar - start
  // --------------------------------------------------
  $(document).ready(function () {
    $('.close_btn, .overlay').on('click', function () {
      $('.sidebar_mobile_menu').removeClass('active');
      $('.overlay').removeClass('active');
    });

    $('.mobile_menu_btn').on('click', function () {
      $('.sidebar_mobile_menu').addClass('active');
      $('.overlay').addClass('active');
    });
  });

  // 3rd level dropdown menu
  $('.dropdown > a').addClass('dropdown-toggle');
  $('.dropdown-menu .dropdown > a').on('click', function(e) {
    if (!$(this).next().hasClass('show')) {
      $(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
    }
    var $subMenu = $(this).next(".dropdown-menu");
    $subMenu.toggleClass('show');
    $(this).parents('li.dropdown.show').on('.dropdown', function(e) {
      $('.dropdown-menu > .dropdown .show').removeClass("show");
    });
    $('.dropdown-menu li a.dropdown-toggle').removeClass("show_dropdown");
    if ($(this).next().hasClass('show')) {
      $(this).addClass("show_dropdown");
    }
    return false;
  });

  $(document).ready(function () {
    $('.close_btn, .overlay').on('click', function () {
      $('.cart_sidebar').removeClass('active');
      $('.overlay').removeClass('active');
    });

    $('.cart_btn').on('click', function () {
      $('.cart_sidebar').addClass('active');
      $('.overlay').addClass('active');
    });
  });

  $(document).ready(function () {
    $('.close_btn, .overlay').on('click', function () {
      $('.filter_sidebar').removeClass('active');
      $('.overlay').removeClass('active');
    });

    $('.filter_sidebar_btn').on('click', function () {
      $('.filter_sidebar').addClass('active');
      $('.overlay').addClass('active');
    });
  });
  // sidebar - end
  // --------------------------------------------------


  // background parallax - start
  // --------------------------------------------------
  $(".parallaxie").parallaxie({
    offset: 0,
    speed: 0.3,
  });
  // background parallax - end
  // --------------------------------------------------


  // multy count down - start
  // --------------------------------------------------
  $('.countdown_timer').each(function(){
    $('[data-countdown]').each(function() {
      var $this = $(this), finalDate = $(this).data('countdown');
      $this.countdown(finalDate, function(event) {
        var $this = $(this).html(event.strftime(''
          + '<li class="days_count"><strong>%D</strong><span>Days</span></li>'
          + '<li class="hours_count"><strong>%H</strong><span>Hours</span></li>'
          + '<li class="minutes_count"><strong>%M</strong><span>Mins</span></li>'
          + '<li class="seconds_count"><strong>%S</strong><span>Secs</span></li>'));
      });
    });
  });
  // multy count down - end
  // --------------------------------------------------


  // popup images & videos - start
  // --------------------------------------------------
  $('.zoom-gallery').magnificPopup({
    delegate: '.popup_image',
    type: 'image',
    closeOnContentClick: false,
    closeBtnInside: false,
    mainClass: 'mfp-with-zoom mfp-img-mobile',
    image: {
      verticalFit: true,
      titleSrc: function(item) {
        return item.el.attr('title') + ' &middot; <a class="image-source-link" href="'+item.el.attr('data-source')+'" target="_blank">image source</a>';
      }
    },
    gallery: {
      enabled: true
    },
    zoom: {
      enabled: true,
      duration: 300,
      opener: function(element) {
        return element.find('img');
      }
    }
  });

  $('.play_btn, .play_btn_1, .play_btn_2').magnificPopup({
    disableOn: 700,
    type: 'iframe',
    preloader: false,
    removalDelay: 160,
    mainClass: 'mfp-fade',
    fixedContentPos: false
  });
  // popup images & videos - end
  // --------------------------------------------------


  // wow animation - start
  // --------------------------------------------------
  function wowAnimation() {
    new WOW({
      offset: 100,
      mobile: true
    }).init()
  }
  wowAnimation();
  // wow animation - end
  // --------------------------------------------------


  // masoney grid layout - start
  // --------------------------------------------------
  var $grid = $('.grid').imagesLoaded( function() {
    $grid.masonry({
      itemSelector: '.grid-item',
      percentPosition: true,
      columnWidth: '.grid-sizer'
    }); 
  });
  // masoney grid layout - end
  // --------------------------------------------------


  // isotope filtering - start
  // --------------------------------------------------
  function portfolioMasonry() {
    var portfolio = $(".element-grid");
    if (portfolio.length) {
      portfolio.imagesLoaded(function () {
        portfolio.isotope({
          itemSelector: ".element-item",
          layoutMode: 'masonry',
          filter: "*",
          animationOptions: {
            duration: 1000
          },
          transitionDuration: '0.5s',
          masonry: {

          }
        });

        $(".filters-button-group button").on('click', function () {
          $(".filters-button-group button").removeClass("active");
          $(this).addClass("active");

          var selector = $(this).attr("data-filter");
          portfolio.isotope({
            filter: selector,
            animationOptions: {
              animationDuration: 750,
              easing: 'linear',
              queue: false
            }
          })
          return false;
        })
      });
    }
  }
  portfolioMasonry();
  // isotope filtering - end
  // --------------------------------------------------

  
  // quantity - start
  // --------------------------------------------------
  
  function neoncart_quantity(){
    $(document).on('click', '.quantity_input .input_number_decrement, .quantity_input .input_number_increment', function (e) {
      var target = $(e.target),
      qty = target.closest('.quantity_input').find('input.input_number'),
      min, max, step, value;
      
      if (qty.length) {
        min = qty.attr('min') || 0;
        max = qty.attr('max') || 0;
        step = qty.attr('step') || 1;
        min = parseInt(min);
        max = parseInt(max);
        step = parseInt(step);
        value = parseInt(qty.val());
        
        if (target.is('.input_number_increment')) {
          value += step;
        } else {
          value -= step;
        }
        
        value = Math.max(min, value);
        if (max) {
          value = Math.min(max, value);
        }
        
        qty.val(value).change();
      }
    });
}
  neoncart_quantity();
  // quantity - end
  // --------------------------------------------------
  
  // zoom
  $('.zoom-image img').click(function (event) {
    var ix = $(this).offset().left;
    var iy = $(this).offset().top;
    console.log(ix + '-' + iy);

    var mx = event.pageX;
    var my = event.pageY;
    console.log(mx + '-' + my);
  })
  $('.zoom-image img').hover(function () {
    var img = $(this).attr('src');
    $(this).after("<div class='hover-image' style='background-image: url(" + img + "); background-size: 1200px;'></div>");
    $(this).mousemove(function (event) {

      // Mouse Position
      var mx = event.pageX;
      var my = event.pageY;

      // Image Position
      var ix = $(this).offset().left;
      var iy = $(this).offset().top;

      // Mouse Position Relavtive to Image
      var x = mx - (ix);
      var y = my - (iy);

      // Image Height and Width
      var w = $(this).width();
      var h = $(this).height();

      // Mouse Position Relative to Image, in %
      var xp = (-x / w) * -70;
      var yp = (-y / h) * -70;

      $(this).parent().find('.hover-image').attr('style',
        "background-image: url(" + img + "); background-size: 1200px; background-repeat: no-repeat; background-position: " + xp + "% " + yp + "%; top: " + y + "px; left: " + x + "px;");
    });

  }, function () {
    $(this).parent().find('.hover-image').remove();
  });
  // price range - start
  // --------------------------------------------------
  if($("#slider-range").length){
    $( "#slider-range" ).slider({
      range: true,
      min: 5,
      max: 1000,
      values: [ 30.00, 429.00 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
  }

  $('.ar_top').on('click', function () {
    var getID = $(this).next().attr('id');
    var result = document.getElementById(getID);
    var qty = result.value;
    $('.proceed_to_checkout .update-cart').removeAttr('disabled');
    if( !isNaN( qty ) ) {
      result.value++;
    }else{
      return false;
    }
  });
  // price range - end
  // --------------------------------------------------


  // common carousel - start
  // --------------------------------------------------
  $('.slideshow1_slider').slick({
    dots: true,
    speed: 1000,
    arrows: true,
    infinite: true,
    autoplay: true,
    slidesToShow: 1,
    pauseOnHover: true,
    autoplaySpeed: 4000,
    prevArrow: ".left_arrow",
    nextArrow: ".right_arrow",
  });

  $('.slideshow2_slider').slick({
    dots: true,
    speed: 1000,
    arrows: true,
    infinite: true,
    autoplay: true,
    slidesToShow: 2,
    pauseOnHover: true,
    autoplaySpeed: 4000,
    prevArrow: ".ss2_left_arrow",
    nextArrow: ".ss2_right_arrow",
    responsive: [
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 2
      }
    }
    ]
  });

  $('.slideshow3_slider').slick({
    dots: true,
    speed: 1000,
    arrows: true,
    infinite: true,
    autoplay: true,
    slidesToShow: 3,
    pauseOnHover: true,
    autoplaySpeed: 4000,
    prevArrow: ".ss3_left_arrow",
    nextArrow: ".ss3_right_arrow",
    responsive: [
    {
      breakpoint: 0,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 551,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 2
      }
    },
    {
      breakpoint: 992,
      settings: {
        slidesToShow: 2
      }
    },
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 3
      }
    }
    ]
  });

  $('.slideshow4_slider').slick({
    dots: true,
    speed: 1000,
    arrows: true,
    infinite: true,
    autoplay: true,
    slidesToShow: 4,
    pauseOnHover: true,
    autoplaySpeed: 4000,
    prevArrow: ".ss4_left_arrow",
    nextArrow: ".ss4_right_arrow",
    responsive: [
    {
      breakpoint: 0,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 681,
      settings: {
        slidesToShow: 2
      }
    },
    {
      breakpoint: 992,
      settings: {
        slidesToShow: 3
      }
    },
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 4
      }
    }
    ]
  });

  $('.slideshow5_slider').slick({
    dots: true,
    speed: 1000,
    arrows: true,
    infinite: true,
    autoplay: true,
    slidesToShow: 5,
    pauseOnHover: true,
    autoplaySpeed: 4000,
    prevArrow: ".left_arrow5",
    nextArrow: ".right_arrow5",
    responsive: [
    {
      breakpoint: 0,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 576,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 681,
      settings: {
        slidesToShow: 2
      }
    },
    {
      breakpoint: 881,
      settings: {
        slidesToShow: 3
      }
    },
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 4
      }
    }
    ]
  });
  // common carousel - end
  // --------------------------------------------------


  // main slider - start
  // --------------------------------------------------
  $('.main_slider').slick({
    dots: true,
    fade: true,
    arrows: true,
    // speed: 1000,
    infinite: true,
    autoplay: true,
    slidesToShow: 1,
    // pauseOnHover: true,
    autoplaySpeed: 6000,
    prevArrow: ".main_left_arrow",
    nextArrow: ".main_right_arrow",
    customPaging: function (slider, i) {
      console.log(slider);
      var slideNumber   = (i + 1),
      totalSlides = slider.slideCount;
      return '<a class="custom-dot" role="button" title="' + slideNumber + ' of ' + totalSlides + '"><span class="string">' + slideNumber + '</span></a>';
    }
  });

  $('.main_slider').on('init', function (e, slick) {
    var $firstAnimatingElements = $('div.item:first-child').find('[data-animation]');
    doAnimations($firstAnimatingElements);
  });
  $('.main_slider').on('beforeChange', function (e, slick, currentSlide, nextSlide) {
    var $animatingElements = $('div.item[data-slick-index="' + nextSlide + '"]').find('[data-animation]');
    doAnimations($animatingElements);
  });
  var slideCount = null;

  $('.main_slider').on('init', function (event, slick) {
    slideCount = slick.slideCount;
    setSlideCount();
    setCurrentSlideNumber(slick.currentSlide);
  });
  $('.main_slider').on('beforeChange', function (event, slick, currentSlide, nextSlide) {
    setCurrentSlideNumber(nextSlide);
  });

  function setSlideCount() {
    var $el = $('.slide_count_wrap').find('.total');
    if (slideCount < 10) {
      $el.text('0' + slideCount);
    } else {
      $el.text(slideCount);
    }
  }

  function setCurrentSlideNumber(currentSlide) {
    var $el = $('.slide_count_wrap').find('.current');
    $el.text(currentSlide + 1);
  }

  function doAnimations(elements) {
    var animationEndEvents = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
    elements.each(function () {
      var $this = $(this);
      var $animationDelay = $this.data('delay');
      var $animationType = 'animated ' + $this.data('animation');
      $this.css({
        'animation-delay': $animationDelay,
        '-webkit-animation-delay': $animationDelay
      });
      $this.addClass($animationType).one(animationEndEvents, function () {
        $this.removeClass($animationType);
      });
    });
  }

  var $timer = 6000;
  function progressBar() {
    $(".slick-progress").find("span").removeAttr("style");
    $(".slick-progress").find("span").removeClass("active");
    setTimeout(function () {
      $(".slick-progress").find("span").css("transition-duration", $timer / 1000 + "s").addClass("active");
    }, 100);
  }

  progressBar();
  $('.main_slider').on("beforeChange", function (e, slick) {
    progressBar();
  });
  // main slider - end
  // --------------------------------------------------


  // lookbook slide - start
  // --------------------------------------------------
  // debounce from underscore.js
  function debounce(func, wait, immediate) {
    var timeout;
    return function () {
      var context = this, args = arguments;
      var later = function () {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  // use x and y mousewheel event data to navigate flickity
  function slick_handle_wheel_event(e, slick_instance, slick_is_animating) {
    // do not trigger a slide change if another is being animated
    if (!slick_is_animating) {
      // pick the larger of the two delta magnitudes (x or y) to determine nav direction
      var direction =
        Math.abs(e.deltaX) > Math.abs(e.deltaY) ? e.deltaX : e.deltaY;

      console.log("wheel scroll ", e.deltaX, e.deltaY, direction);

      if (direction > 0) {
        // next slide
        slick_instance.slick("slickNext");
      } else {
        // prev slide
        slick_instance.slick("slickPrev");
      }
    }
  }

  // debounce the wheel event handling since trackpads can have a lot of inertia
  var slick_handle_wheel_event_debounced = debounce(
    slick_handle_wheel_event
    , 50, true
  );

  // init onelook_slider slider
  const onelook_slider = $(".onelook_slider");
  onelook_slider.slick({
    dots: true,
    vertical: true,
    verticalSwiping: true,
    arrows: false
  });
  var onelook_slider_is_animating = false;

  onelook_slider.on("afterChange", function (index) {
    console.log("Slide after change " + index);
    onelook_slider_is_animating = false;
  });

  onelook_slider.on("beforeChange", function (index) {
    console.log("Slide before change " + index);
    onelook_slider_is_animating = true;
  });

  onelook_slider.on("wheel", function (e) {
    slick_handle_wheel_event_debounced(e.originalEvent, onelook_slider, onelook_slider_is_animating);
  });

  // init mouse_scroll_slide slider
  const mouse_scroll_slide = $(".mouse_scroll_slide");
  mouse_scroll_slide.slick({
    dots: true,
    slidesToShow: 3,
    responsive: [
      {
        breakpoint: 0,
        settings: {
          slidesToShow: 1
        }
      },
      {
        breakpoint: 481,
        settings: {
          slidesToShow: 1
        }
      },
      {
        breakpoint: 992,
        settings: {
          slidesToShow: 2
        }
      },
      {
        breakpoint: 1280,
        settings: {
          slidesToShow: 3
        }
      }
    ]
  });
  var mouse_scroll_slide_is_animating = false;

  mouse_scroll_slide.on("afterChange", function (index) {
    console.log("Slide after change " + index);
    mouse_scroll_slide_is_animating = false;
  });

  mouse_scroll_slide.on("beforeChange", function (index) {
    console.log("Slide before change " + index);
    mouse_scroll_slide_is_animating = true;
  });

  mouse_scroll_slide.on("wheel", function (e) {
    slick_handle_wheel_event_debounced(e.originalEvent, mouse_scroll_slide, mouse_scroll_slide_is_animating);
  });

  // lookbook slide - end
  // --------------------------------------------------


  // product details slider - start
  // --------------------------------------------------
  $('.pd_slide').slick({
    dots: true,
    fade: false,
    arrows: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    asNavFor: '.pd_slide_nav',
  });
  $('.pd_slide_nav').slick({
    dots: false,
    arrows: true,
    slidesToShow: 5,
    centerMode: true,
    slidesToScroll: 1,
    focusOnSelect: true,
    asNavFor: '.pd_slide',
    responsive: [
    {
      breakpoint: 0,
      settings: {
        slidesToShow: 2
      }
    },
    {
      breakpoint: 576,
      settings: {
        slidesToShow: 2,
      }
    },
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 3
      }
    },
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 5
      }
    }
    ]
  });
  // product details slider - end
  // --------------------------------------------------


  // category slider - start
  // --------------------------------------------------
  $('.carparts_category_carousel').slick({
    dots: false,
    speed: 1000,
    arrows: false,
    infinite: true,
    autoplay: true,
    slidesToShow: 5,
    pauseOnHover: true,
    autoplaySpeed: 4000,
    responsive: [
    {
      breakpoint: 0,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 380,
      settings: {
        slidesToShow: 1,
        centerMode: true,
        centerPadding: '40px',
      }
    },
    {
      breakpoint: 451,
      settings: {
        slidesToShow: 1,
        centerMode: true,
        centerPadding: '60px',
      }
    },
    {
      breakpoint: 576,
      settings: {
        slidesToShow: 2
      }
    },
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 3
      }
    },
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 4
      }
    },
    {
      breakpoint: 1280,
      settings: {
        slidesToShow: 5
      }
    }
    ]
  });
  // category slider - end
  // --------------------------------------------------


  // barnd carousel - start
  // --------------------------------------------------
  $('.barnd_carousel').slick({
    dots: false,
    speed: 1000,
    arrows: false,
    infinite: true,
    autoplay: true,
    slidesToShow: 6,
    pauseOnHover: true,
    autoplaySpeed: 3000,
    responsive: [
    {
      breakpoint: 0,
      settings: {
        slidesToShow: 2
      }
    },
    {
      breakpoint: 481,
      settings: {
        slidesToShow: 2
      }
    },
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 3
      }
    },
    {
      breakpoint: 992,
      settings: {
        slidesToShow: 4
      }
    },
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 6
      }
    }
    ]
  });
  // barnd carousel - end
  // --------------------------------------------------


  // electronic feature carousel - start
  // --------------------------------------------------
  $('.electronic_feature_carousel2').slick({
    dots: true,
    speed: 1000,
    arrows: true,
    infinite: true,
    autoplay: true,
    slidesToShow: 1,
    pauseOnHover: true,
    autoplaySpeed: 4000,
  });
  // electronic feature carousel - end
  // --------------------------------------------------


  // product 3 collumn - start
  // --------------------------------------------------
  $('.product3_collumn_carousel').slick({
    dots: true,
    speed: 1000,
    arrows: true,
    infinite: true,
    autoplay: true,
    slidesToShow: 3,
    pauseOnHover: true,
    autoplaySpeed: 2000,
    responsive: [
    {
      breakpoint: 0,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 501,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 680,
      settings: {
        slidesToShow: 2
      }
    },
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 3
      }
    },
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 3
      }
    }
    ]
  });

  $('.product4_collumn_carousel').slick({
    dots: true,
    speed: 1000,
    arrows: true,
    infinite: true,
    autoplay: true,
    slidesToShow: 4,
    pauseOnHover: true,
    autoplaySpeed: 2000,
    responsive: [
    {
      breakpoint: 0,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 681,
      settings: {
        slidesToShow: 2
      }
    },
    {
      breakpoint: 992,
      settings: {
        slidesToShow: 3
      }
    },
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 4
      }
    }
    ]
  });
  // product 3 collumn - end
  // --------------------------------------------------


  // supermarket feature carousel - start
  // --------------------------------------------------
  $('.supermarket_feature_carousel').slick({
    dots: true,
    speed: 1000,
    arrows: true,
    infinite: true,
    autoplay: true,
    slidesToShow: 1,
    pauseOnHover: true,
    autoplaySpeed: 4000,
  });
  // supermarket feature carousel - end
  // --------------------------------------------------


  // motorcycle testimonial carousel - start
  // --------------------------------------------------
  $('.motorcycle_testimonial_carousel').slick({
    dots: true,
    speed: 1000,
    arrows: true,
    infinite: true,
    autoplay: true,
    slidesToShow: 1,
    pauseOnHover: true,
    autoplaySpeed: 4000,
    prevArrow: ".mt_left_arrow",
    nextArrow: ".mt_right_arrow",
  });
  // motorcycle testimonial carousel - end
  // --------------------------------------------------


  // gadget gallery carousel - start
  // --------------------------------------------------
  $('.gadget_gallery_carousel').slick({
    dots: true,
    speed: 1000,
    arrows: true,
    infinite: true,
    autoplay: true,
    slidesToShow: 4,
    pauseOnHover: true,
    autoplaySpeed: 4000,
    prevArrow: ".ggc_left_arrow",
    nextArrow: ".ggc_right_arrow",
    responsive: [
    {
      breakpoint: 0,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 481,
      settings: {
        slidesToShow: 1
      }
    },
    {
      breakpoint: 576,
      settings: {
        slidesToShow: 2
      }
    },
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 3
      }
    },
    {
      breakpoint: 992,
      settings: {
        slidesToShow: 3
      }
    },
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 4
      }
    }
    ]
  });
  // gadget gallery carousel - end
  // --------------------------------------------------


  // google map - start
  // --------------------------------------------------
  if ( $('#mapBox').length ){
    var $lat = $('#mapBox').data('lat');
    var $lon = $('#mapBox').data('lon');
    var $zoom = $('#mapBox').data('zoom');
    var $marker = $('#mapBox').data('marker');
    var $info = $('#mapBox').data('info');
    var $markerLat = $('#mapBox').data('mlat');
    var $markerLon = $('#mapBox').data('mlon');
    var map = new GMaps({
      el: '#mapBox',
      lat: $lat,
      lng: $lon,
      scrollwheel: false,
      scaleControl: true,
      streetViewControl: false,
      panControl: true,
      disableDoubleClickZoom: true,
      mapTypeControl: false,
      zoom: $zoom,
    });
    map.addMarker({
      lat: $markerLat,
      lng: $markerLon,
      icon: $marker,    
      infoWindow: {
        content: $info
      }
    })
  }
  // google map - end
  // --------------------------------------------------


})(jQuery);