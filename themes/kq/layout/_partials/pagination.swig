{% if page.prev or page.next %}
  <nav class="dl_cntBox_pagination index_cntBox_pagination">
    {{
      paginator({
        prev_text: '<',
        next_text: '>',
        mid_size: 1
      })
    }}
  </nav>
{% endif %}
