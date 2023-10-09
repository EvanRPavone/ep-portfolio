import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {}
  connect() {}
  toggleForm(event){
    console.log("Clicked edit button");
    event.preventDefault();
    event.stopPropagation();
    const formId = event.params["form"];
    const commentBodyId = event.params["body"];
    const editButtonId = event.params["edit"];

    const form = document.getElementById(formId);
    const commentBody = document.getElementById(commentBodyId);
    const editButton = document.getElementById(editButtonId);

    form.classList.toggle("d-none");
    form.classList.toggle("mt-5");
    commentBody.classList.toggle("d-none");
    this.toggleEditButton(editButton);
  }

  toggleEditButton(editButton){
    if(editButton.innerText === "Edit") {
      editButton.innerText = "Cancel";
      this.toggleEditButtonClass(editButton);
    } else {
      editButton.innerText = "Edit";
      this.toggleEditButtonClass(editButton);
    }
  }

  toggleEditButtonClass(editButton){
    editButton.classList.toggle("btn-secondary");
    editButton.classList.toggle('btn-warning');
  }

}