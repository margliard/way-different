import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input"]
  connect() {
    console.log(this.inputTarget)
  }

  clearinput(event) {
    // setTimeout(console.log("coucou"), 200)
  }
}
