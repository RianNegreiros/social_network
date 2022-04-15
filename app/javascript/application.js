// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import './like_toggle'
import './comments_toggle'
import jquery from "jquery"
window.jQuery = jquery
window.$ = jquery
