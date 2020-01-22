$(function(){
  $('.detail__main__box__flame__content__sub__itemphoto__subphoto__box__size').click(function(){
    var $thisImg = $(this).attr('src');
    console.log($thisImg)
    $('.detail__main__box__flame__content__sub__itemphoto__mainphoto__size').attr({src:$thisImg});
    });
  });