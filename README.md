# RailsWebpackReactGenerator
## CAUTION!!
  * This gem is under development.
  * This gem assumes that you are currently working on a react project that uses the webpacker gem.
  * The gem has only been tested with Rails 5.1 and its built-in webpacker, thus I can't really say for sure
    if it will work on previous version of rails that has the webpacker gem installed.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_webpack_react_generator', git: "git@bitbucket.org:armanmiranda/railswebpackreactgenerator.git"
```

And then execute:
```bash
$ bundle
```

## Sample Usage
* Some preparations to do before using the gem:
    * run the following code to start a new react project (requires rails 5.1)

        ```bash
        $ rails new react-generator-sample --webpack=react -T
        ```

    * Upon generation go to the project folder and create a new controller
        
        ```bash
        $ rails generate controller pages home
        ```

    * Make sure to do the following as well, all of them are under `app/javascript/packs`:
        * remove the default `hello_react.jsx` file from the packs folder.
        * also delete the contents of the `application.js` file.
    
    * We can now generate a new react page via ```react:page_scaffold``` by executing

        ```bash
        $ rails generate react:page_scaffold home App
        ```

        this will generate a directory ```home/``` and under it is the ```home/components/``` folder which contains the root of the react page which we named ```App```. The generator will also import our directory into the ```packs/application.js``` file and it will create an ```index.js``` which selects our component target.
    
    * Now open the view under ```views/pages/home.html.erb``` and change its contents to these:

        ```ruby
        0| <div id="homeElement"></div>
        ```
        ```
        1| <%= javascript_pack_tag 'application' %>    
        ```
    
    * Now run ```rails server``` and ```./bin/webpack-dev-server``` and navigate to ```localhost:5000/pages/home``` it should show the text ```Test Content```
    
## Generators
* ```react:page_scaffold [parent_dir_name] [root_component_name]```
    *  This will generate a initial react page that has minimal but functional content.

* ```react:module_pack [parent_dir_name]```
    *  Adds a unregistered parent_dir to the application.js file
    *  This currently doesn't check if the given parent_dir argument exists or not.

* ```react:component [parent_dir_name] [component_name]```
    *  This will generate a component under an existing react page.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
~
~
