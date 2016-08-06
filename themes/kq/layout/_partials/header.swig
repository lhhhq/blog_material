    <div class="dl_header" style="background-image: url({{ theme.banner }})">
        <div class="dl_header_blogInfo">
            <div class="dl_header_blogInfo_avatar">
                <a href="/"><img src="{{ theme.avatar }}" alt="海荞的头像"></a>
            </div>
            <div class="dl_header_blogInfo_title">
                <a href="/"><h2>{{ config.title }}</h2></a>
            </div>
            <div class="dl_header_blogInfo_subTitle">
                <h3>{{ config.description }}</h3>
            </div>
            <ul class="dl_header_blogInfo_counter">
                {# TODO #}
                <li class="dl_header_blogInfo_counter_article">
                    <span>{{ site.posts.length }}</span><br>
                    <span>文章</span>
                </li>
                <li class="dl_header_blogInfo_counter_category js_navCategoryBtn">
                    <span>{{ site.categories.length }}</span><br>
                    <span>分类</span>
                </li>
                <li class="dl_header_blogInfo_counter_tag js_navTagBtn">
                    <span>{{ site.tags.length }}</span><br>
                    <span>标签</span>
                </li>
            </ul>
        </div>
    </div>
