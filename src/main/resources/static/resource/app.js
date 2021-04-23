/*jshint esversion: 6 */
const $toggles = document.querySelectorAll(".toggle");
const $toggleBtn = document.getElementById("toggle_btn");

$toggleBtn.addEventListener("click", function () {
  toggleElements();
});

function toggleElements() {
  [].forEach.call($toggles, function (toggle) {
    toggle.classList.toggle("on");
  });
}

function offElements() {
  [].forEach.call($toggles, function (toggle) {
    toggle.classList.remove("on");
  });
}

window.addEventListener("resize", function () {
  if (window.innerWidth > 1024) {
    offElements();
  }
});

window.addEventListener("scroll", function(){
  const header = document.querySelector("header");
  header.classList.toggle("sticky", scrollY > 0);
});
