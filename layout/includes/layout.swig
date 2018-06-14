
{% set pageTitle = page.title || config.subtitle || '' %}

{% if is_archive() %}
  {% set pageTitle = 'Archives' %}
{% endif %}

{% if is_tag() %}
  {% set pageTitle = 'Tag: ' + page.tag %}
{% endif %}

{% if is_category() %}
  {% set pageTitle = 'Category: ' + page.category %}
{% endif %}

{% if is_month() %}
  {% set pageTitle = pageTitle + ': ' + page.month + '/' + page.year %}
{% endif %}

{% if is_year() %}
  {% set pageTitle = pageTitle + ': ' + page.year %}
{% endif %}

{% set pageTitle = pageTitle + config.title %}

<!doctype html>
<html lang="{{ config.language }}">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
  <meta name="renderer" content="webkit">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no", user-scalable=no">
  <title>{{ pageTitle }}</title>
  <link rel="shortcut icon" href="{{ theme.favicon }}">
  {% if theme.stylesheets !== undefined && theme.stylesheets.length > 0 %}
    {# stylesheet list from config.yml #}
    {% for url in theme.stylesheets %}
      <link rel="stylesheet" href="{{ url }}">
    {% endfor %}
  {% endif %}

  {% if theme.sidebar == 'light' %}
    <link rel="stylesheet" href="{{ theme.siderbar_style }}">
  {% endif %}

  <!-- jQuery first, then Tether, then Bootstrap JS. -->
  {% if theme.scripts !== undefined && theme.scripts.length > 0 %}
  {# scripts list from config.yml #}
  {% for url in theme.scripts %}
    <script src="{{ url }}"></script>
  {% endfor %}
  {% endif %}
</head>
<body>
<script>AV.init({appId:'{{ theme.leancloud.app_id }}',appKey:'{{ theme.leancloud.app_key }}'});</script>
<script type="text/javascript">
      var config = {
            ClasS: 'Counter',
            el:'.views',
            elP: '.views-post'
      }
</script>
<div class="container">
    <div class="row blog-box-shadow">
        <!--博客主栏开始-->
        <div class="col-xl-9 col-lg-12 blog-main" id="pjax-box">
            <header class="blog-header">
                <a href="{{ config.url }}" class="blog-header-mobile-title">{{ config.title }}</a>
                <a href="javascript:;" class="blog-header-navbar-btn"><i class="fa fa-bars"></i></a>
                <nav class="blog-header-navbar blog-header-fixed">
                    <ul class="blog-navbar-links">
                        {% for key in Object.keys(theme.menu) %}
                          <li class="blog-nav-item"><a href="{{ theme.menu[key] }}" class="transition">{{ key }}</a></li>
                        {% endfor %}
                        <div class="blog-navbar-right">
                            <form action="">
                                <div class="input-group">
                                    <input type="text" class="blog-header-search" placeholder="search...">
                                    <buttn type="submit" class="blog-header-search-btn"><i class="fa fa-search"></i></buttn>
                                </div>
                            </form>
                        </div>
                    </ul>
                </nav>
            </header>
                {% block body %}{% endblock %}
                {# 这里是分页 #}
            <footer class="blog-footer">
                <p class="blog-footer-left">Copyright © {% set current = date(Date.now(), "YYYY") %} {{ current }} <a href="{{ config.url }}">{{ config.title }}</a></p>
                <p class="blog-footer-right">Powered by <a href="https://hexo.io" target="_blank">Hexo</a>,Theme <a href="https://note.isweic.com/themes-life/" target="_blank">Life</a></p>
            </footer>
        </div><!--博客主栏结束-->
        <!--博客侧边栏开始-->
        <div class="col-xl-3 blog-sidebar">
            <div class="blog-sidebar-title">
                <a href="">{{ config.title }}</a>
            </div>
            <div class="blog-sidebar-logo">
                <img src="{{ theme.logo }}">
            </div>
            <div class="blog-sidebar-count blog-sidebar-padding">
                <div class="blog-sidebar-count-left">
                    <p class="blog-sidebar-count-p">{{ site.posts.length }}</p>
                    <span class="blog-sidebar-count-span">文章</span>
                </div>
                <div class="blog-sidebar-count-right">
                    <p class="blog-sidebar-count-p">{{ site.tags.length }}</p>
                    <span class="blog-sidebar-count-span">标签</span>
                </div>
                <div style="clear: both;"></div>
            </div>
            <div class="blog-sidebar-icon blog-sidebar-padding">
                <ul>
                    <li><a href="{{ theme.github }}" class="icon-github" target="_blank" data-toggle="tooltip" data-placement="top" title="Github"><i class="fa fa-github"></i></a></li>
                    <li><a href="{{ theme.weibo }}" class="icon-weibo" target="_blank" data-toggle="tooltip" data-placement="top" title="新浪微博"><i class="fa fa-weibo"></i></a></li>
                    <li><a href="{{ theme.twitter }}" class="icon-twitter" target="_blank" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                    <!--<li><a href="{{ theme.facebook }}" class="icon-facebook" target="_blank" data-toggle="tooltip" data-placement="top" title="FaceBook"><i class="fa fa-facebook"></i></a></li>-->
                    <li><a href="mailto:{{ theme.email }}" class="icon-email" data-toggle="tooltip" data-placement="top" title="E-Mail"><i class="fa fa-envelope"></i></a></li>
                    <li><a href="{{ theme.rss }}" class="icon-rss" data-toggle="tooltip" target="_blank" data-placement="top" title="RSS"><i class="fa fa-rss"></i></a></li>
                </ul>
            </div>
            <div class="blog-sidebar-categories">
                <h4 class="blog-sidebar-h4"><i class="fa fa-folder-open"></i>&nbsp;文章分类</h4>
                <ul class="list-group blog-sidebar-padding">
                  {% if site.categories and site.categories.length %}
                    {% for categories in site.categories %}
                      <li class="list-group-item justify-content-between">
                          <a href="{{ url_for(categories.path) }}">{{ categories.name }}</a>
                          <span class="badge badge-default badge-pill">{{ categories.length }}</span>
                      </li>
                    {% endfor %}
                  {% endif %}
                </ul>
            </div>
            <div class="blog-sidebar-tags">
                <h4 class="blog-sidebar-h4"><i class="fa fa-tag"></i>&nbsp;标签云</h4>
                <ul class="blog-sidebar-tags-ul blog-sidebar-padding">
                  {% if site.tags and site.tags.length %}
                    {% for tags in site.tags %}
                      <li><a href="{{ url_for(tags.path) }}" class="tag-could" data-toggle="tooltip" data-placement="top" title="{{tags.name}}">{{ tags.name }}</a></li>
                    {% endfor %}
                  {% endif %}
                </ul>
            </div>
            <script>
              // 博客侧栏标签云随机色
              var tag_cloud = $('.tag-could');
              tag_cloud.each(function () {
                  var Cnum = 9;
                  var Crand = parseInt(Math.random() * Cnum);
                  $(this).addClass("tag-could" + Crand);
              })
            </script>
            <!--返回顶部按钮-->
            <div class="retop">
                <i class="fa fa-angle-up"></i>
            </div>
        </div><!--博客侧边栏结束-->
    </div>
</div>
<script src="{{ theme.LeanStatistics_script }}"></script>
<script src="{{ theme.life_script }}"></script>
<script type="text/javascript">
    hljs.initHighlightingOnLoad();
    hljs.initLineNumbersOnLoad();
    otherF();
    LeanStatistics();
    $(document).pjax('a', '#pjax-box', {fragment:'#pjax-box', timeout:8000}).on('pjax:complete', function() {
      $('pre code').each(function(i, block){
        hljs.highlightBlock(block);
      })
      $('code.hljs').each(function(i, block) {
        hljs.lineNumbersBlock(block);
      });
      LeanStatistics();
    }).on('pjax:start', function() { NProgress.start(); }).on('pjax:end',   function() {
      NProgress.done();
      otherF();
    });
</script>
</body>
</html>
