jQuery(function($){
	$('.mypage__main__margin__right__news__text__le').click(function(){
		$('.is-active').removeClass('is-active');
		$(this).addClass('is-active');
		$('.is-show').removeClass('is-show');
        // クリックしたタブからインデックス番号を取得
		const index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
		$('.mypage__main__margin__right__news__main__ul').eq(index).addClass('is-show');
	});
});


jQuery(function($){
	$('.mypage__main__margin__right__news__footer__text__le').click(function(){
		$('.ls-active').removeClass('ls-active');
		$(this).addClass('ls-active');
		$('.le-show').removeClass('le-show');
        // クリックしたタブからインデックス番号を取得
		const index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
		$('.mypage__main__margin__right__news__footer__main__ul').eq(index).addClass('le-show');
	});
});