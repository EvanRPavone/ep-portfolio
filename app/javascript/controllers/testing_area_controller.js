import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="testing-area"
export default class extends Controller {
  connect() {
    console.log("testing area controller has been connected");
    $( "#datepicker" ).datepicker();
  }
}
