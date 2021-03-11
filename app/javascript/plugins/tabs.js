import { Tab } from "bootstrap";


const getTab = () => {
  
  const tabs = document.querySelectorAll('.nav-link');
  
  tabs.forEach((tab) => {
    tab.addEventListener('click', (event) => {
      console.log(event.currentTarget.classList);
      event.currentTarget.className = 'nav-link active';
    });
  });
};

// tab.addEventListener('click', ())

// $('#myTab a').on('click', function (e) {
//   e.preventDefault()
//   $(this).tab('show')
// })

export { getTab };