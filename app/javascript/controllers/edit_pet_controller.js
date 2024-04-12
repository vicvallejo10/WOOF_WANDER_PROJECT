import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "infos"];

  connect() {
    console.log("Edit Pet controller connected");
  }

  displayForm() {
    this.infosTarget.classList.add("d-none"); // Hide pet infos
    this.formTarget.classList.remove("d-none"); // Show edit form
    this.formTarget.querySelector("input[type='text']").focus(); // Focus on the first input field
  }

  async update(event) {
    event.preventDefault();

    // Extract updated values from the form
    const formData = new FormData(this.formTarget);
    const updatedData = Object.fromEntries(formData.entries());

    const petId = this.element.dataset.petId;

    try {
      // Perform AJAX request to update the pet information
      const response = await fetch(`/pets/${petId}`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify(updatedData)
      });

      if (!response.ok) {
        throw new Error("Network response was not ok.");
      }

      // Update displayed pet information on success
      this.infosTarget.classList.remove("d-none"); // Show pet infos
      this.formTarget.classList.add("d-none"); // Hide edit form
      this.displayUpdatedInfo(updatedData); // Update displayed information

      console.log("Pet information updated successfully!");
    } catch (error) {
      console.error("Error updating pet information:", error);
    }
  }

  displayUpdatedInfo(updatedData) {
    // Update displayed information
    this.infosTarget.querySelector(".pet-name").textContent = updatedData.pet_name;
    this.infosTarget.querySelector(".birthdate").textContent = updatedData.birthdate;
    this.infosTarget.querySelector(".microchip-number").textContent = updatedData.microchip_number;
    this.infosTarget.querySelector(".breed").textContent = updatedData.breed;
    this.infosTarget.querySelector(".sizer").textContent = updatedData.size;
    this.infosTarget.querySelector(".color").textContent = updatedData.color;
    this.infosTarget.querySelector(".vaccine_card").textContent = updatedData.vaccine_card;
  }
}
