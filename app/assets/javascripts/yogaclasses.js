$(() => {
  bindingClickHandlers()
})

const bindingClickHandlers = () => {
  $('.yogaclass').on('click', (e) => {
    e.preventDefault()
    console.log('hello')
  })
}
