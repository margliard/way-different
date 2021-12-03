import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = ["marker"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/scalvogli/ckwdp8oy34cw115odm13tmubl'
    });
    this._addMarkersToMap();

    this.map.once("load", () => {
      this.map.resize()
      this._fitMapToMarkers();
    })
  }

  displaycard(event) {
    console.log(event);
    const card = document.querySelector(`#experience-${event.target.dataset.mapboxExperienceValue}`)
    const y = card.getBoundingClientRect().top + window.pageYOffset;
    scrollTo({top: y, behavior: 'smooth'})
  }

  _addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window); // add this
      // Create a HTML element for your custom marker
      const customMarker = document.createElement('div');
      customMarker.className = 'marker';
      customMarker.style.backgroundImage = `url('${marker.image_url}')`;
      customMarker.style.backgroundSize = 'contain';
      customMarker.style.width = '40px';
      customMarker.style.height = '40px';
      customMarker.dataset.mapboxTarget = "marker"
      customMarker.dataset.mapboxExperienceValue = marker.experience_id;
      customMarker.dataset.experienceUrl = marker.experience_url;
      customMarker.dataset.action = "click->mapbox#displaycard";

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup, {
          "focusAfterOpen":false
        })
        .addTo(this.map);
    });
    // console.log(this.markerTargets)
  }

  _fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 3 });
    // console.log(this.markersValue)
  }
}
