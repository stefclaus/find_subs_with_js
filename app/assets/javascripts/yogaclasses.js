
$(() => {
  bindingClickHandlers()
  pilatesClickHandler()
})

const pilatesClickHandler = () => {
  $('#pilates').on('click', function(e) {
    fetch(`/yogaclasses.json`)
    .then(response => response.json())
    .then(data => {
      const pilatesFilter = data.filter(yogaclass => yogaclass.name == 'Pilates');
      $('#app-container').html(`<h1> All Classes </h1>`)
      pilatesFilter.forEach(yogaclass => {
        let newYogaclass = new Yogaclass(yogaclass)
        let yogaclassHtml = newYogaclass.formatIndex()
        $('#app-container').append(yogaclassHtml)
      })
  })
  })
}



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
    history.pushState(null, null, `yogaclasses/${id}`)
    fetch(`/yogaclasses/${id}.json`)
    .then(res => res.json())
    .then(yogaclass => {
      let newYogaclass = new Yogaclass(yogaclass)
      let yogaclassHtml = newYogaclass.formatShow()
      $('#app-container').append(yogaclassHtml)
    })
  })
  $('#new_subrequest').on('submit', function(e) {
		e.preventDefault();
    const values = $(this).serialize()

    $.post("/subrequests", values).done(function(data) {
        $('#app-container').html('')
        const newSubrequest = new Subrequest(data)
        const htmlToAdd = newSubrequest.formatShow()
        $("#app-container").html(htmlToAdd)
      })
  })
  $("#sort").on('click', function(e){
    fetch(`/yogaclasses.json`)
      .then(response => response.json())
      .then(data => {
         let sortedData = data.slice().sort(function (yogaclassOne, yogaclassTwo) {
          return yogaclassOne.name.localeCompare(yogaclassTwo.name);

        });

        $('#app-container').html(`<h1> All Classes </h1>`)
        sortedData.forEach(yogaclass => {
          let newYogaclass = new Yogaclass(yogaclass)
          let yogaclassHtml = newYogaclass.formatIndex()
          $('#app-container').append(yogaclassHtml)
        })

      })
    })



}
//
function Subrequest(subrequest) {
  this.id = subrequest.id
  this.date = subrequest.date
  this.assistant_requesting = subrequest.assistant_requesting
  this.assistant_covering = subrequest. assistant_covering
  this.comment = subrequest.comment
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

Subrequest.prototype.formatShow = function(){

  let subrequestHtml =
  `
  <h1>Request successful!</h1>
  <br></br>
  <br></br>
  <br></br>
  <h2>Your Submitted request:</h2>
  <p>Comment: ${this.comment}</p>
  <p>Assistant Covering: ${this.assistant_covering}</p>
  <p>Assistant Requesting: ${this.assistant_requesting}</p>
  <p>Date: ${this.date}</p>
  `
  return subrequestHtml
}
