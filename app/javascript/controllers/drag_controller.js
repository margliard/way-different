// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Sortable from "sortablejs"
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ["card"]

  connect() {
    this.sortable = Sortable.create(this.element, {
      group: 'shared',
      animation: 150,
      onEnd: this.end.bind(this),
    })
  }

  end(event) {
    console.log(event)
    let favoriteid = event.item.dataset.favorite
    let newtraveldayid = event.to.dataset.travelday
    console.log(favoriteid)
    console.log(newtraveldayid)

    fetch(`/favorites/${favoriteid}/changeday?travelday=${newtraveldayid}`, {
      method: "PATCH",
      headers: {
        'X-CSRF-Token': csrfToken()
      }
    })
    location.reload()
  }
}
