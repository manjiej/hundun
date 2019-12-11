chrome.browserAction.onClicked.addListener((tab) => {
  chrome.tabs.executeScript({
      file: "scripts/send-data.js"
    });
});
