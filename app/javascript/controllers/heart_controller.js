import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="heart"
export default class extends Controller {
  static targets = ["item"]
  static values = {
    placeid: Number
  }

  updatefavorite() {
    // first, we add the class to the heart item, using the target only
    this.itemTarget.classList.toggle('active')

    // then, we will call a method in the places_controller to save the information
    // the best is to use a POST method, and transmit the parameters in a JSON by using the value defined in the html (the place id)
    const data = {
      place_id: this.placeidValue,
    };

    // we need also to retrieve the security token, which usually is hidden in the html document
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content

    // the url
    const request = new Request(`/places/updatelist`, {
      method: 'POST',
      headers: {
        'X-CSRF-Token': csrfToken,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
    fetch(request)
    .then(response => {
    })
    .then((data) => {
    })

  }

}
