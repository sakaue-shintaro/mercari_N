$(function(){
  $("#new_item").validate({
		rules : {
      'item[images_attributes][][image]': {
        required: true
      },
			'item[name]': {
					required: true
        },
      'item[body]': {
					required: true
      },
      'item[category_id]': {
        required: true
      },
      'item[size]': {
        required: true
      },
      'item[condition]': {
        required: true
      },
      'item[burden]': {
        required: true
      },
      'item[region]': {
        required: true
      },
      'item[sending_days]': {
        required: true
      },
      'item[price]': {
        required: true
      }},
      messages: {
        'item[images_attributes][][image]':{
            required: "必須項目です。入力をお願いします。"
          },
          'item[name]':{
            required: "必須項目です。入力をお願いします。"
          },
          'item[body]':{
            required: "必須項目です。入力をお願いします。"
          },
          'item[category_id]':{
            required: "必須項目です。入力をお願いします。"
          },
          'item[size]':{
            required: "必須項目です。入力をお願いします。"
          },
          'item[conditon]':{
            required: "必須項目です。入力をお願いします。"
          },
          'item[burden]':{
            required: "必須項目です。入力をお願いします。"
          },
          'item[region]':{
            required: "必須項目です。入力をお願いします。"
          },
          'item[sending_days]':{
            required: "必須項目です。入力をお願いします。"
          },
          'item[price]':{
            required: "必須項目です。入力をお願いします。"
          },
        },
          errorClass: "invalid", // バリデーションNGの場合に追加するクラス名の指定
          errorElement: "p", // エラーメッセージの要素種類の指定
          validClass: "valid", // バリデーションOKの場合に追加するクラス名の指定
})
})