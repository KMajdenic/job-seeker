import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"

export default class extends Controller {
  connect() {
    document.addEventListener('turbo:submit-end', this.handleSubmit)
    console.log("Im connected")
  }

  disconnect() {
    document.removeEventListener('turbo:submit-end', this.handleSubmit)
    console.log("Im disconnected")
  }

  close() {
    // Remove the modal element so it doesn't blanket the screen
    this.element.remove()

    // Remove src reference from parent frame element
    // Without this, turbo won't re-open the modal on subsequent clicks
    this.element.closest("turbo-frame").src = undefined
  }

  handleKeyup(e) {
    if (e.code == "Escape") {
      this.close()
    }
  }

  handleSubmit = (e) => {
    if (e.detail.success) {
      this.close()
    }
  }
}