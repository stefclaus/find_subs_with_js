
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
}

function Yogaclass(yogaclass) {
  this.id = yogaclass.id
  this.name = yogaclass.name
  this.weekday = yogaclass.weekday
  this.instructor = yogaclass. instructor
}

Yogaclass.prototype.formatIndex = function(){
  let yogaclassHtml = `
  <a hfref="/yogaclasses/${this.id}"><h1>${this.name}</h1>`
  return yogaclassHtml
}
