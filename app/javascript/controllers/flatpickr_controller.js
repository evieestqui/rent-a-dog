import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
// The range plugin is also needed in order to use two inputs
import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput' ]
    // On controller's connection, call the flatpickr
    // function in order to build the calendars
  connect() {
    flatpickr(this.startDateInputTarget, {
      onChange: (selectedDates, dateString, instance) => {
        function addOneMonth(dateString) {
          let date = new Date(dateString);
          date.setMonth(date.getMonth() + 1);
          return date.toISOString().split('T')[0]; // Returns in YYYY-MM-DD format
        }

        const startDate = selectedDates[0]
        const maxDateValue = addOneMonth(startDate)

        instance.set(maxDate, maxDateValue)
      },
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
    })
  }


}
