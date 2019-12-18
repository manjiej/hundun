import $ from 'jquery';
import 'select2';

const initSelect2 = () => {

  let options = {
    placeholder: "Category",
    form: ''
  }

  $('.select2').select2(options);
};

export { initSelect2 };


// 1. Find the value of the items you've chosen in JS
// 2. Insert those items into a hidden field of a form
// 3. On form submit, send those hidden field items to your show
