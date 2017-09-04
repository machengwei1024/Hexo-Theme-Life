{% if page.current && page.total %}
    <nav id="pagination" class="blog-pagination">
            {{ 
                paginator({
                    prev_text: "<i class='fa fa-angle-left'></i>",
                    next_text: "<i class='fa fa-angle-right'></i>", 
                    mid_size: 1
                }) 
            }}
    </nav>
{% endif %}