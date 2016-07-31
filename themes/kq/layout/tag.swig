{% extends '_layout.swig' %}
{% import '_macro/post_list.swig' as post_template %}

{% block title %} 标签 {{ page.tag }} | {{ config.title }} {% endblock %}

{% block content %}

        <div class="dl_cntBox_title">
            —— 标签 {{ page.tag }} ——
        </div>
        <div class="dl_cntBox_artList">

          {% for post in page.posts %}
            {{ post_template.render(post) }}
          {% endfor %}

        </div>
        {% include '_partials/pagination.swig' %}

{% endblock %}
