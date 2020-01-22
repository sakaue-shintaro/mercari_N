$(function(){
  $('#item_price').on('input',function(){
    var price = $('#item_price').val();
    var profit = Math.round(price * 0.9);
    var profit2 = profit.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' })
    var fee = Math.round(price * 0.1);
    var fee2 = fee.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' })
    $('.main__contents__item__bottom__box__head__form__goods__price__group__category__commission__right').html(fee2)
    $('.main__contents__item__bottom__box__head__form__goods__price__group__category__profit__right').html(profit2)
  })
})