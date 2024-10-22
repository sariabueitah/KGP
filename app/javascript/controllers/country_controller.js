import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="country"
export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.setList()
    this.getCountries("/countries")
  }

  getCountries(url){
    console.log("fired get countries")
    this.ulTarget.innerHTML = ""
      fetch(url)
      .then(response => response.json())
      .then((data) => {
        data.forEach((value) => {
          this.addResultItem(value);
        });
      })
      .catch((error) => {
        debugger;
      });
  }

  setList(){
    this.element.setAttribute("class", "relative")
    this.ulTarget = document.createElement("ul")
    this.ulTarget.setAttribute("class", "transparent-scroll hidden absolute top-19 left-0 w-full max-h-52 overflow-x-hidden overflow-y-scroll bg-gray-100 px-2")
    this.element.appendChild(this.ulTarget)
  }

  addResultItem(value){
    let li = document.createElement('li')
    li.setAttribute("tabIndex", "0")
    li.setAttribute("data-country-value-param", value["name"])
    li.setAttribute("class", "w-full text-gray-700 p-2 mt-2 bg-white hover:bg-gray-200 hover:border-gray-300 hover:border focus:bg-gray-200 focus:border-gray-300 focus:border country-list")
    li.setAttribute("data-action", "mousedown->country#setValue")
    li.setAttribute("data-action", "keydown->country#listKeyControl")
    li.innerHTML = value["flag"] + " " + value["name"]
    this.ulTarget.appendChild(li)
  }

  showList(){
    this.inputTarget.select()
    this.getCountries("/countries/"+this.inputTarget.value)
    this.ulTarget.className = this.ulTarget.className.replace( /(?:^|\s)hidden(?!\S)/g , ' block' )
  }

  filterCountries(){
    this.getCountries("/countries/"+event.currentTarget.value)
  }

  setValue(){
    this.inputTarget.value = event.params.value
  }

  hideList(){
    if(event.relatedTarget == null || !event.relatedTarget.classList.contains("country-list")){
      this.ulTarget.className = this.ulTarget.className.replace( /(?:^|\s)block(?!\S)/g , ' hidden' )
    }
  }

  listKeyControl(){
    if(event.key == "Enter") {
      this.setValue()
      this.hideList()
    }
    if(event.key == "ArrowDown") {
      event.currentTarget.nextSibling.focus()
    }
    if(event.key == "ArrowUp") {
      event.currentTarget.previousSibling.focus()
    }

  }

  inputKeyControl(){
    this.ulTarget.firstChild.focus()
  }
 

}
