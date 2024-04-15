import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log(this.markersValue)
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/vmt-wgn/club2ppnp017b01qs7wgo6pt0"
    })

    this.#fitMapToRoute()
    const start = [2.380070, 48.864930];

      // this is where the code for the next step will go
      // create a function to make a directions request
      async function getRoute(end, map) {
        // make a directions request using walking profile
        // an arbitrary start will always be the same
        // only the end or destination will change
        const query = await fetch(
          `https://api.mapbox.com/directions/v5/mapbox/walking/${start[0]},${start[1]};${end[0]},${end[1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
          { method: 'GET' }
        );
        const json = await query.json();
        const data = json.routes[0];
        const route = data.geometry.coordinates;
        const geojson = {
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'LineString',
            coordinates: route
          }
        };
        // if the route already exists on the map, we'll reset it using setData
        if (map.getSource('route')) {
          map.getSource('route').setData(geojson);
        }
        // otherwise, we'll make a new request
        else {
          map.addLayer({
            id: 'route',
            type: 'line',
            source: {
              type: 'geojson',
              data: geojson
            },
            layout: {
              'line-join': 'round',
              'line-cap': 'round'
            },
            paint: {
              'line-color': '#FF6D00',
              'line-width': 5,
              'line-opacity': 0.75
            }
          });
        }
        // add turn instructions here at the end
        // get the sidebar and add the instructions
        const instructions = document.getElementById('instructions');
        const steps = data.legs[0].steps;

        let tripInstructions = '';
        for (const step of steps) {
          tripInstructions += `<li>${step.maneuver.instruction}</li>`;
        }
        instructions.innerHTML = `<p><strong>Trip duration: ${Math.floor(
          data.duration / 60
        )} min 🐕 </strong></p>
        <ol>${tripInstructions}</ol>`;
      }

      this.map.on('load', () => {
        // make an initial directions request that
        // starts and ends at the same location
        getRoute(start, this.map);

        // Add starting point to the map
        this.map.addLayer({
          id: 'point',
          type: 'circle',
          source: {
            type: 'geojson',
            data: {
              type: 'FeatureCollection',
              features: [
                {
                  type: 'Feature',
                  properties: {},
                  geometry: {
                    type: 'Point',
                    coordinates: start
                  }
                },
                {
                  type: 'Feature',
                  properties: {},
                  geometry: {
                    type: 'Point',
                    coordinates: this.markersValue
                  }
                }
              ]
            }
          },
          paint: {
            'circle-radius': 10,
            'circle-color': '#FF6D00'
          }
        });
        getRoute(this.markersValue, this.map)
      });

  }

    #fitMapToRoute() {
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([2.380070, 48.864930])
      bounds.extend([2.3373098, 48.848473])
      this.map.fitBounds(bounds, { padding: 50, maxZoom: 15, duration: 0 })
    }
}
