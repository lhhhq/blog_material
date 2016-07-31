{% extends '_layout.swig' %}

{% block title %}
  {% set page_title_suffix = ' | ' + config.title %}

  {% if page.type === "categories" %}
    {{ "分类" + page_title_suffix }}
  {% elif page.type === "tags" %}
    {{ "标签" + page_title_suffix }}
  {% else %}
    {{ page.title + page_title_suffix }}
  {% endif %}
{% endblock %}

{% block content %}

      {{ page.content }}

{% endblock %}
