import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accordion"
export default class extends Controller {
  static targets = ["arrow", "menu"]
  connect() {
    this.menuHeight = this.menuTarget.scrollHeight+"px"
  }
  toggle() {
    this.arrowTarget.classList.toggle("-rotate-180")
    if(this.menuTarget.style.maxHeight == this.menuHeight) {
      this.menuTarget.style.maxHeight = 0
    }else{
      this.menuTarget.style.maxHeight = this.menuHeight
    }
    
  }
}
