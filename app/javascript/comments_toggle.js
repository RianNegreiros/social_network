import $ from 'jquery'

document.addEventListener('turbolinks:load', function () {
  $('.comments-toggle').on('click', function () {
    $(this).closest(".card").next('.comments-list').toggle()
  })
})