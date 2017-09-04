{% extends 'includes/layout.swig' %}

{% block body %}
<header class="blog-post-page-title">
    <h4>{{ page.title }}</h4>
    <time datetime="{{ page.date.toJSON() }}"><i class="fa fa-clock-o"></i>{{ date(page.date) }}</time>
    {# 文章阅读次数 #}
    {% if theme.LeanStatistics_enable==true %}
    <span>
        <i class="fa fa-eye"></i>
        <span id="{{ url_for(page.path) }}" class="views views-post"  title="{{ page.title }}"></span>
    </span>
    {% endif %}
    {# 文章阅读次数 #}
    {# 文章分类 #}
	{% if page.categories and page.categories.length %}
        <span><i class="fa fa-folder-o"></i>
    		{% for categories in page.categories %}
    	       <a href="{{ url_for(categories.path) }}" rel="categories" data-toggle="tooltip" data-placement="top" title="Linux">{{ categories.name }}</a>
    		{% endfor %}
        </span>
	{% endif %}
    {# 文章分类 #}
</header>
<div class="blog-main-post blog-post-page-box">
    <article class="blog-post-block blog-post-page-content">
        <section>
            {% if theme.post_excerpt==true %}
                {{ page.content }}
            {% else %}
                {{ page.more }}
            {% endif %}
        </section>
        <footer class="blog-post-page-tags">
        {# 文章标签 #}
			{% if page.tags and page.tags.length %}
				{% for tag in page.tags %}
			<a href="{{ url_for(tag.path) }}" rel="tag" data-toggle="tooltip" data-placement="top" title="Linux">{{ tag.name }}</a>
				{% endfor %}
			{% endif %}
		{# 文章标签 #}
        </footer>
    </article>
    <article class="blog-post-page-readmore">
    	{# {% include 'includes/pagination.swig' %} #}
    	{# 上一篇 #}
		{% if page.prev_link %}
			<a href="{{ url_for(page.prev_link) }}" class="blog-post-page-readmore-prev" data-toggle="tooltip" data-placement="top" title="{{ page.prev.title }}">上一篇</a>
			{% elif page.prev && page.prev.path %}
			<a href="{{ url_for(page.prev.path) }}" class="blog-post-page-readmore-prev" data-toggle="tooltip" data-placement="top" title="{{ page.prev.title }}">上一篇</a>
		{% endif %}

		{# 下一篇 #}
		{% if page.next_link %}
			<a href="{{ url_for(page.next_link) }}" class="blog-post-page-readmore-next" data-toggle="tooltip" data-placement="top" title="{{ page.next.title }}">下一篇</a>
			{% elif page.next && page.next.path %}
			<a href="{{ url_for(page.next.path) }}" class="blog-post-page-readmore-next" data-toggle="tooltip" data-placement="top" title="{{ page.next.title }}">下一篇</a>
		{% endif %}

        <div style="clear: both;"></div>
    </article>

    <article class="blog-post-block blog-post-page-content">
            <div class="row">
            {% if theme.comment==true %}
                <div class="col-md-4 col-sm-4 post-page-more-btn">
                    <span class="post-comments-btn btn btn-info btn-block" data-toggle="tooltip" data-placement="top" title="本站采用Disqus评论组件，若您没有科学上网可能会无法查看并评论">加载评论</span>
                </div>
            {% endif %}
                <div class="col-md-4 col-sm-4 post-page-more-btn">
                    <span  data-toggle="modal" data-target="#post-donate-content">
                        <span id="post-donate-btn" class="btn btn-danger btn-block" data-toggle="tooltip" data-placement="top" title="如果您觉得本文还不错或者对您有帮助，可以考虑打赏一下作者哦">打赏本文</span>
                    </span>
                </div>
                <div class="col-md-4 col-sm-4 post-page-more-btn">
                    <span  data-toggle="modal" data-target="#post-qrcode-content">
                        <span><span id="post-qrcode-btn" class="btn btn-success btn-block" data-toggle="tooltip" data-placement="top" title="微信扫描二维码手机端查看本文及分享本文">二维码</span></span>
                    </span>
                </div>
            </div>
        <div class="post-more-function-br"></div>
{# 打赏模态框 #}
        <div class="modal fade" id="post-donate-content" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">打赏本文</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row post-donate-content">
                            <div class="col-md-4">
                                <p>支付宝</p>
                                <img class="post-donate-content-img no-lightbox" src="{{ theme.alipay }}"/>
                            </div>
                            <div class="col-md-4">
                                <p>微信</p>
                                <img class="post-donate-content-img no-lightbox" src="{{ theme.wechat }}"/>
                            </div>
                            <div class="col-md-4">
                                <p>财付通</p>
                                <img class="post-donate-content-img no-lightbox" src="{{ theme.qq }}"/>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
{# 文章二维码模态框 #}
        <div class="modal fade" id="post-qrcode-content" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">文章二维码</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row post-qrcode-content">
                            <span class="post-qrcode-content-canvas"></span>
                            <img class="post-qrcode-content-img no-lightbox" src=""/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
        {# 文章页二维码生成脚本 #}
        <script>
            // post QRcode
            // 中文转码
            function toUtf8(str) {
                var out, i, len, c;
                out = "";
                len = str.length;
                for (i = 0; i < len; i++) {
                    c = str.charCodeAt(i);
                    if ((c >= 0x0001) && (c <= 0x007F)) {
                        out += str.charAt(i);
                    } else if (c > 0x07FF) {
                        out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
                        out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
                        out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
                    } else {
                        out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
                        out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
                    }
                }
                return out;
            }
            // 生成
            var qrcode= $('.post-qrcode-content-canvas').qrcode({width: 150,height: 150,text: toUtf8("{{ page.permalink }}")}).hide();
            var canvas=qrcode.find('canvas').get(0);
            $('.post-qrcode-content-img').attr('src',canvas.toDataURL('image/jpg'));
        </script>

        {% if theme.disqus.enable==true %}
        {# disqus评论 #}
            <div id="disqus_thread"></div>
            <script data-no-instant>
                $(document).ready(function() {
                    $('.post-comments-btn').on('click', function(){
                        var disqus_shortname = '{{ theme.disqus.name }}';
                        $.ajax({
                            type: "GET",
                            url: "https://" + disqus_shortname + ".disqus.com/embed.js",
                            dataType: "script",
                            cache: true
                        });
                        $('.post-more-function-br').css('height','.6em');
                    });
                });
                var reset = function (newIdentifier, newUrl, newTitle, newLanguage) {
                    DISQUS.reset({
                        reload: true,
                        config: function () {
                            this.page.identifier = newIdentifier;
                            this.page.url = newUrl;
                            this.page.title = newTitle;
                            this.language = newLanguage;
                        }
                    });
                };
            </script>
            {% endif %}
    </article>
    {% if theme.valine_enable==true %}
      <article class="blog-post-block blog-post-page-content" style="margin-top:2.5em;">
      {#valine评论#}
      <div class="comment"></div>
      <script>
          new Valine({
              av: AV, // source from av-min.js
              el: '.comment' ,
              notify:false, // 邮件提醒 v1.1.4新增
              verify:false, // 验证码 v1.1.4新增
              app_id: '{{theme.leancloud.app_id}}',
              app_key: '{{theme.leancloud.app_key}}',
              placeholder: 'ヾﾉ≧∀≦)o来啊，快活啊!',
              path:window.location.pathname // 路径配置 v1.1.5新增，可填window.location.href
          });
      </script>
      </article>
      {% endif %}
</div>
{% endblock %}
