let button = document.querySelector("#send-data");
let buttonTwo = document.querySelector("#send-data-later")

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
    // const url = 'http://localhost:3000/summaries'
    const url = 'http://hundun.io/summaries'
    const body = JSON.stringify({"article_url": tabUrl})
    fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json'},
      body
    }).then(response => response.json()).then((data) => {
      let redirectUrl = data[0].url
      window.open(redirectUrl);
    })
  })
}

if (button) {
  button.addEventListener('click', () => {
    const container = document.getElementById("popup-loader");
    container.innerHTML = "<img src='https://image.noelshack.com/fichiers/2019/51/1/1576471668-spin-hundun.gif'>"
    fetchData();
  });
}

const fetchDataLater = async () => {
  getTabUrl().then(tabUrl => {
    // const url = 'http://localhost:3000/summaries'
    const url = 'http://hundun.io/summaries'
    const body = JSON.stringify({"article_url": tabUrl})
    fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json'},
      body
    }).then(response => response.json()).then((data) => {
      let redirectUrl = data[0].url
      document.getElementById("popup-loader").style.display = 'none';
      document.getElementById("success").style.display = 'block';
    })
  })
}

if (buttonTwo) {
  buttonTwo.addEventListener('click', () => {
    const container = document.getElementById("popup-loader");
    container.innerHTML = "<img src='https://image.noelshack.com/fichiers/2019/51/1/1576471668-spin-hundun.gif'>";
    fetchDataLater();
  });
}

const contextMenuItem = {
  "title": "Crunch Later - HUNDUN",
  "id": "HUNDUN Digest",
  "contexts": ["link"]
};

chrome.runtime.onInstalled.addListener(function() {
  // When the app gets installed, set up the context menus
  chrome.contextMenus.create(contextMenuItem);
});

chrome.contextMenus.onClicked.addListener((e) => {
  // alert("I'm here")
  // console.log(e.linkUrl)
  // const url = 'http://localhost:3000/summaries'
    const url = 'http://hundun.io/summaries'
    const body = JSON.stringify({"article_url": e.linkUrl})
    fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json'},
      body
    }).then(response => response.json()).then((data) => {
      console.log(data)
      let redirectUrl = data[0].url
      document.getElementById("popup-loader").style.display = 'none';
      document.getElementById("success").style.display = 'block';
    })
})

