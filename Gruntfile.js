module.exports = function(grunt) {
  "use strict";

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // Builds custom modernizr script.
    modernizr: {
      build: {
        'devFile' : 'bower_components/modernizr/modernizr.js',
        'outputFile' : 'javascripts/modernizr.js',
        'tests': [
          'flexbox',
          'svg'
        ],
        'uglify' : false
      }
    },

    // Concatenates the javascript source files to the javascripts folder.
    concat: {
      build: {
        src: [
          'bower_components/jquery/dist/jquery.js',
          'sources/javascripts/*.js'
        ],
        dest: 'javascripts/main.js'
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
          cwd: 'sources/stylesheets',
          src: 'main.scss',
          dest: 'stylesheets/',
          ext: '.css'
        }]
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
          cwd: 'sources/images',
          src: '*.{png,jpg,gif}',
          dest: 'images/'
        }]
      }
    },

    // Minifies the scalable vector graphics files.
    svgmin: {
      build: {
        files: [{
          expand: true,
          cwd: 'sources/assets',
          src: '*.svg',
          dest: 'assets/',
          ext: '.svg'
        }]
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
      js: {
        files: 'sources/javascripts/*.js',
        tasks: ['concat:build', 'uglify:build']
      },

      css: {
        files: [
          'sources/stylesheets/*.scss',
          'sources/stylesheets/*/*.scss'
        ],
        tasks: ['sass:build', 'cssmin:build']
      },

      img: {
        files: [
          'sources/images/*.jpg',
          'sources/images/*.png',
          'sources/images/*.gif'
        ],
        tasks: ['imagemin:build']
      },

      svg: {
        files: 'sources/assets/*.svg',
        tasks: ['svgmin:build']
      },

      voog: {
        files: ['javascripts/*.js', 'stylesheets/*.css', 'layouts/*.tpl', 'components/*.tpl'],
        options: {
          spawn: false
        }
      }
    },
  });

  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-exec');
  grunt.loadNpmTasks('grunt-modernizr');
  grunt.loadNpmTasks('grunt-svgmin');

  grunt.registerTask('default', ['modernizr', 'concat', 'uglify', 'sass', 'cssmin', 'imagemin', 'svgmin']);

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
