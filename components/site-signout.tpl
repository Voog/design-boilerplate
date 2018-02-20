{% if editmode != true and previewmode != true and page.private? %}
  <div class="signout-btn-wrap">
    <a class="signout-link" data-disable-forcetouch="true" href="/admin/site/sessions/logout">
      <span class="signout-ico">
        <svg class="signout-svg" transform="scale(1.1)" width="16" height="30" xmlns="http://www.w3.org/2000/svg">
          <path stroke="currentColor" fill="none" d="M12.5 19.5v3H1.523C.96 22.5.5 22.053.5 21.5v-14c0-.552.458-1 1.023-1H12.5v3m2.5 5l-5.455 4 5.455-4zm-5.455-4l5.455 4-5.455-4zm-5.558 4H14.5"></path>
        </svg>
      </span><span class="signout-name">{{ "sign_out" | lc }}</span>
    </a>
  </div>
{% endif %}
