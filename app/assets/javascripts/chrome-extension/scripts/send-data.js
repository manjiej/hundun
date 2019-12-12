// const input = document.getElementById("summary_article_url");

// function fetchData() {
//   const url = window.location.href;

//   return {
//     url: url
//   }
// }

// // function sendData = (data) => {
// //   const url = 'http://localhost:3000/summaries/';
// //   fetch(url, {
// //     method: 'POST',
// //     headers: { "Content-Type": "application/json" },
// //     body: JSON.stringify(summary: {
// //       "article_url": `${data.url}`)
// //     })
// //   })
// // }

// function sendData(data) {
//   const url = 'http://localhost:3000/summaries/';
//   fetch(url, {
//     method: 'POST',
//     headers: { "Content-Type": "application/json" },
//     body: JSON.stringify(data)
//     })
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data);
//   })
// }

// input.addEventListener('submit', (event) => {
//   event.preventDefault();
//   // postMessage(newMessage());
//   sendData(fetchData());
// });
