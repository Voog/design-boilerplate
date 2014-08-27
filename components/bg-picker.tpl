{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    // Body background image and color data preview and save logic
    {% if bg-picker == "article" %}
      var articleData = new Edicy.CustomData({
        type: 'article',
        id: '{{ article.id }}'
      });
    {% else %}
      var pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
      });
    {% endif %}

    var bgPickerBody = new Edicy.BgPicker($('.js-bgpicker-body-settings'), {
      picture: true,
      color: true,

      preview: function(data) {
        console.log('{{ page.data.header_image }}');
        var img = (data.image && data.image !== '') ? 'url("' + data.image + '")' : 'none',
            col = (data.color && data.color !== '') ? data.color : 'none';

        $('.js-bgpicker-body-color').css({'background' : col});

        if (data.image === null || data.image === '') {
          $('.backstretch').remove();
          $('.js-bgpicker-body-color').css({'opacity' : 1});
        } else {
          $.backstretch(data.image);
          $('.js-bgpicker-body-color').css({'opacity' : 0.5});
        }
      },

      commit: function(data) {
        {% if bg-picker == "article" %}
          articleData.set({
        {% else %}
          pageData.set({
        {% endif %}
          'body_image': data.image || '',
          'body_color': data.color || ''
        });
      }
    });
  </script>
{% endeditorjsblock %}
