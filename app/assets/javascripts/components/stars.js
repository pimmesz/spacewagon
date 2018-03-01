$(document).ready(function(){

  for (var i=0; i < 75; i++){
    var randomNum1 = Math.random()*100;
    var randomNum2 = Math.random()*100;
    $('<div class="stars1-star" style="top:'+randomNum1+'%;left:'+randomNum2+'%"></div>').appendTo('.stars1');
  }

  function stars1(){
    $('.stars1-one').css('top','0');
    $('.stars1-two').css('top','100%');
    $('.stars1-one').animate({
      top: '-100%'
    }, 10000, 'linear');
    $('.stars1-two').animate({
      top: '0'
    }, 10000, 'linear', function(){
      stars1();
    });
  };

  stars1()

  for (var i=0; i < 50; i++){
    var randomNum1 = Math.random()*100;
    var randomNum2 = Math.random()*100;
    $('<div class="stars2-star" style="top:'+randomNum1+'%;left:'+randomNum2+'%"></div>').appendTo('.stars2');
  }

  function stars2(){
    $('.stars2-one').css('top','0');
    $('.stars2-two').css('top','100%');
    $('.stars2-one').animate({
      top: '-100%'
    }, 15000, 'linear');
    $('.stars2-two').animate({
      top: '0'
    }, 15000, 'linear', function(){
      stars2();
    });
  };

  stars2()

  for (var i=0; i < 11; i++){
    var randomNum1 = Math.random()*100;
    var randomNum2 = Math.random()*100;
    $('<div class="stars3-star" id="glowStar'+i+'" style="top:'+randomNum1+'%;left:'+randomNum2+'%"></div>').appendTo('.stars3');
  }

  function stars3(){
    var randomNum = Math.random()*10;
    var ID = Math.round(randomNum);
    var starID = "#glowStar" + ID;
    $(starID).animate({
      opacity: 1
    }, 1000, 'swing', function(){
      $(starID).animate({
        opacity: 0
      }, 1000, 'swing', function(){
        stars3();
      });
    });
  };

  stars3()

});

