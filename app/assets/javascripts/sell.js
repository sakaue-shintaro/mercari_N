$(function(){
  function appendOption(child){
    var html = `<option value="${child.id}">${child.name}</option>`;
    return html;
  }

  function appendChildBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `
    <div id = 'child_categorybox' class='main__contents__item__bottom__box__head__form__goods__detail__group__add__select__box'>
      <div class='main__contents__item__bottom__box__head__form__goods__detail__group__add__select__box__bottom'>
      </div>
      <select id="child_category" name="item[category_id]"><option value="">---</option>
      ${insertHTML}
  </div>`
  $('.main__contents__item__bottom__box__head__form__goods__detail__group__add__select').append(childSelectHtml);
  }

  function appendGrandchildBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `
    <div id = 'grandchild_categorybox' class='main__contents__item__bottom__box__head__form__goods__detail__group__add__select__box'>
      <div class='main__contents__item__bottom__box__head__form__goods__detail__group__add__select__box__bottom'>
      </div>
      <select id="grandchild_category" name="item[category_id]"><option value="">---</option>
      ${insertHTML}
  </div>`
  $('.main__contents__item__bottom__box__head__form__goods__detail__group__add__select').append(grandchildSelectHtml);
  }

  function appendOptionBox(){
    var Size = `<option value="Sサイズ">Sサイズ</option><option value="Mサイズ">Mサイズ</option><option value="Lサイズ">Lサイズ</option>`;
    var OptionboxHtml = '';
    OptionboxHtml = `
    <div class='main__contents__item__bottom__box__head__form__goods__detail__group__condition'>
  <div class='main__contents__item__bottom__box__head__form__goods__detail__group__condition__cover'>サイズ</div>
  <div class='main__contents__item__bottom__box__head__form__goods__detail__group__condition__cover__logo'>必須</div>
</div>
<div class='main__contents__item__bottom__box__head__form__goods__detail__group__selects'>
  <div class='main__contents__item__bottom__box__head__form__goods__detail__group__selects__box'>
    <div class='main__contents__item__bottom__box__head__form__goods__detail__group__selects__box__bottom'></div>
    <select id="size_category" name="item[size]"><option value="">---</option>
    ${Size}
  </div>
</div>`
  $('.main__contents__item__bottom__box__head__form__goods__detail__group__add__select').append(OptionboxHtml);
  }

  function appendBrandBox(){
  var BrandboxHtml = '';
  BrandboxHtml =  `
  <div class='main__contents__item__bottom__box__head__form__goods__detail__group__condition'>
  <div class='main__contents__item__bottom__box__head__form__goods__detail__group__condition__cover'>ブランド</div>
  <div class='main__contents__item__bottom__box__head__form__goods__detail__group__condition__cover__logo__sub'>任意</div>
  </div>
  <div class='main__contents__item__bottom__box__head__form__goods__detail__group__selects'>
  <div class='main__contents__item__bottom__box__head__form__goods__detail__group__selects__box'>
  <div class='main__contents__item__bottom__box__head__form__goods__detail__group__selects__box__bottom'></div>
  <input type ="text" class="boxFiletext_field" name= "item[brandname]" value="" placeholder="例）シャネル">
  </div>
  </div>`
  $('.main__contents__item__bottom__box__head__form__goods__detail__group__add__select').append(BrandboxHtml);

    }


  $(function(){
    $('#parent_category').on('change', function(e){
      e.preventDefault()
      var parentCategory = document.getElementById('parent_category').value;
      var url = '/items/get_category_children'
      $.ajax({
        type: "GET",
        url: url,
        data: {id: parentCategory},
        dataType: 'json',
      })

      .done(function(child){
        $('#child_categorybox').remove();
        $('#grandchild_categorybox').remove();
        insertHTML = '';
        child.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildBox(insertHTML);
      })
    });
  });

  $(function(){
    $('.main__contents__item__bottom__box__head__form__goods__detail').on('change', '#child_category', function(e){
      e.preventDefault()
      var childCategory = document.getElementById('child_category').value;
      var url = '/items/get_category_grandchildren'    
      $.ajax({
        type: "GET",
        url: url,
        data: {id: childCategory},
        dataType: 'json',
      })
      .done(function(grandchild){
        $('#grandchild_category').remove();
        insertHTML = '';
        grandchild.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildBox(insertHTML);
      })
  })
  })

  $(function(){
    $('.main__contents__item__bottom__box__head__form__goods__detail').on('change', '#grandchild_category', function(e){
      e.preventDefault()
      var grandchildCategory = document.getElementById('grandchild_category').value;
      var url = '/items/get_brand'    
      $.ajax({
        type: "GET",
        url: url,
        dataType: 'json',
      })
      .done(function(fashion){
        console.log(fashion)
        fashion.forEach(function(id){
          if (grandchildCategory == id.id){
            appendOptionBox()
          }
        })
        appendBrandBox()
      })
    })
  })
})
    // //     else if(grandchildCategory !== fa.id)
    // //     {appendBrandBox()};
    // // })
    //   })
    //   })
    //   })