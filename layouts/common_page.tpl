<!DOCTYPE html>
{% include "template-variables" %}
<html class="{{ view_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="common-page {{ language_flags_mode }}">
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}
        {% comment %}{% include "site-sidebar" %}{% endcomment %}

        <main class="page-content" role="main">
          <section class="content-area">
            <header class="content-header">{% contentblock name="content_header" %}<h1>{{ page.title }}</h1>{% endcontentblock %}</header>
            <div class="content-body">{% content %}</div>
          </section>
        </main>

        {% include "site-footer" %}
      </div>
    </div>

    {% include "template-tools" %}

    {% include "template-javascripts" %}

    {% comment %}Follow the instructions in "components/site-header.tpl" to enable language menu popover with flags.{% endcomment %}
    {% comment %}{% include "menu-language-popover" %}{% endcomment %}

    <script>site.initCommonPage();</script>
  </body>
</html>
