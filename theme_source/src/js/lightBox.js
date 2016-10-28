let lightBox = (function() {
    function _createCover(options) {
            let cover = document.createElement('div');
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
        let ratio = width/height;

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
                width: (width > $(window).innerWidth()*2/3) ? width/1.5 : width,
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
        }).click(function(e) {
            if (e.target === board) {
                _esc(img, board);
            }
        });
    }

    function _display(img, board) {
        let image = new Image();
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

    let LightBox = function(target, options) {
        if (this instanceof LightBox) {
            this.cover = options.cover;
            this.target = $(target);
            this.imgList = $(target).find('img').filter(function(index) {
                return $(this).width() > 100;
            }).toArray();
            this.srcList = (function() {
                let srcList = [];
                $(target).find('img').each(function(index, ele) {
                    $(ele).css({
                        cursor: 'pointer'
                    });
                    srcList.push($(ele).attr('src'));
                });
                return srcList;
            })();
        } else {
            LigbtBox.init(target, options);
        }
    }

    LightBox.init = function(target, options) {
        options = _extendOptions(options);
        options.cover = _createCover(options);
        let lightBox =  new LightBox(target, options);

        $(window).click(function(e) {
            if (lightBox.imgList.indexOf(e.target) > -1) {
                _display(e.target, options.cover);
            }
        })

        return lightBox;
    }

    return LightBox;
})();

export default lightBox;
