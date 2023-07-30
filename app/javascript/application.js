// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require vue
import "@hotwired/turbo-rails"
import "controllers"

new Vue({
    el: '#app',
    components: {
      'my-component': mycomponent
    }
  })