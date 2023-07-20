// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require vue
//= require vue-router (optional)
//= require vue-resource (optional)
//= require vuex (optional)
import "@hotwired/turbo-rails"
import "controllers"

new Vue({
    el: '#app',
    components: {
      'my-component': mycomponent
    }
  })