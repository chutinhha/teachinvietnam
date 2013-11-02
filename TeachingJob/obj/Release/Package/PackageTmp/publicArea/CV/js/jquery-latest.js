$(document).ready(function () {
    var text = $('#content').html();
    var extract = text.substring(0, 300) + "...";
    $('#content').html(extract);
    $('#button').html('<a href="#" class="more">Show More</a>');
    more(text);
});

this.more = function (text) {
    $('.more').click(function () {
        $('#content').html(text);
        $('#content').append('<div class="position"></div>');
        position();
        $('#button').html('<a href="#" class="less">Show Less</a>');
        return false;
    });
}

this.position = function () {
    var p = $(".position");
    var position = p.position();
    var pos_top = position.top;
    $('#content').animate({ height: pos_top + 'px' }, function () {
        less();
    });
}

this.less = function () {
    $('.less').click(function () {
        $('#content').animate({ height: '100px' }, function () {
            var text = $('#content').html();
            var extract = text.substring(0, 300) + "...";
            $('#content').html(extract);
            $('#button').html('<a href="#" class="more">Show More</a>');
            more(text);
        });
        return false;
    });
}