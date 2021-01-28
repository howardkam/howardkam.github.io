const search = document.getElementById('search');
const matchList = document.getElementById('match-list');
const adv = document.getElementById('match-advisory');
const p1 = document.getElementById('match-1');
const p2 = document.getElementById('match-2');
const p3 = document.getElementById('match-3');
const p4 = document.getElementById('match-4');
const p5 = document.getElementById('match-5');
const p6 = document.getElementById('match-6');
const p7 = document.getElementById('match-7');



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


  //This handles the matches then does the HTML
const outputHtml = matches => {
    if (matches.length > 0) {
        const html = matches.map(match => `
            <div class"card card-body mb-1 text-center">
            <center>
                <h3>${match.first} ${match.last} </h3>
                <p class="text-warning">${match.notes}</p>
              
                   
                    <button type="button" class="btn btn-danger" onclick="location.href='${match.a}'">Advisory</button>
                    <button type="button" class="btn btn-danger" onclick="location.href='${match.p1}'">Period 1</button>
                    <p></p>
                    <button type="button" class="btn btn-danger" onclick="location.href='${match.p2}'">Period 2</button>
                    <button type="button" class="btn btn-danger" onclick="location.href='${match.p3}'">Period 3</button>
                    <p></p>
                    <button type="button" class="btn btn-danger" onclick="location.href='${match.p4}'">Period 4</button>
                    <button type="button" class="btn btn-danger" onclick="location.href='${match.p5}'">Period 5</button>
                    <p></p>
                    <button type="button" class="btn btn-danger" onclick="location.href='${match.p6}'">Period 6</button>
                    <button type="button" class="btn btn-danger" onclick="location.href='${match.p7}'">Period 7</button>

                    </center>

                    </div>
                    `).join('');
        
                    matchList.innerHTML = html;
    }
  }


search.addEventListener('input', () => searchStates(search.value));