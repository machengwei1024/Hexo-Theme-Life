{% extends 'includes/layout.swig' %}

{% block body %}
<header class="blog-post-page-title blog-search-page-title">
  <h4>标签<a href="">{{ page.tag }}</a>下的文章</h4>
</header>
<div class="blog-main-post blog-post-page-box">
  {% for article in page.posts.toArray() %}
    <article class="blog-post-block">
        {% if article.photos and article.photos.length > 0%}
        <header>
            <div class="blog-post-block-img">
                <img src="{{ article.photos }}" alt="">
            </div>
        </header>
        {% endif %}
        <div class="blog-post-block-padding">
          {% if article.link %}
            <a href="{{ url_for(article.link) }}">{{ article.title || 'No Title' }}</a>
          {% else %}
            <a href="{{ url_for(article.path) }}">{{ article.title || 'No Title' }}</a>
          {% endif %}
            <section>
              {% if article.excerpt.length > 0 %}
                {{ article.excerpt }}
              {% else %}
                {% set content = article.content | striptags %}
                {{ content.substring(0, theme.index_post.length) }}
                {% if content.length > theme.auto_excerpt.length %}...{% endif %}
              {% endif %}
            </section>
            <footer>
                <time datetime="{{ date_xml(article.date) }}><i class="fa fa-clock-o"></i>{{ date(article.date) }}</time>
                {# 文章阅读次数 #}
                {% if theme.LeanStatistics_enable==true %}
                <span>
                    <i class="fa fa-eye"></i>
                    <span id="{{ url_for(postItem.path) }}" class="views"  title="{{ postItem.title }}"></span>
                </span>
                {% endif %}
                {# 文章阅读次数 #}
                {% if article.categories and article.categories.length %}
                  <span><i class="fa fa-folder-o"></i>
                    {% for cat in article.categories %}
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
    {% include 'includes/pagination.swig' %}
</div>
{% endblock %}
