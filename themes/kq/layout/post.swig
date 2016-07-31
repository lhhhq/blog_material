{% extends '_layout.swig' %}

{% block title %} {{ page.title }} | {{ config.title }} {% endblock %}


{% block content %}
  <article class="artCnt_cntBox_post">
    <header class="artCnt_cntBox_post_header">
      <h3 class="artCnt_cntBox_post_header_title">
        <a href="{{ page.link }}">{{ page.title }}</a>
      </h3>
      <div class="artCnt_cntBox_post_header_meta">
        <span class="artCnt_cntBox_post_header_meta_time">
            <span>发表于</span>
            <span>{{ date(page.date, config.date_format) }}</span>
        </span>
        <span class="artCnt_cntBox_post_header_meta_time">
              {% if page.categories and page.categories.length %}
                <span> | </span>
                <span>分类于 </span>
                  {% for cat in page.categories %}
                    <span">
                      <a href="{{ url_for(cat.path) }}">
                        {{ cat.name }}
                      </a>
                    </span>
                    {% set cat_length = page.categories.length %}
                    {% if cat_length > 1 and loop.index !== cat_length %}
                      ,
                    {% endif %}
                  {% endfor %}
              {% endif %}
                    {% if page.tags and page.tags.length and not is_index %}
                    <span> | </span>
                    <span>标签 </span>
                    <sapn>
                      {% for tag in page.tags %}
                        <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
                      {% endfor %}
                    </span>
                  {% endif %}
                </div>
            </header>
            <div class="artCnt_cntBox_post_body">
                {{ page.content }}
            </div>
        </article>
        <footer class="artCnt_cntBox_post_footer">

            <div class="artCnt_cntBox_post_footer_nav floatfix">
                <div class="artCnt_cntBox_post_footer_nav_item artCnt_cntBox_post_footer_nav_pre">
                  {% if page.prev %}
                  <a href="{{ url_for(page.prev.path) }}">
                    <span>&lt;</span> {{ page.prev.title }}
                  </a>
                  {% endif %}
                </div>

                <div class="artCnt_cntBox_post_footer_nav_item artCnt_cntBox_post_footer_nav_next">
                    {% if page.next %}
                    <a href="{{ url_for(page.next.path) }}">
                    {{ page.next.title }} <span>&gt;</span>
                    </a>
                    {% endif %}
                </div>
            </div>
        </footer>

{% endblock %}