/**
 * Created by Weic on 2017/6/8.
 */
// Pjax用其他脚本封装函数
function otherF() {

// 文章页标签云随机色
var tag_cloud = $('.blog-post-page-tags>a');
tag_cloud.each(function () {
    var Cnum = 9;
    var Crand = parseInt(Math.random() * Cnum);
    $(this).addClass("tag-could" + Crand);
})


// 限制博客盒子的最低高度为浏览器可视区高度
$('.blog-main').css('min-height',$(window).height());


// 给文章页input添加class
$('.blog-post-page-content input').addClass('form-control');


// 返回顶部
function backTop() {
    var DomscrollTop = $(document).scrollTop();
    if (DomscrollTop > 450) {
        $(".retop").css("display", "block");
    } else {
        $(".retop").css("display", "none");
    }
    setTimeout(backTop)
}
backTop();
$(".retop").click(function() {
    $('html,body').animate({
            scrollTop: 0
        },
        400)
});


// 博客侧栏网站标题
function blogTitle() {
    var DomscrollTop = $(document).scrollTop();
    if (DomscrollTop > 10){
        $('.blog-sidebar-title').addClass('blog-sidebar-title-shadow');
    }else{
        $('.blog-sidebar-title').removeClass('blog-sidebar-title-shadow');
    }
    setTimeout(blogTitle);
}
blogTitle();


// 移动端导航
$(".blog-header-navbar-btn").click(function () {
    $(".blog-header-navbar").slideToggle("slow");
}) 

// 标签提示
$('.tag-could,.blog-post-page-readmore>a,.blog-post-page-tags>a,.blog-sidebar-icon>ul>li>a,.btn').tooltip();

// 图像查看器插件
$(".blog-post-page-content img:not('.no-lightbox')").each(function(){
    var imgSrc = $(this).attr('src');
    $(this).wrap("<a class='img-a img-group' data-fancybox='group' href='javascript:;'></a>");
    $(this).parent().attr('href',imgSrc);
})

//给文章页a标签添加target='_blank'属性
$(".blog-post-page-content a:not('.img-a')").attr('target','_blank');

// 链接页面类名
$('.links-block>a').addClass('links-block-btn btn btn-outline-info btn-block').wrap('<div class="col-md-3 links-block-div"></div>');
$('.links-block').addClass('row');

}
