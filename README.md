# Edicy design boilerplate

## Basic layout structure
### Sample code:
```html
<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <!-- Additional template specific <head> element code. -->
  </head>
  
  <body class="UNIQUE-CLASS-NAME">
    <div class="container cfx">
      {% include "header" %}
  
      <main class="content cfx" role="main">
        <header class="content-header">
          <h1 class="user-content">{% content name="slogan" %}</h1>
        </header>
        <section class="content-body user-content">{% content %}</section>
      </main>
  
      {% include "footer" %}
    </div>
  
    {% include "javascripts" %}
    <script>project.initCommonPage();</script>
  </body>
</html>
```

### Comments
* ```<body class="UNIQUE-CLASS-NAME">```
  * Each layout has its own class name for ```<body>``` element to write layout-specific CSS code.
* ```<div class="container cfx">```
  * Each layout ```<body>``` element contains ```<div>``` element with class names **container** and **cfx**
  * ```<div class="container cfx">``` element holds all layout components - header, content, sidebar, footer etc
  * ```<div class="container cfx">``` element is used for styling basic layout. For example website content area positioning, width, background etc
* ```<main class="content cfx" role="main">```
  * Each layout ```container``` element contains ```<main>``` element with class names **content** and **cfx**. ```<main>``` element also has the ```role``` attribute with value **main**
  * ```<main class="content cfx" role="main">``` element holds the main content of the page - Articles listing, article, text, images etc
