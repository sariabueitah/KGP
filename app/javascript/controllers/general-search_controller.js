import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="general-search"
export default class extends Controller {

  update(){
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.submit()
    }, 500)
  }

  submit(){
    this.element.requestSubmit()
  }

  // fetch turbostream
  // swap() {
  //   fetch( this.urlValue+"?search="+this.element.value , {
  //     method: "GET",
  //     headers: {
  //       Accept: "text/vnd.turbo-stream.html",
  //       "X-CSRF-Token": this.getCsrfToken()
  //     }
  //   })
  //     .then(r => r.text())
  //     .then(html => Turbo.renderStreamMessage(html))
  // }

  // getCsrfToken() {
  //   return document.querySelector('meta[name="csrf-token"]').content;
  // }
}
