import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-map"
export default class extends Controller {
  static targets = ["map", "list"]

  fire() {
    console.log("you clicked the button")
    this.mapTarget.classList.toggle("d-none")
    this.listTarget.classList.toggle("d-none")
  }
}
