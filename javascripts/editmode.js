; (function ($) {
  // ===========================================================================
  // Binds image drop areas.
  // ===========================================================================
  var bindContentItemImgDropAreas = function (placeholderText, itemImageKey, cropStateKey) {
    $('.js-content-item-img-drop-area').each(function (index, imgDropAreaTarget) {
      var $imgDropAreaTarget = $(imgDropAreaTarget),
        $contentItemBox = $imgDropAreaTarget.closest('.js-content-item-box'),
        $removeBtn = $contentItemBox.find('.image_settings-remove'),
        itemId = $contentItemBox.data('item-id'),
        itemType = $contentItemBox.data('item-type'),
        itemImageType = $contentItemBox.data('image-type'),
        itemData = new Edicy.CustomData({
          type: itemType,
          id: itemId
        });

      var imgDropArea = new Edicy.ImgDropArea($imgDropAreaTarget, {
        positionable: false,
        target_width: 2048,
        placeholder: '<div class="edy-img-drop-area-placeholder">' + placeholderText + '</div>',
        removeBtn: '<div class="edy-img-drop-area-remove-image">' +
          '<div class="edy-img-drop-area-remove-image-ico">' +
          '<svg width="16" height="20" viewBox="0 0 26 30" xmlns="http://www.w3.org/2000/svg">' +
          '<g fill-rule="nonzero" fill="currentColor">' +
          '<g transform="translate(2 5)">' +
          '<path d="M0 .997h2V21c0 1 1 2 2 2h14c1 0 2-1 2-2V1h2v20c0 2.25-1.75 4-4 4H4c-2.25 0-4-1.75-4-4V.997z"/>' +
          '<rect x="10" y="4" width="2" height="16" rx="1"/>' +
          '<rect x="5" y="4" width="2" height="16" rx="1"/>' +
          '<rect x="15" y="4" width="2" height="16" rx="1"/>' +
          '</g>' +
          '<path d="M26 4v2H0V4h7V2c0-1 1-2 2-2h8c1 0 2 1 2 2v2h7zM9 4h8V3c0-.5-.5-1-1-1h-6c-.5 0-1 .5-1 1v1z"/>' +
          '</g>' +
          '</svg>' +
          '</div>' +
          '</div>',

        change: function (image) {
          var $cropToggleButton = $contentItemBox.find('.js-toggle-crop-state');
          $imgDropAreaTarget
            .removeClass('is-cropped')
            .addClass('not-cropped')
            .css('opacity', .1)
            ;

          if (image) {
            removeImagePlaceholder($contentItemBox, $cropToggleButton);
            $('.js-remove-image').css('display', 'flex');
          } else {
            $contentItemBox.find('.image_settings').hide();

            $contentItemBox
              .removeClass('with-image is-loaded with-error')
              .addClass('without-image not-loaded')
              ;

            $cropToggleButton
              .addClass('is-hidden')
              .removeClass('is-visible')
              ;
            $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 0);
          }


          var itemType = $contentItemBox.data('item-type');
          var itemId = $contentItemBox.data('item-id');

          var itemData = new Edicy.CustomData({
            type: itemType,
            id: itemId
          });

          itemData.set({ [cropStateKey]: 'not-cropped', [itemImageKey]: image });
          $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');
          $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 1);
          $imgDropAreaTarget.css('opacity', 1);
        }
      });

      $removeBtn.on('click', function () {
        var $el = $(this);
        itemData.get({
          success: function (data) {
            if (data.item_image) {
              itemData.remove(itemImageKey, {
                success: function (data) {
                  itemData.remove(cropStateKey, {
                    success: function (data) {
                      if (itemType !== 'article') {
                        handleProductImage(placeholderText, itemId, null, itemData);
                      } else {
                        addProductImagePlaceholder($el, placeholderText);
                      }
                    }
                  });
                }
              });
            } else {
              $.ajax({
                type: 'PUT',
                contentType: 'application/json',
                url: '/admin/api/pages/' + itemId,
                dataType: 'json',
                data: JSON.stringify({ "image_id": null })
              }).then(function (product) {
                addProductImagePlaceholder($el, placeholderText);
              });
            }
          }
        });

      });
    });
  };

  var removeImagePlaceholder = function ($contentItemBox, $cropToggleButton) {
    $contentItemBox.find('.image_settings').show();

    $contentItemBox
      .removeClass('without-image is-loaded with-error')
      .addClass('with-image not-loaded')
      ;

    $cropToggleButton
      .removeClass('is-hidden')
      .addClass('is-visible')
      ;
  }

  var addProductImagePlaceholder = function (el, placeholderText) {
    el.closest('.js-content-item-box').find('.top-inner')
      .append('<div class="edy-img-drop-area-placeholder">' + placeholderText + '</div>');
    el.closest('.js-content-item-box').find('.top-inner').attr("style", "");
    el.closest('.js-content-item-box')
      .removeClass('with-image is-loaded with-error')
      .addClass('without-image not-loaded')
      ;
    el.closest('.js-content-item-box').find('.edy-img-drop-area').removeClass('active');
    el.closest('.image_settings').hide();
  };

  // ===========================================================================
  // Sets functions that will be initiated globally when resizing the browser
  // window.
  // ===========================================================================
  var bindContentItemImageCropToggle = function (dataKey) {
    $('.js-toggle-crop-state').on('click', function () {
      var $contentItemBox = $(this).closest('.js-content-item-box'),
        $imgDropAreaTarget = $contentItemBox.find('.js-content-item-img-drop-area'),
        itemId = $contentItemBox.data('item-id'),
        itemType = $contentItemBox.data('item-type'),
        itemData = new Edicy.CustomData({
          type: itemType,
          id: itemId
        }),
        imageCropState;

      if ($imgDropAreaTarget.hasClass('is-cropped')) {
        $imgDropAreaTarget
          .removeClass('is-cropped')
          .addClass('not-cropped')
          ;

        imageCropState = 'not-cropped';
      } else {
        $imgDropAreaTarget
          .removeClass('not-cropped')
          .addClass('is-cropped')
          ;

        imageCropState = 'is-cropped';
      }

      itemData.set(dataKey, imageCropState);
    });
  };

  //==========================================================================
  // Sets site custom data saving fanction variable.
  //==========================================================================
  var bindCustomDataItem = function () {
    $('.js-data-item').each(function () {
      $(this).on('change', function (e) {
        if (e.target.type === 'checkbox') {
          var val = e.target.checked;
        } else {
          var val = e.target.value;
        }
        var dataKey = e.target.dataset.name;
        var dataId = e.target.dataset.id;
        var dataEntity = e.target.dataset.entity;
        var dataReload = e.target.dataset.reload;

        if (dataEntity == 'site') {
          var entityData = new Edicy.CustomData({
            type: 'site'
          });;
        } else {
          var entityData = new Edicy.CustomData({
            type: dataEntity,
            id: dataId
          });
        }

        entityData.set({ [dataKey]: val }, {
          success: function () {
            if (dataReload) { location.reload(); };
          }
        });
      });
    });
  };

  var bindCustomTexteditorStyles = function () {
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', { name: 'Button', tagname: 'a', attribute: { 'href': '#' }, classname: 'custom-btn', toggle: true }]);
  };

  handleProductImage = function (placeholderText, pageId, event, itemData) {
    var partialId = $('.js-buy-btn-content  .partial .edy-buy-button-container').data("component-id");
    var productId = $('.js-buy-btn-content  .partial .edy-buy-button-container').data("product-id");
    var productImageEl = $('.js-product-page-image .image-drop-area');

    $.ajax({
      type: 'GET',
      contentType: 'application/json',
      url: '/admin/api/pages/' + pageId,
      dataType: 'json'
    }).then(function (page) {
      if (event) {
        if (page.data.item_image) {
          productImageEl.css('background-image', 'url(' + page.data.item_image.url + ')');
          $('.js-remove-image').css('display', 'flex');
        } else if (event.detail.product.image) {
          $('.image_settings').css('display', 'flex');
          $('.js-remove-image').css('display', 'none');
          $('.edy-img-drop-area-placeholder').remove();
          removeImagePlaceholder(productImageEl.closest('.js-content-item-box'), productImageEl.find('.js-toggle-crop-state'))
          productImageEl.css('background-image', 'url(' + event.detail.product.image.url + ')');
        } else if (page.image) {
          productImageEl.css('background-image', 'url(' + page.image.public_url + ')');
          $('.js-remove-image').css('display', 'flex');
        } else {
          addProductImagePlaceholder($('.js-product-page-image .image-drop-area'), placeholderText);
        }
      } else {
        $.ajax({
          type: 'GET',
          contentType: 'application/json',
          url: '/admin/api/ecommerce/v1/products/' + productId + '?include=details',
          dataType: 'json'
        }).then(function (product) {
          if (product.image) {
            $('.image_settings').css('display', 'flex');
            $('.js-remove-image').css('display', 'none');
            $('.edy-img-drop-area-placeholder').remove();
            removeImagePlaceholder(productImageEl.closest('.js-content-item-box'), productImageEl.find('.js-toggle-crop-state'))
            productImageEl.css('background-image', 'url(' + product.image.url + ')');
          } else if (page.image) {
            productImageEl.css('background-image', 'url(' + page.image.public_url + ')');
            $('.js-remove-image').css('display', 'flex');
          } else {
            addProductImagePlaceholder($('.js-product-page-image .image-drop-area'), placeholderText);
          }
        });
      }
    });
  };

  var debounce = function (func, wait, immediate) {
    var timeout;
    return function () {
      var context = this, args = arguments;
      var later = function () {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  var initSettingsEditorBtn = function () {
    window.addEventListener('DOMContentLoaded', function (event) {
      var shadowDom = document.querySelector(".edy-next-shadowdom").shadowRoot;
      var setSettingsBtn = setInterval(function () {
        if (shadowDom.querySelectorAll('div[class^="toolbar__"]').length) {
          var toolbarExpandBtn = shadowDom.querySelector('div[class^="toolbar-expand"]');
          var toolbar = shadowDom.querySelector('div[class^="toolbar__"]');
          var settingsBtn = document.querySelector(".js-layout_settings-btn");
          var toolbarItem = shadowDom.querySelector('div[class^="toolbar-content-item__"]');

          settingsBtn.className = toolbarItem.className + ' ' + settingsBtn.className;

          toolbar.insertBefore(settingsBtn, toolbarExpandBtn);

          shadowDom.querySelector(".js-layout_settings-btn").addEventListener(
            "click", function (e) {
              document.querySelector('body').classList.toggle('layout_settings-visible');
              e.stopImmediatePropagation();
            }
          );

          var positionPopover = function () {
            var settingsPopover = $('.js-layout_settings-popover');
            var settingsPopoverArrow = $('.layout_settings-arrow');

            if ($(window).width() > 768) {
              settingsPopover.css({ right: window.innerWidth - settingsBtn.getBoundingClientRect().right - (settingsPopover.width() / 2) })
              settingsPopoverArrow.css({ right: settingsPopover.width() / 2 });
            } else {
              settingsPopover.css({ right: 0 });
              settingsPopoverArrow.css({ right: 72 });
            }
          }

          $(window).resize(debounce(function () {
            positionPopover();
          }, 25));

          positionPopover();
          clearInterval(setSettingsBtn);
        }
      }, 500);

      $('body').append($('.js-layout_settings-popover'));
    });
  }

  var bindProductListeners = function (placeholderText, pageId) {
    document.addEventListener('voog:ecommerce:buttonproductsave', function (event) {
      handleProductImage(placeholderText, pageId, event);
    });
  };

  var handleDocument = function () {
    window.addEventListener('DOMContentLoaded', function (event) {
      $('#fc_frame').css('display', 'block!important;');
    });
  };

  var init = function () {
    bindCustomTexteditorStyles();
    bindCustomDataItem();
    //handleDocument();
  };

  // Enables the usage of the initiations outside this file.
  // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
  window.site = $.extend(window.site || {}, {
    bindContentItemImgDropAreas: bindContentItemImgDropAreas,
    bindContentItemImageCropToggle: bindContentItemImageCropToggle,
    bindProductListeners: bindProductListeners,
    initSettingsEditorBtn: initSettingsEditorBtn
  });

  // Initiates site wide functions.
  init();
})(jQuery);