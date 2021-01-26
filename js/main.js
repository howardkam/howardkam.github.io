const search = document.getElementById('search');
const matchList = document.getElementById('match-list');

//Search states.json and filter it

const searchStates = async searchText => {
    const res = await fetch('../data/state.json');
    const states = await res.json();

    //console.log(states);
    //Get matches to current text input 
    let matches = states.filter(state => {
        const regex = new RegExp(`^${searchText}`, 'gi');
        return state.first.match(regex) || state.last.match(regex);
    });

    if (searchText.length === 0) {
        matches = [];
    }

    outputHtml(matches);

};
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
  }
  
  // Close the dropdown if the user clicks outside of it
  window.onclick = function(event) {
    if (!event.target.matches('.dropbtn')) {
      var dropdowns = document.getElementsByClassName("dropdown-content");
      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }
const outputHtml = matches => {
    if (matches.length > 0) {
        const html = matches.map(match => `
            <div class"card card-body mb-1 text-center">
            <center>
                <h3>${match.first} ${match.last} </h3>
                    <span class="text-primary">
                    ${match.notes}
                    </span>
                <br>
                <button type="button" class="btn btn-danger" onclick="location.href='${match.ar}'">Advisory Red</button>
                <button type="button" class="btn btn-warning" onclick="location.href='${match.ag}'">Advisory Gold</button>
                <hr>
                <button type="button" class="btn btn-danger" onclick="location.href='${match.p1r}'">Period 1 Red</button>
                <button type="button" class="btn btn-warning" onclick="location.href='${match.p1g}'">Period 1 Gold</button>
                <hr>
                <button type="button" class="btn btn-danger" onclick="location.href='${match.p2r}'">Period 2 Red</button>
                <button type="button" class="btn btn-warning" onclick="location.href='${match.p2g}'">Period 2 Gold</button>
                <hr>
                <button type="button" class="btn btn-danger" onclick="location.href='${match.p3r}'">Period 3 Red</button>
                <button type="button" class="btn btn-warning" onclick="location.href='${match.p3g}'">Period 3 Gold</button>
                <hr>
                <button type="button" class="btn btn-danger" onclick="location.href='${match.p4r}'">Period 4 Red</button>
                <button type="button" class="btn btn-warning" onclick="location.href='${match.p4g}'">Period 4 Gold</button>
                <hr>
                <button type="button" class="btn btn-danger" onclick="location.href='${match.p5r}'">Period 5 Red</button>
                <button type="button" class="btn btn-warning" onclick="location.href='${match.p5g}'">Period 5 Gold</button>
                <hr>
                <button type="button" class="btn btn-danger" onclick="location.href='${match.p6r}'">Period 6 Red</button>
                <button type="button" class="btn btn-warning" onclick="location.href='${match.p6g}'">Period 6 Gold</button>
                <hr>
                <button type="button" class="btn btn-danger" onclick="location.href='${match.p7r}'">Period 7 Red</button>
                <button type="button" class="btn btn-warning" onclick="location.href='${match.p7g}'">Period 7 Gold</button>
</center>

            </div>


        `).join('');

        matchList.innerHTML = html;
    }
}

search.addEventListener('input', () => searchStates(search.value));

// <div class="dropdown">
//   <button onclick="myFunction()" class="dropbtn">Click For Classes</button>
//   <div id="myDropdown" class="dropdown-content">
//     <a href=" ${match.ar} ">Advisory Red</a>
//     <a href=" ${match.ag} ">Advisory Gold</a>
//     <a href=" ${match.p1r} ">Period 1 Red</a>
//     <a href=" ${match.p1g} ">Period 1 Gold</a>
//     <a href=" ${match.p2r} ">Period 2 Red</a>
//     <a href=" ${match.p2g} ">Period 2 Gold</a>
//     <a href=" ${match.p3r} ">Period 3 Red</a>
//     <a href=" ${match.p3g} ">Period 3 Gold</a>
//     <a href=" ${match.p4r} ">Period 4 Red</a>
//     <a href=" ${match.p4g} ">Period 4 Gold</a>
//     <a href=" ${match.p5r} ">Period 5 Red</a>
//     <a href=" ${match.p5g} ">Period 5 Gold</a>
//     <a href=" ${match.p6r} ">Period 6 Red</a>
//     <a href=" ${match.p6g} ">Period 6 Gold</a>
//     <a href=" ${match.p7r} ">Period 7 Red</a>
//     <a href=" ${match.p7g} ">Period 7 Gold</a>

//   </div>
// </div>