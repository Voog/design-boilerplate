/* GENERAL */
body {
  font-family: var(--main-font-family);
  color: var(--primary-color);
}
body.dark-background {
  color: var(--fourth-color);
}

.container {
  max-width: var(--container-max-width);
}

.header .header-left .header-title, .header .header-left .header-title a {
  color: var(--primary-color);
}

.post .post-title, .post .post-title a {
  color: var(--secondary-color);
}
.dark-background .post .post-title, .dark-background .post .post-title a {
  color: var(--fourth-color);
}
.post .post-title a:hover {
  color: var(--secondary-color);
}
.dark-background .post .post-title a:hover {
  color: var(--fourth-color);
}
.post .post-date {
  color: var(--secondary-color);
}
.dark-background .post .post-date {
  color: var(--fourth-color);
}
.dark-background .post .post-author {
  color: var(--fourth-color);
}
.post .post-comments-count a {
  color: var(--third-color);
}
.dark-background .post .post-comments-count a {
  color: var(--fourth-color);
}
.post .post-comments-count a:hover {
  color: var(--third-color);
}
.dark-background .post .post-comments-count a:hover {
  color: var(--fourth-color);
}

@media screen and (max-width: 752px) {
  .menu-btn .menu-stripe {
    background-color: var(--secondary-color);
  }
  .dark-background .menu-btn .menu-stripe {
    background-color: var(--fourth-color);
  }
}

.menu .menu-link {
  color: var(--third-color);
}
@media screen and (min-width: 752px) {
  .dark-background .menu .menu-link {
    color: var(--fourth-color);
  }
}
.menu .menu-link:hover {
  color: var(--primary-color);
}
@media screen and (min-width: 752px) {
  .dark-background .menu .menu-link:hover {
    color: var(--fourth-color);
  }
}

.menu-main .menu .menu-link.active {
  color: var(--primary-color);
}
@media screen and (min-width: 752px) {
  .dark-background .menu-main .menu .menu-link.active {
    color: var(--fourth-color);
  }
}
@media screen and (max-width: 752px) {
  .menu-main.expanded .menu-lang .menu-item .menu-link {
    color: var(--secondary-color);
  }
}

.dark-background .menu-sub .menu .menu-item .menu-link {
  color: var(--fourth-color);
}
.menu-sub .menu .menu-item .menu-link.active {
  color: var(--primary-color);
}
@media screen and (min-width: 752px) {
  .dark-background .menu-sub .menu .menu-item .menu-link.active {
    color: var(--fourth-color);
  }
}

.footer .voog-reference a {
  color: var(--primary-color);
}

.dark-background .content-formatted {
  color: var(--fourth-color);
}
.content-formatted h1, .content-formatted h2, .content-formatted h3, .content-formatted h4, .content-formatted h5, .content-formatted h6 {
  color: var(--secondary-color);
}
.dark-background .content-formatted h1, .dark-background .content-formatted h2, .dark-background .content-formatted h3, .dark-background .content-formatted h4, .dark-background .content-formatted h5, .dark-background .content-formatted h6 {
  color: var(--fourth-color);
}
.content-formatted a {
  color: var(--third-color);
}
.dark-background .content-formatted a {
  color: var(--fourth-color);
}
.content-formatted .custom-btn {
  color: var(--secondary-color);
}
.dark-background .content-formatted .custom-btn:hover {
  color: var(--fourth-color);
}
