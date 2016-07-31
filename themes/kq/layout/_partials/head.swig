<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>

{# Disable Baidu tranformation #}
<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link href="{{ url_for(theme.css) }}/main.css?v={{ theme.version }}" rel="stylesheet" type="text/css" />

{% if page.keywords %}
  <meta name="keywords" content="{{ page.keywords }}" />
{% elif page.tags and page.tags.length %}
  <meta name="keywords" content="{% for tag in page.tags %}{{ tag.name }},{% endfor %}" />
{% elif theme.keywords %}
  <meta name="keywords" content="{{ theme.keywords }}" />
{% endif %}


{% if theme.favicon %}
  <link rel="shortcut icon" type="image/x-icon" href="{{ url_for(theme.favicon) }}?v={{ theme.version }}" />
{% endif %}

{# Export some HEXO Configurations to Front-End #}
{# <script type="text/javascript" id="hexo.configuration">
  var NexT = window.NexT || {};
  var CONFIG = {
    scheme: '{{ theme.scheme }}',
    sidebar: {{ theme.sidebar | json_encode }},
    fancybox: {{ theme.fancybox }},
    motion: {{ theme.use_motion }},
    duoshuo: {
      userId: {{ theme.duoshuo_info.user_id | default() }},
      author: '{{ theme.duoshuo_info.admin_nickname | default(__('author'))}}'
    }
  };
</script> #}
