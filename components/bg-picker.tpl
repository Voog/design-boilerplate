{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    // BODY BACKGROUND IMAGE AND COLOR DATA PREVIEW AND SAVE LOGIC
    {% if bg-picker == "article" %}
      // Article pages custom data variable.
      var articleData = new Edicy.CustomData({
        type: 'article',
        id: '{{ article.id }}'
      });
    {% else %}
      // Article pages custom data variable.
      var pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
      });
    {% endif %}

    // BODY BACKGROUND IMAGE AND COLOR PREVIEW LOGIC FUNCTION.
    var bodyBgPreview = function(data, body) {
      // Returns the suitable version of the image depending on the viewport width.
      var getImageByWidth = function(sizes, targetWidth) {
        var prevImage;

        for (var i = 0, max = sizes.length; i < max; i++) {
          if (sizes[i].width < targetWidth) {
            return prevImage || sizes[i];
          }
          prevImage = sizes[i];
        }
        // Makes sure that smallest is returned if all images bigger than targetWidth.
        return sizes[sizes.length - 1];
      };

      // Defines the variables used in preview logic.
      var suitableImage = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : 'none',
          bodyBgImage = (data.image && data.image !== '') ? 'url(' + suitableImage.url + ')' : 'none',
          bodyBgColor = (data.color && data.color !== '') ? data.color : 'rgba(255,255,255,0)';

      // Updates the body background image and background color.
      $(body).find('.js-body-background-image').css({'background-image' : bodyBgImage});
      $(body).find('.js-body-background-color').css({'background-color' : bodyBgColor});
    };

    // BODY BACKGROUND IMAGE AND COLOR SAVE LOGIC FUNCTION.
    var bodyBgCommit = function(data, dataName) {
      var commitData = $.extend(true, {}, data);
      commitData.image = data.image || '';
      commitData.imageSizes = data.imageSizes || '';
      commitData.color = data.color || 'transparent';

      // Saves the background data to custom data.
      {% if bg-picker == "article" %}
        // Saves background image and color data for article pages.
        Edicy.articles.currentArticle.setData(dataName, commitData);
      {% else %}
        // Saves background image and color data for common pages.
        pageData.set(dataName, commitData);
      {% endif %}
    }

    // Front page left content area background picker.
    var bodyBg = new Edicy.BgPicker($('.js-body-background-settings'), {
        picture: true,
        target_width: 600,
        color: true,
        showAlpha: true,

      preview: function(data) {
        bodyBgPreview(data, 'body');
      },

      commit: function(data) {
        bodyBgCommit(data, 'body_bg');
      }
    });
  </script>
{% endeditorjsblock %}
