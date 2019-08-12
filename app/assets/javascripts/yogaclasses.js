
$(() => {
  bindingClickHandlers()
})

const bindingClickHandlers = () => {
  $('.all-yogaclasses').on('click', (e) => {
    e.preventDefault()
    fetch(`/yogaclasses.json`)
    .then(res => res.json())
    .then(data => console.log(data))
  })
}
