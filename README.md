#The Pripyat (basic boilerplate) design template for Voog

##Set up the developing environment
To modify this template [Node Package Manager](https://www.npmjs.org/) (or [Node.js](http://www.nodejs.org/)), [Bower](http://www.bower.io/) and [Grunt](http://www.gruntjs.com/) must be installed.

To set up the local developing environment, clone this repository and run the following commands:

* Install Grunt dependencies: ```npm install```
* Install Bower dependencies: ```bower install```
* Run Grunt tasks: ```grunt```

To sync the template with your **Voog** sites, set up the [Voog Developer Toolkit](http://www.voog.com/developers/kit)

##Watch and update modifications
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
