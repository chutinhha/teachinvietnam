(function ($) {
    
})(jQuery); (function ($) {
    $.widget("ui.scrollHero", { options: { blocksUrl: "", blocksPerRotation: 4, startBlock: 0, height: 205 }, _create: function (options) {
        var self = this; this.element.find(".hero-button").height(this.options.height); this.element.find(".left-hero-button").bind("click.scrollHero", function (event) { self.previousRotation(); event.stopPropagation(); }); this.element.find(".right-hero-button").bind("click.scrollHero", function (event) { self.nextRotation(); event.stopPropagation(); }); allItems = this.element.find(".hero-content .item"); this.blocks = allItems.clone().toArray(); for (x = this.options.blocksPerRotation; x < allItems.length; x++)
        { $(allItems[x]).remove(); }
        this.scrolling = true; this.loadAdditionalBlocks();
    }, loadAdditionalBlocks: function () {
        if (this.options.blocksUrl == "")
        { this.scrolling = false; return; }
        var self = this; $.ajax({ url: this.options.blocksUrl, data: this.options.filters, dataType: "json", success: function (data, status) {
            if ($.isArray(data)) {
                $.each(data, function (index, item) { self.blocks.push(item.html); })
                self.scrolling = false;
            } 
        } 
        });
    } 
    });
})(jQuery); jQuery.cookie = function (key, value, options) {
    if (arguments.length > 1 && String(value) !== "[object Object]") {
        options = jQuery.extend({}, options); if (value === null || value === undefined) { options.expires = -1; }
        if (typeof options.expires === 'number') { var days = options.expires, t = options.expires = new Date(); t.setDate(t.getDate() + days); }
        value = String(value); return (document.cookie = [encodeURIComponent(key), '=', options.raw ? value : encodeURIComponent(value), options.expires ? '; expires=' + options.expires.toUTCString() : '', options.path ? '; path=' + options.path : '', options.domain ? '; domain=' + options.domain : '', options.secure ? '; secure' : ''].join(''));
    }
    options = value || {}; var result, decode = options.raw ? function (s) { return s; } : decodeURIComponent; return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
};  (function ($) {
    $.widget("ui.dotSlider", { options: { sliderInterval: 6000 }, _create: function () {
        var self = this; var sliderPos = 0; var sliderPositions = new Array(); var sliderIntervalId; var totalWidth = 0; this.element.find(".slides .slide").each(function (i)
        { sliderPositions[i] = totalWidth; totalWidth += 1020; }); this.element.find(".slides").width(totalWidth); this.element.find(".dots-nav ul li a").bind("click.dotSlider", function (event)
        { self.element.find(".dots-nav li").addClass('current '); $(this).parent().siblings().removeClass("current"); sliderPos = $(this).parent().prevAll(".dots-nav li").length; self.element.find(".slides").stop().animate({ left: -sliderPositions[sliderPos] + 'px' }, 850); event.preventDefault(); event.stopImmediatePropagation(); }); this.element.find(".dots-nav ul li:first").addClass("current").siblings(); this.element.find(".slide-wrapper").parents("div:first").bind("mouseover.dotSlider", function ()
        { clearInterval(sliderIntervalId) }); this.element.find(".slide-wrapper").parents("div:first").bind("mouseout.dotSlider", function ()
        { }); this._setDragable(sliderPositions);
    }
    });
})(jQuery); 
(function ($) {
    $.fn.simpleTabs = function (options) {
        var defaults = { initialTab: '', onTabSelected: function () { }, setInputFocus: false, appendTabToLocation: false }
        if (location.hash != '')
        { defaults.initialTab = location.hash.replace("#", "").replace("-tab", ""); }
        var options = $.extend(defaults, options); return this.each(function () {
            var tabUl = $(this); var tabPanels; var SelectByIndex = function (index)
            { var lis = tabUl.find('li'); SelectByLi($(lis[index])); }
            var SelectByName = function (name) {
                var lis = tabUl.find('li:has(a[href*="#' + name + '"])'); if (lis.length == 1)
                { SelectByLi($(lis[0])); }
                else
                { SelectByIndex(0); } 
            }
            var SelectByLi = function (li) {
                var panel = li.find('a')[0].hash.replace("#", ""); $('#' + panel).parent().find('.simple-tab-panel').hide(); $('#' + panel).show(); tabUl.find('li').removeClass('selected'); tabUl.find('li:has(a[href="#' + panel + '"])').addClass('selected'); if (options.appendTabToLocation)
                { location.hash = "#" + panel + "-tab"; }
                options.onTabSelected(panel); if (options.setInputFocus)
                { $(document.getElementById(panel)).find('input, select, textarea').first().focus(); } 
            }
            tabUl.find('li a').each(function () {
                var panel = $(this)[0].hash.replace('#', ''); $(this).parent().addClass('simple-tab'); $('#' + panel).addClass('simple-tab-panel'); tabPanels = $('#' + panel).parent(); $(this).parent().click(function (event)
                { event.stopPropagation(); SelectByLi($(this)); return false; });
            }); tabUl.addClass('simple-tabs'); if (options.initialTab != '')
            { SelectByName(options.initialTab); }
            else
            { SelectByIndex(0); } 
        });
    } 
})(jQuery); function ResetFavicon() {
    jQuery('link[rel=icon],link[rel=shortcut\\\ icon]').each(function ()
    { var el = jQuery(this); el.remove(); jQuery('<link rel="' + el.attr('rel') + '" type="' + el.attr('type') + '" href="' + el.attr('href') + '" />').appendTo('head'); });
}