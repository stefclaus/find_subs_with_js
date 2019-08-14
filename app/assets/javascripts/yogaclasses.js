
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
    history.pushState(null, null, `yogaclasses/thisclass`)
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
  this.time = yogaclass.time
  this.subrequests = yogaclass.subrequests

}

Yogaclass.prototype.formatIndex = function(){
  let yogaclassHtml = `
  <a href="/yogaclasses/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a><p>${this.instructor}</p><p>${this.weekday}</p><p>${this.time}</p>`
  return yogaclassHtml
}

Yogaclass.prototype.formatShow = function(){
  let yogaclassesHtml = `Subrequests for this class:`
  this.subrequests.forEach( subrequest => {
    yogaclassesHtml += `
    <ul>
      <li> Assistant covering: ${subrequest.assistant_covering}<br>Assistant requesting: ${subrequest.assistant_requesting}<br>Comment:${subrequest.comment}<br>Class date:${subrequest.date} </li>
    </ul>`
  })

  let subrequestHtml =
  `
  <h1>${this.name}</h1>
  ${yogaclassesHtml}
  `

  return subrequestHtml
}
