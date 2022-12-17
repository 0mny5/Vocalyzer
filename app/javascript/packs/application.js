// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "bootstrap"
import '@fortawesome/fontawesome-free/js/all'
import "@nathanvda/cocoon"
import "../stylesheets/application"

// import "../src/capture.js"

// template 'Stream'
// import "../src/stream/global.js"
import "../src/stream/top_animation.js"
import '../src/stream/jquery.migrate.min.js'
import '../src/stream/typed.min.js'
import '../src/stream/slick.min.js'
import '../src/cocoon_form_number.js'
import 'jquery-parallax.js'
import 'typed.js'
import 'slick-carousel'

// puppeteer

Rails.start()
ActiveStorage.start()

