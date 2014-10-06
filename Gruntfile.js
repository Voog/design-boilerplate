module.exports = function(grunt) {
  "use strict";

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // Copys the source files from the bower directory to the project's source locations.
    bowercopy: {
      options: {
        srcPrefix: 'bower_components'
      },

      javascripts: {
        options: {
          destPrefix: 'javascripts/src/'
        },
        files: {
          'concat/backstretch.js': 'jquery-backstretch/jquery.backstretch.js',
          'concat/jquery.js': 'jquery/dist/jquery.js',
          'concat/overthrow.js': 'overthrow/src/overthrow-polyfill.js',
          'modernizr.js': 'modernizr/modernizr.js'
        }
      },

      stylesheets: {
        options: {
          destPrefix: 'stylesheets/scss/'
        },
        files: {
          'bourbon': 'bourbon/dist'
        }
      }
    },

    // Builds custom modernizr script.
    modernizr: {
      build: {
        'devFile' : 'javascripts/src/modernizr.js',
        'outputFile' : 'javascripts/modernizr.js',

        'tests': [
          'flexbox',
          'svg'
        ],

        'uglify' : false
      }
    },

    // Copys the standalone (not concatenated) javascript source files to the javascripts folder.
    copy: {
      javascripts: {
        files: [
          {
            expand: true,
            cwd: 'javascripts/src',
            src: [
              '*.js',
              '!modernizr.js'
            ],
            dest: 'javascripts/'
          }
        ]
      }
    },

    // Concatenates the javascript source files to the javascripts folder.
    concat: {
      build: {
        src: [
        'javascripts/src/concat/jquery.js',
        'javascripts/src/concat/*.js'
        ],
        dest: 'javascripts/application.js'
      }
    },

    // Minifies the javascript files.
    uglify: {
      build: {
        files: [{
          expand: true,
          cwd: 'javascripts/',
          src: [
            '*.js',
            '!*.min.js'
          ],
          dest: 'javascripts/',
          ext: '.min.js'
        }]
      }
    },

    // Compiles the stylesheet files.
    sass: {
      build: {
        options: {
          style: 'expanded',
          sourcemap: 'none'
        },
        files: [{
          expand: true,
          cwd: 'stylesheets/scss',
          src: '*.scss',
          dest: 'stylesheets',
          ext: '.css'
        }]
      }
    },

    exec: {
      kitmanifest: {
        cmd: function(file) {
          return 'kit manifest';
        }
      },
      kit: {
        cmd: function(file) {
          return 'kit push -s ' + grunt.option('site') + ' ' + file;
        }
      }
    },

    // Minifies the stylesheet files.
    cssmin: {
      build: {
        expand: true,
        cwd: 'stylesheets/',
        src: [
          '*.css',
          '!*.min.css'
        ],
        dest: 'stylesheets/',
        ext: '.min.css'
      }
    },

    // Minifies the image files.
    imagemin: {
      build: {
        files: [{
          expand: true,
          cwd: 'images/src/',
          src: '*.{png,jpg,gif}',
          dest: 'images/'
        }]
      }
    },

    // Minifies the scalable vector graphics files
    svgmin: {
      build: {
        files: [{
          expand: true,
          cwd: 'assets/src/',
          src: '*.svg',
          dest: 'assets/',
          ext: '.svg'
        }]
      },
    },

    // Watches the project for changes and recompiles the output files.
    watch: {
      js: {
        files: 'javascripts/src/concat/*.js',
        tasks: ['newer:concat', 'newer:uglify']
      },

      css: {
        files: 'stylesheets/scss/*.scss',
        tasks: ['sass:build', 'newer:cssmin:build']
      },

      voog: {
        files: ['javascripts/*.js', 'stylesheets/*.css', 'layouts/*.tpl', 'components/*.tpl'],
        options: {
          spawn: false
        }
      }
    },
  });

  grunt.loadNpmTasks('grunt-bowercopy');
  grunt.loadNpmTasks('grunt-modernizr');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-svgmin');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-newer');
  grunt.loadNpmTasks('grunt-exec');

  grunt.registerTask('default', ['bowercopy', 'modernizr', 'copy', 'concat', 'uglify', 'sass', 'cssmin', 'imagemin', 'svgmin']);

  grunt.event.on('watch', function(action, filepath, target) {
    if (target == 'voog') {
      if (action == "added" || action == "deleted") {
        grunt.task.run(['exec:kitmanifest']);
      }
      if (action != "deleted") {
        grunt.task.run(['exec:kit:' + filepath]);
      }
    }
  });
};
