import { Controller } from "@hotwired/stimulus";
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

export default class extends Controller {
  static values = {
    apiKey: String,
  }

  static targets = ["address"]

  connect() {
    console.log(
      "test"
    )
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address",
      placeholder: "Where do you want to go?"
    });
    this.geocoder.addTo(this.element);

    this.geocoder.on("result", event => this._setInputValue(event));
    this.geocoder.on("clear", () => this._clearInputValue());
  }

  _setInputValue(e) {
    this.addressTarget.value = e.result["place_name"];
  }

  _clearInputValue() {
    this.addressTarget.value = "";
  }

  disconnect() {
    this.geocoder.onRemove()
  }
}
