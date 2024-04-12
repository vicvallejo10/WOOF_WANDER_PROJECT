import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

//import and fetch
import PetController from '../controllers/edit_pet_controller.js'
Stimulus.register('edit-pet', PetController)
