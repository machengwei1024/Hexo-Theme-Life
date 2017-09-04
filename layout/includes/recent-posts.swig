
{% if site.posts.length > 0 %}
{% for postItem in page.posts %}

<article class="blog-post-block">
    {% if postItem.photos and postItem.photos.length > 0%}
        <header>
            <div class="blog-post-block-img">
                <img src="{{ postItem.photos }}" alt="">
            </div>
        </header>
    {% endif %}

    <div class="blog-post-block-padding">
        <a href="{{ config.root }}{{ postItem.path }}">{{ postItem.title }}</a>
        <section>
            {% if postItem.excerpt.length > 0 %}
                {{ postItem.excerpt }}
            {% else %}
                {% set content = postItem.content | striptags %}
                {{ content.substring(0, theme.index_post.length) }}
                {% if content.length > theme.auto_excerpt.length %}...{% endif %}
            {% endif %}
        </section>
        <footer>
        {% if postItem.date %}
            <time datetime="{{ postItem.date.toJSON() }}"><i class="fa fa-clock-o"></i>{{ date(postItem.date) }}</time>
        {% endif %}
        {# 文章阅读次数 #}
        {% if theme.LeanStatistics_enable==true %}
        <span>
            <i class="fa fa-eye"></i>
            <span id="{{ url_for(postItem.path) }}" class="views"  title="{{ postItem.title }}"></span>
        </span>
        {% endif %}
        {# 文章阅读次数 #}
        {% if postItem.categories and postItem.categories.length %}
          <span><i class="fa fa-folder-o"></i>
            {% for cat in postItem.categories %}
              <a href="{{ url_for(cat.path) }}" itemprop="url" rel="index">
                {{ cat.name }}
              </a>
            {% endfor %}
          </span>
        {% endif %}
        </footer>
    </div>
</article>
{% endfor %}
{% endif %}
