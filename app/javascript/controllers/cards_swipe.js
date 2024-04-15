const cardsContainer = document.querySelector('.cards');

let startX = 0;
let isScrolling = false;

cardsContainer.addEventListener('touchstart', (e) => {
  startX = e.touches[0].clientX;
  isScrolling = true;
});

cardsContainer.addEventListener('touchmove', (e) => {
  if (!isScrolling) return;

  const diffX = e.touches[0].clientX - startX;
  cardsContainer.scrollLeft -= diffX;
  startX = e.touches[0].clientX;
});

cardsContainer.addEventListener('touchend', () => {
  isScrolling = false;
});


