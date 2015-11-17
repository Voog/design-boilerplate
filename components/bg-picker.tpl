{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    {% if blog_article_page %}
      var pageType = 'articlePage';
    {% else %}
      var pageType = 'contentPage',
          pageData = new Edicy.CustomData({
            type: 'page',
            id: '{{ page.id }}'
          });
    {% endif %}

    $('.js-bg-picker-area').each(function(index, bgPickerArea) {
      var bgPickerButton = $(bgPickerArea).find('.js-background-settings'),
          dataBgKey = $(bgPickerButton).data('bg-key'),
          pictureBoolean = $(bgPickerButton).data('bg-picture-boolean');

      var bgPicker = new Edicy.BgPicker(bgPickerButton, {
            picture: pictureBoolean,
            target_width: 600,
            color: true,
            showAlpha: true,

        preview: function(data) {
          site.bgPickerPreview($(bgPickerArea), data, bgPicker);
        },

        commit: function(data) {
          site.bgPickerCommit(dataBgKey, data, bgPicker, pageType);
        }
      });
    });
  </script>
{% endeditorjsblock %}
