import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="account-categories"
export default class extends Controller {
  static targets = ["categorySelect"]

  connect() {
    console.log("Account Categories Controller connected!")
  }

  update(event) {
    const accountId = event.target.value; // Get the selected account ID
    console.log(`Account selected: ${accountId}`); // Log the selected account ID
  }

  // update(event) {
  //   const accountId = event.target.value;
  //   console.log(`Selected Account ID: ${accountId}`); // Debugging

  //   if (accountId) {
  //     fetch(`/accounts/${accountId}/categories.json`)
  //       .then((response) => {
  //         console.log("Response status:", response.status); // Check response status
  //         return response.json();
  //       })
  //       .then((categories) => {
  //         console.log("Fetched Categories:", categories); // Log fetched categories
  //         this.populateCategories(categories);
  //       })
  //       .catch((error) => {
  //         console.error("Error fetching categories:", error); // Log errors
  //       });
  //   } else {
  //     this.clearCategories();
  //   }
  // }

  populateCategories(categories) {
    console.log("Populating categories with:", categories); // Debugging
    this.categorySelectTarget.innerHTML = '<option value="">Select a Category</option>';
    categories.forEach((category) => {
      console.log("Adding category:", category); // Log each category
      const option = document.createElement("option");
      option.value = category.id;
      option.textContent = category.name;
      this.categorySelectTarget.appendChild(option);
    });
  }

  clearCategories() {
    this.categorySelectTarget.innerHTML = '<option value="">Select a Category</option>'
  }
}