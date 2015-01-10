# discourse-vietnamese-slug
Add Vietnamese Slug to Discourse. http://ask.hoidapyhoc.com

#Installation

##Non-docker installation

* Run `bundle exec rake plugin:install repo=https://github.com/thangngoc89/discourse-vietnamese-slug` in your discourse directory
* In development mode, `run bundle exec rake assets:clean`
* In production, recompile your assets: `bundle exec rake assets:precompile`
* Restart Discourse

## Docker installation

[Official Plugin Installation Guide](https://meta.discourse.org/t/advanced-troubleshooting-with-docker/15927#Example:%20Install%20a%20plugin)

````
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/discourse/docker_manager.git
          - git clone https://github.com/thangngoc89/discourse-vietnamese-slug.git
```

Rebuild Your Docker
`./launcher rebuild app`

###Want to add your own language Slug? Don't hesitate to fork this project and replace proper character in `plugin.rb` file

## TODO

[ ] Find a more effective way to do this instead of replace char by char (performance issue)
[ ] Support Vietnamese Unicode 2 byte character
