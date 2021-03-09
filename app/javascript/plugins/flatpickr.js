import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    onChange: (selectedDates, dateStr, instance) => {
      fetch(`${instance.element.dataset.url}?date=${dateStr}`)
        .then(response => response.text())
        .then((data) => {
          instance.element
            .closest("form")
            .querySelector(".times")
            .innerHTML = data
        })
    }
  });
}

export { initFlatpickr };