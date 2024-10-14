document.getElementById("add-event-btn").addEventListener("click", () => {
  document.getElementById("addEventModal").style.display = "block";
});

document.querySelector(".close").addEventListener("click", () => {
  document.getElementById("addEventModal").style.display = "none";
});

window.onclick = function (event) {
  const modal = document.getElementById("addEventModal");
  if (event.target == modal) {
    document.getElementById("addEventModal").style.display = "none";
  }
};
