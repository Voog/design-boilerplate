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

.menu .menu-link.current-page {
  color: var(--primary-color);
}

@media screen and (min-width: 752px) {
  .dark-background .menu .menu-link {
    color: var(--fourth-color);
  }
}

.menu .menu-link a:hover {
  color: var(--primary-color);
}

@media screen and (min-width: 752px) {
  .dark-background .menu .menu-link a:hover {
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

.content-formatted {
  font-size: var(--content-body-font-size);
  line-height: var(--content-body-line-height);
  color: var(--content-body-color);
}

.dark-background .content-formatted {
  color: var(--fourth-color);
}

.content-formatted h1, .content-formatted h2:not(.comment-title), .content-formatted h3, .content-formatted h4, .content-formatted h5, .content-formatted h6 {
  color: var(--secondary-color);
}

.dark-background .content-formatted h1, .dark-background .content-formatted h2:not(.comment-title), .dark-background .content-formatted h3, .dark-background .content-formatted h4, .dark-background .content-formatted h5, .dark-background .content-formatted h6 {
  color: var(--fourth-color);
}

.content-formatted h1 {
  font-size: var(--headings-title-font-size);
  font-style: var(--headings-title-font-style);
  font-weight: var(--headings-title-font-weight);
  line-height: var(--headings-title-line-height);
  color: var(--headings-title-color);
  text-align: var(--headings-title-text-alignment);
  -webkit-text-decoration: var(--headings-title-text-decoration);
          text-decoration: var(--headings-title-text-decoration);
  text-transform: var(--headings-title-text-transform);
}

.content-formatted h2:not(.comment-title) {
  font-size: var(--headings-heading-font-size);
  font-style: var(--headings-heading-font-style);
  font-weight: var(--headings-heading-font-weight);
  line-height: var(--headings-heading-line-height);
  color: var(--headings-heading-color);
  text-align: var(--headings-heading-text-alignment);
  -webkit-text-decoration: var(--headings-heading-text-decoration);
          text-decoration: var(--headings-heading-text-decoration);
  text-transform: var(--headings-heading-text-transform);
}

.content-formatted h3, .content-formatted h4, .content-formatted h5, .content-formatted h6 {
  font-size: var(--headings-subheading-font-size);
  font-style: var(--headings-subheading-font-style);
  font-weight: var(--headings-subheading-font-weight);
  line-height: var(--headings-subheading-line-height);
  color: var(--headings-subheading-color);
  text-align: var(--headings-subheading-text-alignment);
  -webkit-text-decoration: var(--headings-subheading-text-decoration);
          text-decoration: var(--headings-subheading-text-decoration);
  text-transform: var(--headings-subheading-text-transform);
}

.content-formatted a:not(.custom-btn) {
  font-style: var(--content-link-font-style);
  font-weight: var(--content-link-font-weight);
  color: var(--content-link-color);
  -webkit-text-decoration: var(--content-link-text-decoration);
          text-decoration: var(--content-link-text-decoration);
  text-transform: var(--content-link-text-transform);
}

.dark-background .content-formatted a:not(.custom-btn) {
  color: var(--fourth-color);
}

.content-formatted a:not(.custom-btn):hover {
  font-style: var(--content-link-hover-font-style);
  font-weight: var(--content-link-hover-font-weight);
  color: var(--content-link-hover-color);
  -webkit-text-decoration: var(--content-link-hover-text-decoration);
          text-decoration: var(--content-link-hover-text-decoration);
  text-transform: var(--content-link-hover-text-transform);
}

.dark-background .content-formatted a:not(.custom-btn):hover {
  color: var(--fourth-color);
}

.content-formatted .custom-btn {
  color: var(--secondary-color);
}

.dark-background .content-formatted .custom-btn:hover {
  color: var(--fourth-color);
}

.blog-page .post-read-more-btn {
  font-style: var(--content-link-font-style);
  font-weight: var(--content-link-font-weight);
  color: var(--content-link-color);
  -webkit-text-decoration: var(--content-link-text-decoration);
          text-decoration: var(--content-link-text-decoration);
  text-transform: var(--content-link-text-transform);
}

.product-content .product-price {
  color: var(--content-area-product-price__color);
  font-size: var(--content-area-product-price__font-size);
  font-weight: var(--content-area-product-price__font-weight);
  font-style: var(--content-area-product-price__font-style);
  -webkit-text-decoration: var(--content-area-product-price__text-decoration);
          text-decoration: var(--content-area-product-price__text-decoration);
}

.product-content .product-description {
  color: var(--content-area-product-description__color);
  font-size: var(--content-area-product-description__font-size);
  font-weight: var(--content-area-product-description__font-weight);
  font-style: var(--content-area-product-description__font-style);
  -webkit-text-decoration: var(--content-area-product-description__text-decoration);
          text-decoration: var(--content-area-product-description__text-decoration);
}

.product-content .content-item-title h1 {
  color: var(--content-area-product-title__color);
  font-size: var(--content-area-product-title__font-size);
  font-weight: var(--content-area-product-title__font-weight);
  font-style: var(--content-area-product-title__font-style);
  -webkit-text-decoration: var(--content-area-product-title__text-decoration);
          text-decoration: var(--content-area-product-title__text-decoration);
  text-align: var(--content-area-product-title__alignment);
}
