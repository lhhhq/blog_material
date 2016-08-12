<div class="dl_dropmenu_content dl_dropmenu_content_Tags">
  <div class="dl_dropmenu_content_tagsCloud">
        <div> 
        {{ tagcloud({min_font: 12, max_font: 30, amount: 200, color: true, start_color: '#ccc', end_color: '#111'}) }}
        </div>
  </div>
</div>
<div class="dl_dropmenu_content dl_dropmenu_content_Cats">
  <div class="dl_dropmenu_content_catsCloud">
        <div>
        {{ list_categories() }}
        </div>
  </div>
</div>
