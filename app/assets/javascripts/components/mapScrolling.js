
function mapScrolling() {
    if (document.documentElement.scrollTop > 800) {
      console.log("MORE THAN 500")
        document.getElementById("map").className = "";
    } else {
        document.getElementById("map").className = "maphidden";
    }
}
window.onscroll = mapScrolling;
