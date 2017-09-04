{% extends 'includes/layout.swig' %}

{% block body %}
<header class="blog-post-page-title">
    <h4>{{ page.title }}</h4>
</header>
<div class="blog-main-post blog-post-page-box">
    <article class="blog-post-block blog-post-page-content">
        <section>
            {% autoescape false %}{{ page.content }}{% endautoescape %}
        </section>     
    </article>
</div>
{% endblock %}
