import "bootstrap";
import { previewImageOnFileSelect } from '../components/photo_preview';
import { initSelect2 } from '../components/init_select2';
import 'select2/dist/css/select2.css';


previewImageOnFileSelect();
initSelect2();

// let search = document.querySelector('.select2-search__field')
// let choices = document.querySelectorAll('.select2-selection__choice') // Node Array

// // Add Event Listener
// search.addEventListener('keyup', (event) => {
//   if (event.key === 'Enter') {
//     choices.forEach((choice) => {
//       console.log(choice)
//     })
//   }
// })

const button = document.querySelector('#submit-tag')
button.addEventListener('click', (event) => {
  const results = document.querySelectorAll('.select2-selection__choice')
  console.log(results);
  /*var str = '';
  results.forEach((result) => {
    str += result
  })


  console.log(str);*/
  document.querySelector('form').insertAdjacentHTML("beforeend", "<input id='summary_category_list' type='hidden' name='summary[category_list]' />");

  results.forEach((result) => {
    document.querySelector('input[name="summary[category_list]"').value = result;
  })

})

const saveResult = (event) => {
  fetch("/summaries/4", {
    method: "POST",
    body: JSON.stringify({ category_list: event.title })
  })
    .then(response => console.log(response))
    .then((data) => {
      console.log(data.hits); // Look at local_names.default
    });
};

const input = document.querySelector("#search");
input.addEventListener("keyup", searchAlgoliaPlaces);
