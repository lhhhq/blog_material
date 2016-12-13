{% macro render(post) %}
  <div class="dl_cntBox_artList_item">
    <div class="dl_cntBox_artList_item_title">
        <h3><a href="{{ url_for(post.path) }}" title="{{ post.title }}">{{ post.title }}</a></h3>
    </div>
    <div class="dl_cntBox_artList_item_meta">
        <span class="dl_cntBox_artList_item_meta_time">
            {{ date(post.date, config.date_format) }}
        </span>

        {% if post.categories and post.categories.length %}
            <span>&nbsp;|&nbsp;分类于 </span>
            {% for cat in post.categories %}
              <span class="dl_cntBox_artList_item_meta_category">
                <a href="{{ url_for(cat.path) }}" itemprop="url" rel="index">
                  {{ cat.name }}
                </a>
              </span>
              {% set cat_length = post.categories.length %}
              {% if cat_length > 1 and loop.index !== cat_length %}
                <span>,</span>
              {% endif %}
            {% endfor %}
        {% endif %}

{#         <span> | </span>
        <span class="dl_cntBox_artList_item_meta_commentsNum index_cntBox_artList_item_meta_commentsNum">0</span>
        <span>Comments</span> #}
    </div>
    <div class="dl_cntBox_artList_item_detail">
        {% if post.description %}
            {{ truncate( post.description, {length: 67}) }}
        {% else %}
          糟糕，主人忘记加简介了……
        {% endif %}
    </div>
    <div class="dl_cntBox_artList_item_readBtn">
        <a href="{{ url_for(post.path) }}" title="{{ post.title }}">
            阅读全文
        </a>
        <div class="dl_cntBox_artList_item_readBtn_hover"></div>
    </div>
  </div>
{% endmacro %}
