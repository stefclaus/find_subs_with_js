
$(() => {
  bindingClickHandlers()
})

const bindingClickHandlers = () => {
  $('.all-yogaclasses').on('click', (e) => {
    e.preventDefault()
    history.pushState(null, null, "yogaclasses")
    fetch(`/yogaclasses.json`)
    .then(res => res.json())
    .then(yogaclasses => {
      $('#app-container').html('')
      yogaclasses.forEach(yogaclass => {
        let newYogaclass = new Yogaclass(yogaclass)
        let yogaclassHtml = newYogaclass.formatIndex()
        $('#app-container').append(yogaclassHtml)
      })
    })
  })
  $(document).on('click', ".show_link", function(e) {
    e.preventDefault()
    $('#app-container').html('')
    let id = $(this).attr('data-id')
    fetch(`/yogaclasses/${id}.json`)
    .then(res => res.json())
    .then(yogaclass => {
      let newYogaclass = new Yogaclass(yogaclass)
      let yogaclassHtml = newYogaclass.formatShow()
      $('#app-container').append(yogaclassHtml)
    })
  })
}

function Yogaclass(yogaclass) {
  this.id = yogaclass.id
  this.name = yogaclass.name
  this.weekday = yogaclass.weekday
  this.instructor = yogaclass. instructor
}

Yogaclass.prototype.formatIndex = function(){
  let yogaclassHtml = `
  <a href="/yogaclasses/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1>`
  return yogaclassHtml
}

Yogaclass.prototype.formatShow = function(){
  let yogaclassHtml = `
  <h3>${this.name}</h3>`
  return yogaclassHtml
}
