/**
 * 首页文化banner滚动的js
 *
 * 图片轮播--文字也要轮播
 *
 */

$(function () {
    var words = ['我是图1', '我是图2', '我是图3', '我是图4', '我是图5'];
    $('#hpage_slider').after('<div id="fsn"><ul id="fs_pagination">').cycle({
        timeout: 5000, // milliseconds between slide transitions (0 to disable auto advance)
        fx: 'fade', // choose a transition type, ex: fade, scrollUp, shuffle, etc...
        pager: '#fs_pagination', // selector for element to use as pager container
        pause: 1, // true to enable "pause on hover"
        after: function (currSlideElement, nextSlideElement, options, forwardFlag) {
            // banner滑动事件index
            alert('s' + words[options.currSlide]);
            // 根据id的显示数据
            $('#output').text("dd");
        },
        pauseOnPagerHover: 0 // true to pause when hovering over pager link
    });
});
