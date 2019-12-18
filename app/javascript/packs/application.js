import "bootstrap";
import { previewImageOnFileSelect } from '../components/photo_preview';
import { initSelect2 } from '../components/init_select2';
import 'select2/dist/css/select2.css';


previewImageOnFileSelect();
initSelect2();


let search = document.querySelector('.select2-search__field')
let choices = document.querySelectorAll('.select2-selection__choice') // Node Array
const button = document.querySelector('#submit-tag')

// Add Event Listener
// search.addEventListener('ValueChange', (event) => {
//   choices.forEach((choice) => {
//     console.log(choice)
//   })
// })

button.addEventListener('click', (event) => {
  const results = document.querySelectorAll('.select2-selection__choice')
  console.log(results)
  let tagChoicesSelected = []
  results.forEach((result) => {
    console.log(result.title)
    tagChoicesSelected.push(result.title)
  })
    console.log(tagChoicesSelected)
    document.querySelector('#summary_category_list').value = tagChoicesSelected.join();
})

// const saveResult = (event) => {
//   console.log(event)
//   fetch(`"${event.toElement.form.action}"`, {
//     method: "POST",
//     body: JSON.stringify({ summary.category_list: result.title })
//   })
//   //   .then(response => console.log(response))
//   //   .then((data) => {
//   //     console.log(data)
//   //   });
// }
