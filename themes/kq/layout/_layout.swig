<!doctype html>
<html lang="zh-cmn-Hans">
<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
</head>

<body>
  <header>
    {%- include '_partials/header.swig' %}
  </header>

  <div class="dl_dropmenu js_navDropmenuBox">
      {%- include '_partials/nav.swig' %}
  </div>

  <div class="dl_cntBox">
      {% block content %}{% endblock %}
  </div>


  {%- include '_partials/footer.swig' %}
  {%- include '_scripts/main.swig' %}
</body>
</html>
