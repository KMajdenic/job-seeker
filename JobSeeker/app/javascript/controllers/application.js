import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"

const application = Application.start()
Turbo.start()
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
window.Turbo = Turbo

export { application }



// import { Application } from "@hotwired/stimulus"
// import "@hotwired/turbo-rails"
// import ModalController from "./modal_controller"
// import "controllers"

// const application = Application.start()
// Turbo.start()
// // Configure Stimulus development experience
// application.debug = false
// application.register("modal", ModalController)
// window.Stimulus = application
// window.Turbo = Turbo
// const context = require.context("controllers", true, /_controller\.js$/)
// application.load(definitionsFromContext(context))


// export { application }

