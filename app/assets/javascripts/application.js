//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require flatpickr/dist/flatpickr.min.js
//= require materialize-css/dist/js/materialize.min.js
//= require nprogress/nprogress.js
//= require_tree .

document.addEventListener('turbolinks:click', function() {
  NProgress.start();
});

document.addEventListener('turbolinks:visit', function() {
  NProgress.start();
});

document.addEventListener('turbolinks:render', function() {
  NProgress.done();
  setTimeout(function() {
    NProgress.done();
    NProgress.remove();
  }, 600);
});
