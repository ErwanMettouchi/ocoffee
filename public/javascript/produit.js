const originPara = document.querySelector('#origin');
const longitude = originPara.dataset.longitude;
const latitude = originPara.dataset.latitude;
const coffeeName = document.querySelector('#coffee-name');
const coffeeOrigin = document.querySelector('#coffee-origin');

var map = L.map('map').setView([latitude, longitude], 4);

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

var marker = L.marker([latitude, longitude]).addTo(map);