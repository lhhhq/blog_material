/*
 Dandelion By@yangfch3
 Tue Dec 13 2016 17:35:11 GMT+0800 (CST)
 */
(function () {
    'use strict';

    var lightBox = function () {
        function _createCover(options) {
            var cover = document.createElement('div');
            $(cover).addClass('light-box').css({
                position: 'fixed',
                width: '100%',
                height: '100%',
                'z-index': '1000',
                'background-color': options.backgroundColor,
                display: 'none'
            });
            $(document.body).prepend(cover);
            return cover;
        }

        function _extendOptions(options) {
            options = $.isPlainObject(options) ? options : {};

            options.filter = $.isPlainObject(options.filter) ? {
                width: $.isNumeric(options.filter.width) ? options.filter.width : 320,
                height: $.isNumeric(options.filter.height) ? options.filter.height : 480
            } : {
                width: 320,
                height: 480
            };

            options.backgroundColor = options.backgroundColor || 'rgba(19, 19, 19, 0.72)';

            return options;
        }

        function _render(width, height, img, board) {
            var ratio = width / height;

            if (width > $(board).width() || height > $(board).height()) {
                if (ratio >= $(window).innerWidth() / $(window).innerHeight()) {
                    $(img).css({
                        width: '80%',
                        height: 'auto'
                    });
                } else {
                    $(img).css({
                        height: '90%',
                        width: 'auto'
                    });
                }
            } else {
                $(img).css({
                    width: width > $(window).innerWidth() * 2 / 3 ? width / 1.5 : width,
                    height: 'auto'
                });
            }

            $(img).css({
                display: 'block',
                position: 'absolute',
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                margin: 'auto',
                overflow: 'hidden'
            });
            $(board).prepend($(img)).css({
                display: 'block'
            }).click(function (e) {
                if (e.target === board) {
                    _esc(img, board);
                }
            });
        }

        function _display(img, board) {
            var image = new Image();
            image.src = img.src;

            if (img.naturalWidth) {
                _render(img.naturalWidth, img.naturalHeight, image, board);
            } else {
                image.onload = _render(image.width, image.height, image, board);
            }
        }

        function _esc(img, board) {
            $(img).remove();
            $(board).css({
                display: 'none'
            });
        }

        var LightBox = function LightBox(target, options) {
            if (this instanceof LightBox) {
                this.cover = options.cover;
                this.target = $(target);
                this.imgList = $(target).find('img').filter(function (index) {
                    return $(this).width() > 100;
                }).toArray();
                this.srcList = function () {
                    var srcList = [];
                    $(target).find('img').each(function (index, ele) {
                        $(ele).css({
                            cursor: 'pointer'
                        });
                        srcList.push($(ele).attr('src'));
                    });
                    return srcList;
                }();
            } else {
                LigbtBox.init(target, options);
            }
        };

        LightBox.init = function (target, options) {
            options = _extendOptions(options);
            options.cover = _createCover(options);
            var lightBox = new LightBox(target, options);

            $(window).click(function (e) {
                if (lightBox.imgList.indexOf(e.target) > -1) {
                    _display(e.target, options.cover);
                }
            });

            return lightBox;
        };

        return LightBox;
    }();

    $('.js_navTagBtn, .js_navCategoryBtn').on('click', function (e) {
        var navDropmenuBox = $('.js_navDropmenuBox');
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
                bottom: -navDropmenuBox.children().first().height(),
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
            bottom: -navDropmenuBox.children().last().height(),
            opacity: 1
        });

        navDropmenuBox.data('statu', 'cats');
    });

    $(document).ready(function () {
        if ($('.artCnt_cntBox_post_body').length > 0) {
            $('.artCnt_cntBox_post_body img').each(function (index, el) {
                if ($(el).width() > 100) {
                    $(el).css({
                        display: 'block',
                        margin: '0 auto'
                    });
                }

                if ($(el).width() > $('.artCnt_cntBox_post_body').width() * 2 / 3) {
                    $(el).css({
                        width: 520,
                        'max-width': '100%'
                    });
                }
            });
            lightBox.init('.artCnt_cntBox_post_body');
        }
    });

}());
