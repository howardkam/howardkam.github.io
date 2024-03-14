const late_button = document.getElementById('late');
const late = new Audio('./sounds/late.mp3'); 
late_button.addEventListener('click', () => {
  late.play();
});


const are_you_serious_button = document.getElementById('are_you_serious');
const seriously= new Audio('./sounds/seriously.mp3'); 
are_you_serious_button.addEventListener('click', () => {
  seriously.play();
});

const go_ahead_button = document.getElementById('goahead');
const goahead= new Audio('./sounds/yougoahead.mp3'); 
go_ahead_button.addEventListener('click', () => {
  goahead.play();
});

const congratulations_button = document.getElementById('congratulations');
const congratulations= new Audio('./sounds/congratulationsIguess.mp3'); 
congratulations_button.addEventListener('click', () => {
  congratulations.play();
});

const bareminimum_button = document.getElementById('bareminimum');
const bareminimum= new Audio('./sounds/bareminimum.mp3'); 
bareminimum_button.addEventListener('click', () => {
  bareminimum.play();
});

const nobodylikesyou_button = document.getElementById('nobodylikesyouonsocialmedia');
const nobodylikesyouonsocialmedia= new Audio('./sounds/nobodylikesyouonsocialmedia.mp3'); 
nobodylikesyou_button.addEventListener('click', () => {
    nobodylikesyouonsocialmedia.play();
});

const tryharderinlife_button = document.getElementById('nobodylikesyouonsocialmedia');
const tryharderinlife = new Audio('./sounds/tryharderinlife.mp3'); 
tryharderinlife.addEventListener('click', () => {
    tryharderinlife.play();
});

const whichparent_button = document.getElementById('nobodylikesyouonsocialmedia');
const whichparent = new Audio('./sounds/whichparentshouldIblame.mp3'); 
whichparent.addEventListener('click', () => {
    whichparent.play();
});







