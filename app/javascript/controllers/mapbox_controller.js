import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/scalvogli/ckwdp8oy34cw115odm13tmubl'
    });
    this._addMarkersToMap();
    this._fitMapToMarkers();
    console.log(this.map);
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
      //   customMarker.style.backgroundImage = `url('${marker.image_url[0]}')`;
      // else
      //   if (marker.category == "Restaurant")
      //     customMarker.style.backgroundImage = `url('${marker.image_url[1]}')`;
      //   else
      //     customMarker.style.backgroundImage = `url('${marker.image_url[2]}')`;

    // if (marker.category == "Accommodation")
    //     customMarker.style.backgroundImage = ("montagne.png");
    //   else
    //     if (marker.category == "Restaurant")
    //       customMarker.style.backgroundImage = ("voyager.png");
    //   else
    //       customMarker.style.backgroundImage = ("account.png");
      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }
  // _addMarkersToMap() {
  //     this.markersValue.forEach((marker) => {
  //       if (this.markersValue.length == 1) {
  //         new mapboxgl.Marker()
  //           .setLngLat([marker.lng, marker.lat])
  //           .addTo(this.map);
  //       } else {
  //         new mapboxgl.Marker()
  //           .setLngLat([marker.lng, marker.lat])
  //           .setPopup(new mapboxgl.Popup()
  //           .setHTML(marker.info_window))
  //           .addTo(this.map);
  //       }
  //     });
  //   }
  _fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}
