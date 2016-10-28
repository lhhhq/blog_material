import lightBox from './lightBox';

$('.js_navTagBtn, .js_navCategoryBtn').on('click', function(e) {
    let navDropmenuBox = $('.js_navDropmenuBox');
    navDropmenuBox.children().stop();

    if ($(e.currentTarget).hasClass('js_navTagBtn')) {
        if (navDropmenuBox.data('statu') === 'tags') {
            navDropmenuBox.children().first().animate({
                bottom: 0,
                opacity: 0
            }).css({
                display: 'none'
            });
            navDropmenuBox.data('statu', 'none');
            return;
        }

        navDropmenuBox.children().last().css({
            bottom: 0,
            opacity: 0,
            display: 'none'
        });

        navDropmenuBox.children().first().css({
            display: 'block'
        }).animate({
            bottom: -(navDropmenuBox.children().first().height()),
            opacity: 1
        });

        navDropmenuBox.data('statu', 'tags');
        return;
    }

    if (navDropmenuBox.data('statu') === 'cats') {
        navDropmenuBox.children().last().animate({
            bottom: 0,
            opacity: 0
        }).css({
            display: 'none'
        });
        navDropmenuBox.data('statu', 'none');
        return;
    }

    navDropmenuBox.children().first().css({
        bottom: 0,
        opacity: 0,
        display: 'none'
    });

    navDropmenuBox.children().last().css({
        display: 'block'
    }).animate({
        bottom: -(navDropmenuBox.children().last().height()),
        opacity: 1
    });

    navDropmenuBox.data('statu', 'cats');
})

$(document).ready(function() {
    if ($('.artCnt_cntBox_post_body').length > 0) {
        $('.artCnt_cntBox_post_body img').each(function(index, el) {
            if ($(el).width() > 100) {
                $(el).css({
                    display: 'block',
                    margin: '0 auto'
                })
            }

            if ($(el).width() > $('.artCnt_cntBox_post_body').width()*2/3) {
                $(el).css({
                    width: 520,
                    'max-width': '100%'
                })
            }
        });
        lightBox.init('.artCnt_cntBox_post_body');
    }
})

