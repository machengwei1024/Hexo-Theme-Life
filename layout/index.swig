{% extends 'includes/layout.swig' %}

{% block body %}
<div class="blog-main-post">
	<div class="index-post-br"></div>
  {% include 'includes/recent-posts.swig' %}
  {% include 'includes/pagination.swig' %}
 </div>
{% endblock %}
