// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "trix"
import "@rails/actiontext"
import "./controllers"
import "bootstrap"

import "./src/jquery"
import "./src/jquery-ui"

$(function() {
  $('#dialog').dialog()
})