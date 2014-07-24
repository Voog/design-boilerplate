module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-bowercopy');
  grunt.loadNpmTasks('grunt-modernizr');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-svgmin');
  grunt.loadNpmTasks('grunt-newer');
  grunt.loadNpmTasks('grunt-contrib-watch');

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
          'concat/jquery.js': 'jquery/dist/jquery.js',
          'concat/backstretch.js': 'jquery-backstretch/jquery.backstretch.js',
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

        'css': {
          'flexbox': true
        },

        'misc': {
          'svg': true
        },

        'uglify' : false
      }
    },

    // Concatenates javascripts into one file.
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
            'modernizr.js',
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
          style: 'expanded'
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
        ext: '.min.css',
        options: {
          spawn: false
        }
      }
    },

    // Minifies the image files.
    imagemin: {
      images: {
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
      concat: {
        files: 'javascripts/src/concat/*.js',
        tasks: 'concat',
        options: {
          spawn: false
        }
      },

      uglify: {
        files: [
        'javascripts/*.js',
        '!javascripts/*.min.js'
        ],
        tasks: 'newer:uglify',
        options: {
          spawn: false
        }
      },

      css: {
        files: 'stylesheets/scss/*.scss',
        tasks: ['sass', 'newer:cssmin'],
        options: {
          spawn: false
        }
      },

      imagemin:  {
        files: 'images/src/*.{png,jpg,gif}',
        tasks: 'newer:imagemin',
        options: {
          spawn: false
        }
      },

      svgmin: {
        files: 'assets/src/*.svg',
        tasks: 'newer:svgmin',
        options: {
          spawn: false
        }
      }
    },
  });

grunt.registerTask('default', ['bowercopy', 'modernizr', 'concat', 'uglify', 'sass', 'cssmin', 'imagemin', 'svgmin']);

grunt.registerTask('dev', ['watch']);
};
