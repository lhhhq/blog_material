<!doctype html>
<html lang="zh-cmn-Hans">
<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
  <script src="{{ url_for(theme.scripts.lib) }}jquery/jquery.js"></script>
</head>

<body>
  <header>
    {%- include '_partials/header.swig' %}
    <div class="dl_dropmenu js_navDropmenuBox">
      {%- include '_partials/nav.swig' %}
    </div>
  </header>

  <div class="dl_cntBox">
      {% block content %}{% endblock %}
  </div>


  {%- include '_partials/footer.swig' %}
  <script src="{{ url_for(theme.scripts.main) }}"></script>
  {% if is_post() %}

  {% endif %}

</body>
</html>
