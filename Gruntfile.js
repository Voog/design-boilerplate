module.exports = function(grunt) {
  'use strict';

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // Removes old files.
    clean: {
      reset: {
        src: ['assets', 'images', 'javascripts', 'stylesheets']
      },

      remove: {
        src: ['sources/components/custom-styles/tmp']
      }
    },

    modernizr_builder: {
      build: {
        options: {
          config: 'modernizr-config.json',
          dest: 'javascripts/modernizr-custom.min.js',
          uglify: true
        }
      }
    },

    // Concatenates the javascript source files to the javascripts folder.
    concat: {
      build: {
        src: [
          'sources/javascripts/concat/*.js'
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
    // When using Dart Sass, synchronous compilation is twice as fast
    // as asynchronous compilation by default, due to the overhead of asynchronous callbacks.
    // To avoid this overhead, fibers package is used
    sass: {
      build_main: {
        options: {
          implementation: require('node-sass'),
          sourceMap: false,
          fiber: require('fibers'),
          outputStyle: 'expanded'
        },
        files: [{
          expand: true,
          cwd: 'sources/stylesheets',
          src: '*.scss',
          dest: 'stylesheets/',
          ext: '.css'
        }]
      },

      // Builds custom style components to temporary folder.
      build_custom_styles: {
        options: {
          implementation: require('node-sass'),
          sourceMap: false,
          fiber: require('fibers'),
          outputStyle: 'expanded'
        },
        files: [{
          expand: true,
          cwd: 'sources/components/custom-styles',
          src: '*.scss',
          dest: 'sources/components/custom-styles/tmp',
          ext: '.css'
        }]
      }
    },

    postcss: {
      options: {
        processors: [
          require('autoprefixer')({
            browsers: 'last 4 versions'
          })
        ]
      },
      main_styles: {
        src: [
          'stylesheets/*.css',
          'stylesheets/!*.min.css'
        ]
      },
      custom_styles: {
        src: [
          'sources/components/custom-styles/tmp/*.css'
        ]
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
      build_images: {
        files: [{
          expand: true,
          cwd: 'sources/images/minify',
          src: '*.{png,jpg,gif}',
          dest: 'images/'
        }]
      },

      build_assets: {
        files: [{
          expand: true,
          cwd: 'sources/assets/minify',
          src: '*.svg',
          dest: 'assets/'
        }]
      }
    },

    // Copys the files from the source folders to the layout folders.
    copy: {
      assets: {
        files: [
          {
            expand: true,
            cwd: 'sources/assets/copy',
            src: '*',
            dest: 'assets/'
          }
        ]
      },

      images: {
        files: [
          {
            expand: true,
            cwd: 'sources/images/copy',
            src: '*',
            dest: 'images/'
          }
        ]
      },

      javascripts: {
        files: [
          {
            expand: true,
            cwd: 'sources/javascripts/copy',
            src: '*',
            dest: 'javascripts/'
          }
        ]
      },

      // Copies the compiled css files from temporary folder to "components"
      // folder and renames the files to ""*.tpl".
      custom_styles: {
        files: [
          {
            expand: true,
            cwd: 'sources/components/custom-styles/tmp',
            src: '*.css',
            dest: 'components',
            ext: '.tpl'
          }
        ]
      }
    },

    // Executes the Voog Kit toolkit manifest generation and file upload commands.
    exec: {
      kitmanifest: {
        cmd: function(file) {
          return 'kit manifest';
        }
      },

      kit: {
        cmd: function(file) {
          if (grunt.option('site')) {
            return 'kit push -s ' + grunt.option('site') + ' ' + file;
          } else {
            return 'kit push ' + file;
          }
        }
      }
    },

    // Watches the project for changes and recompiles the output files.
    watch: {
      modernizr: {
        files: 'modernizr-config.json',
        tasks: ['modernizr_builder:build']
      },

      js_copy: {
        files: 'sources/javascripts/copy/*.js',
        tasks: ['copy:javascripts', 'exec:kitmanifest', 'exec:kit:javascripts/*.js']
      },

      js_concat: {
        files: 'sources/javascripts/concat/*.js',
        tasks: ['concat:build', 'uglify:build', 'exec:kitmanifest', 'exec:kit:javascripts/*.js']
      },

      css_main: {
        files: [
          'sources/stylesheets/*.scss',
          'sources/stylesheets/*/*.scss',
        ],
        tasks: ['sass:build_main', 'postcss', 'cssmin:build', 'exec:kitmanifest', 'exec:kit:stylesheets/*.css']
      },

      custom_styles: {
        files: 'sources/components/custom-styles/*.scss',
        tasks: ['sass:build_custom_styles', 'postcss:custom_styles', 'copy:custom_styles', 'clean:remove', 'exec:kitmanifest']
      },

      img_copy: {
        files: 'sources/images/copy/*',
        tasks: [ 'copy:images', 'exec:kitmanifest', 'exec:kit:images/*']
      },

      img_minify: {
        files: 'sources/images/minify/*',
        tasks: ['imagemin:build_images', 'exec:kitmanifest', 'exec:kit:images/*']
      },

      assets_copy: {
        files: 'sources/assets/copy/*',
        tasks: ['copy:assets', 'exec:kitmanifest', 'exec:kit:assets/*']
      },

      assets_minify: {
        files: 'sources/assets/minify/*',
        tasks: ['imagemin:build_assets', 'exec:kitmanifest', 'exec:kit:assets/*']
      },

      voog: {
        files: ['layouts/*.tpl', 'components/*.tpl'],
        options: {
          spawn: false
        }
      }
    }
  });

  require('load-grunt-tasks')(grunt);

  grunt.registerTask('default', ['clean:reset', 'modernizr_builder', 'concat', 'copy:assets', 'copy:images', 'copy:javascripts', 'uglify', 'sass', 'postcss:main_styles', 'cssmin', 'imagemin', 'postcss:custom_styles', 'copy:custom_styles', 'clean:remove']);

  grunt.event.on('watch', function(action, filepath, target) {
    if (target == 'voog') {
      if (action == 'added' || action == 'deleted') {
        grunt.task.run(['exec:kitmanifest']);
      }
      if (grunt.file.exists('.voog')) {
        if (action != 'deleted') {
          grunt.task.run(['exec:kit:' + filepath]);
        }
      }
    }
  });
};
