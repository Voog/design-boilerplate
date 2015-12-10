<!DOCTYPE html>
{% include "template-variables" %}
<html class="{{ view_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="blog-news-page blog-listing-page {{ language_flags_mode }}">
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}
        {% comment %}{% include "site-sidebar" %}{% endcomment %}

        <main class="page-content" role="main">
          {% if editmode %}
            <div class="cms-blog-article-add">{% addbutton %}</div>
          {% endif %}

          <section class="blog-articles">
            {% for article in articles %}
              <article class="blog-article">
                <header class="article-header">
                  <h1 class="article-title">
                    <a href="{{ article.url }}">{{ article.title }}</a>
                  </h1>
                  <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}</time>
                  <div class="article-author">{{ article.author.name }}</div>
                </header>

                <div class="article-content">
                  <div class="article-excerpt content-area">{{ article.excerpt }}</div>
                </div>

                <footer class="article-footer">
                  <a href="{{ article.url }}#article-comments">{{ "post_has_replies" | lcc: article.comments_count }}</a>
                </footer>
              </article>
            {% endfor %}
          </section>
        </main>

        {% include "site-footer" %}
      </div>

      {% include "template-tools" %}

      {% include "template-javascripts" %}

      {% comment %}Follow the instructions in "components/site-header.tpl" to enable language menu popover with flags.{% endcomment %}
      {% comment %}{% include "menu-language-popover" %}{% endcomment %}

      <script>site.initBlogPage();</script>
    </div>
  </body>
</html>
