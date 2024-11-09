import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="general-search"
export default class extends Controller {
  static values = {
    url: String
  }

  update(){
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.swap()
    }, 500)
  }

  //fetch turbostream
  swap() {
    fetch( this.urlValue+"?q="+this.element.value , {
      method: "GET",
      headers: {
        Accept: "text/vnd.turbo-stream.html",
        "X-CSRF-Token": this.getCsrfToken()
      }
    })
      .then(r => r.text())
      .then(html => Turbo.renderStreamMessage(html))
  }

  getCsrfToken() {
    return document.querySelector('meta[name="csrf-token"]').content;
  }
}
