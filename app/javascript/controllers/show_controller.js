import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["output"]

  connect() {
    console.log("Hello")
  }
}

// const a = document.querySelector('#buttonfav');
//   buttonfav.addEventListener('click', (event) => {
//   const clickedButton = event.currentTarget;
//   clickedButton.setAttribute('disabled', '');
//   clickedButton.innerText = 'Bingo!';
// });
