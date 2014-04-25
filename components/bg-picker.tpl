{% editorjsblock %}
  <script src='/assets/admin/tools/0.1.0/edicy-tools.js'></script>
  <script>
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    siteData.get({
      success: function(currentData) {
        var bgPickerBody = new Edicy.BgPicker($('.js-bgpicker-body-settings'), {
          picture: true,
          color: true,
          preview: function(data) {
            var img = (data.image && data.image !== '') ? 'url("' + data.image + '")' : '',
                col = (data.color && data.color !== '') ? data.color : '';

            $('.js-bgpicker-body-image').css({'background-image' : img});
            $('.js-bgpicker-body-color').css({'background-color' : col});

            if (data.image === null || data.image === '') {
              $('.js-bgpicker-body-color').css({'opacity' : 1});
            } else {
              $('.js-bgpicker-body-color').css({'opacity' : 0.5});
            }
          },

          commit: function(data) {
            if (data.image && data.image !== '') {
              currentData['body_image'] = data.image;
            } else if (currentData['body_image']) {
              delete currentData['body_image'];
              $('.js-bgpicker-body-color').css({'opacity' : '1'});
            }

            if (data.color && data.color !== '') {
              currentData['body_color'] = data.color;
              if (data.image && data.image !== "") {
                $('.js-bgpicker-body-color').css({'opacity' : '0.5'});
              }
            } else if (currentData['body_color']) {
              delete currentData['body_color']
            }

            siteData.set(currentData);
          }
        });

      }
    });

  </script>
{% endeditorjsblock %}
