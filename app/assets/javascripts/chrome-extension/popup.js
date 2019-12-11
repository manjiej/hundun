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

// let button = document.querySelector("#send-data");
// let vv = document.getElementById("summary_article_url");
// let url = window.location.href;

// function fetchData() {
//   url = window.location.href;
// }

// chrome.browserAction.onClicked.addListener((tab) => {
//   chrome.tabs.executeScript({
//     code: 'vv.innerValue = url'
//   });
// });

function sendData(data) {
  const url = 'http://localhost:3000/summaries/new';
  fetch(url, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({article_url: window.location.href})
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
  })
}

button.addEventListener('click', () => {
  sendData();
});

// input.addEventListener('submit', (event) => {
//   event.preventDefault();
//   // postMessage(newMessage());
//   sendData(fetchData());
// });



