import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="employee-search"
export default class extends Controller {

  connect() {
    console.log("employee-search_controller connect fired")
  }

  update(){
    console.log("employee-search_controller update fired")
  }
}
