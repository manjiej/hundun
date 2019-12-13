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

let button = document.querySelector("#send-data");


const getTabUrl = () => {
  return new Promise(resolve => {
    chrome.tabs.query({'active': true, 'currentWindow': true}, (tabs) => {
      let url = tabs[0].url
      resolve(url)
    })
  })
}

const fetchData = async () => {
  getTabUrl().then(tabUrl => {
    const url = 'http://localhost:3000/summaries'
    const body = JSON.stringify({"article_url": tabUrl})
    fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json'},
      body
    }).then(response => response.json()).then((data) => {
      let redirectUrl = data[0].url
      window.open(redirectUrl)
    })
  })
}

button.addEventListener('click', () => {
  const container = document.getElementById("popup-loader");
  container.innerHTML = "<img src='https://image.noelshack.com/fichiers/2019/50/5/1576207438-spin.gif'>"
  fetchData();
});


// input.addEventListener('submit', (event) => {
//   event.preventDefault();
//   // postMessage(newMessage());
//   sendData(fetchData());
// });



