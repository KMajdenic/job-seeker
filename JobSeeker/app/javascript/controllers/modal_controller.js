import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"

export default class extends Controller {
  connect() {
    document.addEventListener('turbo:submit-end', this.handleSubmit);
    console.log("Im connected");
  }

  
  close() {
    // Remove the modal element so it doesn't blanket the screen 
    console.log('Closing modal...', this.element);
    
    // Remove the modal element
    this.element.remove();
    
    // Attempt to find the closest turbo-frame
    const turboFrame = this.element.closest("turbo-frame");
    
    // Log whether turbo-frame was found
    if (turboFrame) {
      console.log('Turbo Frame found:', turboFrame);
      
    } else {
      console.log('Turbo Frame not found. Skipping src reset.');
    }
    
  }
  
  handleKeyup(e) {
    if (e.code == "Esc") {
      this.close();
    }
  }
  
  handleSubmit = (e) => {
    console.log('Form submission event:', e.detail);
    
    if (e.detail.success) {
      this.close();
    }else{
      console.log("From submission failed");
    }
  }
  disconnect() {
    document.removeEventListener('turbo:submit-end', this.handleSubmit);
    console.log("Im disconnected");
  }
}