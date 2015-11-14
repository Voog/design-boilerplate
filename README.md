# The Pripyat (basic boilerplate) design template for Voog

## Setup
### The developing environment
To modify this template [Node Package Manager](https://www.npmjs.org/) (or [Node.js](http://www.nodejs.org/)), [Bower](http://www.bower.io/) and [Grunt](http://www.gruntjs.com/) must be installed.

To set up the local developing environment, clone this repository and run the following commands:

* Install Grunt dependencies: ```npm install```
* Install Bower dependencies: ```bower install```
* Run Grunt tasks: ```grunt```

To sync the template with your **Voog** sites, set up the [Voog Developer Toolkit](http://www.voog.com/developers/kit)

###Watch and update modifications
* To watch (and synchronize) modified files in real time (**on the default site**) start the Grunt watcher task:
  * **Example:** ```grunt watch```
  * **Notes:**
    * Default site is the first site defined in the **.voog** configuration file.
    * If the **.voog** file is missing, the watcher will only update the output files on the local computer.
* To watch **specific site** start the Grunt watcher with **--site** parameter value.
  * **Example:** ```grunt watch --site=mysite.voog.com```
  * **Notes:**
    * Possible **--site** values are the site names defined in the **.voog** configuration file.
    * If the **.voog** file is missing, the watcher will ignore the **--site** parameter and updates the output files only on the local computer.

**NB! The following part of the document is a working draft. Read with caution!2**

## Required parts

### Folders
Voog templates uses folders with predefined names to store different parts of the template.

#### layouts/
Folder to store template's layouts.

* **Layout** is a main file that holds code for rendering **pages** in Voog.
* Each **page** is binded with it's **layout**.

##### components/
Folder to store template's (reusable) components.

* Each **component** can be **included** in **layouts**:
* Usage example:

```liquid
<!DOCTYPE html>
<html>
  <head>
    <!-- Include "components/template-head.tpl" content here -->
    {% include "template-head" %}
  </head>
</html>
```

#### stylesheets
Folder to store template's stylesheets.

* Supported file types:
	* .css
* Files can be accessed in **templates** and **components** using {{ stylesheets_path }} variable:

```liquid
<script src="{{ stylesheets_path }}/main.js">
```

#### javascripts/
Folder to store template's images.

* Supported file types:
	* .js
* Files can be accessed in **templates** and **components** using {{ javascripts_path }} variable:

```liquid
<script src="{{ javascripts_path }}/main.js">
```

#### images
Folder to store template's images.

* Supported file types:
	* .jpg
	* .png
	* TODO: *something else?*
* Files can be accessed in **templates** and **components** using {{ images_path }} variable:

```liquid
<img src="{{ images_path }}/image.jpg">
```

#### assets
Folder to store template's files. For example **webfonts** or **svg**.

* Supported file types:
	* TODO: *anything?*

### Layouts
#### Generating layouts
##### Local environment
* Each **layout** must be a file with type **.tpl**
* Each **layout** must be configurated in the **manifest.json** file with the following key/value pairs:
	* content_type – the type of the content in layout.
	* component – boolean to indicate if the file is a includable partial or independent layout.
	* file – file name with its extension.
	* layout_name – type of the layout.
	* title – name that is rendered in the design editor.
* Example configuration:

```javascript
{
  "content_type": "page", // Other possible values: "blog", "blog_article", "elements", "element", "component"
  "component": false, // Must be false for layout files.
  "file": "layouts/common_page.tpl", // Location of the file in the template's structure
  "layout_name": "page_default", // Other possible values:  "page_front", "blog", "blog_article", "elements", "element"
   "title": "Common page" // Human friendly version of the file name.
}
```

**Tip: Running ```Kit manifest``` command from the root directory automatically generates the JSON for the layout parts. "content_type" and "layout_name" values are always set as "page" and "page_default" and must be edited manually if the generated values are not correct.**

**Tip: Create the structure of the template using Voog design editor view and use "kit pull" command to download it to the local environment. This way the manifest is generated with the correct values automattically.**

##### Voog design editor
* Click on the **+** button next to the **Layouts** heading.
* Add **name** for the layout.
* Choose the **layout type**.
* Choose **layout parent** if needed.
* No need to specify anything in the **manifest.json**.

**Tip: Create layouts in Voog design editor and pull them with "kit pull layouts" to bypass manual configuration of the "manifest.json"**

#### Standard design required layouts
Each standard design layout should respect the naming conventions for file names to preserve the unity of the templates.

Standard design requires 4 main **layouts**:

##### "Blog & News"
Layout for blog articles listing pages.

* Title in design editor: **"Blog & News"**
* File name: **blog___news.tpl** (use **title** as name if creating in Voog design editor).
* Configuration in **manifest.json**:

```json
{
  "content_type": "blog",
  "component": false,
  "file": "layouts/blog___news.tpl",
  "layout_name": "blog",
  "title": "Blog & News"
}
```

##### "Blog article"
Layout for blog single articles.

* Title in design editor: **"Blog article"**
* File name: **blog_article.tpl** (use **title** as name if creating in Voog design editor).
* **Parent layout** must be set as "Blog & News" if created with Voog design editor.
* Configuration in **manifest.json**:

```json
{
  "content_type": "blog_article",
  "component": false,
  "file": "layouts/blog_article.tpl",
  "layout_name": "blog_article",
  "title": "Blog article"
}
```

##### "Common page"
Layout for simple content pages.

* Title in design editor: **"Common page"**
* File name: **common_page.tpl** (use **title** as name if creating in Voog design editor).
* Configuration in **manifest.json**:

```json
{
  "content_type": "page",
  "component": false,
  "file": "layouts/common_page.tpl",
  "layout_name": "page_default",
  "title": "Common page"
}
```

##### "Front page"
Layout for landing pages.

* Title in design editor: **"Front page"**
* File name: **front_page.tpl** (use **title** as name if creating in Voog design editor).
* Configuration in **manifest.json**:

```json
{
  "content_type": "page",
  "component": false,
  "file": "layouts/front_page.tpl",
  "layout_name": "page_front",
  "title": "Front page"
}
```

### Components
Each standard design component should respect the naming conventions for file names to preserve the unity of the templates.

#### Generating components
##### Local environment
* Each **component** must be a file with type **.tpl**
* Each **component** must be configurated in the **manifest.json** file with the following key/value pairs:
	* content_type – the type of the content in layout.
	* component – boolean to indicate if the file is a includable partial or independent layout.
	* file – file name with its extension.
	* layout_name – type of the layout.
	* title – name that is rendered in the design editor.
* Example configuration:

```javascript
{
  "content_type": "component", // Must be "component" for components.
  "component": true, // Must be true for layout files.
  "file": "components/template-head.tpl", // Location of the file in the template's structure
  "layout_name": "template-head", // File name without the extension.
   "title": "Common page" // Same as layout_name.
}
```

**Tip: Running ```Kit manifest``` command from the root directory automatically generates the JSON for the component parts.**

##### Voog design editor
* Click on the **+** button next to the **Components** heading.
* Add **name** for the component.
* No need to specify anything in the **manifest.json**.

#### Standard design required components
##### template-head
Component to store the global part of the ```<head></head>``` tag.

* Shouldn't be confused with the **"site-header"** component.
* Configuration in **manifest.json**:

```json
{
  "content_type": "component",
  "component": true,
  "file": "components/template-head.tpl",
  "layout_name": "template-head",
  "title": "template-head"
}
```

##### Menus
The number and name of the menu components depend how deeply menu structure is supported.

###### menu-main
Component to store the code for main menu if main menu renders more than first level menu. For example level-1 menu with dropdowns containing level-2 (and level-3 and level-*N*).

* Configuration in **manifest.json**:

```json
{
  "content_type": "component",
  "component": true,
  "file": "components/menu-main.tpl",
  "layout_name": "menu-main",
  "title": "menu-main"
}
```

###### menu-level-*N*
Component(s) to store the code for the specific level menu in site structure.

* N stands for the deepness of the menu level in site structure. For example "**menu-level-1**" or "**menu-level-2**"

* Configuration in **manifest.json**:

```json
{
  "content_type": "component",
  "component": true,
  "file": "components/menu-level-*N*.tpl",
  "layout_name": "menu-level-*N*",
  "title": "menu-level-*N*"
}
```

##### site-header
Component to store the code for the the template's header (visible part containing site tile, menu, etc).

* Shouldn't be confused with the **"template-head"** component.
* Configuration in **manifest.json**:

```json
{
  "content_type": "component",
  "component": true,
  "file": "components/site-header.tpl",
  "layout_name": "site-header",
  "title": "site-header"
}
```

##### site-footer
Component to store the code for the the template's footer (visible part containing contact info, menu, etc).

* Configuration in **manifest.json**:

```json
{
  "content_type": "component",
  "component": true,
  "file": "components/site-footer.tpl",
  "layout_name": "site-footer",
  "title": "site-footer"
}
```

#### Standard design optional components
##### template-javascripts
Component to store the code for the template's global javascripts.

* Configuration in **manifest.json**:

```json
{
  "content_type": "component",
  "component": true,
  "file": "components/template-javascripts.tpl",
  "layout_name": "template-javascripts",
  "title": "template-javascripts"
}
```

##### template-tools
Component to store the code for the template's global JS that must be used with liquid tags and due to that can't be located in the **sources/javascripts/base.js**. For example **BG-picker**, **Image drop area**, **Custom data saving variables** etc.

**Tip: This part of the JS should be as short as it can be. For example the code should initiate the functions in the "sources/javascripts/base.js" with the parameters rendered from Liquid markup, instead of the entire function code.**

* Code must be wrapped in the ```{% editorjsblock %}{% endeditorjsblock %}```
* Example:

```liquid
{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>

  <script>
    // Sets the variable for saving global custom data.
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    // Sets the variable for saving global custom data.
    site.initSomething('{{ page.data.some_value }}');
  </script>
{% endeditorjsblock %}
```

* Configuration in **manifest.json**:

```json
{
  "content_type": "component",
  "component": true,
  "file": "components/template-variables.tpl",
  "layout_name": "template-variables",
  "title": "template-variables"
}
```

##### template-variables
Component to store the code for the template's global liquid variables.

* Configuration in **manifest.json**:

```json
{
  "content_type": "component",
  "component": true,
  "file": "components/template-variables.tpl",
  "layout_name": "template-variables",
  "title": "template-variables"
}
```

### Stylesheets
#### main.css
Global CSS file that contains all the CSS code that's needed for styling the template's main parts.

### Javascripts
#### main.js
Global JS file that contains all the JS code that's needed for the template's main functionality.

#### main.min.js
Minified version of the **"main.js"**.

## Naming conventions
To preserve unity of the template's code any added file should use the following naming rules:

### Layouts
* Name the layout so it represents the purpose of the layout.
	* For example **"Blog & News"** will render blog or news listing.
* Capitalize the **title**.
* Use lowercase in **file name**.
* Separate words with **spaces** in the **title**.
* Separate words with **underscores** in the **title**.

### Components
* Name the component so it represents the purpose of the component.
	* For example **"template-head"** will hold the code for the template's ```<head>``` tag.
* Use lowercase in **title** and **file name**.
* Use the following prefixes:
	* **template-** – components that are storing global, non-visible parts of the template. For example Liquid variables for translations or bg-picker, etc.
	* **site-** – components that are storing global, visible parts of the template. For example site's header, footer and sidebars.
	* **menu-** – components that are storing menu rendering logic.
	* ***layout-name-*** – components that are meant for the specific layouts.
		* For example:
			* **"blog-and-news-article"** to store the code for the blog listing page article.
			* **"site-sidebar-content"** to store the code for the sidebar's content area.

### Javascripts
* Name the component so it represents the purpose of the component.

### Images
* Name the images so it represents the purpose of the image.

### Images
* Name the assets so it represents the purpose of the asset.

## Liquid markup conventions
* Prefer **double quotes** – Voog custom liquid tags work only with double quotes and to preserve the unity of the code, double quotes should be used. Use single quotes only if they conflict with other quotation marks.
	* Example: ```placeholder="{{ 'search' | lc }}...">```

## Standard template required parts
### Navigation menus
Voog standard designs must have at least 2 level deep navigation.

* Each menu must be a separate component named **"menu-level-*N*"** if it is used to render only one level of the menu structure.
* If more than one level is rendered in the same menu, then the name of the component should be different:
	* **"menu-main.tpl"** – if the menu renders **level-1 + level-2 ( + level-*N*)**.
	* **"menu-sub.tpl"** – if the menu renders **(level-2 + ) level-3 ( + level-*N*)**.

* Each menu must have **page adding button** and **hidden items list button**  under the menu items listing.
* Menu items that are not translated should have distinctive style.
* Menu items that are not visible, should be hidden (and visible under the **hidden items list button**).
* Editmode buttons shouldn't be on the same line with the menu links because the length of the menu can produce major difference between editmode and live.
* Example of the menu code:

```liquid
<nav class="menu-main">
  <ul class="menu menu-horizontal menu-public menu-level-1">
    {% unless site.root_item.hidden? %}
      {% menulink site.root_item wrapper-tag="li" %}
    {% endunless %}

    {% for level_1 in site.visible_menuitems %}
      {% menulink level_1 wrapper-tag="li" %}
    {% endfor %}
  </ul>

  {% if editmode %}
    <ul class="menu menu-horizontal menu-cms">
      {% if site.hidden_menuitems.size > 0 %}
        <li>{% menubtn site.hidden_menuitems %}</li>
      {% endif %}

      <li>{% menuadd %}</li>
    </ul>
  {% endif %}
</nav>

```

### Language menu
Voog standard designs must have a navigation menu.

* If language menu has language flags, then there must be an option to toggle them.


### Site search
Site search consist of 4 parts:
* Search form for search input.
* Stylesheet with default design for the search output.
* Javascript plugin for search functionality.
* Javascript code snippet to bind search functionality with the form and set it's options.

#### Search form
Search form should be in a component named **"site-search"**. Example:

```liquid
{% if site.search.enabled %}
  <div class="site-search">
    <form class="search-form js-search-form" method="get">
      <input class="search-input" type="search" placeholder="{{ "search" | lc }}...">
      <input class="search-submit" type="submit" value="{{ "search" | lc }}">
    </form>
  </div>
{% endif %}
```

* Class **"js-search-form"** is used for binding search plugin's functionality.
* Search input must have the **"type="search""** or **"type="input""** attribute.
* To use default styles for the search results modal, the following stylesheet must be added int he **"template-head"** component:'

```liquid
{% if site.search.enabled %}
  <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.css">
{% endif %}
```

**There's no need for the stylesheet if search has custom design that doesn't use any part of the default style. Custom style or default styles overrides for the search form and modal must be added into the "sources/stylesheets/components/_site-search.scss".**

* Search plugin must be included in **"template-javascripts"** component:

```liquid
{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>site.bindSiteSearch($('.js-search-form').get(0), '{{ page.language_code }}');</script>
{% endif %}
```

* Search initiation function must be added in the **"sources/javascripts/base.js"**:

```javascript
var bindSiteSearch = function(searchForm, languageCode) {
    if (searchForm) {
      var search = new VoogSearch(searchForm, {
        // Results are lazy-loaded on scroll.
        // This defines the number of results per query.
        per_page: 10,

        // Language code for restricting the search to page language
        lang: languageCode,

        // If given an DOM element results are rendered inside that element
        // instead of modal (with scroll lazy load support).
        // Example: resultsContainer: $('.custom-search-container').get(0),
        resultsContainer: null,

        // Defines if modal should close on sideclick
        sideclick: true,

        // Mobile checkpoint (adds class "voog-search-mobile-mode" if <= nr)
        mobileModeWidth: 640,

        // Updates results on every keypress
        updateOnKeypress: false
      });
    }
  };
```

* To enable the **"bindSiteSearch"** function outside the **"sources/javascripts/base.js"** file, it must be added into **window.site** variable at the end of the **"sources/javascripts/base.js"** file:

```javascript
window.site = $.extend(window.site || {}, {
  // ...other "key: value" pairs...
  bindSiteSearch: bindSiteSearch
});
```
