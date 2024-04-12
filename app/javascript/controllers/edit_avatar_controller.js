import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-avatar"
export default class extends Controller {
  static targets = ["form"]

  displayForm() {
    this.formTarget.classList.remove("d-none")
  }
}
