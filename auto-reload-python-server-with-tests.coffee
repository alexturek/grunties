module.exports = (grunt) ->
    grunt.initConfig {
        pkg: grunt.file.readJSON 'package.json'
        shell:
            'python unit tests -> server':
                options:
                    stdout: true
                command: 'make test-unit && make dev'
        watch:
            scripts:
                files: [
                    'src/**/*.py',
                    'test/unit/*.py',
                    'Gruntfile.coffee',
                    'requirements-dev.txt',
                    'config/**/*.ini'
                ]
                tasks: ['shell']
                options:
                    display: 'short'
                    summary: false
                    debounceDelay: 500
    }

    grunt.loadNpmTasks 'grunt-shell'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    grunt.registerTask 'default', ['shell', 'watch']
