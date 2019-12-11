// function listenClick() {
//   const button = document.getElementById('send-data');
//   button.addEventListener('click', () => {
//     chrome.tabs.executeScript({
//       file: "scripts/send-data.js"
//     });
//   })
// }
// listenClick();



// function redirect () {
//   window.open("http://localhost:3000/summaries/new")
// }

// button.addEventListener('click', redirect);

let button = document.querySelector("#send-data");
const input = document.getElementById("summary_article_url");

function fetchData() {
  const url = window.location.href;
  return url;
}

button.addEventListener('click', (event) => {
  fetchData();
  window.open("http://localhost:3000/summaries/new")
});

function sendData(data) {
  const url = 'http://localhost:3000/summaries/new';
  fetch(url, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
  })
}

input.innerHTML = 'Fred Flinstone';



