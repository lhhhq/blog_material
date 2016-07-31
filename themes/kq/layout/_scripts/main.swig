<script>
    var DOMUtil = {
        trim: function(str, leftTrimBoolean, rightTrimBoolean) {
            if (str.trim && str.trimLeft && str.trimLRight) {
                switch (true) {
                    case leftTrimBoolean:
                        str = str.trimLeft();
                    case rightTrimBoolean:
                        str = str.trimRight();
                }
            } else {
                switch (true) {
                    case leftTrimBoolean:
                        str = str.replace(/(^\s*)/g,"");
                    case rightTrimBoolean:
                        str = str.replace(/(\s*$)/g,"");
                        break;
                }
            }
            return str;
        },
    
        getElement: function(ele, selector) {
            var isId = (this.trim(selector, true, true).indexOf('#') === 0),
                isClass = (this.trim(selector, true, true).indexOf('.') === 0);
    
            switch (true) {
                case isId:
                    return ele.querySelector ? ele.querySelector(selector) : ele.getElementById(selector);
                case isClass:
                    return ele.querySelectorAll ? ele.querySelectorAll(selector) : ele.getElementsByClassName(selector);
                default:
                    return ele.querySelectorAll ? ele.querySelectorAll(selector) : ele.getElementsByTagName(selector);
            }
        },
    
        getFirstElementChild: function(element){
            for (var nodes = element.chileNodes, node, i = 0, len = nodes.length; i < l; ++i) {
                if (node = nodes[i], 1 === node.nodeType) {
                    return node;
                }
            }
            return null;
        },
    
        getLastElementChild: function(){
            for(var nodes = this.chileNodes, node, i = nodes.length - 1; i >= 0; --i) {
                if(node = nodes[i], 1 === node.nodeType) {
                    return node;
                }
            }
            return null;
        },
    
        getNextElementSibling: function(element) {
            if (document.body.nextElementSibling) {
                return element.nextElementSibling;
            } else {
                do { element = element.nextSibling } while ( element && element.nodeType !== 1 );
                return element;
            }
        },
    
        getPrevElementSibling: function(element) {
            if (document.body.previousElementSibling) {
                return element.previousElementSibling;
            } else {
                do { element = element.previousSibling } while ( element && element.nodeType !== 1 );
                return element;
            }
        },
    
        traverseElement: function(element, process) {
            var i,
                len,
                child;
    
            if (!!element.firstElementChild) {
                child = element.firstElementChild;
    
                while (child != element.lastElementChild) {
                    process(child);
                    child = child.nextElementSibling;
                }
    
                process(child);
            } else {
                child = element.firstChild;
                while (child != element.lastChild) {
                    if (child.nodeType == 1) {
                        process(child);
                    }
                    child = child.nextSibling;
                }
            }
        },
    
        toggleClass: function(element, toToggleClass) {
            if (!!element.classList) {
                element.classList.toggle(toToggleClass);
            } else {
                var classNames = element.className.split(/\s+/);
                
                var pos = -1,
                    i,
                    len = classNames.length;
                
                for (i = 0; i < len; i++ ) {
                    if (classNames[i] == toToggleClass) {
                        pos = i;
                        break;
                    }
                }
                
                if (pos == -1) {
                    classNames.push(toToggleClass);
                } else {
                    classNames.splice(i, 1);
                }
                
                element.className = classNames.join(' ');
            }
        },
    
        getStyle: function(element, prop) {
            if (arguments[1]) {
                if (document.defaultView && document.defaultView.getComputedStyle) {
                    return document.defaultView.getComputedStyle(element, null)[prop];
                } else if (element.currentStyle) {
                    return element.currentStyle[prop];
                } else {
                    return element.style[prop];
                }
            } else {
                if (document.defaultView && document.defaultView.getComputedStyle) {
                    return document.defaultView.getComputedStyle(element, null);
                } else if (element.currentStyle) {
                    return element.currentStyle;
                } else {
                    return element.style;
                }
            }
        }
    };

    var eventUtil = {
        addEventHandler: function(element, type, handler) {
            if (element.addEventListener) {
                element.addEventListener(type, handler, false);
            } else if (element.attachEvent) {
                element.attachEvent('on' + type, handler);
            } else {
                element['on' + type] = handler;
            }
        },
    
        getEvent: function(event) {
            return event ? event : window.event;
        },
        
        // For mouseover, mouseout events
        getRelatedTarget: function(event) {
            if (event.relatedTarget) {
                return event.relatedTarget;
            } else if (event.toElement) {
                return event.toElement;
            } else if (event.fromElement) {
                return event.fromElement;
            } else {
                return null;
            }
        },
    
        // For mousedown, mouseup events
        getButton: function(event) {
            if (document.implementation.hasFeature('MouseEvents', '2.0')) {
                return event.button;
            } else {
                switch (event.button) {
                    case 0:
                    case 1:
                    case 3:
                    case 5:
                    case 7:
                        return 0;
                    case 2:
                    case 6:
                        return 2;
                    case 4:
                        return 1;
                }
            }
        },
        
        // For mouseWheel event
        getWheelDelta: function(event) {
            if (event.wheelDelta) {
                return event.wheelDelta;
            } else {
                return -event.detail * 40;
            }
        },
    
        // For keyboard event
        getCharCode: function(event) {
            if (typeof event.charCode) {
                return event.charCode;
            } else {
                return event.keycode;
            }
        },
    
        getTarget: function(event) {
            return event.target || event.srcElement;
        },
    
        preventDefault: function(event) {
            if (event.preventDefault) {
                event.preventDefault();
            } else {
                event.returnValue = false;
            }
        },
    
        stopPropagation: function(event) {
            if (event.stopPropagation) {
                event.stopPropagation();
            } else {
                event.cancelBubble = true;
            }
        },
        
        removeEventHandler: function(element, type, handler) {
            if (element.removeEventListener) {
                element.removeEventListener(type, handler, false);
            } else if (element.detachEvent) {
                element.detachEvent('on' + type, handler);
            } else {
                element['on' + type] = null;
            }
        },
        
        // For copy, cut and paste event
        getClipboardText: function(event) {
            var clipboardData = (event.clipboardData || window.clipboardData);
            return clipboardData.getData('text');
        },
    
        setClipboardDataText: function(event, value) {
            if (event.clipboardData) {
                return event.clipboardData.setData('text/plain', value);
            } else if(window.clipboardData) {
                return window.clipboardData.setData('text', value);
            }
        }
    };

!(function (window) {
    var DOMSet = {
        tagsBtn: DOMUtil.getElement(document, '.js_navTagBtn')[0],
        catsBtn: DOMUtil.getElement(document, '.js_navCategoryBtn')[0],
        navBox: DOMUtil.getElement(document, '.js_navDropmenuBox')[0]
    }

    var originClass = DOMUtil.getElement(document, '.js_navDropmenuBox')[0].className;

    var otherCofig = {
        tagsSwitch: 0,
        catsSwitch: 0
    };

    var showAndHiddenDropMenu = {
        showAndHiddenTags: function() {
            if (otherCofig.tagsSwitch === 0) {
                DOMSet.navBox.className = originClass + ' showTags';
                otherCofig.tagsSwitch = 1;
                otherCofig.catsSwitch = 0;
            } else if (otherCofig.tagsSwitch === 1) {
                DOMSet.navBox.className = originClass;
                otherCofig.tagsSwitch = 0;
            }
        },
        showAndHiddenCats: function() {
            if (otherCofig.catsSwitch === 0) {
                DOMSet.navBox.className = originClass + ' showCats';
                otherCofig.catsSwitch = 1;
                otherCofig.tagsSwitch = 0;
            } else if (otherCofig.catsSwitch === 1) {
                DOMSet.navBox.className = originClass;
                otherCofig.catsSwitch = 0;
            }
        }
    }

    eventUtil.addEventHandler(DOMSet.tagsBtn, 'click', showAndHiddenDropMenu.showAndHiddenTags);

    eventUtil.addEventHandler(DOMSet.catsBtn, 'click', showAndHiddenDropMenu.showAndHiddenCats);


})(window);


</script>