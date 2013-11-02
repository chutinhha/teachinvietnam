(function ($) {
    $.fn.simpleTabs = function (options) {
        var defaults =
		{
		    initialTab: '',
		    onTabSelected: function () { },
		    setInputFocus: false,
		    appendTabToLocation: false
		}

        if (location.hash != '') {
            defaults.initialTab = location.hash.replace("#", "").replace("-tab", "");
        }

        var options = $.extend(defaults, options);

        return this.each(function () {
            var tabUl = $(this);
            var tabPanels;

            var SelectByIndex = function (index) {
                var lis = tabUl.find('li');

                SelectByLi($(lis[index]));
            }

            var SelectByName = function (name) {
                var lis = tabUl.find('li:has(a[href*="#' + name + '"])');

                if (lis.length == 1) {
                    SelectByLi($(lis[0]));
                }
                else {
                    SelectByIndex(0);
                }
            }

            var SelectByLi = function (li) {
                //removed by SM. Can make page move unnecessarily. It's removing the visible tab on down this function anyway.
                //tabPanels.find( '.simple-tab-panel' ).hide();

                var panel = li.find('a')[0].hash.replace("#", "");

                $('#' + panel).parent().find('.simple-tab-panel').hide();
                $('#' + panel).show();

                tabUl.find('li').removeClass('selected');
                tabUl.find('li:has(a[href="#' + panel + '"])').addClass('selected');

                //removed by AG (breaks back button behaviour unless onhashchange is properly handled)
                if (options.appendTabToLocation) {
                    location.hash = "#" + panel + "-tab";
                }
                //ResetFavicon();

                options.onTabSelected(panel);

                if (options.setInputFocus) {
                    $(document.getElementById(panel)).find('input, select, textarea').first().focus();
                }
            }

            tabUl.find('li a').each(function () {
                var panel = $(this)[0].hash.replace('#', '');

                $(this).parent().addClass('simple-tab');
                $('#' + panel).addClass('simple-tab-panel');
                tabPanels = $('#' + panel).parent();

                $(this).parent().click(function (event) {
                    event.stopPropagation();

                    SelectByLi($(this));
                    return false;
                });
            });

            tabUl.addClass('simple-tabs');

            if (options.initialTab != '') {
                SelectByName(options.initialTab);
            }
            else {
                SelectByIndex(0);
            }
        });
    }
})(jQuery);


function ResetFavicon() {
    jQuery('link[rel=icon],link[rel=shortcut\\\ icon]').each(function () {
        var el = jQuery(this);
        el.remove();
        jQuery('<link rel="' + el.attr('rel') + '" type="' + el.attr('type') + '" href="' + el.attr('href') + '" />').appendTo('head');
    });
}